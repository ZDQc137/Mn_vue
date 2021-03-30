<template>
  <main class="container bg-light px-0 scroll">
    <!-- <div>{{sid}}号商品</div> -->
    <!-- 返回按钮 -->
    <div class="back">
      <!-- 返回按钮 -->
      <div class="back-mod" @click="backPrev">
        <div class="back-icon"></div>
      </div>
    </div>
    <!-- 预览图 -->
    <div class="swipeH swipe">
      <div class="count">
        {{swipeI}}/{{swipeCount}}
      </div>
      <mt-swipe class="px-0" @change="swipeIchange" :auto="0" :show-indicators="false">
        <mt-swipe-item v-for="(item,i) of previmgs" :key="i">
          <img class="img-fluid prev-img" :src="item.i_url"/>
        </mt-swipe-item>
        <!-- <mt-swipe-item>
          <img class="img-fluid prev-img" src="//m.360buyimg.com/mobilecms/s843x843_jfs/t1/132012/9/17154/101878/5fbe11fdE677359d7/004d8ff354b77a30.jpg!q70.dpg.webp"/>
        </mt-swipe-item> -->
      </mt-swipe>
    </div>
    <!-- 商品价格、商品名称、服务承诺 -->
    <div class="item">
      <div class="price">
        <span>￥</span>{{seriesDetail.price}}<span>.00</span>
      </div>
      <!-- 商品名称 -->
      <div class="pname">{{seriesDetail.pname}}</div>
      <!-- 服务承诺 -->
      <div class="promise" @click="PromiseToggle">
        <div>服务承诺</div>
        <div class="gt"></div>
      </div>
      <!-- 服务承诺弹出框 -->
      <mt-popup
        v-model="promiseVisible"
        position="bottom"
        popup-transition="popup-fade"
        class="w-100 h-75"
      >
        <!-- 标题 与 关闭标签 -->
        <div class="promiseTitle">
          <div>服务说明</div>
          <div class="close" @click="PromiseToggle"></div>
        </div>
        <!-- 服务说明 -->
        <ul class="pro-content">
          <!-- 单条服务说明 -->
          <li class="one-pro">
            <!-- 标题 -->
            <div class="title">全场包邮</div>
            <!-- 内容 -->
            <div class="content">所有商品包邮 (偏远地区除外)</div>
          </li>
          <!-- 单条服务说明 -->
          <li class="one-pro">
            <!-- 标题 -->
            <div class="title">7天无理由退货</div>
            <!-- 内容 -->
            <div class="content">满足相应条件时,消费者可申请 "7天无理由退货"</div>
          </li>
          <!-- 单条服务说明 -->
          <li class="one-pro">
            <!-- 标题 -->
            <div class="title">48小时发货</div>
            <!-- 内容 -->
            <div class="content">若超时未发货,消费者将会收到至少3元无门槛代金券</div>
          </li>
          <!-- 单条服务说明 -->
          <li class="one-pro">
            <!-- 标题 -->
            <div class="title">假一赔十</div>
            <!-- 内容 -->
            <div class="content">若收到商品是假冒品牌,可获得十倍现金券赔偿</div>
          </li>
        </ul>
      </mt-popup>
    </div>
    <!-- 商品评价 需要新写一个页面 -->
    <div class="evaluate" @click="toEval">
      <!-- 上半部分 标题 查看全部 -->
      <div class="top" @click="toEvalAll">
        <div class="evaluateCount">商品评价({{evaluateCount}})</div>
        <div class="evaluateAll">
          查看全部 
          <div class="gt"></div> 
        </div>
      </div>
      <!-- 中间部分 评价标题: 正品(16) 物美价廉(9) 质量很好(8) -->
      <div class="center">
        <div class="one-title">正品(16)</div>
        <div class="one-title">物美价廉(9)</div>
        <div class="one-title">质量很好(8)</div>
      </div>
      <!-- 下半部分 评论预览 用户相关 -->
      <div class="bottom">
        <!-- 单条评价 -->
        <div v-for="(item,i) of evalprevs" :key="i" class="one-eva">
          <!-- 用户相关 -->
          <div class="user">
            <!-- 用户头像 -->
            <!-- <img class="avatarUrl" src="//storage.360buyimg.com/i.imageUpload/6a645f3461656463373031623036343331343738353235393836393936_sma.jpg"/> -->
            <img class="avatarUrl" :src="item.avatarUrl"/>
            <!-- 用户昵称
            jn  -->
            <span>{{item.nickName}}</span>
          </div>
          <!-- 评论内容 -->
          <div class="content" :data-evalid="item.eid">
            {{item.content}}
          </div>
        </div>
      </div>
    </div>
    <!-- 商品详情 品牌.... 商品详情图 -->
    <div class="detail">
      <!-- 商品详情上部分 标题 -->
      <div class="top">商品详情</div>
      <!-- 商品详情中部分 内容 : 品牌、系统.... -->
      <div class="center">
        <div class="det">
          <!-- 单条详情内容 -->
          <div class="one-detail">
            <div class="title">品牌</div>
            <div>{{seriesDetail.brand}}</div>
          </div>
          <!-- 单条详情内容 -->
          <div class="one-detail">
            <div class="title">系列</div>
            <div>{{seriesDetail.sname}}</div>
          </div>
          <!-- 单条详情内容 -->
          <div class="one-detail">
            <div class="title">操作系统</div>
            <div>{{seriesDetail.os}}</div>
          </div>
          <!-- 单条详情内容 -->
          <div class="one-detail">
            <div class="title">类型</div>
            <div>{{seriesDetail.ptype}}</div>
          </div>
        </div>
      </div>
      <!-- 商品详情下半部分 商品详情图 -->
      <div class="bottom">
        <img v-for="(item,i) of detaimgs" :key="i" :src="item.i_url"/>
        <!-- <img src="//img13.360buyimg.com/imgzone/jfs/t1/150023/31/15641/322040/5fbdf7e7E1c75bdd7/7e502b45164c250a.jpg!q70.dpg.webp"/> -->
      </div>
    </div>
    <!-- 网页底部 商品导航 -->
    <div class="GoodsAction">
      <!-- 带有图标的小按钮 -->
      <div class="icons">
        <!-- 单个图标字体 -->
        <div class="one-icon" @click="toService">
          <img src="../../public/images/icons/page/service.png">
          <div>客服</div>
        </div>
        <!-- 单个图标字体 -->
        <div class="one-icon" @click="toCart">
          <img src="../../public/images/icons/page/cart.png">
          <div>购物车</div>
        </div>
      </div>
      <!-- 加入购物车、立即购买 -->
      <div class="Action" @click="goodsPopup">
        <button class="btn addcart btn-danger">加入购物车</button>
        <button class="btn pay btn-warning">立即购买</button>
      </div>
      <!-- 商品导航弹出框 -->
      <mt-popup
        v-model="goodsActionVisible"
        position="bottom"
        popup-transition="popup-fade"
        class="w-100 h-75 goodsPopup"
        style="z-index:10000;"
      >
        <!-- 关闭叉子 -->
        <div class="close" @click="hiddenGoods"></div>
        <!-- 上部分 -->
        <div class="top">
          <div class="previmg">
            <img :src="specImg"/>
          </div>
          <div class="text">
            <div class="price">￥{{selectSpec.price}}</div>
            <div class="select" v-if="selectSpec.spec==''">请选择: 颜色分类</div>
            <div class="select" v-else>已选择:&nbsp;{{selectSpec.spec}}&nbsp;{{selectSpec.memory}}&nbsp;{{selectSpec.hard}}</div>
          </div>
        </div>
        <!-- 中间部分 颜色分类、内存容量、数量 -->
        <div class="center h-100">
          <div class="overflow-y">
            <!-- 单个栏 -->
            <!-- 颜色分类 -->
            <div class="one-line">
              <span>颜色分类</span>
              <div class="items" @click="selectColor">
                  <!-- 单个内容 -->
                  <!-- <div class="one-item active">20款 13寸256灰 MXK32</div> -->
                  <div v-for="(item,i) of specs" :key="i" :class="item.active?'active':''" :data-i="i" class="one-item">{{item.sname}}</div>
              </div>
            </div>
            <!-- 内存容量 -->
            <div class="one-line">
              <span>内存容量</span>
              <div class="items">
                  <!-- 单个内容 -->
                  <!-- <div class="one-item active">20款 13寸256灰 MXK32</div> -->
                  <div class="one-item active">8GB</div>
              </div>
            </div>
            <!-- 硬盘容量 -->
            <div class="one-line">
              <span>硬盘容量</span>
              <div class="items">
                  <!-- 单个内容 -->
                  <!-- <div class="one-item active">20款 13寸256灰 MXK32</div> -->
                  <div class="one-item active">256GB SSD</div>
              </div>
            </div>
          </div>
        </div>
        <!-- 下部分 确定按钮 -->
        <div class="bottom">
          <mt-button type="danger" size="large">确定</mt-button>
        </div>
      </mt-popup>
    </div>
  </main>
