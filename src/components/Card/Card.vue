<template>
  <!-- 商品卡片 -->
  <div class="card-item">
    <!-- 小圆点点击 -->
    <slot name="confirm"></slot>
    <!-- 商品图片 -->
    <div class="card-img">
      <slot name="pimg"></slot>
    </div>
    <!-- 商品内容 -->
    <div class="card-content">
      <div class="card-content-top">
        <div class="pname">{{titel}}</div>
        <div class="describe">ssssssss</div>
      </div>
      <div class="card-content-bottom">
        <div class="price">
          <span>￥</span><span class="price">3</span>.<span>00</span>
        </div>
        <!-- 数量 -->
        <div class="count">
          <slot name="reduce"></slot><input type="text" v-model="COUNT"><slot name="add"></slot>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'card',
  props: {
    titel: {
      type: String,
      default: '商品名称'
    },
    subtitle: {
      type: String
    },
    price: {
      type: Number,
      default: 3
    },
    count: {
      type: Number,
      default: 2
    },
    methods: {
      type: Object
    }
  },
  data(){
    return {
      COUNT: this.count, //商品数量
      add: this.methods.add,
      reduce: this.methods.reduce
    }
  },
  computed: {
    PRICE(){ //商品价格
      return this.price * this.COUNT;
    }
  },
  watch: {
    COUNT(){
      if(this.COUNT < 1) {
        this.COUNT = 1;
      }
      if(this.COUNT > 100) {
        this.COUNT = 100;
      }
    }
  }
}
</script>

<style scoped>
/* 商品卡片 */
.card-item{
  display: flex;
  justify-content: start;
  padding: 10px 20px;
  padding-left: 10px;
  background-color: #fff;
  border-radius: 20px;
  align-items: center;
}
.card-item:not(:first-child){
  margin-top: 15px;
}
/* 选中小圆点 */
.card-item .card-checkbox{
  width: 20px;
  height: 20px;
  border: 2px solid #cccccc;
  border-radius: 100%;
  /* align-self: center; */
  margin-right: 5px;
}

/* 商品卡片 图片 */
.card-item .card-img{
  width: 88px;
  height: 88px;
  border: 1px solid #f2f2f2;
  border-radius: 10px;
  margin-right: 10px;
}
.card-item .card-img img{
  width: 100%;
  height: 100%;
}
/* 商品卡片内容 */
.card-item .card-content{
  width:calc(100% - 128px);
  flex-grow: 1;
  text-align: left;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}
.card-item .card-content .card-content-top,.card-item .card-content .card-content-bottom{
  overflow:hidden;
}
/* 卡片内容上半部分商品名称和商品描述共同样式 */
.card-item .card-content .card-content-top .pname,.card-item .card-content .card-content-top .describe{
  word-break: keep-all;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis; 
}
/* 商品名称 */
.card-item .card-content .card-content-top .pname{
  color: #323233;
  font-size:14px;
}
.card-content .card-content-top .describe{
  color: #646566;
}
/* 卡片下半部分 */
.card-item .card-content .card-content-bottom{
  display: flex;
  justify-content: space-between;
}
/* 商品价格 */
.card-item .card-content .card-content-bottom .price{
  color: rgb(255, 0, 0);
}
.card-item .card-content .card-content-bottom .price .price{
  font-size: 18px;
}
/* 商品数量 */
/* .card-item .card-content .card-content-bottom .count{
  height: 21px;
  border: 1px solid #f2f2f2;
  overflow: hidden;
} */
.card-item .card-content .card-content-bottom .count button,.card-item .card-content .card-content-bottom .count input{
  padding: 0;
  text-align: center;
  border: 0;
  /* outline: 0; */
}
.card-item .card-content .card-content-bottom .count button{
  width: 20px;
  height: 20px;
  padding: 0px 6px;
}
.card-item .card-content .card-content-bottom .count input{
  width: 35px;
  height: 20px;
}

</style>