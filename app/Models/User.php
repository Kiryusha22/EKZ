<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Hash;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'id',
        'name',
        'surname',
        'patronymic',
        'phone_number',
        'login',
        'password',
        'role_id',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',

    ];
    public function role():BelongsTo
    {
        return $this->belongsTo(Role::class);
    }
    public function orders(): HasMany
    {
        return $this->hasMany(Order::class);
    }
    public function order(): BelongsTo
    {
        return $this->belongsTo(Order::class);
    }
    public static function boot(): void
    {
        parent::boot();

        static::creating(function ($user) {
            $user->password = Hash::make($user->password);
        });

        static::updating(function ($user) {
            if ($user->isDirty('password')) {
                $user->password = Hash::make($user->password);
            }
        });
    }
}
