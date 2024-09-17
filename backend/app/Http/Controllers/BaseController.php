<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class BaseController extends Controller
{
    /**
     * @param Request $request
     * @return mixed
     */
    public function listing(Request $request){
        $keyword = $request->query('keyword');
        $page = $this->getPage($request);
        $pageSize = $this->getPageSize($request);

        return $this->repository->doList($keyword, $page, $pageSize);
    }

    /**
     * Current page, default is 1
     * @param $request
     * @return int
     */
    private function getPage($request): int
    {
        $page = $request->query('page') != null ? intval($request->query('page')) : 1;
        if ($page < 1) {
            $page = 1;
        }
        return $page;
    }

    /**
     * Number of item in page, default is 10
     * @param $request
     * @return int
     */
    private function getPageSize($request): int
    {
        return $request->query('page_size') != null ? intval($request->query('page_size')) : 1000;
    }
}
