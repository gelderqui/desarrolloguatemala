<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Tablapib;

class TablapibController extends Controller
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
            $tablapibs = Tablapib::orderBy('id', 'desc')->paginate(3);
        }
        else{
            $tablapibs = Tablapib::where($criterio, 'like', '%'. $buscar . '%')->orderBy('id', 'desc')->paginate(3);
        }
        

        return [
            'pagination' => [
                'total'        => $tablapibs->total(),
                'current_page' => $tablapibs->currentPage(),
                'per_page'     => $tablapibs->perPage(),
                'last_page'    => $tablapibs->lastPage(),
                'from'         => $tablapibs->firstItem(),
                'to'           => $tablapibs->lastItem(),
            ],
            'tablapibs' => $tablapibs
        ];
    }

    public function update(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $tablapib = Tablapib::findOrFail($request->id);
        $tablapib->etapa = $request->etapa;
        $tablapib->pib_menor = $request->pib_menor;
        $tablapib->pib_mayor = $request->pib_mayor;
        $tablapib->save();
    }

  
}
