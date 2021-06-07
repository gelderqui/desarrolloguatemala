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
                        <i class="fa fa-align-justify"></i> Escuesta
                        <button type="button" @click="abrirModal('pregunta','registrar')" class="btn btn-secondary">
                            <i class="icon-plus"></i>&nbsp;Nuevo
                        </button>
                        <i class="fa fa-align-justify"></i> Organizacion
                        <button type="button" @click="abrirModal2('pregunta','registrar')" class="btn btn-secondary">
                            <i class="icon-plus"></i>&nbsp;Nuevo
                        </button>                        
                    </div>
                    <div class="card-body">
                        <div class="form-group row">
                            <div class="col-md-6">
                                <div class="input-group">
                                    <select class="form-control col-md-3" v-model="criterio">
                                      <option value="pregunta">Pregunta</option>
                                      <option value="nombre">Institucion</option>
                                    </select>
                                    <input type="text" v-model="buscar" @keyup.enter="listarPregunta(1,buscar,criterio)" class="form-control" placeholder="Texto a buscar">
                                    <button type="submit" @click="listarPregunta(1,buscar,criterio)" class="btn btn-primary"><i class="fa fa-search"></i> Buscar</button>
                                </div>
                            </div>
                        </div>
                        <table class="table table-bordered table-striped table-sm">
                            <thead>
                                <tr>
                                    <th>Opciones</th>
                                    <th>Pregunta</th>
                                    <th>Indicador</th>
                                    <th>Nombre de la Organizacion</th>
                                    <th>Fuente</th>
                                    <th>Estado</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="pregunta in arrayPregunta" :key="pregunta.id">
                                    <td v-if="pregunta.condicion_organizacion">
                                        <button type="button" @click="abrirModal2('pregunta','actualizar',pregunta)" class="btn btn-warning btn-sm">
                                          <i class="icon-pencil"></i>
                                        </button> &nbsp;
                                        <template v-if="pregunta.condicion">
                                            <button type="button" class="btn btn-danger btn-sm" @click="desactivarIndicador(pregunta.id)">
                                                <i class="icon-trash"></i>
                                            </button>
                                        </template>
                                        <template v-else>
                                            <button type="button" class="btn btn-info btn-sm" @click="activarIndicador(pregunta.id)">
                                                <i class="icon-check"></i>
                                            </button>
                                        </template>
                                    </td>
                                    <td v-else>
                                        <button type="button" @click="abrirModal('pregunta','actualizar',pregunta)" class="btn btn-warning btn-sm">
                                          <i class="icon-pencil"></i>
                                        </button> &nbsp;
                                        <template v-if="pregunta.condicion">
                                            <button type="button" class="btn btn-danger btn-sm" @click="desactivarIndicador(pregunta.id)">
                                                <i class="icon-trash"></i>
                                            </button>
                                        </template>
                                        <template v-else>
                                            <button type="button" class="btn btn-info btn-sm" @click="activarIndicador(pregunta.id)">
                                                <i class="icon-check"></i>
                                            </button>
                                        </template>
                                    </td>

                                    <td v-text="pregunta.pregunta"></td>                                 
                                    <td v-text="pregunta.nombre_indicador"></td>
                                    <td v-text="pregunta.nombre"></td>                                      
                                    <td>
                                        <div v-if="pregunta.condicion_organizacion">
                                            <span class="badge badge-success">Organizacion</span>
                                        </div>
                                        <div v-else>
                                            <span class="badge badge-danger">Encuesta</span>
                                        </div>
                                        
                                    </td>                                    
                                    <td>
                                        <div v-if="pregunta.condicion">
                                            <span class="badge badge-success">Activo</span>
                                        </div>
                                        <div v-else>
                                            <span class="badge badge-danger">Desactivado</span>
                                        </div>
                                        
                                    </td>                                    
                                </tr>                                
                            </tbody>
                        </table>
                        <nav>
                            <ul class="pagination">
                                <li class="page-item" v-if="pagination.current_page > 1">
                                    <a class="page-link" href="#" @click.prevent="cambiarPagina(pagination.current_page - 1,buscar,criterio)">Ant</a>
                                </li>
                                <li class="page-item" v-for="page in pagesNumber" :key="page" :class="[page == isActived ? 'active' : '']">
                                    <a class="page-link" href="#" @click.prevent="cambiarPagina(page,buscar,criterio)" v-text="page"></a>
                                </li>
                                <li class="page-item" v-if="pagination.current_page < pagination.last_page">
                                    <a class="page-link" href="#" @click.prevent="cambiarPagina(pagination.current_page + 1,buscar,criterio)">Sig</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <!-- Fin ejemplo de tabla Listado -->
            </div>
            <!--Inicio del modal agregar/actualizar-->
            <div class="modal fade" tabindex="-1" :class="{'mostrar' : modal}" role="dialog" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
                <div class="modal-dialog modal-primary modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" v-text="tituloModal"></h4>
                            <button type="button" class="close" @click="cerrarModal()" aria-label="Close">
                              <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="" method="post" enctype="multipart/form-data" class="form-horizontal">
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Pregunta</label>
                                    <div class="col-md-9">
                                        <input type="text" v-model="pregunta" class="form-control" placeholder="Ingrese pregunta">                                        
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Indicador</label>
                                    <div class="col-md-9">
                                        <select class="form-control" v-model="idindicador">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="indicador in arrayIndicador" :key="indicador.id" :value="indicador.id" v-text="indicador.nombre"></option>
                                        </select>                                        
                                    </div>
                                </div>
                                <div v-show="errorPregunta" class="form-group row div-error">
                                    <div class="text-center text-error">
                                        <div v-for="error in errorMostrarMsjPregunta" :key="error" v-text="error">

                                        </div>
                                    </div>
                                </div>                                
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" @click="cerrarModal()">Cerrar</button>
                            <button type="button" v-if="tipoAccion==1" class="btn btn-primary" @click="registrarPregunta()">Guardar</button>
                            <button type="button" v-if="tipoAccion==2" class="btn btn-primary" @click="actualizarPregunta()">Actualizar</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!--Fin del modal-->
            <!--Inicio del modal agregar/actualizar2-->
            <div class="modal fade" tabindex="-1" :class="{'mostrar' : modal2}" role="dialog" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
                <div class="modal-dialog modal-primary modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" v-text="tituloModal"></h4>
                            <button type="button" class="close" @click="cerrarModal2()" aria-label="Close">
                              <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="" method="post" enctype="multipart/form-data" class="form-horizontal">
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Pregunta</label>
                                    <div class="col-md-9">
                                        <input type="text" v-model="pregunta" class="form-control" placeholder="Ingrese pregunta">                                        
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Indicador</label>
                                    <div class="col-md-9">
                                        <select class="form-control" v-model="idindicador">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="indicador in arrayIndicador" :key="indicador.id" :value="indicador.id" v-text="indicador.nombre"></option>
                                        </select>                                        
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Nombre de organizacion</label>
                                    <div class="col-md-9">
                                        <input type="text" v-model="nombre" class="form-control" placeholder="Ingrese pregunta">                                        
                                    </div>
                                </div>                                
                                <div v-show="errorPregunta" class="form-group row div-error">
                                    <div class="text-center text-error">
                                        <div v-for="error in errorMostrarMsjPregunta" :key="error" v-text="error">

                                        </div>
                                    </div>
                                </div>                                
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" @click="cerrarModal2()">Cerrar</button>
                            <button type="button" v-if="tipoAccion==1" class="btn btn-primary" @click="registrarPregunta2()">Guardar</button>
                            <button type="button" v-if="tipoAccion==2" class="btn btn-primary" @click="actualizarPregunta2()">Actualizar</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!--Fin del modal-->
        </main>
