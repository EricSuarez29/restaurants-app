<?php

use App\Http\Controllers\RestaurantController;
use App\Http\Controllers\SystemController;
use App\Http\Controllers\TraslatePhraseController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::controller(RestaurantController::class)
    ->prefix('/restaurants')
    ->group(function () {
        Route::get('/', 'index');
        Route::post('/', 'store');
        Route::get('/{restaurant}', 'show');
        Route::put('/{restaurant}', 'update');
        Route::delete('/{restaurant}', 'destroy');
    });

Route::controller(SystemController::class)
    ->prefix('/systems')
    ->group(function () {
        Route::get('/', 'index');
        Route::post('/', 'store');
        Route::get('/{system}', 'show');
        Route::put('/{system}', 'update');
        Route::delete('/{system}', 'destroy');
    });

Route::controller(TraslatePhraseController::class)
    ->prefix('/phrases')
    ->group(function () {
        Route::get('/', 'index');
        Route::post('/', 'store');
        Route::get('/{traslatePhrase}', 'show');
        Route::put('/{traslatePhrase}', 'update');
        Route::delete('/{traslatePhrase}', 'destroy');
    });
