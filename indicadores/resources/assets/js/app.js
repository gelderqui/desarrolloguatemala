
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */


Vue.component('pilar', require('./components/Pilar.vue'));
Vue.component('indicador', require('./components/Indicador.vue'));
Vue.component('tablapib', require('./components/Tablapib.vue'));
Vue.component('indice', require('./components/Indice.vue'));
Vue.component('respuestaadmin', require('./components/RespuestaAdmin.vue'));
Vue.component('respuesta', require('./components/Respuesta.vue'));
Vue.component('respuestaentidad', require('./components/RespuestaEntidad.vue'));
Vue.component('usuario', require('./components/Usuario.vue'));
Vue.component('rol', require('./components/Rol.vue'));
Vue.component('graficos', require('./components/Graficas.vue'));
Vue.component('compara', require('./components/Compara.vue'));
Vue.component('graficapilar', require('./components/Graficapilar.vue'));
Vue.component('comfecha', require('./components/Comparafecha.vue'));
Vue.component('reportepil', require('./components/Reportepilar.vue'));
Vue.component('correo', require('./components/Correo.vue'));

const app = new Vue({
    el: '#app',
    data :{
        menu : 0
    }
});
