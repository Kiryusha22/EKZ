<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        //Создание таблицы
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('description');
            $table->decimal('price', 8, 2);
            $table->string('image')->nullable();
            $table->unsignedBigInteger('type_category_id');

            $table->foreign('type_category_id')->references('id')->on('type_categories');

            $table->timestamps();
        });
    }

    public function down()
    {
        //удаление таблицы
        Schema::dropIfExists('products');
    }
};