</template>

<script>
export default {
  props:{
    sid:{default:'',type:String}, //商品系列id
  },
  data(){
    return {
      swipeI:1, //轮播图当前显示第几张
      swipeCount:2, //轮播图总共有几张
      promiseVisible:false, //服务承诺弹出框显示状态
      evaluateCount: 52, //商品评价数量
      evalprevs: [], //预览评论内容
      previmgs:[],//预览图
      detaimgs:[],//详情图
      seriesDetail:[],//系列详情
      specs:[],//系列规格列表
      goodsActionVisible:true,//商品底部导航栏弹出框显示状态
      goodsAction:'加入购物车',//弹出框中确定按钮的执行方法 加入购物车、立即购买
      selectSpec:{//选择的规格
        price:'00.00',
        spec:'', //颜色分类
        memory:'8GB',//内存容量
        hard:'256GB SSD',//硬盘容量
        img:''//选中的规格的封面图
      },
      specImg:"",//选择规格的图片
    }
  },
  methods:{
    //返回上一页
    backPrev(){
      this.$router.go(-1); //返回上一页
    },
    //轮播图下标
    swipeIchange(index) {
      this.swipeI = index + 1;
    },
    //单击显示/隐藏promise弹出框
    PromiseToggle(){
      this.promiseVisible = !this.promiseVisible;
    },
    //点击跳转到商品评价页
    toEvalAll(){ //1.查看全部
      this.$toast({
        message:`跳转到 ${this.sid} 号商品所属评价页面`
      });
      //                                预览评论eid默认位置0
      //                                          ↓
      // this.$router.push(`/evaluate/${this.sid}/0`);
    },
    toEval(e){
      if(e.target.nodeName === "DIV"){
        //2.跳往 sid 号商品中 #标题 相关评价
        if(e.target.className === "one-title"){
          var str = e.target.innerHTML;
          str = str.replace(/\(\d*\)/ig,"");
          console.log(str);
          this.$toast(`跳转到 ${this.sid} 号商品中关于 "#${str}" 相关的评价`);
        }
        //3.跳往 sid 号商品中 预览评论的位置
        if(e.target.className === "content"){
          //获取当前预览评论的 data-evalid
          var eid = e.target.getAttribute("data-evalid");
          this.$toast(`跳转到${this.sid}号商品的 第${eid}条 预览评论位置`);
        }
      }
    },
    //ajax函数获取 sid 为 x 的商品详情
    detail(){
      (async ()=>{
        var result = await this.axios.get("/product/detail",{params:{sid:this.sid}});
        var data = result.data;
        if(data.data){
          var data = data.data;
          console.log(data);
          //商品预览图
          this.previmgs = data.previmgs;
            //设置轮播图数量
            this.swipeCount = data.previmgs.length;
            //将选择规格的图片默认赋值为商品预览图的第一张
            this.specImg = data.previmgs[0].i_url;
          //商品详情图
          this.detaimgs = data.detaimgs;
          //商品详情
          this.seriesDetail = data.series[0];
            
            console.log(this.seriesDetail);
          //商品规格
          //遍历商品规格 添加一个 active 来控制是否选中
          for(var item of data.specs){
            item.active = false; //默认是未选中
          }
          this.specs = data.specs;
          
          console.log(this.specs);
        }
      })();
    },

    //前往客服页面
    toService(){
      this.$toast('前往客服页面');
    },
    //前往购物车页面
    toCart(){
      this.$toast('前往我的购物车');
    },
    //商品导航弹出框的显示隐藏
    goodsPopup(e){
      if(e.target.nodeName === "BUTTON"){
        this.goodsActionVisible = !this.goodsActionVisible;
        if(e.target.innerHTML === "加入购物车"){

        }
      }
    },
    //关闭商品导航弹出框
    hiddenGoods(){
      this.goodsActionVisible = !this.goodsActionVisible;
    },
    //商品导航弹出框颜色分类选择
    selectColor(e){
      if(e.target.nodeName==="DIV" && e.target.className.indexOf('one-item')!==-1){
        //先获取当前点击的 data-i属性的值
        var I = e.target.getAttribute("data-i");
        //如果是选中的状态
        if(e.target.className.indexOf('active') !== -1){ 
          //则改为未选中并重新将选中的系列规格重置为默认状态
          this.specs[I].active = false;

          this.selectSpec.price = "00.00";
          this.selectSpec.spec = "";
          //将选中的图片设置为默认商品预览图的第一张
          this.specImg = this.previmgs[0].i_url;
        }
        //如果是未选中状态
        if(e.target.className.indexOf('active') === -1) {
          //遍历系列规格表,将除了当前 data-i 位置的其他规格选中状态改为false
          for(var i=0;i<this.specs.length;i++){
            if(i !== I){
              this.specs[i].active = false;
            }
          }
          //将当前data-i位置的规格 的选中改为true
          this.specs[I].active = true;
          //再将当前data-i位置的规格的详情赋值给选中的 规格
          this.selectSpec.price = this.specs[I].price;
          this.selectSpec.spec = this.specs[I].sname;
          this.selectSpec.img = this.specs[I].img;
          //将规格封面图改为当前data-i位置的规格的img
          this.specImg = this.specs[I].img;
        }
      }
    }
  },
  mounted(){
    /************ 示例数据 ***************/
    //发送请求 获取实例的评论
    //评论示例数据 两条
    var evalprevs = [
      {
        eid: 1,
        avatarUrl: '//storage.360buyimg.com/i.imageUpload/6a645f3461656463373031623036343331343738353235393836393936_sma.jpg',
        nickName: '徐下@诺言',
        content: '小巧精致,便携方便,非常亮,电池耐用,照的远'
      },
      {
        eid: 2,
        avatarUrl: '//storage.360buyimg.com/i.imageUpload/31333030363236372d393831343439333331353630313630323631353438_sma.jpg',
        nickName: '大憨批',
        content: '收到了超级喜欢，直接就带上了，果然红色是最好看的颜色，超级爱，有需要还会再来。收到了超级喜欢，直接就带上了，果然红色是最好看的颜色，超级爱，有需要还会再来。'
      }
    ]
    //遍历评论示例数据
    for(var item of evalprevs){
      //如果品论内容字符串的长度超过 62就 就截取到第62位置 并且加上"..."
      if(item.content.length >= 60) {
        item.content = item.content.substring(0,62) + "...";
      }
    }
    this.evalprevs = evalprevs;
    /************ 示例数据 ***************/
    //调用Ajax函数 发送请求获取商品详情数据
    this.detail();
  }
}
</script>

