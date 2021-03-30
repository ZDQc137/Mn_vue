<template>
  <div class="cart container px-2">
    <!-- 返回框 -->
    <back>
      <img slot="icon" src="../../public/images/icons/page/back.png"/>
      购物车
    </back>
    <!-- 编辑商品 和 完成 -->
    <div></div>
    <!-- 内容区域 -->
    <div class="cards">
      <!-- 单个商品卡片 -->
      <div class="card-item" v-for="(item,i) of items" :key="i">
        <!-- 小圆点点击 -->
        <div :data-i="i" @click="cardSel" class="confirm" :class="item.is_selected?'sel':''"></div>
        <!-- 商品图片 -->
        <div class="card-img">
          <img :src="item.img">
        </div>
        <!-- 商品内容 -->
        <div class="card-content">
          <div class="card-content-top">
            <div class="pname">{{items[0].title}}</div>
            <div class="describe">{{items[0].subtitle}}</div>
          </div>
          <div class="card-content-bottom">
            <div class="price">
              <span>￥</span><span class="price">{{item.price * item.count}}</span>.<span>00</span>
            </div>
            <!-- 数量 -->
            <div class="count" :data-i="i">
              <button @click="reduce">-</button>
              <input type="text" :value="item.count" disabled="disabled" />
              <button @click="add">+</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Back from '../components/Back/back';
import Card from '../components/Card/Card';
export default {
  data(){
    return {
      items:[
        {
          img: "https://gma.alicdn.com/bao/uploaded/i2/117938769/O1CN01XVP1x82EeFlEi0XKQ_!!0-saturn_solar.jpg_200x200.jpg_.webp",
          title: '商品名称1',
          subtitle: '商品描述1',
          price: 500,
          count: 2,
          is_selected: false
        },
        {
          img: 'https://gma.alicdn.com/bao/uploaded/i2/296000156/O1CN01B3qmQT1D1UPpiKH9s_!!0-saturn_solar.jpg_200x200.jpg_.webp',
          title: '商品名称2',
          subtitle: '商品描述2',
          price: 999,
          count: 1,
          is_selected: false
        }
      ]
    }
  },
  methods:{
    cardSel(e){
      var i = e.target.getAttribute("data-i");
      this.items[i].is_selected = !this.items[i].is_selected;
    },
    reduce(e){ //减数量
      //获取父元素的 data-i属性
      var i = e.target.parentNode.getAttribute("data-i");
      if(this.items[i].count > 1) { //如果数量大于 1 就可以--
        this.items[i].count--;
      }
    },
    add(e){ //加数量
      //获取父元素的 data-i属性
      var i = e.target.parentNode.getAttribute("data-i");
      if(this.items[i].count < 5) { //如果数量小于 5 就可以++
        this.items[i].count++;
      }
    }
  },
  components: {
    "back": Back,
    "card": Card
  }
}
</script>

<style scoped>
.cart{
  height: calc(100% - 50px);
}
/* 商品卡片 */
.cards .card-item{
  display: flex;
  justify-content: start;
  padding: 10px 20px;
  padding-left: 10px;
  background-color: #fff;
  border-radius: 20px;
  align-items: center;
}
.cards .card-item:not(:first-child){
  margin-top: 15px;
}
/* 选中小圆点 */
.cards .confirm{
  width: 20px;
  height: 20px;
  border: 2px solid #ccc;
  border-radius: 50%;
  margin: 5px;
  overflow: hidden;
  position: relative;
}
/* 小圆点选中样式 */
.cards .confirm.sel{
  background-color: #007bff;
}

/* 商品卡片 图片 */
.cards .card-item .card-img{
  width: 88px;
  height: 88px;
  border: 1px solid #f2f2f2;
  border-radius: 10px;
  margin-right: 10px;
}
.cards .card-item .card-img img{
  width: 100%;
  height: 100%;
}
/* 商品卡片内容 */
.cards .card-item .card-content{
  width:calc(100% - 128px);
  height: 88px;
  flex-grow: 1;
  text-align: left;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}
.cards .card-item .card-content .card-content-top,.cards .card-item .card-content .card-content-bottom{
  overflow:hidden;
}
/* 卡片内容上半部分商品名称和商品描述共同样式 */
.cards .card-item .card-content .card-content-top .pname,.cards .card-item .card-content .card-content-top .describe{
  word-break: keep-all;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
/* 商品名称 */
.cards .card-item .card-content .card-content-top .pname{
  color: #323233;
  font-size:14px;
}
.cards .card-content .card-content-top .describe{
  color: #646566;
}
/* 卡片下半部分 */
.cards .card-item .card-content .card-content-bottom{
  display: flex;
  justify-content: space-between;
}
/* 商品价格 */
.cards .card-item .card-content .card-content-bottom .price{
  color: rgb(255, 0, 0);
}
.cards .card-item .card-content .card-content-bottom .price .price{
  font-size: 18px;
}
/* 商品数量 */
/* .card-item .card-content .card-content-bottom .count{
  height: 21px;
  border: 1px solid #f2f2f2;
  overflow: hidden;
} */
.cards .card-item .card-content .card-content-bottom .count button,.cards .card-item .card-content .card-content-bottom .count input{
  padding: 0;
  vertical-align: bottom;
  text-align: center;
  border-color: black;
}
.cards .card-item .card-content .card-content-bottom .count button{
  width: 20px;
  height: 20px;
  /* padding: 0px 6px; */
}
/* 数量输入框 只读 */
.cards .card-item .card-content .card-content-bottom .count input{
  width: 30px;
  height: 20px;
  outline: none;
  border-right: 0;
  border-left: 0;
}

</style>