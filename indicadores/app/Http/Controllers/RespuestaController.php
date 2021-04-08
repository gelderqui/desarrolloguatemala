<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Respuesta;
use Illuminate\Support\Facades\DB;
use App\User;

class RespuestaController extends Controller
{
    public function store(Request $request) 
    {
        if (!$request->ajax()) return redirect('/');

        $idusers = \Auth::user()->id;

        $users=DB::table('users')->where('id','=',$idusers)->first();
        $iddep=$users->iddep;

        $indice=DB::table('indices')->where('iddep','=',$iddep)->where('anio','=',date('Y'))->first();
        $idindice=$indice->id;

        $detalles = $request->arrayPregunta;//Array de detalles
            //Recorro todos los elementos

            foreach($detalles as $ep=>$det)
            {
                $detalle = new Respuesta();
                $detalle->idmun = $idindice;
                $detalle->ponderacion = $det['idpilar'];
                $detalle->idindicador = $det['id'];       
                $detalle->save();
            } 
           /* return [

            'idusers' =>$idusers,
        'iddep' =>$iddep,
        'idindice' =>$idindice,
        'iddep' =>$iddep
            ];*/
    }

    public function storeAdmin(Request $request) 
    {
        if (!$request->ajax()) return redirect('/');

        $iddep1 = $request->iddep;

        $indice=DB::table('indices')->where('iddep','=',$iddep1)->where('anio','=',date('Y'))->first();
        $idindice=$indice->id;

        $detalles = $request->arrayPregunta;//Array de detalles
            //Recorro todos los elementos

            foreach($detalles as $ep=>$det)
            {
                $detalle = new Respuesta();
                $detalle->idmun = $idindice;
                $detalle->ponderacion = $det['idpilar'];
                $detalle->idindicador = $det['id'];       
                $detalle->save();
            } 
           /* return [

            'idusers' =>$idusers,
        'iddep' =>$iddep,
        'idindice' =>$idindice,
        'iddep' =>$iddep
            ];*/
    }

    public function storeRest(Request $request) 
    {
        if (!$request->ajax()) return redirect('/');

        $iddep1 = $request->iddep;

        $indice=DB::table('indices')->where('iddep','=',$iddep1)->where('anio','=',date('Y'))->first();
        $idindice=$indice->id;

        $detalles = $request->arrayPregunta;//Array de detalles
            //Recorro todos los elementos

        foreach($detalles as $ep=>$det)
        {
            $detalle = new Respuesta();
            $detalle->idmun = $idindice;
            $detalle->ponderacion = $det['idpilar'];
            $detalle->idindicador = $det['id'];       
            $detalle->save();
        } 
    }

    
}
