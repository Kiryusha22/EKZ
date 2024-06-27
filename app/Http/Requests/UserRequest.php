<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UserRequest extends FormRequest
{
    public function rules(): array
    {
        return [
            'name' => ['required'],
            'surname' => ['required'],
            'patronymic' => ['required'],
            'phone_number' => ['required'],
            'login' => ['required'],
            'password' => ['required'],
            'role_id' => ['required', 'integer']
        ];
    }

    public function authorize(): bool
    {
        return true;
    }
}
