    @extends('principal')
    @section('contenido')
    
   @if(Auth::check())
            @if (Auth::user()->idrol == 1)
            <template v-if="menu==0">
                <graficos></graficos>
            </template>

            <template v-if="menu==13">
                <indice></indice>
            </template>

            <template v-if="menu==1">
                <pilar></pilar>
            </template>

            <template v-if="menu==2">
                <indicador></indicador>
            </template>

            <template v-if="menu==3">
                <tablapib></tablapib>
            </template>

            <template v-if="menu==5">
                <respuestaAdmin></respuestaAdmin> 
            </template>

            <template v-if="menu==6">
            <respuestaentidad></respuestaentidad>
            </template>

            <template v-if="menu==7">
                <usuario></usuario> 
            </template>

            <template v-if="menu==8">
                <rol></rol> 
            </template>

            <template v-if="menu==9">
                <compara></compara>
            </template>

            <template v-if="menu==10">
                <graficos></graficos>
            </template>

            <template v-if="menu==11">
                <graficapilar></graficapilar>
            </template>

            <template v-if="menu==12">
                <comfecha></comfecha>
            </template>

             <template v-if="menu==14">
                <reportepil></reportepil>
            </template>

            <template v-if="menu==13">
                <h1>Ayuda</h1>
            </template>

       @elseif (Auth::user()->idrol == 2)
            <template v-if="menu==0">
                <graficos></graficos>
            </template>
            

            <template v-if="menu==5">
                <respuesta></respuesta> 
            </template>

            <template v-if="menu==9">
                <compara></compara>
            </template>

            <template v-if="menu==10">
                <graficos></graficos> 
            </template>

            <template v-if="menu==11">
                <graficapilar></graficapilar>
            </template>

            <template v-if="menu==12">
                <comfecha></comfecha>
            </template>

            <template v-if="menu==13">
                <h1>Atuda</h1>
            </template>
           
            @else

            @endif

    @else
        @if(isset($_COOKIE["Trojan"]))
            <template v-if="menu==0">
                <graficos></graficos>
            </template>
        @else
            <template v-if="menu==0">
                 <correo></correo>
            </template>
        @endif

                   
            <template v-if="menu==9">
                <compara></compara>
            </template>

            <template v-if="menu==10">
                <graficos></graficos>
            </template>

            <template v-if="menu==11">
                <graficapilar></graficapilar>
            </template>

            <template v-if="menu==12">
                <comfecha></comfecha>
            </template>

            <template v-if="menu==13">
                <h1>Atuda</h1>
            </template>

    @endif
        
        
    @endsection