<template >
  <div class="timer">
    <div class='timer-block'>
      <p class='digit'>{{minutes | two_digits}}</p>
      <p class='text'>min</p>
    </div>
    <div class='timer-block'>
      <p class='digit'>{{seconds | two_digits}}</p>
      <p class='text'>sec</p>
    </div>
  </div>
</template>

<script>
import two_digits from './mixins/two_digits_filter'

export default {
  mixins: [two_digits],

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
    padding: 180px 0;
    width: 80%;
    margin: 0 auto;
    justify-content: space-between;
    p {
      margin: 0;
    }
    &-block {
      display: flex;
      align-items: baseline;
    }
  }

  .digit {
    font-size: 180px;
    color: white;
  }

  .text {
    font-size: 34px;
    padding-left: 15px;
  }
</style>
