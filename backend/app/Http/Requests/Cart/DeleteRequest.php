<?php

namespace App\Http\Requests\Cart;

use App\Http\Requests\BaseRequest;

class DeleteRequest extends BaseRequest
{
    public $regx = [
        'product_id' => 'required|numeric|exists:products,id'
    ];
}
