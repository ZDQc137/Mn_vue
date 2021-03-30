import Vue from 'vue'
import VueRouter from 'vue-router'

import Home from '../views/Home.vue';
import Detail from '../views/Detail.vue';
import Cart from '../views/Cart.vue';
Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home,
    meta:{ //缓存
      keepAlive:true
    }
  },
  {
    path: '/home',
    name: 'Home',
    component: Home,
    meta:{ //缓存
      keepAlive:true
    }
  },
  {
    path: '/detail/:sid', //设置可传递参数 sid
    name: 'Detail',
    component: Detail,
    props:true //设置可以传递参数
  },
  {
    path: '/cart',
    name: 'Cart',
    component: Cart
  }
]

const router = new VueRouter({
  routes
})

export default router
