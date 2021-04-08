<template>
            <main class="main">
            <!-- Breadcrumb -->
            <ol class="breadcrumb">
                <li class="breadcrumb-item">Home</li>
                <li class="breadcrumb-item"><a href="#">Admin</a></li>
                <li class="breadcrumb-item active">Dashboard</li>
            </ol>
            <div class="container-fluid">
                <!-- Ejemplo de tabla Listado -->
                <div class="card">
                    <div class="card-header">
                        <i class="fa fa-align-justify"></i> Pilares 
                        <button type="button" @click="abrirModal('pilar','registrar')" class="btn btn-secondary">
                            <i class="icon-plus"></i>&nbsp;Nuevo
                        </button>
                    </div>
                    <div class="card-body">
                        <div class="form-group row">
                            <div class="col-md-6">
                                <div class="input-group">
                                    <select class="form-control col-md-3" v-model="criterio">
                                      <option value="nombre">Nombre</option>
                                      <option value="descripcion">Descripción</option>
                                    </select>
                                    <input type="text" v-model="buscar" @keyup.enter="listarPilar(1,buscar,criterio)" class="form-control" placeholder="Texto a buscar">
                                    <button type="submit" @click="listarPilar(1,buscar,criterio)" class="btn btn-primary"><i class="fa fa-search"></i> Buscar</button>
                                </div>
                            </div>
                        </div>
                        <table class="table table-bordered table-striped table-sm">
                            <thead>
                                <tr>
                                    <th>Opciones</th>
                                    <th>Nombre</th>
                                    <th>Descripción</th>
                                    <th>Etapa1</th>
                                    <th>Etapa2</th>
                                    <th>Etapa3</th>
                                    <th>Estado</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="pilar in arrayPilar" :key="pilar.id">
                                    <td>
                                        <button type="button" @click="abrirModal('pilar','actualizar',pilar)" class="btn btn-warning btn-sm">
                                          <i class="icon-pencil"></i>
                                        </button> &nbsp;
                                        <template v-if="pilar.condicion">
                                            <button type="button" class="btn btn-danger btn-sm" @click="desactivarPilar(pilar.id)">
                                                <i class="icon-trash"></i>
                                            </button>
                                        </template>
                                        <template v-else>
                                            <button type="button" class="btn btn-info btn-sm" @click="activarPilar(pilar.id)">
                                                <i class="icon-check"></i>
                                            </button>
                                        </template>
                                    </td>
                                    <td v-text="pilar.nombre"></td>
                                    <td v-text="pilar.descripcion"></td>
                                    <td v-text="pilar.etapa1"></td>
                                    <td v-text="pilar.etapa2"></td>
                                    <td v-text="pilar.etapa3"></td>
                                    <td>
                                        <div v-if="pilar.condicion">
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
                                    <label class="col-md-3 form-control-label" for="text-input">Nombre</label>
                                    <div class="col-md-9">
                                        <input type="text" v-model="nombre" class="form-control" placeholder="Nombre del pilar">
                                        
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="email-input">Descripción</label>
                                    <div class="col-md-9">
                                        <input type="email" v-model="descripcion" class="form-control" placeholder="Ingrese descripción">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="number-input">Etapa1</label>
                                    <div class="col-md-9">
                                        <input type="number" v-model="etapa1" class="form-control" placeholder="Ingrese Etapa1">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="number-input">Etapa2</label>
                                    <div class="col-md-9">
                                        <input type="number" v-model="etapa2" class="form-control" placeholder="Ingrese Etapa2">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="number-input">Etapa3</label>
                                    <div class="col-md-9">
                                        <input type="number" v-model="etapa3" class="form-control" placeholder="Ingrese Etapa3">
                                    </div>
                                </div>
                                <div v-show="errorPilar" class="form-group row div-error">
                                    <div class="text-center text-error">
                                        <div v-for="error in errorMostrarMsjPilar" :key="error" v-text="error">

                                        </div>
                                    </div>
                                </div>

                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" @click="cerrarModal()">Cerrar</button>
                            <button type="button" v-if="tipoAccion==1" class="btn btn-primary" @click="registrarPilar()">Guardar</button>
                            <button type="button" v-if="tipoAccion==2" class="btn btn-primary" @click="actualizarPilar()">Actualizar</button>
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
                pilar_id: 0,
                nombre : '',
                descripcion : '',
                etapa1 : 0,
                etapa2 : 0,
                etapa3 : 0,
                arrayPilar : [],
                modal : 0,
                tituloModal : '',
                tipoAccion : 0,
                errorPilar : 0,
                errorMostrarMsjPilar : [],
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
                buscar : ''
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
            listarPilar (page,buscar,criterio){
                let me=this;
                var url= '/pilar?page=' + page + '&buscar='+ buscar + '&criterio='+ criterio;
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.arrayPilar = respuesta.pilares.data;
                    me.pagination= respuesta.pagination;
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
                me.listarPilar(page,buscar,criterio);
            },
            registrarPilar(){
                if (this.validarPilar()){
                    return;
                }
                
                let me = this;

                axios.post('/pilar/registrar',{
                    'nombre': this.nombre,
                    'descripcion': this.descripcion,
                    'etapa1': this.etapa1,
                    'etapa2': this.etapa2,
                    'etapa3': this.etapa3
                }).then(function (response) {
                    me.cerrarModal();
                    me.listarPilar(1,'','nombre');
                }).catch(function (error) {
                    console.log(error);
                });
            },
            actualizarPilar(){
               if (this.validarPilar()){
                    return;
                }
                
                let me = this;

                axios.put('/pilar/actualizar',{
                    'nombre': this.nombre,
                    'descripcion': this.descripcion,
                    'etapa1': this.etapa1,
                    'etapa2': this.etapa2,
                    'etapa3': this.etapa3,
                    'id': this.pilar_id
                }).then(function (response) {
                    me.cerrarModal();
                    me.listarPilar(1,'','nombre');
                }).catch(function (error) {
                    console.log(error);
                }); 
            },
            desactivarPilar(id){
               swal({
                title: 'Esta seguro de desactivar este pilar?',
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

                    axios.put('/pilar/desactivar',{
                        'id': id
                    }).then(function (response) {
                        me.listarPilar(1,'','nombre');
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
            activarPilar(id){
               swal({
                title: 'Esta seguro de activar este pilar?',
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

                    axios.put('/pilar/activar',{
                        'id': id
                    }).then(function (response) {
                        me.listarPilar(1,'','nombre');
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
            validarPilar(){
                this.errorPilar=0;
                this.errorMostrarMsjPilar =[];

                if (!this.nombre) this.errorMostrarMsjPilar.push("El nombre del pilar no puede estar vacío.");
                if (!this.etapa1) this.errorMostrarMsjPilar.push("La etapa1 del pilar no puede estar vacío.");
                if (!this.etapa2) this.errorMostrarMsjPilar.push("La etapa2 del pilar no puede estar vacío.");
                if (!this.etapa3) this.errorMostrarMsjPilar.push("La etapa3 del pilar no puede estar vacío.");

                if (this.errorMostrarMsjPilar.length) this.errorPilar = 1;

                return this.errorPilar;
            },
            cerrarModal(){
                this.modal=0;
                this.tituloModal='';
                this.nombre='';
                this.descripcion='';
                this.etapa1=0;
                this.etapa2=0;
                this.etapa3=0;
                
            },
            abrirModal(modelo, accion, data = []){
                switch(modelo){
                    case "pilar":
                    {
                        switch(accion){
                            case 'registrar':
                            {
                                this.modal = 1;
                                this.tituloModal = 'Registrar Pilar';
                                this.nombre= '';
                                this.descripcion = '';
                                this.etapa1 = 0;
                                this.etapa2 = 0;
                                this.etapa3 = 0;
                                this.tipoAccion = 1;
                                break;
                            }
                            case 'actualizar':
                            {
                                //console.log(data);
                                this.modal=1;
                                this.tituloModal='Actualizar Pilar';
                                this.tipoAccion=2;
                                this.pilar_id=data['id'];
                                this.nombre = data['nombre'];
                                this.descripcion= data['descripcion'];
                                this.etapa1= data['etapa1'];
                                this.etapa2= data['etapa2'];
                                this.etapa3= data['etapa3'];
                                break;
                            }
                        }
                    }
                }
            }
        },
        mounted() {
            this.listarPilar(1,this.buscar,this.criterio);
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
