<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Validation\Rules\Password;
use Illuminate\Support\Facades\Auth;

class AuthUserController extends Controller
{
    public function store(Request $request)
    {
        // Валидация данных запроса
        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'surname' => ['required', 'string', 'max:255'],
            'patronymic' => ['required', 'string', 'max:255'],
            'phone_number' => ['required', 'string', 'max:255'],
            'login' => ['required', 'string', 'max:255', 'unique:'.User::class],
            'password' => ['required', 'string','confirmed', Password::defaults()],
        ]);

        // Создание нового пользователя
        $user = User::create([
            'name' => $request->name,
            'surname' => $request->surname,
            'patronymic' => $request->patronymic,
            'phone_number' => $request->phone_number,
            'login' => $request->login,
            'password' => $request->password,
        ]);

        // Авторизация пользователя
        Auth::login($user);

        // Возвращение ответа с информацией о пользователе
        return response($user);
    }
    public function login(Request $request)
    {
        // Валидация данных запроса
        $request->validate([
            'login' => ['required', 'string', 'max:255'],
            'password' => ['required', 'string'],
        ]);

        // Получение учетных данных пользователя
        $credentials = $request->only('login', 'password');

        // Попытка аутентификации пользователя
        if (Auth::attempt($credentials)) {
            // Создание токена для аутентифицированного пользователя
            $token = $request->user()->createToken('authToken')->plainTextToken;
            // Возвращение ответа с токеном доступа
            return response()->json([
                'access_token' => $token,
                'token_type' => 'Bearer',
            ]);
        }

        // Возвращение ошибки при неудачной аутентификации
        return response()->json(['error' => 'Пользователь не существует. Неверный логин или пароль'], 401);
    }

    public function logout(Request $request)
    {
        // Выход пользователя из системы
        Auth::logout();

        // Инвалидация текущей сессии пользователя
        $request->session()->invalidate();

        // Перегенерация токена сессии пользователя
        $request->session()->regenerateToken();

        // Возвращение ответа
        return response()->json(['message' => 'Выход из учетной записи'], 200);
    }
}
