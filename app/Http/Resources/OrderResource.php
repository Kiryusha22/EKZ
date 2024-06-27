<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use \App\Models\Order;

/** @mixin Order */
class OrderResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'total_price' => $this->total_price,
            'user_id' => $this->user_id,
            'is_paid' => $this->is_paid,
            'user' => new UserResource($this->user),
        ];
    }
}
