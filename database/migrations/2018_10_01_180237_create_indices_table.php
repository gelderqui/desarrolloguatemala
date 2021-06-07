<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateIndicesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('indices', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('iddep')->unsigned();
            $table->string('poblacion', 10)->nullable();
            $table->string('anio', 10)->nullable();
            $table->decimal('pib', 11, 2);
            $table->decimal('puntaje', 11, 2)->nullable();
            $table->boolean('condicion')->default(1);
            $table->timestamps();

            $table->foreign('iddep')->references('id')->on('departamentos');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('indices');
    }
}
