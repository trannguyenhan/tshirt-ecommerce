<?php

namespace App\Http\Requests\Bill;

use App\Http\Requests\BaseRequest;

class StoreRequest extends BaseRequest
{
    public $regx = [
        'product' => 'array',
        'products.*.product_id' => 'exists:products,id',
        'products.*.quantity' => 'numeric'
    ];
}
