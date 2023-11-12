<?php

namespace Database\Seeders;

use App\Models\Restaurant;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class RestaurantSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Restaurant::create([
            'name' => 'Campomar Insurgentes',
            'description' => 'De lo mejor que hay en mariscos',
            'stars' =>  4,
            'address' => 'Av Insurgentes #1004',
            'phone' => '477123123',
            'type' => 'Mexicana, Latina',
        ]);

        Restaurant::create([
            'name' => 'Parole Polanco',
            'description' => 'De lo Buen lugar para cumple',
            'stars' =>  5,
            'address' => 'Col Polanco',
            'phone' => '4774324123',
            'type' => 'Italiana, Contemporánea',
        ]);

        Restaurant::create([
            'name' => 'Quezadillas Doña Pelos',
            'description' => 'Mejores quecas de la colonia',
            'stars' =>  3,
            'address' => 'La Ermita #101',
            'phone' => '477234323',
            'type' => 'Mexicana, Fina',
        ]);
    }
}
