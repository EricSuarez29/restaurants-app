<?php

namespace App\Http\Controllers;

use App\Http\Resources\RestaurantResource;
use App\Models\Restaurant;
use Illuminate\Http\Request;

class RestaurantController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $restaurants = Restaurant::where('status', 1)->get();
        return RestaurantResource::collection($restaurants);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $restaurantValidated = $request->validate([
            'name' => 'required',
            'description' => 'string',
            'address' => 'required',
            'phone' => 'string',
            'stars' => 'required',
            'type' => 'required',
        ]);

        $restaurantCreated = Restaurant::create($restaurantValidated);
        return new RestaurantResource($restaurantCreated);
    }

    /**
     * Display the specified resource.
     */
    public function show(Restaurant $restaurant)
    {
        return new RestaurantResource($restaurant);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Restaurant $restaurant)
    {
        if ($request->has('name')) $restaurant->name = $request['name'];
        if ($request->has('description')) $restaurant->description = $request['description'];
        if ($request->has('address')) $restaurant->address = $request['address'];
        if ($request->has('phone')) $restaurant->phone = $request['phone'];
        if ($request->has('stars')) $restaurant->stars = $request['stars'];
        if ($request->has('type')) $restaurant->type = $request['type'];

        $restaurant->save();
        return new RestaurantResource($restaurant);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Restaurant $restaurant)
    {
        $restaurant->status = 0;
        $restaurant->save();
    }
}
