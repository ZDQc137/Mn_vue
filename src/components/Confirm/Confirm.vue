<template>
  <div class="confirm" @click="method" :style="is_selected ? background : ''">

  </div>
</template>

<script>
export default {
  props: {
    selectedColor: { //选中颜色
      type: String,
      default: 'rgb(115 191 255)'
    },
    is_selected: { //是否选中
      type: Boolean,
      default: false
    },
    method: {
      type: Function
    }
  },
  data(){
    return {
      background: `background-color:${this.selectedColor};`
    }
  }
}
</script>

<style scoped>
.confirm{
  width: 20px;
  height: 20px;
  border: 2px solid #ccc;
  border-radius: 50%;
  margin: 5px;
  overflow: hidden;
  position: relative;
}
</style>