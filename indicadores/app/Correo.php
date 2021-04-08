<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Correo extends Model
{
    //public $timestamps = false;
    //protected $table = 'categorias';
    //protected $primaryKey = 'id';
    protected $fillable = ['nombre','correo'];
}
