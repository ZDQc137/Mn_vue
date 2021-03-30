const express = require("express");
const cors = require("cors");
const product = require("./routes/product");

var app = express();
app.use(cors());
//设置跨域访问  
app.all('*', function(req, res, next) {  
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers","X-Requested-With");
  res.header("Access-Control-Allow-Methods","PUT,POST,GET,DELETE,OPTIONS");
  res.header("X-Powered-By",' 3.2.1')
  res.header("Content-Type", "application/json;charset=utf-8");
  next();
});
// app.use(cors({
//   origin:["http://192.168.1.109:8080","http://localhost:8080"],
//   credentials:true
// }));
app.listen(6060);



app.use("/product",product);