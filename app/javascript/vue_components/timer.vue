<template >
  <div class="timer">
    <p>{{remaining}} min</p>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      remaining: 8
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
  }
</style>
