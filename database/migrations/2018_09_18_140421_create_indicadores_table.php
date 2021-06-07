<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateIndicadoresTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('indicadores', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('idpilar')->unsigned();
            $table->string('nombre', 100)->nullable();
            $table->decimal('escala_menor', 11, 2);
            $table->decimal('escala_mayor', 11, 2);
            $table->boolean('condicion')->default(1);
            $table->timestamps();

            $table->foreign('idpilar')->references('id')->on('pilares');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('indicadores');
    }
}
