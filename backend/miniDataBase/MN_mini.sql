SET NAMES UTF8;
DROP DATABASE IF EXISTS mn_mini;
CREATE DATABASE mn_mini CHARSET=UTF8;
USE mn_mini;


#商家表
CREATE TABLE business(
  bid INT PRIMARY KEY AUTO_INCREMENT, #商家编号
  bname VARCHAR(255),                 #商家名称
  phone CHAR(11),                     #联系方式
  logo VARCHAR(2000),                 #商家logo
  introduce VARCHAR(500)              #商家简介
);
#商品系列表
CREATE TABLE series(
  sid INT PRIMARY KEY AUTO_INCREMENT, #系列编号
  sname VARCHAR(255),                 #系列名称
  pname VARCHAR(2000),                 #商品名称
  promise VARCHAR(255),               #服务承诺
  img VARCHAR(2000),                  #系列封面图
  price DECIMAL(10,2),                #系列封面价格
  brand VARCHAR(20),                  #品牌
  os VARCHAR(255),                    #操作系统
  ptype VARCHAR(20),                  #笔记本类型
  business_id INT,                    #所属商家
  FOREIGN KEY(business_id) REFERENCES business(bid)
);
#商品系列图片表
CREATE TABLE imgs(
  id INT PRIMARY KEY AUTO_INCREMENT,  #图片编号
  i_type BOOLEAN,                     #图片类型 预览图-0 详情图-1
  i_url VARCHAR(2000),                #图片地址
  sid INT,                            #所属系列编号
  FOREIGN KEY(sid) REFERENCES series(sid)
);
#商品系列可选内存、硬盘容量
-- CREATE TABLE series_MH(
--   id INT PRIMARY KEY AUTO_INCREMENT,  #
-- );
#商品系列里某个商品的规格表
CREATE TABLE specs(
  id INT PRIMARY KEY AUTO_INCREMENT, #规格编号
  sname VARCHAR(255),                 #规格名称
  img VARCHAR(2000),                  #规格封面图
  price DECIMAL(10,2),                #商品价格
  series_id INT,                      #所属系列编号
  FOREIGN KEY(series_id) REFERENCES  series(sid)
);
--插入商家数据
INSERT INTO business(bid,bname,phone,logo,introduce) VALUES
  (1,"奇怪的商家",'1875904325','/TTG.png','专卖电脑')
;
--插入商品系列表
INSERT INTO series(sid,sname,pname,promise,img,price,brand,os,ptype,business_id) VALUES
#macbook air m1
  (1,'MacBook air','Apple/苹果2020款Macbook Air M1 芯片 配备8核中央处理器','退货包运费','https://img.pddpic.com/mms-material-img/2020-12-21/8646e7ba-a8a8-4ecf-bdc7-65624e2b6498.jpeg.a.jpeg',9799.00,'Apple/苹果','Mac OS','笔记本',1),
#小米Pro15.6
  (2,'小米Pro15.6','Xiaomi/小米Pro【正品行货】 i5/i7学生吃鸡游戏本轻薄笔记本电脑','退货包运费','https://img.pddpic.com/mms-material-img/2020-11-26/03c1f6db-8b50-45b1-a6a6-a55e5321965b.jpeg.a.jpeg',6999.00,'Xiaomi/小米','windows','笔记本',1),
#联想小新air 14
  (3,'小新air 14','联想小新Air14 2020酷睿i5 独显 超轻薄办公商用学生笔记本电脑','退货包运费','https://img.pddpic.com/mms-material-img/2020-11-29/2ea4d01c-bbbb-4885-a1b4-4c4af055ae50.jpeg',3199.00,'Lenovo/联想','windows','笔记本',1),
#惠普暗影精灵6锐龙版
  (4,'暗影精灵6 锐龙版','惠普(HP)暗影精灵6代锐龙版15.6英寸吃鸡游戏本电竞笔记本电脑','退货包运费','https://img.pddpic.com/mms-material-img/2020-08-24/eb292bb8-36f2-49bc-9e6d-fbb1b526e43e.jpeg.a.jpeg',8299.00,'HP/惠普','windows','游戏本',1),
