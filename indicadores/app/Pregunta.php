<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Pregunta extends Model
{
    protected $table = 'preguntas'; 
    protected $fillable =['idindicador','pregunta','condicion_organizacion','nombre','condicion'];
    
    public function indicador(){
        return $this->belongsTo('App\Indicador');
    }

    public function puntajepreguntas()
    {
        return $this->hasMany('App\Puntajepregunta');
    }

    public function respuestas()
    {
        return $this->hasMany('App\Respuesta');
    }
}
