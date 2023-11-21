<?php

namespace Database\Seeders;

use App\Models\System;
use Faker\Factory as Faker;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class SystemSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $faker = Faker::create();

        System::create([
            'name' => 'MX LINUX',
            'description' => 'MX Linux is a cooperative venture between the antiX and MX Linux communities',
            'release_date' => $faker->date,
            'latest_version' => '1.2 LTS',
            'owner' => 'antiX',
            'price' => 0
        ]);

        System::create([
            'name' => 'Ubuntu',
            'description' => 'The open-source desktop operating system that powers millions of PCs and laptops around the world',
            'release_date' => $faker->date,
            'latest_version' => '22.04 LTS',
            'owner' => 'Canonical',
            'price' => 0
        ]);

        System::create([
            'name' => 'Windows 11',
            'description' => 'Windows 11 is the latest major release of Microsofts Windows NT operating system, released on October 5, 2021',
            'release_date' => $faker->date,
            'latest_version' => '11',
            'owner' => 'Microsoft',
            'price' => 3000
        ]);
    }
}
