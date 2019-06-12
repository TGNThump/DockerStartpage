<template>
  <main :class="{ container: !fluid, 'container-fluid': fluid }">
    <slot></slot>
  </main>
</template>

<script>
export default {
  name: 'Container',
  props: { fluid: Boolean }
}
</script>
