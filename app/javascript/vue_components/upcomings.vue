<template>
  <table>
    <thead>
      <tr>
        <td>Bus</td>
        <td>Prochain passage</td>
      </tr>
    </thead>
    <tbody>
      <tr v-for='bus in busesTimes'>
        <td>{{bus.name}}</td>
        <td>{{bus.time | two_digits}} min</td>
      </tr>
    </tbody>
  </table>
</template>

<script>
import two_digits_filter from './mixins/two_digits_filter'

export default {
  mixins: [two_digits_filter],

  props: {
    buses: Array
  },

  data() {
    return {
      now: Math.trunc((new Date()).getTime() / 1000)
    }
  },

  mounted() {
    window.setInterval(() => {
      this.now = Math.trunc((new Date()).getTime() / 1000);
    }, 15000);
  },

  computed: {
    busesTimes: function () {
      const now = this.now
      return this.buses.map(function(bus) {
        const date = Math.trunc(Date.parse(bus.real) / 1000);
        return {name: bus.name, time: Math.trunc((date - now) / 60) % 60}
      })
    }
  }
}
</script>

<style lang="scss">
  table {
    width: 80%;
    margin: 0 auto;
    text-align: center;
    font-size: 40px;
  }

  tbody:before {
    content: "-";
    display: block;
    line-height: 1em;
    color: transparent;
  }
</style>
