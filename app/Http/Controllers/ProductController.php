<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProductRequest;
use App\Http\Resources\ProductResource;
use App\Models\Product;
//use App\Http\Requests\ProductRequest;

class ProductController extends Controller
{
    public function index()
    {
        return ProductResource::collection(Product::all());
    }

    //Создает новый товар.
    public function store(ProductRequest $request)
    {
       return Product::create($request->validated());

    }

    //Возвращает информацию о конкретном товаре.
    public function show(Product $product)
    {
        return $product;
    }

    //Обновляет информацию о конкретном товаре.
    public function update(ProductRequest $request, Product $product)
    {
        $product->update($request->validated());

        return $product;
    }

    //Удаляет товар.
    public function destroy(Product $product)
    {
        $product->delete();

        return response()->json();
    }
}
