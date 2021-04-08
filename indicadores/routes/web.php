<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
/*LO NECESITAMOS DESCOMENTENLO*/ 

Route::get('/main', function () {
return view('contenido/contenido');
})->name('main');


Route::get('/', function () {
    return view('Inicio');
    });   
    Route::get('/graficos', 'GraficosController@index');
    Route::get('/busqueda', 'GraficosController@busqueda');
    Route::get('/busquedas', 'GraficosController@busquedas');
    Route::get('/busquedap', 'GraficosController@busquedap');
    Route::get('/consulta/{id}/{fecha}', 'GraficosController@consulta');
    Route::get('/busquedafecha', 'GraficosController@busquedafecha');
    Route::get('/busquedacompa/{id}/{fecha}', 'GraficosController@busquedacompa');
    Route::get('/busquedapil', 'GraficosController@busquedapil');
    Route::post('/correo/agregar','CorreoController@store');


Route::group(['middleware'=>['guest']],function(){
    
    Route::get('/login','Auth\LoginController@showLoginForm')->name('login');
    Route::post('/login1', 'Auth\LoginController@login')->name('login1');
        
});

Route::group(['middleware'=>['auth']],function(){
    
    Route::post('/logout', 'Auth\LoginController@logout')->name('logout');

    Route::get('/indicador', 'IndicadorController@index');
    Route::post('/indicador/registrar', 'IndicadorController@store');
    Route::put('/indicador/actualizar', 'IndicadorController@update');
    Route::put('/indicador/desactivar', 'IndicadorController@desactivar');
    Route::put('/indicador/activar', 'IndicadorController@activar');
    Route::get('/indicador/buscarIndicador', 'IndicadorController@buscarIndicador');
    Route::get('/indicador/listarPregunta', 'IndicadorController@listarPregunta');
    Route::get('/indicador/listarPreguntaRest', 'IndicadorController@listarPreguntaRest');
    Route::get('/indicador/listarPdf','IndicadorController@listarPdf')->name('indicador_pdf'); 
    Route::get('/indicador/selectIndicador', 'IndicadorController@selectIndicador');

    Route::get('/departamento', 'DepartamentoController@index');
    Route::get('/departamento/selectDepartamento', 'DepartamentoController@selectDepartamento');


    Route::group(['middleware'=>['Digitador']],function(){

        Route::post('/respuesta/registrar', 'RespuestaController@store');
        
    });

    Route::group(['middleware'=>['Administrador']],function(){
        
        
        Route::get('/pilar', 'PilarController@index');
        Route::post('/pilar/registrar', 'PilarController@store');
        Route::put('/pilar/actualizar', 'PilarController@update');
        Route::put('/pilar/desactivar', 'PilarController@desactivar');
        Route::put('/pilar/activar', 'PilarController@activar');
        Route::get('/pilar/selectPilar', 'PilarController@selectPilar');
        
        Route::get('/tablapib', 'TablapibController@index');
        Route::put('/tablapib/actualizar', 'TablapibController@update');
        
        
        Route::get('/indice', 'IndiceController@index');
        Route::post('/indice/registrar', 'IndiceController@store');
        Route::put('/indice/actualizar', 'IndiceController@update');
        
        Route::get('/rol', 'RolController@index');
        Route::get('/rol/selectRol', 'RolController@selectRol');
        
        Route::get('/user', 'UserController@index');
        Route::post('/user/registrar', 'UserController@store');
        Route::put('/user/actualizar', 'UserController@update');
        Route::put('/user/desactivar', 'UserController@desactivar');
        Route::put('/user/activar', 'UserController@activar');

        Route::post('/respuesta/registrarAdmin', 'RespuestaController@storeAdmin');
        Route::post('/respuesta/registrarAdminRest', 'RespuestaController@storeRest');
        
   });

});






//Route::get('/','Auth\LoginController@showLoginForm');