<template>
  <container>
    <section id="header">
      <h2>{{ date }}</h2>
      <h1>{{ greeting }}</h1>
    </section>
    <section class="row">
      <service
        v-for="(value, key) in containers"
        :key="key"
        v-model="containers[key]"
      ></service>
    </section>
  </container>
</template>

<script>
export default {
  data() {
    return {
      containers: {}
    }
  },
  computed: {
    date: function() {
      const days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday']
      const months = [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December'
      ]

      const now = new Date()

      return (
        days[now.getDay() - 1] +
        ', ' +
        now.getDate() +
        ' ' +
        months[now.getMonth()] +
        ' ' +
        now.getFullYear()
      )
    },
    greeting: function() {
      const now = new Date()

      if (now.getHours() < 5) return 'Good Night!'
      if (now.getHours() < 12) return 'Good Morning!'
      if (now.getHours() < 20) return 'Good Afternoon!'
      return 'Good Night!'
    }
  },
  async asyncData({ $axios }) {
    const containers = await $axios.$get('docker/containers/json?all=1')
    return { containers }
  }
}
</script>

<style lang="scss">
section {
  margin-top: 25px;

  h1 {
    font-size: 3rem;
  }

  h2 {
    font-size: 1rem;
    text-transform: uppercase;
    font-weight: normal;
    color: darken(#dff8eb, 50%);
  }
}
</style>