<style scoped>
.scroll{
  height:calc(100% - 60px);
  /* padding-bottom:60px; */
  overflow-y:scroll;
}
/* 返回按钮栏 */
.back{
  position: fixed;
  top:0;
  z-index:1000;
  width:100%;
  height:35px;
  display:flex;
  justify-content: space-between;
  padding:0 5px;
}
/* 返回图标遮罩层 原型 */
.back .back-mod{
  padding:5px;
  border-radius:50%;
  align-self: center;
  background-color:rgba(0, 0, 0, 0.25);
}
/* 返回图标 */
.back .back-mod .back-icon{
  width:20px;
  height:20px;
  background:url("../../public/images/icons/page/back.png") no-repeat;
  background-size:20px;
  background-position:center;
}
/* 返回图标选中样式 */
.back .back-mod:hover{
  background-color:rgba(0, 0, 0, 0.5);
}



/* 轮播预览图 */
.swipe{
  position:relative;
}
/* 数量 与 当前第几章 */
.swipe .count{
  color:#fff;
  font-size:14px;
  width:40px;
  line-height:40px;
  border-top-left-radius: 50% !important;
  border-bottom-left-radius: 50% !important;
  background-color:rgba(0, 0, 0, 0.479);
  position:absolute;
  right:0;
  bottom:10px;
  z-index:100;
}
/* 预览图大小 */
.prev-img{
  width:100%;
}
/* 轮播图高度 */
.swipeH{
  height:375px;
}
@media (min-width:320px) {
  .swipeH{
    height:320px;
  }
}
@media (min-width:375px){
  .swipeH{
    height:375px;
  }
}
@media (min-width:414px){
  .swipeH{
    height:414px;
  }
}
@media (min-width: 576px) {
  .swipeH{
    height:528px;
  }
}
@media (min-width:768px){
  .swipeH{
    height:708px;
  }
}










