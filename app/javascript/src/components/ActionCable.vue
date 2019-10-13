<template>
  <div id="actionCable">
    <RoomChannel ref="roomChannel" />
    <PersonalChannel ref="personalChannel"/>
  </div>
</template>

<script>
import RoomChannel from '@/../src/components/channels/room_channel.vue'
import PersonalChannel from '@/../src/components/channels/personal_channel.vue'
export default {
  data(){
    return {
    }
  },
  methods: {
  },
  computed: {
    roomChannel(){
      return this.$refs.roomChannel
    },
    personalChannel(){
      return this.$refs.personalChannel
    },
  },
  mounted(){
  },
  components: {
    RoomChannel,
    PersonalChannel
  }
}
</script>
