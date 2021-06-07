<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Pilar;
use App\Tablapib;
use App\Puntajepilar;
use App\Indice; 

class IndiceController extends Controller
{
    public function index(Request $request)
    {
       // if (!$request->ajax()) return redirect('/');
        $buscar = $request->buscar;
        $criterio = $request->criterio;
        
        if ($buscar==''){
            $indices = Indice::join('departamentos','indices.iddep','=','departamentos.id')
            ->select('indices.id','indices.iddep','indices.poblacion','departamentos.nombre as departamento','indices.anio','indices.pib','indices.puntaje')
            ->orderBy('indices.id', 'desc')->paginate(6);
        }
        else{
            $indices = Indice::join('departamentos','indices.iddep','=','departamentos.id')
            ->select('indices.id','indices.iddep','indices.poblacion','departamentos.nombre as departamento','indices.anio','indices.pib','indices.puntaje')
            ->where('indices.'.$criterio, 'like', '%'. $buscar . '%')
            ->orderBy('indices.id', 'desc')->paginate(6);
        }

        $pilar=DB::table('pilares')->where('condicion','=','1')->get();
        
        return [
            'pagination' => [
                'total'        => $indices->total(),
                'current_page' => $indices->currentPage(),
                'per_page'     => $indices->perPage(),
                'last_page'    => $indices->lastPage(),
                'from'         => $indices->firstItem(),
                'to'           => $indices->lastItem(),
            ],
            'indices' => $indices,
            'pilar' => $pilar
        ];
    }

    public function store(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

        $pib = Tablapib::select('id','etapa','pib_menor','pib_mayor')
        ->orderBy('id', 'desc')->get();
        $pib2=$pib[1]['pib_mayor'];
        $pib1=$pib[2]['pib_mayor'];
        $pib3=$pib[0]['pib_menor'];
        $pib4=$pib[1]['pib_menor'];
        $pib5=$request->pib;

        try{
            DB::beginTransaction();

            $indice = new Indice();
            $indice->iddep = $request->iddep;
            $indice->poblacion = $request->poblacion;
            $indice->anio = $request->anio;
            $indice->pib = $pib5;
            $indice->condicion = '1';
            $indice->save();


            $detalles = $request->data;
            $pib1 = $request->data1;
            foreach($detalles as $ep=>$det)
            {
                if($pib5 < $pib4){
                    $detalle = new Puntajepilar();
                    $detalle->idmun = $indice->id;
                    $detalle->idpilar = $det['id'];
                    $detalle->porcentaje = $det['etapa1'];        
                    $detalle->save();
                }

                elseif($pib5 < $pib3){
                    $detalle = new Puntajepilar();
                    $detalle->idmun = $indice->id;
                    $detalle->idpilar = $det['id'];
                    $detalle->porcentaje = $det['etapa2'];        
                    $detalle->save();
                }

                elseif($pib5 > $pib2){
                    $detalle = new Puntajepilar();
                    $detalle->idmun = $indice->id;
                    $detalle->idpilar = $det['id'];
                    $detalle->porcentaje = $det['etapa3'];        
                    $detalle->save();
                }

                
            }                
           
            DB::commit();
            return [
                'id' => $indice->id
            ];
        } catch (Exception $e){
            DB::rollBack();
        }
    }
  
    public function update(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $indice = Indice::findOrFail($request->id);
        $indice->iddep = $request->iddep;
        $indice->poblacion = $request->poblacion;
        $indice->anio = $request->anio;
        $indice->pib = $request->pib;
        $indice->condicion = '1';
        $indice->save();
    }
    

   
}
