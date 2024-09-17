<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Bill extends Model
{
    use HasFactory;

    const INSERT_FIELDS = ['user_id', 'date_time', 'total_price', 'status'];
    const UPDATE_FIELDS = ['id', 'user_id', 'date_time', 'total_price', 'status'];

    protected $fillable = ['id', 'user_id', 'date_time', 'total_price', 'status'];

    public function user(): BelongsTo
    {
        return $this->belongsTo(\App\Models\User::class);
    }

    public function detailBills(): HasMany
    {
        return $this->hasMany(\App\Models\DetailBill::class);
    }
}