#飞行堡垒8
  (5,'飞行堡垒8','华硕(ASUS) 飞行堡垒8 酷睿i5/i7吃鸡电竞学生游戏设计笔记本电脑','退货包运费','https://img.pddpic.com/mms-material-img/2020-07-07/009f04da-d354-49d1-bde8-ad7daa590eee.jpeg',6849.00,'Asus/华硕','windows','游戏本',1),
#戴尔外星人 m15
  (6,'m15','外星人  全新m15 2020版R3高清独显15.6寸电竞吃鸡游戏笔记本电脑','退货包运费','https://img.pddpic.com/mms-material-img/2020-08-19/c505e7cf-ae77-4783-81ff-d3f3e6283db0.jpeg',16999.00,'Alienware/外星人','windows','游戏本',1),
#宏碁(Acer)暗影骑士·擎
  (7,'AN515','宏碁(Acer)暗影骑士·擎 15.6英寸 144Hz 吃鸡游戏笔记本 十代I5','退货包运费','https://img.pddpic.com/mms-material-img/2020-09-24/17357c56-13d9-45f4-a649-2dc5e659bd3e.jpeg.a.jpeg',6499.00,'Acer/宏碁','windows','游戏本',1),
#机械师T58-V
  (8,'逐空','机械师T58-V十代i7-10750H学生吃鸡游戏本RTX2060独显笔记本电脑','退货包运费','https://img.pddpic.com/mms-material-img/2020-12-03/062852d7-e3d6-4d48-88ed-1cd9a506a1e3.jpeg.a.jpeg',8600.00,'MACHENIKE/机械师','windows','游戏本',1)
;
--插入商品系列图片表
INSERT INTO imgs(id,i_type,i_url,sid) VALUES
#macbook air m1
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-12-21/8646e7ba-a8a8-4ecf-bdc7-65624e2b6498.jpeg.a.jpeg",1),
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-12-21/46a1a9a1-7ec7-4250-986b-e564ba3c9d5d.jpeg.a.jpeg",1),
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-12-21/d0f82e06-4804-4b5e-bd46-efef7d73bebf.jpeg.a.jpeg",1),
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-12-21/41b2168c-31b3-42fc-9ea8-50953123b633.jpeg.a.jpeg",1),
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-12-21/653166b3-8344-48ba-8a83-a22be4e4b515.jpeg.a.jpeg",1),
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-12-21/92d1cefc-9bb4-4b92-aaf0-de7964a5aa61.jpeg.a.jpeg",1),
  (NULL,1,"https://img-1.pddpic.com/mms-material-img/2020-12-21/b6e563fa-d483-411c-996e-57bfdb8a9401.jpeg.a.jpeg",1),
  (NULL,1,"https://img-1.pddpic.com/mms-material-img/2020-12-21/ea1d535f-9abd-4c0c-b47c-440c625da3d3.jpeg.a.jpeg",1),
  (NULL,1,"https://img-1.pddpic.com/mms-material-img/2020-12-21/0b33ec8d-e557-4aeb-8a6a-8dcb5b80c8dd.jpeg.a.jpeg",1),
  (NULL,1,"https://img-1.pddpic.com/mms-material-img/2020-12-21/120be23f-37dd-4c2c-95af-7cb0ac9f7d89.jpeg.a.jpeg",1),
  (NULL,1,"https://img-1.pddpic.com/mms-material-img/2020-12-21/682a1c20-7143-4e58-a43f-4a70a123ae30.jpeg.a.jpeg",1),
  (NULL,1,"https://img-1.pddpic.com/mms-material-img/2020-12-21/0af888c4-3b6b-4186-8ac2-b37584e1245b.jpeg.a.jpeg",1),
