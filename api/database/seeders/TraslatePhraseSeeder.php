<?php

namespace Database\Seeders;

use App\Models\TraslatePhrase;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class TraslatePhraseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        TraslatePhrase::create([
            'phrase' => 'Happy',
            'translation' => 'Feliz',
            'description' => 'Persona que reboza de felicidad',
            'synonyms' => ['Glad'],
            'example' => 'Steve is so happy because he get a new job position',
            'past' => 'Happy',
        ]);

        TraslatePhrase::create([
            'phrase' => 'Run',
            'translation' => 'Correr',
            'description' => 'Action to run',
            'synonyms' => ['Walk'],
            'example' => 'John is running',
            'past' => 'Ran',
        ]);
    }
}
