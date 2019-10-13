<template>
  <div id="profile">
    <a-modal
      :title="modelTitle"
      v-model="visible"
      :footer="null"
      @ok="goBack"
      @cancel="goBack"
    >
      <p>Some contents...</p>
      <p>Some contents...</p>
      <p>Some contents...</p>
    </a-modal>
  </div>
</template>

<script>
  export default {
    data(){
      return {
        visible: true,
        user_id: this.$route.params.id
      }
    },
    computed: {
      modelTitle(){
        return `User#${this.user_id} Profile`
      }
    },
    methods: {
      goBack(){
        this.$router.push({
          name: 'users#show',
          params: { id: this.user_id }
        })
      },
      handleOk(e){
        console.log(e);
        this.goBack()
      },
    }
  };
</script>
