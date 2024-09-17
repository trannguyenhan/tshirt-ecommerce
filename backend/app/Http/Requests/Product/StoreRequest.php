<?php

namespace App\Http\Requests\Product;

use App\Http\Requests\BaseRequest;
use Illuminate\Validation\Rule;

class StoreRequest extends BaseRequest
{
    public function rules(): array
    {
        return [
            'url_image' => 'required|string|max:500',
            'description' => 'string',
            'title' => 'required|string|max:255',
            'size' => Rule::in("L", "M", "XL", "S", "XXL", "oversize"),
            'material' => 'string',
            'price' => 'required|numeric',
            'warehouse' => 'required|numeric'
        ];
    }
}
