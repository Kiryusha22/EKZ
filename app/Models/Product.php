<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Support\Facades\Storage;

class Product extends Model
{
    protected $fillable = [
        'id',
        'name',
        'description',
        'price',
        'image',
        'type_category_id',
    ];
    public function cart(): HasMany
    {
    return $this->hasMany(Cart::class);
    }
    public function orders(): BelongsToMany
    {
        return $this->belongsToMany(Order::class, Cart::class);
    }
    public function TypeCategory(): BelongsTo
    {
        return $this->belongsTo(TypeCategory::class);
    }
}
