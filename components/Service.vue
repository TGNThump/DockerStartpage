<template>
  <div v-if="!hidden" class="col-12 col-md-6 service">
    <a
      :href="'https://' + url"
      class="card text-reset text-decoration-none"
      :style="{
        'border-left':
          '5px solid ' + (value.State == 'running' ? '#28a745' : '#dc3545')
      }"
    >
      <div class="card-body">
        <div>
          <h1>{{ name }}</h1>
          <h2>{{ url }}</h2>
        </div>
      </div>
    </a>
  </div>
</template>

<style lang="scss">
.service {
  h1,
  h2 {
    margin: 0px;
    padding: 0px;
  }

  h1 {
    font-size: 1rem;
  }

  h2 {
    padding-top: 0.2em;
    font-size: 0.8rem;
    text-transform: lowercase;
  }
}
</style>

<script>
import upperFirst from 'lodash/upperFirst'
const unflatten = require('flat').unflatten

export default {
  name: 'Container',
  props: {
    value: {
      type: Object,
      default() {
        return {}
      }
    }
  },
  computed: {
    labels: function() {
      return unflatten(this.value.Labels)
    },
    segment: function() {
      if (!('traefik' in this.labels)) return
      return this.labels.traefik
    },
    name: function() {
      let name = this.value.Names[0]
      if (name.includes('_')) name = name.split('_')[1]
      if (name.startsWith('/')) name = name.substring(1)
      name = upperFirst(name)
      name = name.replace(/([A-Z])/g, ' $1').trim()
      return name
    },
    rule: function() {

      if (this.segment == undefined) return

      let segment = this.segment;
      if (this.segment.frontend === undefined){
        let keys = Object.keys(this.segment);
        if (keys.length == 0) return;
        segment = this.segment[keys[0]]
      }

      if (segment.frontend === undefined) return
      const rules = segment.frontend.rule.split(';')
      const result = {}

      for (const i in rules) {
        const split = rules[i].split(':')
        result[split[0].toLowerCase()] = split[1]
      }

      return result
    },
    url: function() {
      if (this.rule === undefined) {
        return ''
      }
      return this.rule.host
    },
    hidden: function() {
      if (!('startpage' in this.labels)) return false
      if (!('hidden' in this.labels.startpage)) return false
      return this.labels.startpage.hidden
    }
  }
}
</script>
