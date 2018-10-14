<template>
  <div id="app">
    <p>{{next.name}}</p>
    <!-- <busSelect></busSelect> -->
    <timer v-bind:next='next'></timer>
    <upcomings v-bind:buses='nexts'></upcomings>
  </div>
</template>

<script>
import Timer from './timer.vue';
import BusSelect from './bus_select.vue';
import Upcomings from './upcomings.vue';

export default {
  props: {
    jsonBuses: String
  },

  data() {
    return {
      buses: JSON.parse(this.jsonBuses),
    }
  },

  computed: {
    next: function () {
      return this.buses[0]
    },

    nexts: function () {
      return this.buses.slice(1)
    }
  },

  components: {
    Timer,
    BusSelect,
    Upcomings
  },
}
</script>

<style>
p {
  font-size: 2em;
  text-align: center;
}
</style>