#小米Pro15.6
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-11-26/03c1f6db-8b50-45b1-a6a6-a55e5321965b.jpeg.a.jpeg",2),
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-11-26/8bd044c0-301a-4f07-acb8-8b69bf178796.jpeg.a.jpeg",2),
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-11-26/999957f3-28ad-4475-be2e-feeb38ccb301.jpeg.a.jpeg",2),
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-11-26/91c56708-5c68-44c1-bfd6-e9e08cd57935.jpeg.a.jpeg",2),
  (NULL,1,"https://img-1.pddpic.com/mms-material-img/2020-11-26/d6f0503a-d251-4f95-9608-d7d090250b8c.jpeg.a.jpeg",2),
  (NULL,1,"https://img-1.pddpic.com/mms-material-img/2020-11-26/4735dcf1-dac8-4121-8cd0-f92a9e33e513.jpeg.a.jpeg",2),
  (NULL,1,"https://img-1.pddpic.com/mms-material-img/2020-11-26/03b6795a-c022-41f2-ba23-d70e2485120a.jpeg.a.jpeg",2),
  (NULL,1,"https://img-1.pddpic.com/mms-material-img/2020-11-26/32eb8539-7e85-455d-9b9d-371c962cd45f.jpeg.a.jpeg",2),
  (NULL,1,"https://img-1.pddpic.com/mms-material-img/2020-11-26/344f0a52-b4f6-4123-be0b-20834b1683f2.jpeg.a.jpeg",2),
#联想小新air 14
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-11-29/2ea4d01c-bbbb-4885-a1b4-4c4af055ae50.jpeg",3),
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-11-29/41aeff0a-f463-442d-a5de-698745646979.jpeg",3),
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-11-29/c43703a5-d3a2-4e63-b9c6-2b0077ca0342.jpeg",3),
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-11-29/436b2316-2d68-4c9d-bc97-cfa5e3e03031.jpeg",3),
  (NULL,1,"https://img-1.pddpic.com/mms-material-img/2020-11-29/784f9893-2573-4238-8a69-9ae14cf43807.jpeg",3),
  (NULL,1,"https://img-1.pddpic.com/mms-material-img/2020-11-29/1bc26ac3-7578-45bb-8bb1-a73b78a5f24e.jpeg",3),
  (NULL,1,"https://img-1.pddpic.com/mms-material-img/2020-11-29/66b78b7f-4427-4e3f-81a6-4594241a51c8.jpeg",3),
  (NULL,1,"https://img-1.pddpic.com/mms-material-img/2020-11-29/a722a727-e5f8-4494-9809-57beda3e116f.jpeg",3),
#惠普暗影精灵6锐龙版
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-08-24/eb292bb8-36f2-49bc-9e6d-fbb1b526e43e.jpeg.a.jpeg",4),
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-08-21/20f8a349-ecb2-458a-9ba9-270c8cabce15.jpeg.a.jpeg",4),
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-08-21/282ebebf-9bde-4c12-b570-792a2caff95c.jpeg.a.jpeg",4),
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-08-21/5eb95c13-4300-45f0-9f82-7fb4a6c1777d.jpeg.a.jpeg",4),
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-08-21/d3ce9166-7c7c-40ba-9759-2c20732cc70e.jpeg.a.jpeg",4),
  (NULL,1,"https://img-1.pddpic.com/mms-material-img/2020-08-24/cf405e1a-293b-429f-8456-172819c0bb0b.jpeg.a.jpeg",4),
  (NULL,1,"https://img-1.pddpic.com/mms-material-img/2020-08-24/13034cd8-2fd4-4c92-95d8-89df05ea7187.jpeg.a.jpeg",4),
  (NULL,1,"https://img-1.pddpic.com/mms-material-img/2020-08-24/70b879d7-619c-4d69-a277-9c800ba9ac3e.jpeg.a.jpeg",4),
  (NULL,1,"https://img-1.pddpic.com/mms-material-img/2020-08-24/16e5e3d8-92f8-4a7c-9e0f-7269b8804b8d.jpeg.a.jpeg",4),
  (NULL,1,"https://img-1.pddpic.com/mms-material-img/2020-08-24/34c3f5df-bd8c-4676-9d56-4a1bbff88562.jpeg.a.jpeg",4),
