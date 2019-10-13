<template>
  <div id="app" v-cloak>
    <Layout />
    <!-- <ActionCable ref="actionCable" /> -->
  </div>
</template>

<script>
  // import ActionCable from '@/../src/components/ActionCable.vue';
  import Layout from '@/../src/components/Layout.vue';
  import SocketChannel from '@/../src/socket/channel';
  import SocketHandler from '@/../src/socket/handler';

  export default {
    name: 'app',
    data(){
      return {}
    },
    methods: {},
    computed: {
      actionCable(){
        return this.$refs.actionCable
      }
    },
    mounted(){
    },
    components: {
      // ActionCable,
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
