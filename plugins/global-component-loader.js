import Vue from 'vue'
import _ from 'lodash'

const components = require.context('@/components', false, /[A-Z]\w+\.(vue)$/)
_.forEach(components.keys(), fileName => {
  const componentConfig = components(fileName)
  const componentName = fileName
    .split('/')
    .pop()
    .split('.')[0]
  Vue.component(componentName, componentConfig.default || componentConfig)
})
