<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Validation\UnauthorizedException;
use TCG\Voyager\Models\Role;

class RoleMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next, $role)
    {
        $user = auth('api')->user();
        $roleId = $user->role_id;
        $roleModel = Role::query()->find($roleId);

        if($roleModel == null){
            throw new UnauthorizedException();
        }

        if($roleModel->name != $role){
            throw new UnauthorizedException();
        }

        return $next($request);
    }
}
