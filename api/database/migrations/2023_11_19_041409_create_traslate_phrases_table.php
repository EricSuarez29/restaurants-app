<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('traslate_phrases', function (Blueprint $table) {
            $table->id();
            $table->string('phrase');
            $table->string('translation');
            $table->string('description')->nullable();
            $table->json('synonyms')->nullable();
            $table->string('example')->nullable();
            $table->string('past');
            $table->integer('status')->default(1);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('traslate_phrases');
    }
};
