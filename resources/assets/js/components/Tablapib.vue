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
                        <i class="fa fa-align-justify"></i> Tabla PIB
                       
                    </div>
                    <div class="card-body">
                        <div class="form-group row">
                            <div class="col-md-6">
                                <div class="input-group">
                                    <select class="form-control col-md-3" v-model="criterio">
                                      <option value="nombre">Etapa</option>
                                    </select>
                                    <input type="text" v-model="buscar" @keyup.enter="listarTablapib(1,buscar,criterio)" class="form-control" placeholder="Texto a buscar">
                                    <button type="submit" @click="listarTablapib(1,buscar,criterio)" class="btn btn-primary"><i class="fa fa-search"></i> Buscar</button>
                                </div>
                            </div>
                        </div>
                        <table class="table table-bordered table-striped table-sm">
                            <thead>
                                <tr>
                                    <th>Opciones</th>
                                    <th>Etapa</th>
                                    <th>PIB menor</th>
                                    <th>PIB mayor</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="tablapib in arrayTablapib" :key="tablapib.id">
                                    <td>
                                        <button type="button" @click="abrirModal('tablapib','actualizar',tablapib)" class="btn btn-warning btn-sm">
                                          <i class="icon-pencil"></i>
                                        </button> &nbsp;
                                        
                                    </td>
                                    <td v-text="tablapib.etapa"></td>
                                    <td v-text="tablapib.pib_menor"></td>
                                    <td v-text="tablapib.pib_mayor"></td>
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
                                    <label class="col-md-3 form-control-label" for="text-input">Etapa</label>
                                    <div class="col-md-9">
                                        <input type="text" v-model="etapa" class="form-control" placeholder="Nombre de la etapa">
                                        
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="number-input">PIB menor</label>
                                    <div class="col-md-9">
                                        <input type="number" v-model="pib_menor" class="form-control" placeholder=" ">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="number-input">PIB mayor</label>
                                    <div class="col-md-9">
                                        <input type="number" v-model="pib_mayor" class="form-control" placeholder=" ">
                                    </div>
                                </div>
                                <div v-show="errorTablapib" class="form-group row div-error">
                                    <div class="text-center text-error">
                                        <div v-for="error in errorMostrarMsjTablapib" :key="error" v-text="error">

                                        </div>
                                    </div>
                                </div>

                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" @click="cerrarModal()">Cerrar</button>
                                                        <button type="button" v-if="tipoAccion==2" class="btn btn-primary" @click="actualizarTablapib()">Actualizar</button>
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
                tablapib_id: 0,
                etapa : '',
                pib_menor : 0,
                pib_mayor : 0,
                arrayTablapib : [],
                modal : 0,
                tituloModal : '',
                tipoAccion : 0,
                errorTablapib : 0,
                errorMostrarMsjTablapib : [],
                pagination : {
                    'total' : 0,
                    'current_page' : 0,
                    'per_page' : 0,
                    'last_page' : 0,
                    'from' : 0,
                    'to' : 0,
                },
                offset : 3,
                criterio : 'escala',
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
            listarTablapib (page,buscar,criterio){
                let me=this;
                var url= '/tablapib?page=' + page + '&buscar='+ buscar + '&criterio='+ criterio;
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.arrayTablapib = respuesta.tablapibs.data;
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
                me.listarTablapib(page,buscar,criterio);
            },
            
            actualizarTablapib(){
               if (this.validarTablapib()){
                    return;
                }
                
                let me = this;

                axios.put('/tablapib/actualizar',{
                    'etapa': this.etapa,
                    'pib_menor': this.pib_menor,
                    'pib_mayor': this.pib_mayor,
                    'id': this.tablapib_id
                }).then(function (response) {
                    me.cerrarModal();
                    me.listarTablapib(1,'','nombre');
                }).catch(function (error) {
                    console.log(error);
                }); 
            },
           
            validarTablapib(){
                this.errorTablapib=0;
                this.errorMostrarMsjTablapib =[];

                if (!this.etapa) this.errorMostrarMsjTablapib.push("La etapa de la tabla PIB no puede estar vacío.");
                if (!this.pib_menor) this.errorMostrarMsjTablapib.push("El pib_menor de la tabla PIB no puede estar vacío.");
                if (!this.pib_mayor) this.errorMostrarMsjTablapib.push("El pib_mayor de la tabla PIB no puede estar vacío.");

                if (this.errorMostrarMsjTablapib.length) this.errorTablapib = 1;

                return this.errorTablapib;
            },
            cerrarModal(){
                this.modal=0;
                this.tituloModal='';
                this.etapa='';
                this.pib_menor=0;
                this.pib_mayor=0;
            },
            abrirModal(modelo, accion, data = []){
                switch(modelo){
                    case "tablapib":
                    {
                        switch(accion){
                            case 'actualizar':
                            {
                                //console.log(data);
                                this.modal=1;
                                this.tituloModal='Actualizar tabla PIB';
                                this.tipoAccion=2;
                                this.tablapib_id=data['id'];
                                this.etapa = data['etapa'];
                                this.pib_menor= data['pib_menor'];
                                this.pib_mayor= data['pib_mayor'];
                                break;
                            }
                        }
                    }
                }
            }
        },
        mounted() {
            this.listarTablapib(1,this.buscar,this.criterio);
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
