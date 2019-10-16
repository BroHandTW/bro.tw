<template>
  <a-layout id="components-layout-demo-fixed">
    <Header />
    <a-layout-content :style="{ padding: '0 15px', marginTop: '64px' }">
      <Breadcrumb />
      <router-view />
    </a-layout-content>
    <a-layout-footer :style="{ textAlign: 'center' }">
      Ant Design ©2018 Created by Ant UED
    </a-layout-footer>
  </a-layout>
</template>

<script>
  import Header from '@/../src/components/Header.vue';
  import Breadcrumb from '@/../src/components/Breadcrumb.vue';

  export default {
    data(){
      return {
      }
    },
    computed: {
    },
    methods: {
    },
    mounted(){
    },
    watch: {
    },
    components: {
      Header,
      Breadcrumb
    },
  };
</script>
<style>
  #components-layout-demo-fixed .logo {
    height: 54px;
    margin: 5px 24px 5px 0;
    float: left;
  }
</style>

