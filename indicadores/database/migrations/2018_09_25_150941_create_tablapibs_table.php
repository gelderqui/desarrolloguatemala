<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTablapibsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tablapibs', function (Blueprint $table) {
            $table->increments('id');
            $table->string('etapa', 30)->unique();
            $table->decimal('pib_menor', 11, 2);
            $table->decimal('pib_mayor', 11, 2);
            $table->timestamps();          
        });
        DB::table('tablapibs')->insert(array('id'=>'1','etapa'=>'Etapa1', 'pib_menor'=>0,'pib_mayor'=>0));
        DB::table('tablapibs')->insert(array('id'=>'2','etapa'=>'Etapa2', 'pib_menor'=>0,'pib_mayor'=>0));
        DB::table('tablapibs')->insert(array('id'=>'3','etapa'=>'Etapa3', 'pib_menor'=>0,'pib_mayor'=>0));
            
        
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tablapibs');
    }
}
