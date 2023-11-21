<?php

namespace App\Http\Controllers;

use App\Http\Resources\SystemResource;
use App\Models\System;
use Illuminate\Http\Request;

class SystemController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $systems = System::where('status', 1)->get();
        return SystemResource::collection($systems);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $os = $request->validate([
            'name' => 'required',
            'description' => 'string',
            'release_date' => 'date',
            'latest_version' => 'string',
            'owner' => 'string',
            'price' => 'numeric'
        ]);

        $systemCreated = System::create($os);
        return new SystemResource($systemCreated);
    }

    /**
     * Display the specified resource.
     */
    public function show(System $system)
    {
        return new SystemResource($system);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, System $system)
    {
        if ($request['name']) $system->name = $request['name'];
        if ($request['description']) $system->description = $request['description'];
        if ($request['release_date']) $system->release_date = $request['release_date'];
        if ($request['latest_version']) $system->latest_version = $request['latest_version'];
        if ($request['owner']) $system->owner = $request['owner'];
        if ($request['price']) $system->price = $request['price'];

        $system->save();
        return new SystemResource($system);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(System $system)
    {
        $system->status = 0;
        $system->save();
    }
}
