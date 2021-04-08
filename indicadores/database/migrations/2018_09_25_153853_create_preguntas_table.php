<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePreguntasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('preguntas', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('idindicador')->unsigned();
            $table->string('pregunta', 60)->unique();
            $table->boolean('condicion_organizacion')->default(0);
            $table->string('nombre', 20)->nullable();
            $table->boolean('condicion')->default(1);
            $table->timestamps();

            $table->foreign('idindicador')->references('id')->on('indicadores');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('preguntas');
    }
}
