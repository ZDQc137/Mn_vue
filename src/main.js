import Vue from 'vue';
import App from './App.vue';
import router from './router';
import store from './store';

//引入 axios
import axios from 'axios';
//配置服务器端基础地址
axios.defaults.baseURL = "http://127.0.0.1:6060"; //因为移动端访问没有 http://127.0.0.1:6060所以直接使用此计算机的IP地址作为基础路径 服务器端口号 6060
//将axios对象放入vue的原型对象中
Vue.prototype.axios = axios;

//完整引入mint-ui
import MintUI from 'mint-ui';
//引入mint-ui样式文件
import "mint-ui/lib/style.css";
//注册mint-ui
Vue.use(MintUI);


Vue.config.productionTip = false;

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app');
