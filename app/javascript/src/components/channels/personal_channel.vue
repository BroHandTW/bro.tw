<!-- <template>
  <div class="action-cable-channel">
    <textarea v-model="message"></textarea>
    <button @click="sendMessage('message')">send</button>
    <textarea v-model="graphql"></textarea>
    <button @click="sendMessage('graphql')">send</button>
    <hr>
  </div>
</template> -->
<template></template>

<script>
export default {
  data(){
    return {
      message: 'Hi~ I am PersonalChannel !!',
      graphql: `{
        admin(id: 1){}
      }`,
    }
  },
  channels: {
    PersonalChannel: {
      connected(){
        console.info('connected');
      },
      rejected(){
        console.info('rejected');
      },
      received(data){
        console.log('received', data);
      },
      disconnected(){
        console.info('disconnected');
        this.$cable.unsubscribe('PersonalChannel');
      }
    }
  },
  methods: {
    sendMessage(actionName) {
      this.$cable.perform({
        channel: 'PersonalChannel',
        action: actionName,
        data: { content: this[actionName] }
      });
    },
  },
  mounted() {
    this.$cable.subscribe({ channel: 'PersonalChannel' });
  }
}
</script>
