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
                        <i class="fa fa-align-justify"></i> Indicadores
                        <button type="button" @click="abrirModal('indicador','registrar')" class="btn btn-secondary">
                            <i class="icon-plus"></i>&nbsp;Nuevo
                        </button>
                    </div>
                    <div class="card-body">
                        <div class="form-group row">
                            <div class="col-md-6">
                                <div class="input-group">
                                    <select class="form-control col-md-3" v-model="criterio">
                                      <option value="nombre">Nombre</option>
                                      <option value="pregunta">Pregunta</option>
                                      <option value="organizacion">Organizacion</option>
                                    </select>
                                    <input type="text" v-model="buscar" @keyup.enter="listarIndicador(1,buscar,criterio)" class="form-control" placeholder="Texto a buscar">
                                    <button type="submit" @click="listarIndicador(1,buscar,criterio)" class="btn btn-primary"><i class="fa fa-search"></i> Buscar</button>
                                </div>
                            </div>
                        </div>
                        <table class="table table-bordered table-striped table-sm">
                            <thead>
                                <tr>
                                    <th>Opciones</th>
                                    <th>Nombre</th>
                                    <th>Pilar</th>
                                    <th>Pregunta</th>
                                    <th>Organizacion</th>
                                    <th>Fuente</th>
                                    <th>Estado</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="indicador in arrayIndicador" :key="indicador.id">
                                    <td>
                                        <button type="button" @click="abrirModal('indicador','actualizar',indicador)" class="btn btn-warning btn-sm">
                                          <i class="icon-pencil"></i>
                                        </button> &nbsp;
                                        <template v-if="indicador.condicion">
                                            <button type="button" class="btn btn-danger btn-sm" @click="desactivarIndicador(indicador.id)">
                                                <i class="icon-trash"></i>
                                            </button>
                                        </template>
                                        <template v-else>
                                            <button type="button" class="btn btn-info btn-sm" @click="activarIndicador(indicador.id)">
                                                <i class="icon-check"></i>
                                            </button>
                                        </template>
                                    </td>
                                    <td v-text="indicador.nombre"></td>
                                    <td v-text="indicador.nombre_pilar"></td>
                                    <td v-text="indicador.pregunta"></td>
                                    <td v-text="indicador.organizacion"></td>
                                    <td>
                                        <div v-if="indicador.condicion_organizacion">
                                            <span class="badge badge-success">Organizacion</span>
                                        </div>
                                        <div v-else>
                                            <span class="badge badge-danger">Encuesta</span>
                                        </div>
                                        
                                    </td>
                                    <td>
                                        <div v-if="indicador.condicion">
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
                                    <label class="col-md-3 form-control-label" for="text-input">Pilar</label>
                                    <div class="col-md-9">
                                        <select class="form-control" v-model="idpilar">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="pilar in arrayPilar" :key="pilar.id" :value="pilar.id" v-text="pilar.nombre"></option>
                                        </select>                                        
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Nombre</label>
                                    <div class="col-md-9">
                                        <input type="text" v-model="nombre" class="form-control" placeholder="Nombre del indicador">                                        
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Pregunta</label>
                                    <div class="col-md-9">
                                        <input type="text" v-model="pregunta" class="form-control" placeholder="Ingrese una pregunta al indicador">                                        
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Tipo de pregunta</label>
                                    <div class="col-md-9">
                                        <input type="radio" id="one" value="0" v-model="picked" >
                                        <label for="one" >Encuesta</label>  
                                        <input type="radio" id="one" value="1" v-model="picked" >
                                        <label for="one" >Entidad</label>                                      
                                    </div>
                                </div>
                                <template v-if="picked=='1'">
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Nombre de la entidad</label>
                                    <div class="col-md-9">
                                        <input type="text" v-model="organizacion" class="form-control" placeholder="Ingrese el nombre de la organizacion">                                        
                                    </div>
                                </div>
                                </template>
                                <div v-show="errorIndicador" class="form-group row div-error">
                                    <div class="text-center text-error">
                                        <div v-for="error in errorMostrarMsjIndicador" :key="error" v-text="error">

                                        </div>
                                    </div>
                                </div>

                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" @click="cerrarModal()">Cerrar</button>
                            <button type="button" v-if="tipoAccion==1" class="btn btn-primary" @click="registrarIndicador()">Guardar</button>
                            <button type="button" v-if="tipoAccion==2" class="btn btn-primary" @click="actualizarIndicador()">Actualizar</button>
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
                indicador_id: 0,
                idpilar : 0,
                nombre_pilar : '',
                picked:'0',
                nombre : '',
                pregunta : 0,
                organizacion : 0,
                condicion_organizacion: 0,
                arrayIndicador : [],
                modal : 0,
                tituloModal : '',
                tipoAccion : 0,
                errorIndicador : 0,
                errorMostrarMsjIndicador : [],
                pagination : {
                    'total' : 0,
                    'current_page' : 0,
                    'per_page' : 0,
                    'last_page' : 0,
                    'from' : 0,
                    'to' : 0,
                },
                offset : 3,
                criterio : 'nombre',
                buscar : '',
                arrayPilar :[]
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
            listarIndicador(page,buscar,criterio){
                let me=this;
                var url= '/indicador?page=' + page + '&buscar='+ buscar + '&criterio='+ criterio;
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.arrayIndicador = respuesta.indicadores.data;
                    me.pagination= respuesta.pagination;
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            cargarPdf(){
                window.open('/indicador/listarPdf','_blank');
            },
            selectPilar(){
                let me=this;
                var url= '/pilar/selectPilar';
                axios.get(url).then(function (response) {
                    //console.log(response);
                    var respuesta= response.data;
                    me.arrayPilar = respuesta.pilares;
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
                me.listarIndicador(page,buscar,criterio);
            },
            registrarIndicador(){
                if(this.picked=="1"){
                        this.condicion_organizacion=1;
                    }
                else
                {
                        this.organizacion="";
                }
                if (this.validarIndicador()){
                    return;
                }
                
                let me = this;

                axios.post( '/indicador/registrar',{
                    'idpilar': this.idpilar,
                    'nombre': this.nombre,
                    'pregunta': this.pregunta,
                    'organizacion': this.organizacion,
                    'condicion_organizacion':this.condicion_organizacion
                    
                }).then(function (response) {
                    me.cerrarModal();
                    me.listarIndicador(1,'','nombre');
                }).catch(function (error) {
                    console.log(error);
                });
            },
            actualizarIndicador(){
                if(this.picked=="1"){
                        this.condicion_organizacion=1;
                    }
                else
                {
                        this.organizacion="";
                }
               if (this.validarIndicador()){
                    return;
                }
                
                let me = this;

                axios.put('/indicador/actualizar',{
                    'idpilar': this.idpilar,
                    'nombre': this.nombre,
                    'pregunta': this.pregunta,
                    'organizacion': this.organizacion,
                    'condicion_organizacion':this.condicion_organizacion,
                    'id': this.indicador_id
                }).then(function (response) {
                    me.cerrarModal();
                    me.listarIndicador(1,'','nombre');
                }).catch(function (error) {
                    console.log(error);
                }); 
            },
            desactivarIndicador(id){
               swal({
                title: 'Esta seguro de desactivar este indicador?',
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

                    axios.put( '/indicador/desactivar',{
                        'id': id
                    }).then(function (response) {
                        me.listarIndicador(1,'','nombre');
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
                title: 'Esta seguro de activar este indicador?',
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

                    axios.put('/indicador/activar',{
                        'id': id
                    }).then(function (response) {
                        me.listarIndicador(1,'','nombre');
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
            validarIndicador(){
                this.errorIndicador=0;
                this.errorMostrarMsjIndicador =[];

                if (this.idpilar==0) this.errorMostrarMsjIndicador.push("Seleccione un pilar.");
                if (!this.nombre) this.errorMostrarMsjIndicador.push("El nombre del indicador no puede estar vacío.");
                if (!this.pregunta) this.errorMostrarMsjIndicador.push("La pregunta del indicador no puede estar vacío.");
                if(this.picked=='1')if(!this.organizacion) this.errorMostrarMsjIndicador.push("El nombre de la entidad no puede estar vacío")
                if (this.errorMostrarMsjIndicador.length) this.errorIndicador = 1;

                return this.errorIndicador;
            },
            cerrarModal(){
                this.modal=0;
                this.tituloModal='';
                this.idpilar= 0;
                this.nombre_pilar = '';
                this.nombre = '';
                this.pregunta = '',
                this.organizacion = '',
                this.condicion_organizacion=0,
                this.picked='0',
		        this.errorIndicador=0;
            },
            abrirModal(modelo, accion, data = []){
                switch(modelo){
                    case "indicador":
                    {
                        switch(accion){
                            case 'registrar':
                            {
                                this.modal = 1;
                                this.tituloModal = 'Registrar indicador';
                                this.idpilar=0;
                                this.nombre_pilar='';
                                this.nombre= '';
                                this.pregunta='';
                                this.organizacion='';
                                this.condicion_organizacion=0,
                                this.picked='0',
                                this.tipoAccion = 1;
                                break;
                            }
                            case 'actualizar':
                            {
                                //console.log(data);
                                this.modal=1;
                                this.tituloModal='Actualizar indicador';
                                this.tipoAccion=2;
                                this.indicador_id=data['id'];
                                this.idpilar=data['idpilar'];
                                this.nombre = data['nombre'];
                                this.pregunta=data['pregunta'];
                                this.picked=data['condicion_organizacion']
                                this.organizacion=data['organizacion'];
                                break;
                            }
                        }
                    }
                }
                this.selectPilar();
            }
        },
        mounted() {
            this.listarIndicador(1,this.buscar,this.criterio);
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
