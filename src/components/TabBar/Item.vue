<template>
  <div class="tab-item" @click="changePage" :class="is_Selected?'is-selected':''" :style="colorStyle">
    <div v-if="is_Selected">
      <slot name="selectedIcon"></slot>
    </div>
    <div v-else>
      <slot name="icon"></slot>
    </div>
    <slot></slot>
  </div>
</template>

<script>
export default {
  name: 'tab-item',
  props: {
    id: { //当前定义的id 用于判断是否选中
      type: String
    },
    url: { //需要跳转的页面
      type: String
    }
  },
  data(){
    return {
      colorStyle:{ //字体颜色
        color:''
      }
    }
  },
  computed: { //计算属性
    is_Selected(){ //是否选中
      //组件上的 v-model 会把 value 用作 prop 且把 input 用作 event
      //如果当前组件的父组件的 v-model == 当前组件的id属性
      if(this.$parent.value == this.id){
        //将字体颜色设置为选中的字体颜色
        this.colorStyle.color = this.$parent.selectedColor;
        
        return true; //就返回true
      }
      //将字体颜色设置为未选中的字体颜色
      this.colorStyle.color = this.$parent.color;
      return false //否则返回false
    }
  },
  methods: {
    changePage(){ //修改父组件的value 用于计算属性中计算是否选中
      this.$parent.$emit("input",this.id);
      if(this.url && this.$route.path !== this.url) { //如果有url属性并且当前页面不是url属性的同一地址则跳转
        this.$router.push(this.url);
      }
    }
  },
  mounted(){
    //将当前页面的相对地址 与 传入的url属性值一致
    if(this.$route.path === this.url){
      this.$parent.value = this.id;
    }
  }
}
</script>

<style scoped>
.tab-item{
  height:100%;
  flex-grow:1;
  display:flex;
  flex-direction:column;
  justify-content:center;
  align-self:center;
}
.is-selected{
  background-color:rgb(227 223 223);
}
.tab-item img{
  width:23px;
  height:23px;
}
</style>