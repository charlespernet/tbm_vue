<template>
  <div id="app">
    <busSelect></busSelect>
    <timer></timer>
    <upcomings></upcomings>
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
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
