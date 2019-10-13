// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

console.log('Hello World from Webpacker')

import Vue from 'vue'
import ActionCableVue from 'actioncable-vue';
import App from '@/../src/components/app.vue'
import router from '@/../src/router';

// 用整包 6.4MB
import Antd from 'ant-design-vue'
import 'ant-design-vue/dist/antd.css'
Vue.use(Antd)

Vue.use(ActionCableVue, {
  debug: true,
  debugLevel: 'all',
  connectionUrl: 'ws://www.lvh.me:3000/cable'
});

document.addEventListener('DOMContentLoaded', () => {
  window.app = new Vue({
    router,
    render: h => h(App)
  }).$mount()
  document.body.appendChild(app.$el)
})

// import { axios, apiBaseHelloGet, apiBaseHelloPost, apiBaseHelloPut, apiBaseHelloPatch, apiBaseHelloDelete, } from '@/../src/api.js'
// axios.all([apiBaseHelloGet(), apiBaseHelloPost({a: 1, b: 2}), apiBaseHelloPut(), apiBaseHelloPatch(), apiBaseHelloDelete()])
//      .then(
//         axios.spread((getResponse, postResponse, putResponse, patchResponse, deleteResponse) => {
//           console.log(getResponse, postResponse, putResponse, patchResponse, deleteResponse);
//         })
//       )
