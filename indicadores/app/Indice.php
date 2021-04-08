<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Indice extends Model
{
    protected $table = 'indices';
    protected $fillable =['iddep','poblacion','anio','pib','puntaje','condicion'];
   
    public function departamento(){
        return $this->belongsTo('App\Departamento');
    }

    public function puntajeindicadores()
    {
        return $this->hasMany('App\Puntajeindicador');
    }

    public function puntajepilares()
    {
        return $this->hasMany('App\Puntajepilar');
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
