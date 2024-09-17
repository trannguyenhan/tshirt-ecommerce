<?php

namespace App\Http\Controllers;

use App\Repositories\BrandRepository;
use Illuminate\Http\Request;

class BrandController extends BaseController
{
    public function __construct(BrandRepository $brandRepository)
    {
        $this->repository = $brandRepository;
    }
}
