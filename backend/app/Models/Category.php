<?php

namespace App\Models;

class Category extends \TCG\Voyager\Models\Category
{
    public function products(){
        return $this->hasMany(Product::class);
    }
}
