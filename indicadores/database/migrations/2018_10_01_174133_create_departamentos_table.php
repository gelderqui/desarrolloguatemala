<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDepartamentosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('departamentos', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre', 30)->unique();
            $table->boolean('condicion')->default(1);
            
        });
        DB::table('departamentos')->insert(array('id'=>'1','nombre'=>'Guatemala'));
        DB::table('departamentos')->insert(array('id'=>'2','nombre'=>'Escuintla'));
        DB::table('departamentos')->insert(array('id'=>'3','nombre'=>'Izabal'));
        DB::table('departamentos')->insert(array('id'=>'4','nombre'=>'Alta Verapaz'));
        DB::table('departamentos')->insert(array('id'=>'5','nombre'=>'Quiché'));
        DB::table('departamentos')->insert(array('id'=>'6','nombre'=>'Huehuetenango'));
        DB::table('departamentos')->insert(array('id'=>'7','nombre'=>'Totonicapán'));
        DB::table('departamentos')->insert(array('id'=>'8','nombre'=>'San Marcos'));
        DB::table('departamentos')->insert(array('id'=>'9','nombre'=>'Jutiapa'));
        DB::table('departamentos')->insert(array('id'=>'10','nombre'=>'Baja Verapaz'));
        DB::table('departamentos')->insert(array('id'=>'11','nombre'=>'Santa Rosa'));
        DB::table('departamentos')->insert(array('id'=>'12','nombre'=>'Zacapa'));
        DB::table('departamentos')->insert(array('id'=>'13','nombre'=>'Suchitepéquez'));
        DB::table('departamentos')->insert(array('id'=>'14','nombre'=>'Chiquimula'));
        DB::table('departamentos')->insert(array('id'=>'15','nombre'=>'Jalapa'));
        DB::table('departamentos')->insert(array('id'=>'16','nombre'=>'Chimaltemango'));
        DB::table('departamentos')->insert(array('id'=>'17','nombre'=>'Quetzaltenango'));
        DB::table('departamentos')->insert(array('id'=>'18','nombre'=>'El Progreso'));
        DB::table('departamentos')->insert(array('id'=>'19','nombre'=>'Retalhuleu'));
        DB::table('departamentos')->insert(array('id'=>'20','nombre'=>'Sololá'));
        DB::table('departamentos')->insert(array('id'=>'21','nombre'=>'Sacatepéquez'));
        DB::table('departamentos')->insert(array('id'=>'22','nombre'=>'Petén'));
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('departamentos');
    }
}
