<?php

namespace App\Http\Controllers;

use App\Http\Requests\Bill\StoreRequest;
use App\Http\Requests\IdRequest;
use App\Repositories\BillRepository;

class BillController extends BaseController
{
    public function __construct(BillRepository $repository)
    {
        $this->repository = $repository;
    }

    public function store(StoreRequest $request){
        if(!$request->has('products')){
            return \App\Helper::errorResponse("Not product in bill");
        }

        $products = $request->get('products');
        if(count($products) == 0){
            return \App\Helper::errorResponse("Not product in bill");
        }

        $userId = auth()->id();
        return $this->repository->store($userId, $products);
    }

    public function delete(IdRequest $request){
        return $this->deleteTemplate($request);
    }
}
