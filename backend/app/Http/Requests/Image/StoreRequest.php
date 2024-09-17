<?php

namespace App\Http\Requests\Image;

use App\Http\Requests\BaseRequest;

class StoreRequest extends BaseRequest
{
    public $regx = [
        'name' => 'string',
        'image' => 'required|image'
    ];
}
