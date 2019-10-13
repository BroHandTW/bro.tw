<template>
  <a-layout-header :style="{ position: 'fixed', zIndex: 1, width: '100%' }">
    <img v-show="!hoverLogo"
         :src="require('img/logo-header.png')"
         @mouseover="hoverLogo = true"
         @mouseleave="hoverLogo = false"
         @click="$router.push({name: 'home'})"
         class="logo" alt="" />
    <img v-show="hoverLogo"
         :src="require('img/logo-header-gray.png')"
         @mouseover="hoverLogo = true"
         @mouseleave="hoverLogo = false"
         @click="$router.push({name: 'home'})"
         class="logo" alt=""/>
    <a-menu
      theme="dark"
      mode="horizontal"
      v-model="currentMenuKey"
      :style="{ lineHeight: '64px' }"
    >
      <a-menu-item v-for="menuItem in menuItems" :key="menuItem.key">
        <router-link :to="menuItem.path" exact>{{ menuItem.title }}</router-link>
      </a-menu-item>

      <a-sub-menu>
        <span slot="title" class="submenu-title-wrapper">
          <a-icon type="setting" />Navigation Three - Submenu
        </span>
        <a-menu-item v-for="menuItem in menuItems" :key="menuItem.key">
          <router-link :to="menuItem.path" exact>{{ menuItem.title }}</router-link>
        </a-menu-item>
      </a-sub-menu>
    </a-menu>
  </a-layout-header>
</template>

<script>
  export default {
    data(){
      return {
        hoverLogo: false,
        currentMenuKey: [],
        menuItems: [
          { key: 'about', title: 'About', path: '/about' },
          { key: 'share', title: 'Share', path: '/share' },
          { key: 'users', title: 'Users', path: '/users' },
        ],
      }
    },
    computed: {
    },
    methods: {
      getcurrentMenuKey(){
        let key, path;
        for( { key, path } of this.menuItems){
          if(this.matchRoute(path)) return [key]
        }
        return null
      },
      matchRoute(partial){
        // return this.$route.path == partial
        return this.$route.path.indexOf(partial) > -1
      },
    },
    mounted(){
    },
    watch: {
      $route(to, from){
        this.currentMenuKey = this.getcurrentMenuKey()
      }
    },
    components: {
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

