<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Sistema calculo de ICL en Guatemala">
    <meta name="author" content="www.mesoamericana.edu.gt">
    <meta name="keyword" content="Sistema de calculo del Indice de competitividad local en Guatemala">
    <link rel="shortcut icon" href="img/logito.png">
    <title>ICD en Guatemala</title>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <!-- Icons -->
    <link href="css/plantilla.css" rel="stylesheet">
</head>

<body class="app header-fixed sidebar-fixed aside-menu-fixed aside-menu-hidden">
    <div id="app">
    <header class="app-header navbar">
        <button class="navbar-toggler mobile-sidebar-toggler d-lg-none mr-auto" type="button">
          <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="http://www.gruposgestores.org.gt/" target="_blank"></a>
        <button class="navbar-toggler sidebar-toggler d-md-down-none" type="button">
          <span class="navbar-toggler-icon"></span>
        </button>
        <ul class="nav navbar-nav d-md-down-none">
            
            <li class="nav-item px-5">
            <a class="nav-link" href="http://www.mesoamericana.edu.gt/" target="_blank"> <img src="img/meso.png" alt="Logo Meso"  height="55" width="190"> </a>
            </li>
        </ul>
        <ul class="nav navbar-nav ml-auto">
            
            <?php if (Auth::check()): ?>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                    <img src="img/avatars/logito.png" class="img-avatar" alt="admin@bootstrapmaster.com">
                    <span class="d-md-down-none">{{Auth::user()->usuario}} </span>
                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <div class="dropdown-header text-center">
                        <strong>Cuenta</strong>
                    </div>
                    <a class="dropdown-item" href="{{ route('logout') }}" 
                    onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                    <i class="fa fa-lock"></i> Cerrar sesión</a>

                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                        {{ csrf_field() }}
                    </form>
                </div> 
            </li>
            <?php else:?>
                <a class="nav-link dropdown-toggle nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                    <img src="img/avatars/6.jpg" class="img-avatar" alt="admin@bootstrapmaster.com">
                    <span class="d-md-down-none">Visitante </span>
                </a>
            <?php endif ?>
        </ul>
    </header>

    <div class="app-body">
   
    @if(Auth::check())
            @if (Auth::user()->idrol == 1)
                @include('plantilla.sidebaradministrador')
          @elseif (Auth::user()->idrol == 2)
                @include('plantilla.sidebardigitador')
           
            @else

            @endif

    @else
    
         @include('plantilla.sidebarvisitante')

    @endif 
   

        <!-- Contenido Principal -->
        @yield('contenido')
        <!-- /Fin del contenido principal -->
    </div>   
    </div>
    <footer class="app-footer">
        <span><a href="http://www.mesoamericana.edu.gt/">Mesoamericana</a> <a>--</a> <a href="http://www.gruposgestores.org.gt/">GruposGestores</a> &copy; 2018</span>
        <span class="ml-auto">Desarrollado por <a href="http://www.mesoamericana.edu.gt/">Mesoamericana</a></span>
    </footer>
    

    <script src="js/app.js"></script>
    <script src="js/plantilla.js"></script>
</body>

</html>