<template>
  <a-breadcrumb :style="{ margin: '16px 0' }">
    <a-breadcrumb-item v-for="bread in breadcrumbList">
      <router-link
        :to="{ name: bread.link, params: { id: $route.params.id } }">
        {{ bread.name }}
      </router-link>
    </a-breadcrumb-item>
  </a-breadcrumb>
</template>
<script>
  export default {
    props: {

    },
    data(){
      return {
        breadcrumbList: []
      }
    },
    computed: {
    },
    methods: {
      updateList(){
        this.breadcrumbList = this.$route.meta.breadcrumb
      }
    },
    mounted(){
    },
    watch: {
      $route(){
        this.updateList()
      }
    },
    components: {
    },
  };
</script>
<style>
</style>

