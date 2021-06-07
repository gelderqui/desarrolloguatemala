<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Departamento extends Model
{
    protected $table = 'departamentos';
    protected $fillable =['nombre','condicion'];

    public function indices()
    {
        return $this->hasMany('App\Indice');
    }
}
