<?php

namespace App\Http\Requests;

class IdRequest extends BaseRequest
{
    public $regx = [
        'id' => 'required|numeric'
    ];
}
