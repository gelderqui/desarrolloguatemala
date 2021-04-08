<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Indicador;
use Illuminate\Support\Facades\DB;
use App\User;

class IndicadorController extends Controller
{
    public function index(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

        $buscar = $request->buscar;
        $criterio = $request->criterio;
        
        if ($buscar==''){
            $indicadores = Indicador::join('pilares','indicadores.idpilar','=','pilares.id')
            ->select('indicadores.id','indicadores.idpilar','indicadores.nombre','pilares.nombre as nombre_pilar','indicadores.pregunta','indicadores.organizacion','indicadores.condicion','indicadores.condicion_organizacion')
            ->orderBy('indicadores.id', 'desc')->paginate(6);
        }
        else{
            $indicadores = Indicador::join('pilares','indicadores.idpilar','=','pilares.id')
            ->select('indicadores.id','indicadores.idpilar','indicadores.nombre','pilares.nombre as nombre_pilar','indicadores.pregunta','indicadores.organizacion','indicadores.condicion','indicadores.condicion_organizacion')
            ->where('indicadores.'.$criterio, 'like', '%'. $buscar . '%')
            ->orderBy('indicadores.id', 'desc')->paginate(6);
        }
        

        return [
            'pagination' => [
                'total'        => $indicadores->total(),
                'current_page' => $indicadores->currentPage(),
                'per_page'     => $indicadores->perPage(),
                'last_page'    => $indicadores->lastPage(),
                'from'         => $indicadores->firstItem(),
                'to'           => $indicadores->lastItem(),
            ],
            'indicadores' => $indicadores,
            
        ];
    }

    public function selectIndicador(Request $request){
        if (!$request->ajax()) return redirect('/');
        $indicadores = Indicador::where('condicion','=','1')
        ->select('id','nombre')->orderBy('nombre', 'asc')->get();
        return ['indicadores' => $indicadores];
    }

    public function listarPregunta(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

            $indicadores = Indicador::select('indicadores.id','indicadores.pregunta','indicadores.idpilar')
            ->where('indicadores.condicion','=','1')
            ->where('indicadores.condicion_organizacion','=','0')
            ->orderBy('indicadores.id', 'desc')->get();
            
            $idusers = \Auth::user()->id;

            $users=DB::table('users')->where('id','=',$idusers)->first();
            $iddep=$users->iddep;

            $users=DB::table('departamentos')->where('id','=',$iddep)->first();
            $nombre=$users->nombre;

        return [
            'indicadores' => $indicadores,
            'nombre' =>$nombre];
    }

    public function listarPreguntaRest(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

            $indicadores = Indicador::select('indicadores.id','indicadores.pregunta','indicadores.idpilar')
            ->where('indicadores.condicion','=','1')
            ->where('indicadores.condicion_organizacion','=','1')
            ->orderBy('indicadores.id', 'desc')->get();

        return 'indicadores' -> $indicadores;
    }

    public function listarPdf(){
        $indicadores = Indicador::join('pilares','indicadores.idpilar','=','pilares.id')
        ->select('indicadores.id','indicadores.idpilar','indicadores.nombre',
        'pilares.nombre as nombre_pilar','indicadores.escala_menor','indicadores.escala_mayor',
        'indicadores.condicion')
        ->orderBy('pilares.nombre', 'desc')->get();

        $cont=Indicador::count();

        $pdf = \PDF::loadView('pdf.indicadorespdf',['indicadores'=>$indicadores,'cont'=>$cont]);
        return $pdf->download('indicadores.pdf');
    }

    public function store(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $indicador = new Indicador();
        $indicador->idpilar = $request->idpilar;
        $indicador->nombre = $request->nombre;
        $indicador->pregunta = $request->pregunta;
        $indicador->organizacion = $request->organizacion;
        $indicador->condicion_organizacion = $request->condicion_organizacion;
        $indicador->condicion = '1';
        $indicador->save();
    }

    public function update(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $indicador = Indicador::findOrFail($request->id);
        $indicador->idpilar = $request->idpilar;
        $indicador->nombre = $request->nombre;
        $indicador->pregunta = $request->pregunta;
        $indicador->organizacion = $request->organizacion;
        $indicador->condicion_organizacion = $request->condicion_organizacion;
        $indicador->condicion = '1';
        $indicador->save();
    }

    public function desactivar(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $indicador = Indicador::findOrFail($request->id);
        $indicador->condicion = '0';
        $indicador->save();
    }

    public function activar(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $indicador = Indicador::findOrFail($request->id);
        $indicador->condicion = '1';
        $indicador->save();
    }

    
}
