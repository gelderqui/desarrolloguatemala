<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Puntajeindicador extends Model
{
    protected $table = 'puntajeindicadores';
    protected $fillable =['id','ponderacion','porcentaje','idindicador'];

    public function indice(){
        return $this->belongsTo('App\Indice');
    }

    public function indicador(){
        return $this->belongsTo('App\Indicador');
    }
}
