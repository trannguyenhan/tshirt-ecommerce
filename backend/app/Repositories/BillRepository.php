<?php

namespace App\Repositories;

use App\Helper;
use App\Models\Bill;
use App\Models\DetailBill;
use App\Models\Product;
use Carbon\Carbon;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\DB;

class BillRepository extends BaseRepository
{
    protected $_relationships = ['detailBills.products'];

    public function getModel(): string
    {
        return \App\Models\Bill::class;
    }

    public function modifyResult($collection)
    {
        $collection = array_map(function ($item){
            $item['detail_bills'] = array_map(function($subItem){
                $subItem['products']['url_image'] = Helper::updatedImage($subItem['products']['url_image']);
                return $subItem;
            }, $item['detail_bills']);

            return $item;
        }, $collection);
        return parent::modifyResult($collection);
    }

    /**
     * With each user can see user's data
     * @param $query
     * @param $keyword
     * @return mixed
     */
    public function search($query, $keyword)
    {
        return $query->where('user_id', auth()->id());
    }

    /**
     * Store bill in bills table
     * And store each information of product to detail_bills table
     * @param $userId
     * @param $products
     * @return JsonResponse
     */
    public function store($userId, $products): JsonResponse
    {
        $totalPrice = 0;

        // map price of each product
        $products = array_map(function($item){
            $newItem = array();
            if(array_key_exists('product_id', $item)){
                $productId = $item['product_id'];
                $quantity = 1;
                if(array_key_exists('quantity', $item)){
                    $quantity = $item['quantity'];
                }

                $objProduct = Product::query()->find($productId);
                $price = $objProduct->price * $quantity;

                $newItem['product_id'] = $productId;
                $newItem['quantity'] = $quantity;
                $newItem['price'] = $price;
            }

            return $newItem;
        }, $products);

        // calculator total price
        foreach ($products as $product){
            $totalPrice += $product['price'];
        }

        DB::beginTransaction();

        try {
            // save bill
            $bill = Bill::create([
                'user_id' => $userId,
                'date_time' => Carbon::now()->format('Y-m-d H:i:s'),
                'total_price' => $totalPrice,
            ]);

            // save detail bill
            foreach ($products as $product){
                DetailBill::create([
                    'bill_id' => $bill->id,
                    'product_id' => $product['product_id'],
                    'quantity' => $product['quantity'],
                    'price' => $product['price']
                ]);

                $databaseProduct = Product::query()->find($product['product_id']);
                $databaseProduct->warehouse = $databaseProduct->warehouse - $product['quantity'];
                $databaseProduct->save();
            }
        } catch (\Exception $e){
            return \App\Helper::errorResponse("Update bill fail");
        }

        DB::commit();
        return \App\Helper::successResponse();
    }
}
