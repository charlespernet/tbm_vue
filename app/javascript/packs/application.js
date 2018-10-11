import Vue from 'vue/dist/vue.esm'
import App from '../vue_components/app.vue'
import Timer from '../vue_components/timer.vue'
import BusSelect from '../vue_components/bus_select.vue'
import Upcomings from '../vue_components/upcomings.vue'

Vue.component('app', App)
Vue.component('busSelect', BusSelect)
Vue.component('timer', Timer)
Vue.component('upcomings', Upcomings)

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '[data-behavior="vue"]'
  })
})
