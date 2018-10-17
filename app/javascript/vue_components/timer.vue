<template >
  <div class="timer">
    <p>{{minutes | two_digits}}</p>
    <p>:</p>
    <p>{{seconds | two_digits}}</p>
  </div>
</template>

<script>
import two_digits_filter from './mixins/two_digits_filter'

export default {
  mixins: [two_digits_filter],

  props: {
    next: Object
  },

  data() {
    return {
      now: Math.trunc((new Date()).getTime() / 1000)
    }
  },

  mounted() {
    window.setInterval(() => {
      this.now = Math.trunc((new Date()).getTime() / 1000);
    },1000);
  },

  computed: {
    date: function () {
      return Math.trunc(Date.parse(this.next.real) / 1000)
    },
    seconds: function () {
      return (this.date - this.now) % 60;
    },
    minutes: function () {
      return Math.trunc((this.date - this.now) / 60) % 60;
    }
  },
}
</script>

<style lang="scss">
  .timer {
    display: flex;
    padding: 100px 0;
    width: 80%;
    max-width: 550px;
    margin: 0 auto;
    justify-content: space-between;
    p {
      margin: 0;
      font-size: 220px;
      color: #a17c0b;
      font-weight: bold;
    }
  }
</style>