/* 商品名称 商品价格 服务承诺 */
.item{
  font-size:17px;
  text-align:left;
  background-color:#fff;
  margin-bottom:10px;
}
/* 商品价格 */
.item .price{
  color:#f2270c;
  font-size:30px;
  padding:0 10px;
}
/* 人民币符号 */
.item .price span{
  font-size:16px;
}
/* 商品名称 */
.item .pname{
  font-size:18px;
  font-weight:600;
  margin-bottom:5px;
  padding:0 10px;
}
/* 服务承诺 */
.item .promise{
  display:flex;
  justify-content:space-between;
  height:40px;
  color:#999;
  font-size:14px;
  line-height:40px;
  border-top:1px solid #f2f2f2;
  border-bottom:1px solid #f2f2f2;
  padding:0 10px;
}
.item .promise .gt{
  margin-top:20px;
}
/* 服务承诺选中样式 */
.item .promise:hover{
  color:#555;
  background-color:rgba(92, 91, 91, 0.1);
  cursor: pointer;
}
.item .promise:hover .gt{
  border-left: 1px solid #777;
  border-bottom: 1px solid #777;
}

/* 服务承诺说明标题*/
.item .promiseTitle{
  display:flex;
  font-size:16px;
  font-weight:700;
  /* justify-content:space-between; */
  line-height:55px;
  padding-left:15px;
  padding-right:15px;
  border-bottom:1px solid #f2f2f2;
}
/* 服务说明 */
.item .pro-content{
  color:#d4d4d4;
  padding:0 22px;
}
/* 单条服务说明 */
.item .pro-content .one-pro{
  margin:10px 0px;
}
/* 服务说明标题 */
.item .pro-content .one-pro .title{
  color:black;
  font-size:14px;
  font-weight:500;
}
/* 服务说明具体内容 */
.item .pro-content .one-pro .content{
  font-size:12px;
}











