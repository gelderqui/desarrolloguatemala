<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Respuesta;
use App\Pregunta;
use App\Puntajepregunta;

class PuntajePreguntaController extends Controller
{
    
    public function store(Request $request)
    {           
        if (!$request->ajax()) return redirect('/');
        $idp= $request->id;
        $detallesR = $request->datar;
        $varid=$request->rest;

        $varh=0;
        $rest1=0;
        $vardiv=0;
        //Array de detalles
            //Recorro todos los elementos
        
        if( $varid > 0){

            $suma = $detallesR[0]['idpregunta'];

            for ($i=0; $i < $varid; $i++) 
            {
                if($suma==$detallesR[$i]['idpregunta']){
                    $rest1=$rest1+$detallesR[$i]['ponderacion'];
                    $varh=$varh+1;
                    $vardiv=$detallesR[$i]['idpregunta'];
                }
                else{
                    $puntaje = new Puntajepregunta();
                    $puntaje->id = $idp;
                    $puntaje->ponderacion = $rest1/$varh;
                    $puntaje->idpregunta = $vardiv;
                    $puntaje->save();
                    $rest1=0;
                    $varh=0;
                }
            }       
        }
        
    }

    public function listaRespuestas(Request $request)
    {
        $id= $request->id;
        $repuestas = Respuesta::where('id','=',$id)
        ->select('ponderacion','idpregunta') ->orderBy('idpregunta', 'asc')->get();
        return ['repuestas' => $repuestas];
    }

    public function selectPregunta(Request $request){
        if (!$request->ajax()) return redirect('/');
        $preguntas = Pregunta::where('condicion','=','1')
        ->select('id')->orderBy('id', 'asc')->get();
        return ['preguntas' => $preguntas];
    }
}
