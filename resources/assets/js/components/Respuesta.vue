<template>
            <main class="main">
            <!-- Breadcrumb -->
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Escritorio</a></li>
            </ol>
            <div class="container-fluid">
                <!-- Ejemplo de tabla Listado -->
                <div class="card">
                    <div class="card-header">
                        <i class="fa fa-align-justify"></i> Responder Encuesta                      
                    </div>
                    <div class="card-body">

                         <table class="table table-bordered table-striped table-sm">
                            <thead>
                                <tr>
                                    <th>Departamento</th>
                                    <th>año</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td v-text="nombre"></td> 
                                    <td v-text="anio"></td> 
                                </tr>                                
                            </tbody>
                        </table>


                        <table class="table table-bordered table-striped table-sm">
                            <thead>
                                <tr>
                                    <th>Pregunta</th>
                                    <th>Respuesta</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="pregunta in arrayPregunta" :key="pregunta.id">
                                    <td v-text="pregunta.pregunta"></td> 
                                    <td>
                                        <select class="form-control col-md-3" v-model="pregunta.idpilar">
                                            <option value="0">0</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="6">6</option>
                                            <option value="7">7</option>
                                            <option value="8">8</option>
                                            <option value="9">9</option>
                                            <option value="10">10</option>
                                        </select>                                        
                                    </td>                                                                                                   
                                </tr>                                
                            </tbody>
                        </table>
                        <button type="button" class="btn btn-primary" @click="registrarRespuestas()">Guardar</button>
                    </div>
                </div>
                <!-- Fin ejemplo de tabla Listado -->
            </div>
        </main>
</template>

<script>
    export default {
        data (){
            return {
                id: 1,
                pregunta : '',
                nombre: '',
                anio:0,
                arrayPregunta : [],
                errorPregunta : 0,
                errorMostrarMsjPregunta : []
            }
        },
        methods : {

            listarPregunta(){
                let me=this;
                var d = new Date();
                
                var url= '/indicador/listarPregunta' ;
                axios.get(url).then(function (response) {
                    me.arrayPregunta = response.data.indicadores;
                    me.nombre=response.data.nombre

                    for (let index = 0; index < me.arrayPregunta.length; index++) {
                        me.arrayPregunta[index].idpilar=0;
                        
                    }
                    me.anio = d.getFullYear();

                }).then(function (response) {
                  
                }).catch(function (error) {
                    console.log(error);
                });
            },

             registrarRespuestas(){
                  swal({
                title: 'Esta seguro de enviar la encuesta?',
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Aceptar!',
                cancelButtonText: 'Cancelar',
                confirmButtonClass: 'btn btn-success',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false,
                reverseButtons: true
                }).then((result) => {
                if (result.value) {
                    let me = this;

                    axios.post('/respuesta/registrar',{
                    'arrayPregunta': this.arrayPregunta
                        
                    }).then(function (response) {
                        swal(
                        'Enviado!',
                        'La encuesta fue enviado con exíto.',
                        'success'
                        )
                        for (let index = 0; index < me.arrayPregunta.length; index++) {
                        me.arrayPregunta[index].idpilar=0;
                            }
                        me.listarPregunta();
                    }).catch(function (error) {
                        console.log(error);
                    });
                    
                    
                } else if (
                    // Read more about handling dismissals
                    result.dismiss === swal.DismissReason.cancel
                ) {
                    
                }
                }) 
            },
        },
        mounted() {
            this.listarPregunta();
            
        }
    }
</script>
<style>    
    .modal-content{
        width: 100% !important;
        position: absolute !important;
    }
    .mostrar{
        display: list-item !important;
        opacity: 1 !important;
        position: absolute !important;
        background-color: #3c29297a !important;
    }
    .div-error{
        display: flex;
        justify-content: center;
    }
    .text-error{
        color: red !important;
        font-weight: bold;
    }
</style>
<!-- 
<template v-if="cambio==1"> 
                    <div class="card-body">
                        <table class="table table-bordered table-striped table-sm">
                            <thead>
                                <tr>
                                    <th>Departamento</th>
                                    <th>año</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                    <select class="form-control" v-model="departamento">
                                        <option value="0" disabled>Seleccione</option>
                                        <option v-for="indice in arrayIndice" :key="indice.id" :value="indice.id" v-text="indice.departamento"></option>
                                    </select> 
                                    </td> 
                                    <td>
                                    <select class="form-control" v-model="anio">
                                        <option value="0" disabled>Seleccione</option>
                                        <option v-for="indice in arrayIndice" :key="indice.id" :value="indice.id" v-text="indice.anio"></option>
                                    </select> 
                                    </td> 
                                </tr>                                
                            </tbody>
                        </table>
                        <button type="button" class="btn btn-primary" @click="cambiartemplate()">Hacer Encuesta</button>
                    </div>
</template> -->