<template>
  <div id="home">
    <div class="input-url-block">
    <a-tooltip trigger="focus" placement="bottomRight" title="按 Enter 即送出，Esc 即清除">
      <a-input placeholder="網址太長縮一下"
               v-model="inputUrl"
               @keyup.enter="inputSutmit"
               @keyup.esc="inputClear"
               size="large"
               ref="inputUrlInput"
               >
        <a-icon slot="prefix" type="link" />
        <a-icon v-if="inputUrl" slot="suffix" type="close-circle" @click="inputClear" />
      </a-input>
    </a-tooltip>
    </div>
    <div v-if="encodedUrl" class="shortened-url" style="margin: 12px 0;">
      <a :href="encodedUrl">{{ encodedUrl }}</a>
      <a-icon type="copy" @click="inputCopy" />
    </div>

  </div>
</template>
<script>
import { axios, apiGetEncode } from '@/../src/api.js'
  export default {
    data(){
      return {
        inputUrl: '',
        encodedUrl: ''
      }
    },
    computed: {
    },
    methods: {
      inputClear(){
        this.$refs.inputUrlInput.focus()
        this.inputUrl = ''
        this.encodedUrl = ''
      },
      inputSutmit(){
        apiGetEncode({ url: this.inputUrl })
          .then((response)=> this.encodedUrl = response.data )
      },
      inputCopy(){
        self = this
        this.$copyText(this.encodedUrl).then(function (e) {
          self.$message.success('已複製到剪貼簿')
        }, function (e) {
          self.$message.error('複製失敗')
        })
      },
    }
  };
</script>
<style lang="scss">
.input-url-block {
  .ant-input-affix-wrapper .ant-input:not(:first-child) {
    padding-left: 40px;
  }
  .anticon-link {
    font-size: 16px;
  }
  .anticon-close-circle {
    font-size: 16px;
    cursor: pointer;
    color: #ccc;
    transition: color 0.3s;
    &:hover {
      color: #999;
    }
    &:active {
      color: #666;
    }
  }
  .shortened-url{}
}
</style>
