<template>
  <nuxt class="app" />
</template>

<style lang="scss">
@import '~bootstrap/scss/bootstrap';

$fa-font-path: '~@fortawesome/fontawesome-free/webfonts';
@import '~@fortawesome/fontawesome-free/scss/fontawesome';
@import '~@fortawesome/fontawesome-free/scss/solid';
@import '~@fortawesome/fontawesome-free/scss/regular';
@import url('https://fonts.googleapis.com/css?family=Roboto&display=swap');

body {
  padding-top: 25px;
  background: #30323d;
  font-family: Roboto;
  color: #dff8eb;
}

.card {
  border-radius: 5px;
  box-shadow: 8px 14px 38px rgba(39, 44, 49, 0.06),
    1px 3px 8px rgba(39, 44, 49, 0.03);
  border: 0px;
  margin: 10px 0;
  padding: 0px;

  background-color: darken(#30323d, 3%);

  .card-body {
    padding: 15px;
  }
}
</style>
