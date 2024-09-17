<?php

namespace App\Repositories;

use Illuminate\Http\JsonResponse;

class UserRepository extends BaseRepository
{
    public function getModel(): string
    {
        return \App\Models\User::class;
    }

    public function addProductToCard($productId, $quantity): JsonResponse
    {
        $user = auth()->user();
        $user->cart()->detach($productId); // detach all product with productId to cart
        $user->cart()->attach($productId, ['quantity' => $quantity]); // add again product to cart -> sync productId

        return \App\Helper::successResponse("add product to cart successfully");
    }

    public function deleteProductToCard($productId): JsonResponse
    {
        $user = auth()->user();
        $user->cart()->detach($productId);

        return \App\Helper::successResponse("delete product to cart successfully");
    }

    public function deleteAllProductToCard(): JsonResponse
    {
        $user = auth()->user();
        $user->cart()->detach();

        return \App\Helper::successResponse("delete product to cart successfully");
    }
}
