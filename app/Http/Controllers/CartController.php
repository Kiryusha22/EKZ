<?php

namespace App\Http\Controllers;

use App\Http\Requests\CartRequest;
use App\Http\Resources\CartResource;
use App\Models\Cart;

class CartController extends Controller
{
    public function index()
    {
        //Возвращает коллекцию всех элементов корзины.
        return CartResource::collection(Cart::all());
    }

    public function store(CartRequest $request)
    {
        //Создает новый элемент корзины.
        return Cart::create($request->validated());
    }

    public function show(Cart $cart)
    {
        //Возвращает информацию о конкретном элементе корзины.
        return $cart;
    }

    public function update(CartRequest $request, Cart $cart)
    {
        //Обновляет информацию о конкретном элементе корзины.
        $cart->update($request->validated());

        return $cart;
    }

    public function destroy(Cart $cart)
    {
        //Удаляет элемент корзины.
        $cart->delete();

        return response()->json();
    }

}
