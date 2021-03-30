<template>
  <div id="app">
    <keep-alive>
      <router-view v-if="$route.meta.keepAlive"/>
    </keep-alive>
    <router-view v-if="!$route.meta.keepAlive"></router-view>
    <!-- 底部Tabbar -->
    <tabbar v-model="selected" color="#000">
      <tab-item id="index" url="/home">
        <img src="../public/images/icons/tabbar/index.png" slot="icon">
        <img src="../public/images/icons/tabbar/index-sel.png" slot="selectedIcon">
        主页
      </tab-item>
      <tab-item id="detail" url="/cart">
        <img src="../public/images/icons/tabbar/cart.png" slot="icon">
        <img src="../public/images/icons/tabbar/cart-sel.png" slot="selectedIcon">
        购物车
      </tab-item>
    </tabbar>
  </div>
</template>

<script>
import TabBar from './components/TabBar/TabBar.vue'; //引入tabbar组件
import TabBarItem from './components/TabBar/Item.vue'; //引入tabbarItem
export default {
  data(){
    return {
      selected: 'index',
    }
  },
  watch:{
  },
  components: {
    "tabbar":TabBar,
    "tab-item":TabBarItem
  },
}
</script>

<style>
@import url('./assets/css/base.css');
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  height:100%;
  text-align: center;
  color: #2c3e50;
  background-color:#f7f7f7;
}
</style>
