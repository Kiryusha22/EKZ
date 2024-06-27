<?php

namespace App\Http\Resources;

use App\Models\Order;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Models\Cart;

/** @mixin Cart
 * @property mixed $order
 * @property mixed $product
 */
class CartResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'order_id' => $this->order_id,
            'product_id' => $this->product_id,
            'order' => new OrderResource($this->order),
            'product' => new ProductResource($this->product),
        ];
    }
}
