<template>
  <main class="container px-2 home">
    <!-- 搜索输入框与,分类 -->
    <div class="row d-flex flex-md-column-reverse mx-0 px-1 mb-2 navBar">
      <div class="col-2 col-md-12 px-0 d-md-none">
        <img src="../../public/images/class.png" class="img-fluid w-75"/>
      </div>
      <!-- 搜索输入框 -->
      <div class="col-10 col-md-12 d-flex px-0">
        <input type="text" v-model="inputValue" class="form-control rounded-0 mr-1">
        <button class="btn rounded-0 btn-info w-50">搜索</button>
      </div>
    </div>
    <!-- 内容区域 -->
    <div class="products">
      <div class="scroll row mx-0">
        <!-- 单个商品 -->
        <router-link :to="`/detail/${item.sid}`" v-for="(item,i) of products" :key="i" class="col-12 col-md-6 px-0">
          <div class="one-product bg-light border m-1 text-left rounded">
            <!-- 商品预览图 -->
            <img :src="item.img" class="img-fluid" style="width:100%">
            <p class="pname px-1">{{item.pname}}</p>
            <p class="price px-1"><span>￥</span>&nbsp;{{item.price.toFixed(2)}}</p>
          </div>
        </router-link>
        <!-- 加载更多按钮 -->
        <mt-button type="primary" size="large" class="m-1">加载更多</mt-button>
      </div>
    </div>
    <!-- 底部Tabbar -->
    
  </main>
</template>

<script>
export default {
  data(){
    return {
      inputValue:'666',
      pno:1, //当前页码数
      pageSize:6, //每次显示几条数据
      products:[],//商品数据
    }
  },
  watch:{
    inputValue(){
      console.log(this.inputValue);
    }
  },
  methods:{
    //加载商品函数
    load(){
      (async ()=>{
        var result = await this.axios.get("/product/recommend",{
          params:{
            pno: this.pno,
            pageSize: this.pageSize
          }
        });
        if(result.data.code == 200) {
          this.products = result.data.data;
        }
        console.log(this.products);
      })();
    }
  },
  created(){
    this.load();
  }
}
</script>

<style scoped>
a{
  text-decoration: none;
}
.home{
  height:calc(100% - 50px);
}
.product .one-product{
  background:#fff !important;
}
/* 顶部搜索 */
.navBar{
  height:40px;
}

.products{
  height:calc(100% - 50px);
  /* padding-bottom:50px; */
  overflow:hidden;
}
.products .scroll{
  height:100%;
  overflow-y:scroll;
  /* padding-bottom:50px; */
}
/* 单个商品名称 */
.products .one-product .pname{
  word-break:keep-all;
  white-space:nowrap;
  overflow:hidden;
  text-overflow:ellipsis;
  color:black;
  font-size:17px;
}
/* 单个商品价格 */
.products .one-product .price{
  color:red;
  font-size:17px;
  margin:0;
}
</style>