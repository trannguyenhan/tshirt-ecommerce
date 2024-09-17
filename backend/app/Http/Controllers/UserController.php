<?php

namespace App\Http\Controllers;

use App\Helper;
use App\Http\Requests\Cart\DeleteRequest;
use App\Http\Requests\Cart\StoreRequest;
use App\Repositories\UserRepository;
use Illuminate\Http\JsonResponse;

class UserController extends Controller
{
    public function __construct(UserRepository $repository)
    {
        $this->repository = $repository;
    }

    public function profile(){
        $user = auth()->user()->load('roles:id,name')->load('cart');
        $user->cart = $user->cart->map(function($item){
            $item->url_image = Helper::updatedImage($item->url_image);
            return $item;
        });

        return \App\Helper::successResponse($user);
    }

    public function addProductToCart(StoreRequest $request): JsonResponse
    {
        $productId = $request->get('product_id');
        $quantity = 1;
        if($request->has('quantity')){
            $quantity = $request->get('quantity');
        }

        return $this->repository->addProductToCard($productId, $quantity);
    }

    public function deleteProductToCard(DeleteRequest $request): JsonResponse
    {
        $productId = $request->input('product_id');
        return $this->repository->deleteProductToCard($productId);
    }

    public function deleteAllProductToCart(): JsonResponse
    {
        return $this->repository->deleteAllProductToCard();
    }
}
