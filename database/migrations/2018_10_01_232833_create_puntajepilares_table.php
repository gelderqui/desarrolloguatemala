<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePuntajepilaresTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('puntajepilares', function (Blueprint $table) {
            $table->integer('id')->unsigned();
            $table->foreign('id')->references('id')->on('indices')->onDelete('cascade');
            
            $table->decimal('ponderacion', 10, 2);
            $table->decimal('porcentaje', 10, 2);

            $table->integer('idpilar')->unsigned();
            $table->foreign('idpilar')->references('id')->on('pilares');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('puntajepilares');
    }
}
