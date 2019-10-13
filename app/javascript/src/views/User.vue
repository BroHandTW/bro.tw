<template>
  <div id="user">
    User#{{user_id}}

    <router-link :to="{ name: 'users#profile', params: { id: user_id } }">PROFILE</router-link>
    <router-link :to="{ name: 'users#orders', params: { id: user_id } }">ORDERS</router-link>
    <router-link :to="{ name: 'users#index' }">BACK</router-link>

    <hr>

    <router-view />
  </div>
</template>
<script>
  export default {
    data(){
      return {
        user_id: this.$route.params.id
      }
    },
    watch: {
      $route(){
        this.user_id = this.$route.params.id
      }
    },
  };
</script>
