<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;

class UserController extends Controller
{
    public function index(Request $request)
    {
        //if (!$request->ajax()) return redirect('/');

        $buscar = $request->buscar;
        $criterio = $request->criterio;
        
        if ($buscar==''){
            $users = User::join('roles','users.idrol','=','roles.id')
            ->join('departamentos','users.iddep','=','departamentos.id')
            ->select('users.id','users.nombre','email','telefono','entidad','usuario','password','users.condicion','idrol','iddep','roles.nombre as rol','departamentos.nombre as departamento')
            ->orderBy('users.id', 'desc')->paginate(5);
        }
        else{
            $users = User::join('roles','users.idrol','=','roles.id')
            ->join('departamentos','users.iddep','=','departamentos.id')
            ->select('users.id','users.nombre','email','telefono','entidad','usuario','password','condicion','idrol','iddep','roles.nombre as rol','departamentos.nombre as departamento')
            ->where('users.'.$criterio, 'like', '%'. $buscar . '%')->orderBy('users.id', 'desc')->paginate(5);
            
        }
        
        return [
            'pagination' => [
                'total'        => $users->total(),
                'current_page' => $users->currentPage(),
                'per_page'     => $users->perPage(),
                'last_page'    => $users->lastPage(),
                'from'         => $users->firstItem(),
                'to'           => $users->lastItem(),
            ],
            'users' => $users
        ];
    }

    public function store(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

        

            $user = new User();
            $user->idrol = $request->idrol;
            $user->usuario = $request->usuario;
            $user->password = bcrypt( $request->password);
            $user->nombre = $request->nombre;
            $user->email = $request->email;
            $user->telefono = $request->telefono;
            $user->entidad = $request->entidad;
            $user->iddep = $request->iddep;
            $user->condicion = '1';            
            $user->save();
    }

    public function update(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

            $user = User::findOrFail($request->id);
            $user->idrol = $request->idrol;
            $user->usuario = $request->usuario;
            $user->password = bcrypt( $request->password);
            $user->nombre = $request->nombre;
            $user->email = $request->email;
            $user->telefono = $request->telefono;
            $user->entidad = $request->entidad;
            $user->iddep = $request->iddep;
            $user->condicion = '1';
            $user->save();
    }

    public function desactivar(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $user = User::findOrFail($request->id);
        $user->condicion = '0';
        $user->save();
    }

    public function activar(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $user = User::findOrFail($request->id);
        $user->condicion = '1';
        $user->save();
    }
}