</template>

<script>
    export default {
        data (){
            return {
                pregunta_id: 0,
                idindicador : 0,
                nombre_indicador : '',
                pregunta : '',
                condicion_organizacion: 0,
                nombre: '',
                arrayPregunta : [],
                modal : 0,
                modal2 :0,
                tituloModal : '',
                tipoAccion : 0,
                errorPregunta : 0,
                errorMostrarMsjPregunta : [],
                pagination : {
                    'total' : 0,
                    'current_page' : 0,
                    'per_page' : 0,
                    'last_page' : 0,
                    'from' : 0,
                    'to' : 0,
                },
                offset : 3,
                criterio : 'pregunta',
                buscar : '',
                arrayIndicador :[]
            }
        },
       
        computed:{
            isActived: function(){
                return this.pagination.current_page;
            },
            //Calcula los elementos de la paginación
            pagesNumber: function() {
                if(!this.pagination.to) {
                    return [];
                }
                
                var from = this.pagination.current_page - this.offset; 
                if(from < 1) {
                    from = 1;
                }

                var to = from + (this.offset * 2); 
                if(to >= this.pagination.last_page){
                    to = this.pagination.last_page;
                }  

                var pagesArray = [];
                while(from <= to) {
                    pagesArray.push(from);
                    from++;
                }
                return pagesArray;             

            }
        },
        methods : {
            listarPregunta(page,buscar,criterio){
                let me=this;
                var url= '/pregunta?page=' + page + '&buscar='+ buscar + '&criterio='+ criterio;
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.arrayPregunta = respuesta.preguntas.data;
                    me.pagination= respuesta.pagination;
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            selectIndicador(){
                let me=this;
                var url= '/indicador/selectIndicador';
                axios.get(url).then(function (response) {
                    //console.log(response);
                    var respuesta= response.data;
                    me.arrayIndicador = respuesta.indicadores;
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            cambiarPagina(page,buscar,criterio){
                let me = this;
                //Actualiza la página actual
                me.pagination.current_page = page;
                //Envia la petición para visualizar la data de esa página
                me.listarPregunta(page,buscar,criterio);
            },
            registrarPregunta(){
                if (this.validarPregunta()){
                    return;
                }
                
                let me = this;

                axios.post( '/pregunta/registrar',{
                    'pregunta':this.pregunta,
                    'idindicador': this.idindicador,
                    'condicion_organizacion': this.condicion_organizacion,
                    'nombre': this.nombre,
                }).then(function (response) {
                    me.cerrarModal();
                    me.listarPregunta(1,'','nombre');
                }).catch(function (error) {
                    console.log(error);
                });
            },
            registrarPregunta2(){
                if (this.validarPregunta()){
                    return;
                }
                
                let me = this;

                axios.post( '/pregunta/registrar',{
                    'pregunta':this.pregunta,
                    'idindicador': this.idindicador,
                    'condicion_organizacion': 1,
                    'nombre': this.nombre,
                }).then(function (response) {
                    me.cerrarModal2();
                    me.listarPregunta(1,'','nombre');
                }).catch(function (error) {
                    console.log(error);
                });
            },
            actualizarPregunta2(){
               if (this.validarPregunta()){
                    return;
                }
                
                let me = this;

                axios.put('/pregunta/actualizar',{ 
                    'pregunta':this.pregunta,
                    'idindicador': this.idindicador,
                    'condicion_organizacion': 1,
                    'nombre': this.nombre,
                    'id': this.pregunta_id
                }).then(function (response) {
                    me.cerrarModal2();
                    me.listarPregunta(1,'','nombre');
                }).catch(function (error) {
                    console.log(error);
                }); 
            },
            actualizarPregunta(){
               if (this.validarPregunta()){
                    return;
                }
                
                let me = this;

                axios.put('/pregunta/actualizar',{ 
                    'pregunta':this.pregunta,
                    'idindicador': this.idindicador,
                    'condicion_organizacion': this.condicion_organizacion,
                    'nombre': this.nombre,
                    'id': this.pregunta_id
                }).then(function (response) {
                    me.cerrarModal();
                    me.listarPregunta(1,'','nombre');
                }).catch(function (error) {
                    console.log(error);
                }); 
            },
            desactivarIndicador(id){
               swal({
                title: 'Esta seguro de desactivar esta pregunta?',
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

                    axios.put( '/pregunta/desactivar',{
                        'id': id
                    }).then(function (response) {
                        me.listarPregunta(1,'','nombre');
                        swal(
                        'Desactivado!',
                        'El registro ha sido desactivado con éxito.',
                        'success'
                        )
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
            activarIndicador(id){
               swal({
                title: 'Esta seguro de activar esta pregunta?',
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

                    axios.put('/pregunta/activar',{
                        'id': id
                    }).then(function (response) {
                        me.listarPregunta(1,'','nombre');
                        swal(
                        'Activado!',
                        'El registro ha sido activado con éxito.',
                        'success'
                        )
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
            validarPregunta(){
                this.errorPregunta=0;
                this.errorMostrarMsjPregunta=[];
                if (!this.pregunta) this.errorMostrarMsjPregunta.push("La pregunta no debe de estar vacia.");
                if (this.idindicador==0) this.errorMostrarMsjPregunta.push("Seleccione un indicador.");

                if (this.errorMostrarMsjPregunta.length) this.errorPregunta = 1;

                return this.errorPregunta;
            },
            cerrarModal(){
                this.modal=0;
                this.tituloModal='';
                this.pregunta = '';
                this.idindicador = 0;
                this.condicion_organizacion = 0;
                this.nombre='';
		        this.errorIndicador=0;
            },
            cerrarModal2(){
                this.modal2=0;
                this.tituloModal='';
                this.pregunta = '';
                this.idindicador = 0;
                this.condicion_organizacion = 0;
                this.nombre='';
		        this.errorIndicador=0;
            },
            abrirModal(modelo, accion, data = []){
                switch(modelo){
                    case "pregunta":
                    {
                        switch(accion){
                            case 'registrar':
                            {
                                this.modal = 1;
                                this.tituloModal = 'Registrar Pregunta';
                                this.pregunta = '';
                                this.idindicador = 0,
                                this.condicion_organizacion = 0,
                                this.nombre='',
                                this.tipoAccion = 1;
                                break;
                            }
                            case 'actualizar':
                            {
                                //console.log(data);
                                this.modal=1;
                                this.tituloModal='Actualizar Pregunta';
                                this.tipoAccion=2;
                                this.pregunta_id=data['id'];
                                this.pregunta = data['pregunta'];
                                this.idindicador = data['idindicador'];
                                this.condicion_organizacion = data['condicion_organizacion'];
                                this.nombre=data['nombre'];
                                break;
                            }
                        }
                    }
                }
                this.selectIndicador();
            },
            abrirModal2(modelo, accion, data = []){
                switch(modelo){
                    case "pregunta":
                    {
                        switch(accion){
                            case 'registrar':
                            {
                                this.modal2 = 1;
                                this.tituloModal = 'Registrar Pregunta';
                                this.pregunta = '';
                                this.idindicador = 0,
                                this.condicion_organizacion = 0,
                                this.nombre='',
                                this.tipoAccion = 1;
                                break;
                            }
                            case 'actualizar':
                            {
                                //console.log(data);
                                this.modal2=1;
                                this.tituloModal='Actualizar Pregunta';
                                this.tipoAccion=2;
                                this.pregunta_id=data['id'];
                                this.pregunta = data['pregunta'];
                                this.idindicador = data['idindicador'];
                                this.condicion_organizacion = data['condicion_organizacion'];
                                this.nombre=data['nombre'];
                                break;
                            }
                        }
                    }
                }
                this.selectIndicador();
            }            
        },

        
        mounted() {
            this.listarPregunta(1,this.buscar,this.criterio);
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
s