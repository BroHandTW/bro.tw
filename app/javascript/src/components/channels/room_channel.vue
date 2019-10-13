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
      message: 'Hi~ I am RoomChannel !!',
      graphql: `{
        admin(id: 1){}
      }`,
    }
  },
  channels: {
    RoomChannel: {
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
        this.$cable.unsubscribe('RoomChannel');
      }
    }
  },
  methods: {
    sendMessage(actionName) {
      this.$cable.perform({
        channel: 'RoomChannel',
        action: actionName,
        data: { content: this[actionName] }
      });
    },
  },
  mounted() {
    this.$cable.subscribe({ channel: 'RoomChannel', room: 'public' });
  }
}
</script>
