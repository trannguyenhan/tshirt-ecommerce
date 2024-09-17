<?php

namespace App\Repositories;

use App\Helper;
use Illuminate\Http\JsonResponse;

class ProductRepository extends BaseRepository
{
    protected $_relationships = ['brand', 'category'];

    public function getModel(): string
    {
        return \App\Models\Product::class;
    }

    public function modifyResult($collection)
    {
        $collection = array_map(function ($item){
            $item['url_image'] = Helper::updatedImage($item['url_image']);
            if($item['description'] == null){
                $item['description'] = "";
            }
            return $item;
        }, $collection);
        return parent::modifyResult($collection);
    }

    public function search($query, $keyword)
    {
        if($keyword == null || $keyword == "") {
            return $query;
        }

        return $query->where('title', 'LIKE', "%$keyword%");
    }

    public function detail($id): JsonResponse
    {
        $product = \App\Models\Product::query()->find($id);
        if($product != null){
            return \App\Helper::successResponse($product);
        }

        return \App\Helper::errorResponse("error");
    }
}
