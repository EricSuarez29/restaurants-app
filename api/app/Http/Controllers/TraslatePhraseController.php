<?php

namespace App\Http\Controllers;

use App\Http\Resources\TranslatePhraseResource;
use App\Models\TraslatePhrase;
use Illuminate\Http\Request;

class TraslatePhraseController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $phrases = TraslatePhrase::where('status', 1)->get();
        return TranslatePhraseResource::collection($phrases);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $phrase = $request->validate([
            'phrase' => 'required',
            'translation' => 'required',
            'description' => 'string',
            'synonyms' => 'array',
            'example' => 'string',
            'past' => 'string',
        ]);

        $phraseCreated = TraslatePhrase::create($phrase);
        return new TranslatePhraseResource($phraseCreated);
    }

    /**
     * Display the specified resource.
     */
    public function show(TraslatePhrase $traslatePhrase)
    {
        return new TranslatePhraseResource($traslatePhrase);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, TraslatePhrase $traslatePhrase)
    {
        if ($request['name']) $traslatePhrase->name = $request['name'];
        if ($request['translation']) $traslatePhrase->translation = $request['translation'];
        if ($request['description']) $traslatePhrase->description = $request['description'];
        if ($request['synonyms']) $traslatePhrase->synonyms = $request['synonyms'];
        if ($request['example']) $traslatePhrase->example = $request['example'];
        if ($request['past']) $traslatePhrase->past = $request['past'];

        $traslatePhrase->save();
        return new TranslatePhraseResource($traslatePhrase);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(TraslatePhrase $traslatePhrase)
    {
        $traslatePhrase->status = 0;
        $traslatePhrase->save();
    }
}
