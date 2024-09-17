<?php

use App\Http\Controllers\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group([
    'middleware' => 'api',
    'prefix' => 'auth'
], function () {
    Route::post('/login', [AuthController::class, 'login']);
    Route::post('/register', [AuthController::class, 'register']);
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::post('/refresh', [AuthController::class, 'refresh']);
    Route::post('/me', [\App\Http\Controllers\UserController::class, 'profile'])->middleware('auth:api');
});

Route::group([
    'middleware' => ['api', 'auth:api']
], function(){
    Route::group(['prefix' => '/product', 'middleware' => [ROLE_ADMIN]], function () {
        Route::post('store', [\App\Http\Controllers\ProductController::class, 'store']);
        Route::post('update', [\App\Http\Controllers\ProductController::class, 'update']);
        Route::post('delete', [\App\Http\Controllers\ProductController::class, 'delete']);
    });

    Route::group(['prefix' => '/image', 'middleware' => [ROLE_ADMIN]], function () {
        Route::get('listing', [\App\Http\Controllers\ImageController::class, 'listing']);
        Route::post('store', [\App\Http\Controllers\ImageController::class, 'store']);
        Route::post('delete', [\App\Http\Controllers\ImageController::class, 'delete']);
    });

    Route::group(['prefix' => 'cart'], function(){
        Route::post('store', [\App\Http\Controllers\UserController::class, 'addProductToCart']);
        Route::post('delete', [\App\Http\Controllers\UserController::class, 'deleteProductToCard']);
        Route::post('delete-all', [\App\Http\Controllers\UserController::class, 'deleteAllProductToCart']);
    });

    Route::group(['prefix' => 'bill'], function(){
        Route::get('listing', [\App\Http\Controllers\BillController::class, 'listing']);
        Route::post('store', [\App\Http\Controllers\BillController::class, 'store']);
        Route::post('delete', [\App\Http\Controllers\BillController::class, 'delete']);
    });

});

Route::get('product/listing', [\App\Http\Controllers\ProductController::class, 'listing']);
Route::get('product/detail', [\App\Http\Controllers\ProductController::class, 'detail']);
Route::get('category/listing', [\App\Http\Controllers\CategoryController::class, 'listing']);
Route::get('brand/listing', [\App\Http\Controllers\BrandController::class, 'listing']);