/* 商品评价 */
.evaluate{
  display:flex;
  flex-direction:column;
  background-color:#fff;
  margin-bottom:10px;
}
/* 上 中 下 部分共同样式 */
.evaluate .top,.evaluate .center,.evaluate .bottom{
  padding:0 10px;
}

/* 商品评价上半部分 标题 与 查看全部 */
.evaluate .top{
  display:flex;
  justify-content:space-between;
  align-items:center;
  color:#999;
  height:40px;
  line-height:40px;
  border-bottom:1px solid #f2f2f2;
}
/* 上半部分选中样式 */
.evaluate .top:hover{
  background-color:rgba(92, 91, 91, 0.1);
}
/* 标题 */
.evaluate .top .evaluateCount{
  color:black;
  font-size:16px;
}
/* 查看全部 */
.evaluate .top .evaluateAll{
  font-size:12px;
  display:flex;
  justify-content:space-between;
}
/* 查看全部 下的 大于号 */
.evaluate .top .evaluateAll .gt{
  width:8px;
  height:8px;
  margin-top:19px;
}


/* 商品评价中间部分 评价标题: 正品(16) 物美价廉(9) 质量很好(8)*/
.evaluate .center{
  padding:5px 10px;
  display:flex;
  flex-wrap:wrap;
}
/* 单条 #评价标题 */
.evaluate .center .one-title{
  color:#16bb02;
  line-height:30px;
  border-radius:5px;
  background-color:#00f91830;
  padding:0 10px;
  margin:2px 5px;
}
/* 单条 #评价标题选中样式 */
.evaluate .center .one-title:hover{
  background-color:#11970250;
}
/* 单条 #评价标题第一条样式 */
.evaluate .center .one-title:first-child{
  margin-left:0;
}


