<template>
  <div id="users" :style="{ background: '#fff', padding: '12px', minHeight: '400px' }">
    EasyMode <a-switch checkedChildren="开" unCheckedChildren="关" :checked="easyMode" @change="toggleEasyMode" />
    <a-table
      :size="tableSize"
      :columns="columns"
      :rowKey="(record) => { return record.id }"
      :dataSource="users">
      <template slot="nameHelper" slot-scope="name, record">
        <router-link :to="userPath(record.id)">
          {{ record.name }}
        </router-link>
      </template>
      <template slot="actionHelper" slot-scope="record">
        <router-link :to="userProfilePath(record.id)">
          <a-button v-if="easyMode" shape="circle" icon="profile" />
          <a-button v-else icon="profile">Profile</a-button>
        </router-link>
        <router-link :to="userOrdersPath(record.id)">
          <a-button v-if="easyMode" shape="circle" icon="table" />
          <a-button v-else icon="table">Orders</a-button>
        </router-link>
      </template>
    </a-table>
    <router-view />
  </div>
</template>
<script>
  const columns = [{
    title: '#',
    dataIndex: 'id',
  }, {
    title: 'Name',
    dataIndex: 'name',
    scopedSlots: { customRender: 'nameHelper' },
  }, {
    title: 'Age#',
    dataIndex: 'age',
  }, {
    title: 'Gender',
    dataIndex: 'gender',
  }, {
    title: 'Action',
    scopedSlots: { customRender: 'actionHelper' },
  }];
  export default {
    data(){
      return {
        easyMode: false,
        users: [
          { id: 1, age: '11', gender: 'male', name: 'Cat' },
          { id: 3, age: '33', gender: 'male', name: 'Apple' },
          { id: 2, age: '22', gender: 'female', name: 'Book' },
          { id: 4, age: '44', gender: 'female', name: 'Dog' },
        ],
        columns
      }
    },
    computed: {
      tableSize(){
        return this.easyMode ? 'small' : 'default'
      }
    },
    methods: {
      userPath(userId){
        return { name: 'users#show', params: { id: userId } }
      },
      userProfilePath(userId){
        return { name: 'users#profile', params: { id: userId } }
      },
      userOrdersPath(userId){
        return { name: 'users#orders', params: { id: userId } }
      },
      toggleEasyMode(){
        this.easyMode = !this.easyMode;
      }
    },
    mounted(){
    },
    watch: {
    },
    components: {
    },
  };
</script>
