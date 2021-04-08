<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Pilar extends Model
{
    //
    protected $table = 'pilares';
    protected $fillable = ['nombre','descripcion','etapa1','etapa2','etapa3','condicion'];

    public function indicadores()
    {
        return $this->hasMany('App\Indicador');
    }

    public function puntajepilares()
    {
        return $this->hasMany('App\Puntajepilar');
    }

   
}
