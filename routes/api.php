<?php

use App\Http\Resources\{TypeCategoryResource, ProductResource, UserResource};
use App\Http\Controllers\{ProductController, TypeCategoryController, AuthUserController, UserController};
use App\Models\{TypeCategory, Product};
use Laravel\Sanctum\PersonalAccessToken;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/


Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return new UserResource($request->user());
});
//Тип категории продукта
Route::controller(TypeCategoryController::class)->group(function () {
    Route::get('/type-category', 'index');
});

//Продукты
Route::controller(ProductController::class)->group(function () {
    Route::get('/product', 'index');
    Route::post('/product-create', 'store');
});