#飞行堡垒8
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-07-07/009f04da-d354-49d1-bde8-ad7daa590eee.jpeg",5),
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-07-07/3bb16792-6bec-4dc0-912f-d1a9dadbdcd2.jpeg",5),
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-07-07/d1866a4a-7e5f-4be3-a4aa-fb173bd6a220.jpeg",5),
  (NULL,1,"//img12.360buyimg.com/imgzone/jfs/t1/143039/17/19693/138159/5fe2e011E8fa2dbb1/6fc4d6d83796f278.jpg!q70.dpg.webp",5),
  (NULL,1,"//img12.360buyimg.com/imgzone/jfs/t1/143002/29/19682/187225/5fe2f00aE933cd016/f33e92f0e0117d8f.jpg!q70.dpg.webp",5),
  (NULL,1,"//img13.360buyimg.com/imgzone/jfs/t1/139532/12/20010/340995/5fe2e012E1524c7d4/ab7bf138b3788a89.jpg!q70.dpg.webp",5),
  (NULL,1,"//img12.360buyimg.com/imgzone/jfs/t1/140654/37/19677/160715/5fe2e012E16f76fec/77de4be173c62028.jpg!q70.dpg.webp",5),
#戴尔外星人 m15
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-08-19/c505e7cf-ae77-4783-81ff-d3f3e6283db0.jpeg",6),
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-08-19/c6ed1818-6a87-4ca8-8c96-c3a2e5082f77.jpeg",6),
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-08-19/284ec7b1-5797-430e-88ed-bd7d255fab45.jpeg",6),
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-08-19/1fd71139-d3cb-4ac7-98d6-8efd6e142c80.jpeg",6),
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-08-19/d18aae3c-8514-4d6e-9348-549eb687eb66.jpeg",6),
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-08-19/3cc24776-1f94-40f5-8a98-6f8147e2d473.jpeg",6),
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-08-19/6fb1dcb0-975d-42c2-be6f-a516c6c14c2d.jpeg",6),
  (NULL,1,"https://img-1.pddpic.com/mms-material-img/2020-08-28/d6f40828-a746-42e9-864e-3ba86809f68f.png",6),
  (NULL,1,"https://img-1.pddpic.com/mms-material-img/2020-08-19/260b1927-a2da-48d0-bf21-1b90149eff74.jpeg",6),
  (NULL,1,"https://img-1.pddpic.com/mms-material-img/2020-08-19/e17e1430-c70a-441f-9b90-42ca01b40e22.jpeg",6),
  (NULL,1,"https://img-1.pddpic.com/mms-material-img/2020-08-19/4f53e9a6-429f-4947-ba63-816696e5a532.jpeg",6),
  (NULL,1,"https://img-1.pddpic.com/mms-material-img/2020-08-19/cad68547-d74c-4d40-aca7-e55fc6599bcd.jpeg",6),
#宏碁(Acer)暗影骑士·擎
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-09-24/17357c56-13d9-45f4-a649-2dc5e659bd3e.jpeg.a.jpeg",7),
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-09-24/4f4bc533-56c9-4cbe-a431-b56cd567f774.jpeg.a.jpeg",7),
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-09-24/e1b8cb3d-edc8-40e7-b336-12f3ab7e2cd2.jpeg.a.jpeg",7),
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-09-24/268633ef-e269-4a1b-aa16-8dde68f252be.jpeg.a.jpeg",7),
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-09-24/210dd1a7-a275-43b5-bb52-e437acbd996f.jpeg.a.jpeg",7),
  (NULL,1,"https://img.pddpic.com/mms-material-img/2020-09-24/cc707a13-4a31-4c08-ae19-34cfc5b45eab.jpeg.a.jpeg",7),
  (NULL,1,"https://img.pddpic.com/mms-material-img/2020-09-24/1c25ec45-20db-4147-8503-7f2043917550.jpeg.a.jpeg",7),
  (NULL,1,"https://img.pddpic.com/mms-material-img/2020-09-24/842bfaaa-fd61-4db4-b666-22459501b94a.jpeg.a.jpeg",7),
  (NULL,1,"https://img.pddpic.com/mms-material-img/2020-09-24/82116dac-91dd-4374-beed-6342d821e8f6.jpeg.a.jpeg",7),
  (NULL,1,"https://img.pddpic.com/mms-material-img/2020-09-24/6ffb4e45-5d2c-431f-bdb7-777beda072e3.jpeg.a.jpeg",7),
  (NULL,1,"https://img.pddpic.com/mms-material-img/2020-09-24/07bc745e-60ca-4338-8560-db14c1283b0f.jpeg.a.jpeg",7),
