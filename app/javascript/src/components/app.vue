<template>
  <div id="app" v-cloak>
    <Layout />
  </div>
</template>

<script>
  import Layout from '@/../src/components/Layout.vue';

  export default {
    name: 'app',
    data(){
      return {}
    },
    methods: {},
    computed: {},
    mounted(){
    },
    components: {
      Layout,
    },
  };
</script>

<style scope>
  [v-cloak] { display: none; }
  #app {
    font-family: 'Avenir', Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
  }
</style>
