<template>
  <div class="container px-2 TabBar">
    <slot></slot>
  </div>
</template>

<script>
export default {
  name:'tabbar',
  // 传入的值
  props: {
    value: String,
    color: { //字体颜色 默认黑色
      type: String,
      default: '#000'
    },
    selectedColor: { //选中字体颜色 默认蓝色
      type: String,
      default: '#007bff'
    }
  }
}
</script>

<style scoped>
.TabBar{
  height:50px;
  border-top:1px solid #f2f2f2;
  display:flex;
  justify-content:center;
  align-items:stretch;
}
</style>