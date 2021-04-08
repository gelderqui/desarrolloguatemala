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
                        <i class="fa fa-align-justify" ></i> Indice Competitividad Departamental
                        <button type="button" @click="abrirModal('indice','registrar')" class="btn btn-secondary">
                            <i class="icon-plus" ></i>&nbsp;Nuevo
                        </button>
                    <!--    <h1 v-if="this.pib<this.arraypib[0].pib_mayor && this.pib>this.arraypib[0].pib_menor">Etapa3</h1>
                        <h1 v-else>nota</h1>
                    -->
                    </div>
                    <div class="card-body">
                        <div class="form-group row">
                            <div class="col-md-6">
                                <div class="input-group">
                                    <select class="form-control col-md-3" v-model="criterio">
                                      <option value="anio">año</option>
                                      <option value="poblacion">población</option>
                                    </select>
                                    <input type="text" v-model="buscar" @keyup.enter="listarIndice(1,buscar,criterio)" class="form-control" placeholder="Texto a buscar">
                                    <button type="submit" @click="listarIndice(1,buscar,criterio)" class="btn btn-primary"><i class="fa fa-search"></i> Buscar</button>
                                </div>
                            </div>
                        </div>
                        <table class="table table-bordered table-striped table-sm">
                            <thead>
                                <tr>
                                    <th>Opciones</th>
                                    <th>Departamento</th>
                                    <th>año</th>
                                    <th>Puntaje ICL</th>
                                    <th>PIB</th>
                                    <th>Población</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="indice in arrayIndice" :key="indice.id">
                                    <td>
                                        <button type="button" @click="abrirModal('indice','actualizar',indice)" class="btn btn-warning btn-sm">
                                          <i class="icon-pencil"></i>
                                        </button> &nbsp;
                                       
                                    </td>
                                    <td v-text="indice.departamento"></td>
                                    <td v-text="indice.anio"></td>
                                    <td v-text="indice.puntaje"></td>
                                    <td v-text="indice.pib"></td>
                                    <td v-text="indice.poblacion"></td>
                                    
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
                                    <label class="col-md-3 form-control-label" for="text-input">Departamento</label>
                                    <div class="col-md-9">
                                        <select class="form-control" v-model="iddep">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="departamento in arrayDepartamento" :key="departamento.id" :value="departamento.id" v-text="departamento.nombre"></option>
                                        </select>                                        
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="numb-input">Población</label>
                                    <div class="col-md-9">
                                        <input type="numb" v-model="poblacion" class="form-control" placeholder=" ">                                        
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Año</label>
                                    <div class="col-md-9">
                                        <input type="text" v-model="anio" class="form-control" placeholder=" 2017 ">                                        
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="numb-input">PIB</label>
                                    <div class="col-md-9">
                                        <input type="number" v-model="pib" class="form-control" placeholder=" ">                                        
                                    </div>
                                </div>
                                
                                <div v-show="errorIndice" class="form-group row div-error">
                                    <div class="text-center text-error">
                                        <div v-for="error in errorMostrarMsjIndice" :key="error" v-text="error">

                                        </div>
                                    </div>
                                </div>

                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" @click="cerrarModal()">Cerrar</button>
                            <button type="button" v-if="tipoAccion==1" class="btn btn-primary" @click="registrarIndice()">Guardar</button>
                            <button type="button" v-if="tipoAccion==2" class="btn btn-primary" @click="actualizarIndice()">Actualizar</button>
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
                indice_id: 0,
                iddep : 0,
                departamento : '',
                poblacion : 0,
                anio : '',
                pib : 0,
                pib2 :0,
                arrayIndice : [],
                arrayPilar:[],
                arraypib: [],
                etapa:'',
                modal : 0,
                tituloModal : '',
                tipoAccion : 0,
                errorIndice : 0,
                errorMostrarMsjIndice : [],
                pagination : {
                    'total' : 0,
                    'current_page' : 0,
                    'per_page' : 0,
                    'last_page' : 0,
                    'from' : 0,
                    'to' : 0,
                },
                offset : 3,
                criterio : 'anio',
                buscar : '',
                arrayDepartamento :[],
                arrayRespuesta :[],
                rest :0
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
            listarIndice(page,buscar,criterio){
                let me=this;
                var url= '/indice?page=' + page + '&buscar='+ buscar + '&criterio='+ criterio;
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.arrayPilar= respuesta.pilar;
                    me.arrayIndice = respuesta.indices.data;
                    me.pagination= respuesta.pagination;
                   
                })
                .catch(function (error) {
                    console.log(error);
                });
                 
            },
            
            selectDepartamento(){
                let me=this;
                var url= '/departamento/selectDepartamento';
                axios.get(url).then(function (response) {
                    //console.log(response);
                    var respuesta= response.data;
                    me.arrayDepartamento = respuesta.departamentos;
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
                me.listarIndice(page,buscar,criterio);
            },
            registrarIndice(){
                if (this.validarIndice()){
                    return;
                }
                
                
                 let me = this;
                
                
              /* */
              /*  else
                {
                if( me.pib > me.arraypib[1].pib_menor)
                {
                me.etapa='etapa1';
                }
                }*/
 

                axios.post( '/indice/registrar',{
                    'iddep': this.iddep,
                    'poblacion': this.poblacion,
                    'anio': this.anio,
                    'pib': this.pib,
                    'data':this.arrayPilar,
                    'data1':this.arraypib
                }).then(function (response) {
                    me.cerrarModal();
                    me.listarIndice(1,'','anio');
                }).catch(function (error) {
                    console.log(error);
                });
            },
            actualizarIndice(){
               if (this.validarIndice()){
                    return;
                }
                
                let me = this;

                axios.put('/indice/actualizar',{
                    'iddep': this.iddep,
                    'poblacion': this.poblacion,
                    'anio': this.anio,
                    'pib': this.pib,
                    'id': this.indice_id
                }).then(function (response) {
                    me.cerrarModal();
                    me.listarIndice(1,'','anio');
                }).catch(function (error) {
                    console.log(error);
                }); 
            },
            validarIndice(){
                this.errorIndice=0;
                this.errorMostrarMsjIndice =[];

                if (this.iddep==0) this.errorMostrarMsjIndice.push("Seleccione un departamento.");
                if (!this.poblacion) this.errorMostrarMsjIndice.push("La poblacion no puede estar vacío y debe ser un número.");
                if (!this.anio) this.errorMostrarMsjIndice.push("El año  no puede estar vacío.");
                if (!this.pib) this.errorMostrarMsjIndice.push("El pib debe ser un número y no puede estar vacío.");

                if (this.errorMostrarMsjIndice.length) this.errorIndice = 1;

                return this.errorIndice;
            },
            cerrarModal(){
                this.modal=0;
                this.tituloModal='';
                this.iddep= 0;
                this.departamento = '';
                this.poblacion = 0;
                this.anio = '',
		        this.errorIndice=0;
            },
            abrirModal(modelo, accion, data = []){
                switch(modelo){
                    case "indice":
                    {
                        switch(accion){
                            case 'registrar':
                            {
                                this.modal = 1;
                                this.tituloModal = 'Ingresar ICL nuevo';
                                this.iddep=0;
                                this.departamento='';
                                this.poblacion= 0;
                                this.anio='';
                                this.pib=0;
                                this.tipoAccion = 1;
                                break;
                            }

                            case 'actualizar':
                            {
                                //console.log(data);
                                this.modal=1;
                                this.tituloModal='Actualizar ICL';
                                this.tipoAccion=2;
                                this.indice_id=data['id'];
                                this.iddep=data['iddep'];
                                this.poblacion = data['poblacion'];
                                this.anio=data['anio'];
                                this.pib=data['pib'];
                                break;
                            }
                            
                        }
                    }
                }
                this.selectDepartamento();
            }
        },
        mounted() {
            this.listarIndice(1,this.buscar,this.criterio);
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
