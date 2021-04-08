<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Pilar;

class PilarController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

        $buscar = $request->buscar;
        $criterio = $request->criterio;
        
        if ($buscar==''){
            $pilares = Pilar::orderBy('id', 'desc')->paginate(6);
        }
        else{
            $pilares = Pilar::where($criterio, 'like', '%'. $buscar . '%')->orderBy('id', 'desc')->paginate(6);
        }
        

        return [
            'pagination' => [
                'total'        => $pilares->total(),
                'current_page' => $pilares->currentPage(),
                'per_page'     => $pilares->perPage(),
                'last_page'    => $pilares->lastPage(),
                'from'         => $pilares->firstItem(),
                'to'           => $pilares->lastItem(),
            ],
            'pilares' => $pilares
        ];
    }

    public function selectPilar(Request $request){
        if (!$request->ajax()) return redirect('/');
        $pilares = Pilar::where('condicion','=','1')
        ->select('id','nombre')->orderBy('nombre', 'asc')->get();
        return ['pilares' => $pilares];
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $pilar = new Pilar();
        $pilar->nombre = $request->nombre;
        $pilar->descripcion = $request->descripcion;
        $pilar->etapa1 = $request->etapa1;
        $pilar->etapa2 = $request->etapa2;
        $pilar->etapa3 = $request->etapa3;
        $pilar->condicion = '1';
        $pilar->save();
    }

   
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $pilar = Pilar::findOrFail($request->id);
        $pilar->nombre = $request->nombre;
        $pilar->descripcion = $request->descripcion;
        $pilar->etapa1 = $request->etapa1;
        $pilar->etapa2 = $request->etapa2;
        $pilar->etapa3 = $request->etapa3;
        $pilar->condicion = '1';
        $pilar->save();
    }

    public function desactivar(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $pilar = Pilar::findOrFail($request->id);
        $pilar->condicion = '0';
        $pilar->save();
    }

    public function activar(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $pilar = Pilar::findOrFail($request->id);
        $pilar->condicion = '1';
        $pilar->save();
    }
}
