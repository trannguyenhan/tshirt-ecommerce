<?php

namespace App\Http\Controllers;

use App\Http\Requests\IdRequest;
use App\Http\Requests\Image\StoreRequest;
use App\Repositories\ImageRepository;
use Illuminate\Http\JsonResponse;
use Illuminate\Validation\ValidationException;

class ImageController extends BaseController
{
    public function __construct(ImageRepository $repository)
    {
        $this->repository = $repository;
    }

    /**
     * @throws ValidationException
     */
    public function store(StoreRequest $request): JsonResponse
    {
        try {
            $image = $request->file('image');
            $path = $image->move('uploads', $image->getClientOriginalName());
            $path = url($path);

            $name = null;
            if($request->has('name')){
                $name = $request->get('name');
            }

            $arr = [
                'name' => $name,
                'url' => $path
            ];

            return $this->repository->doStore($arr);
        } catch (\Exception $e){
            throw ValidationException::withMessages([
               'image' => 'upload fail!'
            ]);
        }
    }

    public function delete(IdRequest $request){
        return $this->deleteTemplate($request);
    }
}
