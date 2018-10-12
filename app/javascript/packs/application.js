import Vue from 'vue/dist/vue.esm'
import TimerBlock from '../vue_components/TimerBlock.vue'

Vue.component('timerblock', TimerBlock)

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '[data-behavior="vue"]'
  })
})
