<template>
  <div id="app">
    <p>{{next}}</p>
    <busSelect></busSelect>
    <timer></timer>
    <upcomings v-bind:nexts='buses'></upcomings>
  </div>
</template>

<script>
import Timer from './timer.vue';
import BusSelect from './bus_select.vue';
import Upcomings from './upcomings.vue';

export default {
  components: {
    Timer,
    BusSelect,
    Upcomings
  },

  props: ['obuses'],

  data() {
    return {
      buses: JSON.parse(this.obuses),
    }
  },

  computed: {
    next: function () {
      const bus = this.buses[0]
      return `${bus.name} - ${bus.real}`
    }
  },
}
</script>

<style>
p {
  font-size: 2em;
  text-align: center;
}
</style>
