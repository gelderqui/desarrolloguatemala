<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Puntajepregunta extends Model
{
    protected $table = 'puntajepreguntas';
    protected $fillable =['id','ponderacion','idpregunta'];

    public function indice(){
        return $this->belongsTo('App\Indice');
    }

    public function pregunta(){
        return $this->belongsTo('App\Pregunta');
    }
}
