<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Models\Category;

class Product extends Model
{
    use HasFactory;

    const INSERT_FIELDS = ['url_image', 'description', 'title', 'size', 'material', 'price', 'warehouse'];
    const UPDATE_FIELDS = ['id', 'url_image', 'description', 'title', 'size', 'material', 'price', 'warehouse'];

    protected $fillable = ['id', 'url_image', 'description', 'title', 'size', 'material', 'price', 'warehouse'];

    protected $casts = [
        'size' => 'array'
    ];

    public function brand(){
        return $this->belongsTo(Brand::class);
    }

    public function category(){
        return $this->belongsTo(Category::class);
    }
}
