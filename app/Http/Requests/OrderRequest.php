<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class OrderRequest extends FormRequest
{
    public function rules(): array
    {
        return [
            'total_price' => ['required', 'numeric'],
            'user_id' => ['required', 'integer'],
            'is_paid' => ['boolean'],
        ];
    }

    public function authorize(): bool
    {
        return true;
    }
}
