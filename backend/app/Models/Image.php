<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Image extends Model
{
    use HasFactory;

    const INSERT_FIELDS = ['name', 'url'];
    const UPDATE_FIELDS = ['id', 'name', 'url'];

    protected $fillable = ['id', 'name', 'url'];

    public $timestamps = false;
}
