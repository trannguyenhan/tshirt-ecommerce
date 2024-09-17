<?php

namespace App\Repositories;

class ImageRepository extends BaseRepository
{
    public function getModel(): string
    {
        return \App\Models\Image::class;
    }
}
