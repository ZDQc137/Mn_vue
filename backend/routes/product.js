const express = require("express");
const pool = require("../pool.js");
var router = express.Router();
//推荐商品 使用分页查询
//http://127.0.0.1:6060/product/recommend?pno=1&pageSize=4
router.get("/recommend",(req,res)=>{
  var pno = parseInt(req.query.pno); //页码
  var pageSize = parseInt(req.query.pageSize); //每页显示几条数据
  if(!pno) {//如果没有传入页码
    pno = 1;//默认1
  }
  if(!pageSize) {//如果没有传入大小
    pageSize = 4;//默认4
  }
  //计算开始的值
  var start = (pno-1)*pageSize;
  //sql
  var sql = 'SELECT sid,pname,promise,img,price FROM series LIMIT ?,?';
  //查询数据库
  pool.query(sql,[start,pageSize],(err,result)=>{
    if(err) throw err;
    if(result.length > 0) {
      res.send({code:200,msg:"查找成功",data:result});
    }else{
      res.send({code:500,msg:'没有更多了'});
    }
  });
});
//http://127.0.0.1:8080/product/detail?sid=1
//查询某个商品的所有规格与图片
router.get("/detail",(req,res)=>{
  var details = {}; //将查询的结果放入此结果集
  var sid = req.query.sid; //系列id 通过系列id查找 系列 规格 图片群
  //先查找系列详情
  var sql = "SELECT sname,pname,price,brand,ptype,os,business_id FROM series WHERE sid=?";
  pool.query(sql,[sid],(err,result)=>{
    if(err) throw err;
    if(result.length > 0){
      details.series = result;
      // 查找规格详情
      sql = "SELECT id,sname,img,price FROM specs WHERE series_id=?";
      pool.query(sql,[sid],(err,result)=>{
        if(err) throw err;
        if(result.length > 0){
          details.specs = result;
          // 查找系列所属图片 预览图片
          sql = "SELECT id,i_url FROM imgs WHERE i_type=? AND sid=?";
          pool.query(sql,[0,sid],(err,result)=>{
            if(err) throw err;
            if(result.length > 0){
              details.previmgs = result;
              // 查找系列所属图片 详情图片
              sql = "SELECT id,i_url FROM imgs WHERE i_type=? AND sid=?";
              pool.query(sql,[1,sid],(err,result)=>{
                if(err) throw err;
                if(result.length > 0) {
                  details.detaimgs = result;
                  //所有数据准备完成 响应回网页
                  res.send({code:200,msg:"查找成功",data:details});
                }
              })
            }
          })
        }
      });
    }else{ //如果没有找到系列 则直接返回
      res.send({code:500,msg:"没有更多了"});
    }
  })
});


module.exports = router;