#机械师T58-V
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-12-03/062852d7-e3d6-4d48-88ed-1cd9a506a1e3.jpeg.a.jpeg",8),
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-12-03/1601e71d-e45e-467b-9f46-5f5782bbea69.jpeg.a.jpeg",8),
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-12-03/1c48f786-3a0f-4af8-83cf-06a8d2f44551.jpeg.a.jpeg",8),
  (NULL,0,"https://img.pddpic.com/mms-material-img/2020-12-03/fea42fec-7f9f-49c2-a0fa-a64c80e65c27.jpeg.a.jpeg",8),
  (NULL,1,"https://img.pddpic.com/mms-material-img/2020-12-03/d37abc70-5980-4e16-a6be-aeeceab550f9.jpeg.a.jpeg",8),
  (NULL,1,"https://img.pddpic.com/mms-material-img/2020-12-03/a248be5a-515d-4bb9-8865-d5ded1615ad2.jpeg.a.jpeg",8),
  (NULL,1,"https://t16img.yangkeduo.com/garner-api/89e40e9edffe2698a9d1cb95ec343047.jpeg",8),
  (NULL,1,"https://img.pddpic.com/mms-material-img/2020-12-03/d9eedec3-f087-4068-9572-905474581929.jpeg.a.jpeg",8)
;
--插入系列规格表
INSERT INTO specs(id,sname,img,price,series_id) VALUES
#macbook air m1
  (NULL,'深空灰色 M1芯片','//m.360buyimg.com/mobilecms/s1265x1265_jfs/t1/125393/39/18221/47832/5fab078dEbc040aa5/590d4034236f65ef.jpg!q70.dpg.webp',9799.00,1),
  (NULL,'银色 M1芯片','//m.360buyimg.com/mobilecms/s1265x1265_jfs/t1/120407/8/18203/48564/5fab06c3E62aa043b/8634834af77c3cc5.jpg!q70.dpg.webp',9699.00,1),
  (NULL,'金色 M1芯片','//m.360buyimg.com/mobilecms/s1265x1265_jfs/t1/143581/15/14126/52373/5fab06ecEb746d196/274db844fd42cd28.jpg!q70.dpg.webp',9699.00,1),
#小米Pro15.6
  (NULL,'酷睿i7-10510-银色','https://img.pddpic.com/mms-material-img/2020-11-26/999957f3-28ad-4475-be2e-feeb38ccb301.jpeg.a.jpeg',6900.00,2),
#联想小新air14
  (NULL,'R5 4600U','https://img.pddpic.com/mms-material-img/2020-11-26/999957f3-28ad-4475-be2e-feeb38ccb301.jpeg.a.jpeg',3199.00,3),
#惠普暗影精灵6锐龙版
  (NULL,'R7/2060-6G 电竞屏','https://img.pddpic.com/mms-material-img/2020-08-24/eb292bb8-36f2-49bc-9e6d-fbb1b526e43e.jpeg.a.jpeg',8299.00,4),
#飞行堡垒8
  (NULL,'i7-10750/1650ti-4G','//m.360buyimg.com/mobilecms/s1265x1265_jfs/t1/116387/22/15867/115433/5f41ea73Ef6f69ad5/c9be6778d79917df.jpg!q70.dpg.webp',6849.00,5),
  (NULL,'i5-10200H/1650ti-4G','//m.360buyimg.com/mobilecms/s1265x1265_jfs/t1/116387/22/15867/115433/5f41ea73Ef6f69ad5/c9be6778d79917df.jpg!q70.dpg.webp',6199.00,5),
#戴尔外星人 m15
  (NULL,'i7-10750H/RTX2070','https://img.pddpic.com/mms-material-img/2020-08-19/c505e7cf-ae77-4783-81ff-d3f3e6283db0.jpeg',16999,6),
#宏碁(Acer)暗影骑士·擎
  (NULL,'十代i5/GTX1650Ti','https://img.pddpic.com/mms-material-img/2020-09-24/17357c56-13d9-45f4-a649-2dc5e659bd3e.jpeg.a.jpeg',6499.00,7),
#机械师T58-V
  (NULL,'i7-10750H/RTX2060','https://img.pddpic.com/mms-material-img/2020-12-03/062852d7-e3d6-4d48-88ed-1cd9a506a1e3.jpeg.a.jpeg',8600.00,8)
;