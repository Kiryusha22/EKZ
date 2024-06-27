<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use \App\Http\Resources\User;

/** @mixin User */
class UserResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'surname' => $this->surname,
            'patronymic' => $this->patronymic,
            'phone_number' => $this->phone_number,
            'login' => $this->login,
            'password' => $this->password,
            'role_id' => $this->role_id,
        ];
    }
}
