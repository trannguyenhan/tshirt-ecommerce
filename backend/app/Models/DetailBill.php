<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class DetailBill extends Model
{
    use HasFactory;

    const INSERT_FIELDS = ['bill_id', 'product_id', 'quantity', 'price'];
    const UPDATE_FIELDS = ['id', 'bill_id', 'product_id', 'quantity', 'price'];

    protected $fillable = ['id', 'bill_id', 'product_id', 'quantity', 'price'];

    public function bill(): BelongsTo
    {
        return $this->belongsTo(\App\Models\Bill::class);
    }

    public function products(): BelongsTo
    {
        return $this->belongsTo(\App\Models\Product::class, 'product_id');
    }
}
