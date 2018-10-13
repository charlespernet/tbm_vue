<template>
  <table>
    <thead>
      <tr>
        <td>Bus</td>
        <td>Prochain passage</td>
      </tr>
    </thead>
    <tbody>
      <tr v-for='bus in buses'>
        <td>{{bus.name}}</td>
        <td>{{bus.real}}</td>
      </tr>
    </tbody>
  </table>
</template>

<script>
export default {
  props: {
    buses: Array
  }
}
</script>

<style lang="scss">
  table {
    width: 50%;
    margin: 0 auto;
    text-align: center;
  }
</style>
