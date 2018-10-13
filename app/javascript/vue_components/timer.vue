<template >
  <div class="timer">
    <p>{{minutes | two_digits}}</p>
    <p>:</p>
    <p>{{seconds | two_digits}}</p>
  </div>
</template>

<script>
export default {
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
    date() {
      return Math.trunc(Date.parse(this.next.real) / 1000)
    },
    seconds() {
      return (this.date - this.now) % 60;
    },
    minutes() {
      return Math.trunc((this.date - this.now) / 60) % 60;
    }
  },

  filters: {
    two_digits: value => {
      if(value.toString().length <= 1)
      {
        return "0"+value.toString();
      }
      return value.toString();
    }
  }
}
</script>

<style lang="scss">
  .timer {
    width: 50%;
    margin: 0 auto;
    text-align: center;
    font-size: 44px;
    display: flex;
    justify-content: space-between;
  }
</style>
