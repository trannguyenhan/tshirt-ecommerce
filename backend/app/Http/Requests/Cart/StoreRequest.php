<?php

namespace App\Http\Requests\Cart;

use App\Http\Requests\BaseRequest;

class StoreRequest extends BaseRequest
{
    public $regx = [
        'product_id' => 'required|numeric|exists:products,id',
        'quantity' => 'numeric'
    ];
}