/* 商品评价下半部分 预览评价 用户相关 : 用户昵称、用户头像 */
.evaluate .bottom{
  display:flex;
  flex-direction:column;
}
/* 单条评价 */
.evaluate .bottom .one-eva{
  display:flex;
  flex-direction:column;
  padding:10px 0;
  border-bottom:1px solid #f2f2f2;
}
/* 单条评价用户相关 */
.evaluate .bottom .one-eva .user{
  display:flex;
  justify-content:flex-start;
  font-size:12px;
}
/* 单条评价用户相关 - 头像 */
.evaluate .bottom .one-eva .user .avatarUrl{
  width:20px;
  height:20px;
  border-radius:50%;
}
/* 单条评价用户相关 - 用户昵称 */
.evaluate .bottom .one-eva .user span{
  line-height:20px;
  margin-left:10px;
}
/* 单条评价 评价内容 */
.evaluate .bottom .one-eva .content{
  max-height:60px;
  overflow:hidden;
  text-align:left;
  font-size:14px;
  margin-top:10px;
}








/* 商品详情 */
.detail{
  background-color:#fff;
  display:flex;
  flex-direction:column;
}
.detail .top,.detail .center{
  padding:0 10px;
}
/* 商品详情上半部分 标题 */
.detail .top{
  height:40px;
  font-size:16px;
  text-align:left;
  line-height:40px;
}

/* 商品详情中间部分 */
.detail .center{
  font-size:14px;
}
/*          内容 */
.detail .center .det{
  background-color:#f2f2f28f;
  border-radius:5px;
  display:flex;
  flex-direction:column;
  padding:8px 12px;
}
/*          单条详情 */
.detail .center .det .one-detail{
  display:flex;
  justify-content:flex-start;
  height:30px;
  line-height:30px;
}
/*         单条详情标题 */
.detail .center .det .one-detail .title{
  width:30%;
  color:#999;
  text-align:left;
}

/* 商品详情下半部分 商品详情图 */
/* .detail .bottom{//为底部购买按钮预留位置
  
  padding-bottom:60px;
} */









