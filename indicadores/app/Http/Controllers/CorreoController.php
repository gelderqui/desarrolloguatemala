<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Correo;

class CorreoController extends Controller
{
    public function store(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $corre=new Correo();
        $corre->nombre=$request->nombre;
        $corre->correo=$request->correo;
        $corre->save();
    }
}
