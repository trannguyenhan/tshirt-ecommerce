<?php

namespace App\Repositories;

use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Validation\ValidationException;

abstract class BaseRepository
{
    protected $_model;
    protected $_relationships = [];

    /**
     * Return model will use in repository
     * \App\Models\Name::class
     */
    abstract public function getModel();

    public function __construct()
    {
        $this->_model = app()->make($this->getModel());
    }

    /**
     * @param $keyword
     * @param $page
     * @param $pageSize
     * @return JsonResponse
     */
    public function doList($keyword,
                           $page,
                           $pageSize){
        $query = (new $this->_model)->query(); // create new query

        $query = $this->search($query, $keyword);
        $total = $query->count();

        $query = $query->skip(($page-1) * $pageSize)->take($pageSize);

        $query = $this->relationships($query);
        $result = $this->modifyResult($query->get()->toArray());

        return \App\Helper::successResponseList($result, $total);
    }

    // filter by keyword
    public function search($query, $keyword){
        if($keyword == null) {
            return $query;
        }

        return $query->where('name', 'LIKE', "%$keyword%");
    }

    // override if modify response content
    // suggest: use for in array
    public function modifyResult($collection){
        return $collection;
    }

    // get with relationships
    public function relationships($query){
        if(count($this->_relationships) != 0){
            foreach ($this->_relationships as $relationship){
                $query = $query->with($relationship);
            }
        }

        return $query;
    }

    /**
     * @param $arr
     * @return JsonResponse
     */
    public function doStore($arr): JsonResponse
    {
        $model = new $this->_model;

        $model->fill($arr);
        if($model->save()){
            return \App\Helper::successResponse($model);
        } else {
            return \App\Helper::errorResponse();
        }
    }

    /**
     * @param $arr
     * @return JsonResponse
     */
    public function doUpdate($arr): JsonResponse
    {
        $class = get_class($this->_model);
        $id = defined("$class::PRIMARY_KEY")? $arr[$class::PRIMARY_KEY] : $arr['id'];

        $model = $this->_model->query()->find($id);

        if($model != null){
            $model->fill($arr);
            if($model->save()){
                return \App\Helper::successResponse($model);
            }
        }

        return \App\Helper::errorResponse("update fail!");
    }

    /**
     * @param $id
     * @return JsonResponse
     * @throws ValidationException
     */
    public function doDelete($id): JsonResponse
    {
        if($id == auth()->id() && $this->_model instanceof User){
            throw ValidationException::withMessages([
                'user' => 'Can not delete my own account'
            ]);
        }

        $model = (new $this->_model)->query()->find($id);

        if($model != null && $model->deleted_at == null){
            if($model->delete()){
                return \App\Helper::successResponse("Delete successfully!");
            } else {
                return \App\Helper::errorResponse("Delete error!");
            }
        }

        return \App\Helper::errorResponse("Object not exists!");
    }
}