/* 网页底部商品导航 */
.GoodsAction{
  width:100%;
  height:60px;
  padding:5px 5px 10px 5px;
  border-top:1px solid #f2f2f2;
  background-color:#fff;
  position:fixed;
  left:0;
  bottom:0;
  z-index:101;
  display:flex;
  justify-content:space-between;
}
/* 带图标字体 客服、购物车 */
.GoodsAction .icons{
  width:40%;
  display:flex;
  justify-content:space-between;
}
/* 单个图标字体 */
.GoodsAction .icons .one-icon{
  width:50%;
  padding:5px;
}
/* 单个图标字体 图标 */
.GoodsAction .icons .one-icon img{
  width:24px;
  height:20px;
}

/* 商品底部按钮 */
.GoodsAction .Action{
  width:60%;
  display:flex;
  justify-content:space-between;
}
/* 加入购物车与立即购买共同样式 */
.GoodsAction .Action .addcart,.GoodsAction .Action .pay{
  width:50%;
  color:#fff;
  margin-right:5px;
  border-radius: 21px;
  text-align:center;
}
/* 加入购物车 */
.GoodsAction .Action .addcart{
  background:-webkit-linear-gradient(135deg,#f2140c,#f2270c 70%,#f24d0c);
  background:linear-gradient(135deg,#f2140c,#f2270c 70%,#f24d0c);
}
/* 立即购买 */
.GoodsAction .Action .pay{
  background:-webkit-linear-gradient(135deg,#ffba0d,#ffc30d 69%,#ffcf0d);
  background:linear-gradient(135deg,#ffba0d,#ffc30d 69%,#ffcf0d);
}






/* 商品底部导航弹出框 */
/* 关闭小叉子 */
.goodsPopup .close{
  position:absolute;
  top:2px;
  right:2px;
  z-index:10;
}
/* 上半部分 */
.goodsPopup .top{
  position:relative;
  height:70px;
  border-bottom:1px solid #f2f2f2;
  padding:0 22px;
}
/* 预览图 */
.goodsPopup .top .previmg{
  width:100px;
  height:100px;
  background-color:#fff;
  border:1px solid #999;
  border-radius:10px;
  position:absolute;
  top:-40px;
}
.goodsPopup .top .previmg img{
  border-radius:10px;
}
/* 文本 */
.goodsPopup .top .text{
  height:100%;
  padding: 5px 0 0 102px;
  text-align:left;
}
/* 文本价格 */
.goodsPopup .top .text .price{
  color:red;
  font-size:16px;
}
/* 文本 选择 */
.goodsPopup .top .text .select{
  font-size:12px;
}

/* 中间部分 颜色分类、数量 */
.goodsPopup .center{
  padding-bottom:111px;
}
.goodsPopup .overflow-y{
  height:100%;
  overflow-y:scroll;
}
/* 中间部分单个栏 */
.goodsPopup .overflow-y .one-line{
  padding:10px;
  border-bottom:1px solid #f2f2f2;
  display:flex;
  flex-direction:column;
  text-align:left;
}
.goodsPopup .overflow-y .one-line span{
  font-size:16px;
}
/* 中间部分单个栏 的内容部分 */
.goodsPopup .overflow-y .one-line .items{
  display:flex;
  flex-wrap:wrap;
}
/* 单个栏 内容部分中的单个内容 */
.goodsPopup .overflow-y .one-line .items .one-item{
  margin:5px;
  padding:5px;
  border-radius:5px;
  background-color:#eaeaea;
}
.goodsPopup .overflow-y .one-line .items .one-item:hover{
  background-color:#ffd0d0f7;
}
/* 单个内容选中样式 */
.goodsPopup .overflow-y .one-line .items .one-item.active{
  color:#fff;
  background-color:#ff1c1c;
}

/* 下半部分 按钮 */
.goodsPopup .bottom{
  width:100%;
  position:fixed;
  left:0;
  bottom:0;
}
</style>