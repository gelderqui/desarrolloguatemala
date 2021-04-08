<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Puntajepilar extends Model
{
    protected $table = 'puntajepilares';
    protected $primaryKey = 'id';
    protected $fillable =['idmun','ponderacion','porcentaje','idpilar'];

    public function indice(){
        return $this->belongsTo('App\Indice');
    }

    public function pilar(){
        return $this->belongsTo('App\Pilar');
    }

    
}
