<?php

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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

 Route::post('users/adduser','App\Http\Controllers\UserController@adduser');
 Route::get('users/list','App\Http\Controllers\UserController@Ulist');
Route::post('user/images','App\Http\Controllers\UserController@images');
Route::post('users/addfather','App\Http\Controllers\UserController@addfather');
Route::post('users/addmother','App\Http\Controllers\UserController@addmother');
Route::get('users/family/list','App\Http\Controllers\UserController@familylist');
Route::get('users/user/list','App\Http\Controllers\UserController@userlist');

Route::post('user/test/image','App\Http\Controllers\UserController@testimage');