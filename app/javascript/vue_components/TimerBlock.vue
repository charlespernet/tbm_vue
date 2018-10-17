<template>
  <div id="app">
    <div class="next-bus">
      <p>{{next.name}} à l'arret Bourse du Travail</p>
      <p>Prochain bus dans :</p>
    </div>
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
.next-bus {
  background: #a77b00;
  padding: 80px;
  margin: 50px;
  color: white;
  border-radius: 20px;
  font-size: 2.2em;
  font-weight: bold;
  text-align: center;
}
</style>
