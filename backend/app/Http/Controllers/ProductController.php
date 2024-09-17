<?php

namespace App\Http\Controllers;

use App\Http\Requests\IdRequest;
use App\Http\Requests\Product\StoreRequest;
use App\Http\Requests\Product\UpdateRequest;
use App\Models\Product;
use App\Repositories\ProductRepository;

class ProductController extends BaseController
{
    public function __construct(ProductRepository $repository)
    {
        $this->repository = $repository;
    }

    public function detail(IdRequest $request){
        $id = $request->get('id');
        return $this->repository->detail($id);
    }

    public function store(StoreRequest $request){
        return $this->storeTemplate($request, Product::INSERT_FIELDS);
    }

    public function update(UpdateRequest $request){
        return $this->updateTemplate($request, Product::UPDATE_FIELDS);
    }

    public function delete(IdRequest $request){
        return $this->deleteTemplate($request);
    }
}
