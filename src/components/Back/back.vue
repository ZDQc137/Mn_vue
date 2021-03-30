<template>
  <div class="back">
    <div class="back-icon" @click="$router.go(-1)">
      <slot name="icon"></slot>
    </div>
    <slot></slot>
  </div>
</template>

<script>
export default {
  name: 'back'
}
</script>

<style scoped>
.back{
  height: 35px;
  line-height: 35px;
  text-align: center;
  font-size: 18px;
  overflow: hidden;
  position: relative;
}
.back .back-icon{
  width: 25px;
  height: 25px;
  background-color: rgba(0, 0, 0, 0.514);
  border-radius: 50%;
  position: absolute;
  top: calc(50% - 12px);
  overflow: hidden;
}
.back .back-icon:hover{
  background-color: rgba(0, 0, 0, 0.61);
}
.back .back-icon img{
  width: 20px;
  position: absolute;
  top: calc(50% - 10px);
  left: 2px;
}

</style>