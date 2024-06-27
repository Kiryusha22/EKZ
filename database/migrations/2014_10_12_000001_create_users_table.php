<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        //Создание таблицы
        Schema::create('users', function (Blueprint $table) {

            $table->id();
            $table->string('name');
            $table->string('surname');
            $table->string('patronymic');
            $table->string('phone_number', 11)->unique();
            $table->string('login');
            $table->string('password');
            $table->unsignedBigInteger('role_id')->default(2);

            $table->foreign('role_id')->references('id')->on('roles');

            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //удаление таблицы
        Schema::dropIfExists('users');
    }
};
