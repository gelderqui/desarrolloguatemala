@extends('auth.contenido')

@section('login')
<div class="row justify-content-center">
      <div class="col-md-8">
        <div class="card-group mb-0">
          <div class="card p-4">
          <form class="form-horizontal was-validated" method="POST" action="{{ route('login1')}}">
          {{ csrf_field() }}
              <div class="card-body">
              <h1>Acceder</h1>
              <p class="text-muted">Control de acceso al sistema</p>
              <div class="form-group mb-3{{$errors->has('usuario' ? 'is-invalid' : '')}}">
                <span class="input-group-addon"><i class="icon-user"></i></span>
                <input type="text" value="{{old('usuario')}}" name="usuario" id="usuario" class="form-control" placeholder="Usuario">
                {!!$errors->first('usuario','<span class="invalid-feedback">:message</span>')!!}
              </div>
              <div class="form-group mb-4{{$errors->has('password' ? 'is-invalid' : '')}}">
                <span class="input-group-addon"><i class="icon-lock"></i></span>
                <input type="password" name="password" id="password" class="form-control" placeholder="Password">
                {!!$errors->first('password','<span class="invalid-feedback">:message</span>')!!}
              </div>
              <div class="row">
                <div class="col-6">
                  <button type="submit" class="btn btn-primary px-4">Acceder</button>
                </div>
              </div>
            </div>
          </form>
          </div>
          <div class="card text-white bg-primary py-5 d-md-down-none" style="width:44%">
            <div class="card-body text-center">
              <div>
                <h2>Indice de Competitividad Departamental</h2>
            <p>Sistema desarrollado en alianza de, Mesas de Competitividad, Grupos Gestores y Universidad Mesoamericana, desarrollado para calcular el ICD y presentar gráficas y reportes para la población guatemalteca </p>
                
                <!--<a href="https://www.udemy.com/user/juan-carlos-arcila-diaz/" target="_blank" class="btn btn-primary active mt-3">Ver el curso!</a>-->
              </div>
            </div>
          </div>
        </div>
      </div>
</div>
@endsection
<style>
body {
        /* Aquí el origen de la imagen */
        background-image: url("img/fondo.jpg");
 
        /* Fijar la imagen de fondo este vertical y horizontalmente y centrado */
        background-position: center center;

        /* Esta imagen no debe de repetirse */
        background-repeat: no-repeat;

        /* COn esta regla fijamos la imagen en la pantalla. */
        background-attachment: fixed;

        /* La imagen ocupa el 100% y se reescala */
        background-size: cover;
    }
</style>