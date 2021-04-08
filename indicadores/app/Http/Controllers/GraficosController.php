<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Indicador;
class GraficosController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */



   public function consulta(Request $request,$id,$fecha)
    {
   if (!$request->ajax()) return redirect('/');

         $pilares= DB::table('pilares')->join('puntajepilares', 'pilares.id','=','puntajepilares.idpilar')->join('indices', 'puntajepilares.idmun','=','indices.id')
           ->where('indices.iddep','=',$id)
           ->where('indices.anio','=',$fecha)
       ->get();
         
        $cont=DB::table('pilares')->count();

        $mu= DB::table('departamentos')->where('id','=',$id)->first();
        
        $indicadores= DB::table('indicadores')
        ->join('puntajeindicadores', 'indicadores.id','=','puntajeindicadores.idindicador') 
        ->join('indices', 'puntajeindicadores.idmun','=','indices.id')
          ->where('indices.iddep','=',$id)
           ->where('indices.anio','=',$fecha)
        ->get();
       
        $departamento=$mu->nombre;

       $pdf = \PDF::loadView('pdf.individual',['pilares'=>$pilares,'cont'=>$cont,'departamento'=>$departamento,'indicadores'=>$indicadores]);
            //  $pdf = \View::make('pdf.individual',['pilares'=>$pilares,'cont'=>$cont,'departamento'=>$departamento,'indicadores'=>$indicadores])->render();
                //$pdf = PDF::loadView('user.export-pdf',compact('image'));

              // $view  = \View::make('user.export-pdf', compact('image'))->render();
 
//echo $pdf;        
        return $pdf->download('reporte.pdf');
    }


    public function index(Request $request)
    {
    
   if (!$request->ajax()) return redirect('/');
//$fecha=date('Y');
  //  $anio=DB::table('indices')->select(DB::raw('YEAR(created_at) as fecha'))->distinct()
    //->get();
 $anio=DB::table('indices')->select('anio as fecha')->distinct()
 ->orderBy('indices.anio', 'desc')
    ->get();


      

    $pilares= DB::table('pilares')
    ->where('pilares.condicion','=',1)
    ->get();
    $indicadores= DB::table('indicadores')->get();

    $departamentos= DB::table('departamentos')->get();

        return [
            'pilares'=>$pilares,
            'indicadores' => $indicadores,
            'departamentos'=>$departamentos,
            'anio'=>$anio,
                ];
    }

    
    public function busqueda(Request $request)
    {
    
        if (!$request->ajax()) return redirect('/');
    $buscar = $request->buscar;
$fecha=$request->fecha;

    if ($buscar<=0)
    {
    $indicadores= DB::table('indicadores')->get();
        $pilares= DB::table('pilares')->get();

    }
    else
    {



         $indicadores= DB::table('pilares')->select('idpilar','nombre', 'ponderacion','porcentaje')
         ->join('puntajepilares', 'pilares.id','=','puntajepilares.idpilar')
         ->join('indices', 'puntajepilares.idmun','=','indices.id')
           ->where('indices.iddep','=',$buscar)
        ->where('pilares.condicion','=',1)
           ->where('indices.anio','=',$fecha)
        ->where('pilares.condicion','=',1)
       ->get();

         $pilares= DB::table('indicadores')
         ->select('indicadores.nombre', 'puntajeindicadores.ponderacion','puntajeindicadores.idpilar','pilares.nombre as nombrepil')
        ->join('puntajeindicadores', 'indicadores.id','=','puntajeindicadores.idindicador') 
        ->join('indices', 'puntajeindicadores.idmun','=','indices.id')
        ->join('pilares', 'indicadores.idpilar','=','pilares.id')
          ->where('indices.iddep','=',$buscar)
           ->where('indices.anio','=',$fecha)
        ->orderBy('indicadores.idpilar', 'asc')
        ->get();
        
         $indi=DB::table('indices')->where('iddep','=',$buscar)->first();
            $indice=$indi->poblacion;
            $pib=$indi->pib;
            $punto=$indi->puntaje;
         $mu= DB::table('departamentos')->where('id','=',$buscar)->first();
        $departamento=$mu->nombre;
    }

        return [
            'pilares'=>$pilares,
            'indicadores' => $indicadores,
            'departamento'=>$departamento,
            'indice'=>$indice,
            'pib'=>$pib,
            'punto'=>$punto
                ];
    }



    public function busquedas(Request $request)
    {
      if (!$request->ajax()) return redirect('/');
    $buscar = $request->buscar;
$fecha=$request->fecha;
$buscar2  =  $request->buscar2;
    if ($buscar<=0)
    {
    $indicadores= DB::table('indicadores')->get();
        $pilares= DB::table('pilares')->get();

    }
    else
    {

        $pilares2=  DB::table('pilares')->join('puntajepilares', 'pilares.id','=','puntajepilares.idpilar')->join('indices', 'puntajepilares.idmun','=','indices.id')
           ->where('indices.iddep','=',$buscar2)
           ->where('indices.anio','=',$fecha)
         ->where('pilares.condicion','=',1)
       ->get();


         $indicadores=DB::table('pilares')->join('puntajepilares', 'pilares.id','=','puntajepilares.idpilar')->join('indices', 'puntajepilares.idmun','=','indices.id')
           ->where('indices.iddep','=',$buscar)
           ->where('indices.anio','=',$fecha)
            ->where('pilares.condicion','=',1)
       ->get();

         $pilares= DB::table('indicadores')->join('puntajeindicadores', 'indicadores.id','=','puntajeindicadores.idindicador') 
         ->where('puntajeindicadores.idmun','=',$buscar)
         ->whereYear('indicadores.created_at', $fecha)
         ->get();

         $mu= DB::table('departamentos')->where('id','=',$buscar)->first();
        $departamento=$mu->nombre;
         $mu2= DB::table('departamentos')->where('id','=',$buscar2)->first();
          $departamento2=$mu2->nombre;  
    }

        return [
            'pilares'=>$pilares,
            'indicadores' => $indicadores,
            'departamento'=>$departamento,
            'departamento2'=>$departamento2,
            'pilares2'=>$pilares2
                ];
    }



      public function busquedap(Request $request)
    {
    
        if (!$request->ajax()) return redirect('/');
    $buscar = $request->buscar;
$fecha=$request->fecha;
$pilare=$request->pilare;

    if ($buscar<=0)
    {
    $indicadores= DB::table('indicadores')->get();
        $pilares= DB::table('pilares')->get();

    }
    else
    {


         $indicadores= DB::table('pilares')->join('puntajepilares', 'pilares.id','=','puntajepilares.idpilar')
         ->join('indices', 'puntajepilares.idmun','=','indices.id')
         ->where('indices.iddep','=',$buscar)
          ->where('indices.anio','=',$fecha)
         ->where('pilares.condicion','=',1)
          ->get();

         $pilares= DB::table('indicadores')->join('puntajeindicadores', 'indicadores.id','=','puntajeindicadores.idindicador') 
        ->join('indices', 'puntajeindicadores.idmun','=','indices.id')
          ->where('indices.iddep','=',$buscar)
         ->where('indicadores.idpilar','=',$pilare)
        ->where('indices.anio','=',$fecha)
          ->get();

         $mu= DB::table('departamentos')->where('id','=',$buscar)->first();
        $departamento=$mu->nombre;
    }

        return [
            'pilares'=>$pilares,
            'indicadores' => $indicadores,
            'departamento'=>$departamento
                ];
    }



       public function busquedafecha(Request $request)
    {
    
        if (!$request->ajax()) return redirect('/');
    $buscar = $request->buscar;
$fecha=$request->fecha;
$fecha2=$request->fecha2;
$pilare=$request->pilare;

    if ($buscar<=0)
    {
    $indicadores= DB::table('indicadores')->get();
        $pilares= DB::table('pilares')->get();

    }
    else
    {


         $indicadores= DB::table('pilares')->join('puntajepilares', 'pilares.id','=','puntajepilares.idpilar')
         ->join('indices', 'puntajepilares.idmun','=','indices.id')
         ->where('indices.iddep','=',$buscar)
        ->where('puntajepilares.idpilar','=',$pilare)
        ->where('pilares.condicion','=',1)
         ->whereBetween('indices.anio', [$fecha, $fecha2])
         ->orderBy('indices.anio', 'asc')
         ->get();

         $pilares= DB::table('indicadores')->join('puntajeindicadores', 'indicadores.id','=','puntajeindicadores.idindicador') 
         ->where('puntajeindicadores.idmun','=',$buscar)
         ->where('indicadores.idpilar','=',$pilare)
         ->whereYear('indicadores.created_at', $fecha)
         ->get();

         $mu= DB::table('departamentos')->where('id','=',$buscar)->first();
        $departamento=$mu->nombre;
    }

        return [
            'pilares'=>$pilares,
            'indicadores' => $indicadores,
            'departamento'=>$departamento
                ];
    }

    


    public function busquedacompa(Request $request,$id,$fecha)
    {

         $pilares= DB::table('pilares')->join('puntajepilares', 'pilares.id','=','puntajepilares.idpilar')->join('indices', 'puntajepilares.idmun','=','indices.id')
           ->where('indices.iddep','=',$id)
           ->where('indices.anio','=',$fecha)
            ->where('pilares.condicion','=',1)
       ->get();
         
        $cont=DB::table('pilares')->count();

        $mu= DB::table('departamentos')->where('id','=',$id)->first();
        
        $indicadores= DB::table('indicadores')
        ->join('puntajeindicadores', 'indicadores.id','=','puntajeindicadores.idindicador') 
        ->join('indices', 'puntajeindicadores.idmun','=','indices.id')
          ->where('indices.iddep','=',$id)
           ->where('indices.anio','=',$fecha)
        ->get();
       
        $departamento=$mu->nombre;

       $pdf = \PDF::loadView('pdf.individual',['pilares'=>$pilares,'cont'=>$cont,'departamento'=>$departamento,'indicadores'=>$indicadores]);
              // $pdf = \View::make('pdf.individual',['pilares'=>$pilares,'cont'=>$cont,'departamento'=>$departamento,'indicadores'=>$indicadores])->render();
    // $view  = \View::make('user.export-pdf', compact('image'))->render();
 
//echo $pdf;        
        return $pdf->download('reporte.pdf');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     * 
     */

      public function busquedapil(Request $request)
    {
    
        if (!$request->ajax()) return redirect('/');
    $buscar = $request->buscar;
$fecha=$request->fecha;
$pilare=$request->pilare;

    if ($buscar<=0)
    {
    $indicadores= DB::table('indicadores')->get();
        $pilares= DB::table('pilares')->get();

    }
    else
    {


         $indicadores= DB::table('pilares')
                  ->select('pilares.nombre', 'puntajepilares.ponderacion','puntajepilares.porcentaje','puntajepilares.idpilar','departamentos.nombre as nombredepa')
         ->join('puntajepilares', 'pilares.id','=','puntajepilares.idpilar')
         ->join('indices', 'puntajepilares.idmun','=','indices.id')
        ->join('departamentos', 'indices.iddep','=','departamentos.id')
        ->where('pilares.id','=',$pilare)
          ->where('indices.anio','=',$fecha)
        ->where('pilares.condicion','=',1)
          ->get();

         $pilares= DB::table('indicadores')->join('puntajeindicadores', 'indicadores.id','=','puntajeindicadores.idindicador') 
        ->join('indices', 'puntajeindicadores.idmun','=','indices.id')
         ->where('indicadores.idpilar','=',$pilare)
        ->where('indices.anio','=',$fecha)
          ->get();

         $mu= DB::table('departamentos')->where('id','=',$buscar)->first();
        $departamento=$mu->nombre;
         $pil1= DB::table('pilares')->where('id','=',$pilare)->first();
         $pill=$pil1->nombre;

    }

        return [
            'pilares'=>$pilares,
            'indicadores' => $indicadores,
            'departamento'=>$departamento,
            'pill'=>$pill
                ];
    }

    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
