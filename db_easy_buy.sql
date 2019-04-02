/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : db_easy_buy

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 06/01/2019 09:23:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for easybuy_comment
-- ----------------------------
DROP TABLE IF EXISTS `easybuy_comment`;
CREATE TABLE `easybuy_comment`  (
  `EC_ID` int(10) NOT NULL AUTO_INCREMENT,
  `EC_CONTENT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `EC_CREATE_TIME` datetime(0) NOT NULL,
  `EC_REPLY` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EC_REPLY_TIME` datetime(0) NULL DEFAULT NULL,
  `EC_NICK_NAME` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`EC_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of easybuy_comment
-- ----------------------------
INSERT INTO `easybuy_comment` VALUES (9, '好久不见你好吗', '2019-01-04 13:38:19', '我很想你啊', '2019-01-04 00:00:00', '蜕变');
INSERT INTO `easybuy_comment` VALUES (10, '我要退货', '2019-01-05 20:17:09', '', NULL, '肖箫');
INSERT INTO `easybuy_comment` VALUES (11, '你家的东西什么玩意啊，无缘无故闹肚子', '2019-01-05 20:22:03', '亲！请检查您的肚子，或者购买其他零食进行服用，还可以过来托马斯105，让店主给你揉揉哦~', '2019-01-05 00:00:00', '箫荷');

-- ----------------------------
-- Table structure for easybuy_order
-- ----------------------------
DROP TABLE IF EXISTS `easybuy_order`;
CREATE TABLE `easybuy_order`  (
  `EO_ID` int(10) NOT NULL AUTO_INCREMENT,
  `EO_USER_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `EO_USER_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EO_USER_ADDRESS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EO_CREATE_TIME` datetime(0) NOT NULL,
  `EO_COST` decimal(10, 2) NOT NULL,
  `EO_STATUS` decimal(6, 0) NOT NULL,
  `EO_TYPE` decimal(6, 0) NOT NULL,
  PRIMARY KEY (`EO_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of easybuy_order
-- ----------------------------
INSERT INTO `easybuy_order` VALUES (10, '123123', '肖箫', '墨尔本', '2019-01-05 20:16:39', 14.00, 3, 1);
INSERT INTO `easybuy_order` VALUES (11, '搁浅', '箫荷', '肇庆市', '2019-01-05 20:16:56', 20.00, 2, 1);
INSERT INTO `easybuy_order` VALUES (12, '搁浅', '箫荷', '肇庆市', '2019-01-05 20:18:02', 52.00, 1, 1);
INSERT INTO `easybuy_order` VALUES (13, '搁浅', '箫荷', '肇庆市', '2019-01-05 20:19:00', 98.00, 4, 1);
INSERT INTO `easybuy_order` VALUES (14, '搁浅', '箫荷', '肇庆市', '2019-01-05 20:30:41', 23.00, 5, 1);
INSERT INTO `easybuy_order` VALUES (16, '123123', '肖箫', '墨尔本', '2019-01-05 23:38:32', 26.00, 1, 1);
INSERT INTO `easybuy_order` VALUES (17, '123123', '肖箫', '墨尔本', '2019-01-05 23:43:14', 126.00, 1, 1);

-- ----------------------------
-- Table structure for easybuy_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `easybuy_order_detail`;
CREATE TABLE `easybuy_order_detail`  (
  `EOD_ID` int(10) NOT NULL AUTO_INCREMENT,
  `EO_ID` decimal(10, 0) NOT NULL,
  `EP_ID` decimal(10, 0) NOT NULL,
  `EOD_QUANTITY` decimal(6, 0) NOT NULL,
  `EOD_COST` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`EOD_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of easybuy_order_detail
-- ----------------------------
INSERT INTO `easybuy_order_detail` VALUES (14, 10, 17, 1, 14.00);
INSERT INTO `easybuy_order_detail` VALUES (15, 11, 33, 2, 20.00);
INSERT INTO `easybuy_order_detail` VALUES (16, 12, 41, 1, 52.00);
INSERT INTO `easybuy_order_detail` VALUES (17, 13, 44, 1, 46.00);
INSERT INTO `easybuy_order_detail` VALUES (18, 13, 40, 1, 45.00);
INSERT INTO `easybuy_order_detail` VALUES (19, 13, 34, 1, 7.00);
INSERT INTO `easybuy_order_detail` VALUES (20, 14, 12, 1, 23.00);
INSERT INTO `easybuy_order_detail` VALUES (21, 15, 34, 1, 7.00);
INSERT INTO `easybuy_order_detail` VALUES (22, 16, 16, 2, 26.00);
INSERT INTO `easybuy_order_detail` VALUES (23, 16, 14, 1, 10.00);
INSERT INTO `easybuy_order_detail` VALUES (24, 17, 43, 1, 66.00);
INSERT INTO `easybuy_order_detail` VALUES (25, 17, 40, 1, 45.00);
INSERT INTO `easybuy_order_detail` VALUES (26, 17, 30, 1, 15.00);

-- ----------------------------
-- Table structure for easybuy_product
-- ----------------------------
DROP TABLE IF EXISTS `easybuy_product`;
CREATE TABLE `easybuy_product`  (
  `EP_ID` int(10) NOT NULL AUTO_INCREMENT,
  `EP_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `EP_DESCRIPTION` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EP_PRICE` decimal(10, 2) NOT NULL,
  `EP_STOCK` decimal(10, 0) NOT NULL,
  `EPC_ID` decimal(10, 0) NULL DEFAULT NULL,
  `EPC_CHILD_ID` decimal(10, 0) NULL DEFAULT NULL,
  `EP_FILE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`EP_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of easybuy_product
-- ----------------------------
INSERT INTO `easybuy_product` VALUES (12, '洽洽五香瓜子', '品牌名称：ChaCheer/洽洽 产品参数：  生产许可证编号：SC11834010705158厂名：洽洽食品股份有限公司厂址：安徽省合肥市经济技术开发区莲花路1307号；安徽省合肥市经济技术开发区莲花路2159号厂家联系方式：4008877819 8008680290保质期：240 天品牌: ChaCheer/洽洽系列: 洽洽瓜子香瓜子308克包装种类: 袋装瓜子种类: 葵花子产地: 中国大陆省份: 安徽省城市: 合肥市包装方式: 包装食品口味: 五香瓜子308g*3袋 原香瓜子285g*3袋 奶香瓜子285g*3袋 【五香瓜子308g+原香瓜子285g+奶香瓜子285g】组合 【推荐】五香瓜子308g*5袋净含量: 924g', 23.00, 29, 27, 28, 'q1.jpg');
INSERT INTO `easybuy_product` VALUES (13, '坚果炒货西瓜子', '坚果炒货西瓜子 颗粒饱满休闲零食小吃 话梅西瓜子200g/袋', 18.00, 23, 27, 29, 'q2.jpg');
INSERT INTO `easybuy_product` VALUES (14, '葵花籽奶油味瓜子', '三只松鼠坚果炒货休闲零食葵花籽奶油味瓜子168g/袋', 10.00, 45, 27, 30, 'q3.jpg');
INSERT INTO `easybuy_product` VALUES (15, '卫龙辣条小面筋', '卫龙 辣条 休闲零食 方便食品 小面筋量贩装（香辣味）312g/袋', 12.00, 34, 31, 32, 'l1.jpg');
INSERT INTO `easybuy_product` VALUES (16, '口水娃辣条辣片', '口水娃 年货休闲零食 辣条辣片 即食零食小吃400g', 13.00, 28, 31, 33, 'l2.jpg');
INSERT INTO `easybuy_product` VALUES (17, '香辣味面筋辣条', '良品铺子_烤面筋200g辣皮辣片辣条味即食零食小吃 香辣味面筋辣条零食 烤面筋 200g', 14.00, 119, 31, 34, 'l3.jpg');
INSERT INTO `easybuy_product` VALUES (18, '泡椒凤爪', '有友 【第二份五折】泡椒凤爪428g袋独立小包装 鸡爪 重庆特产 休闲零食 【山椒味】辣度★★★★', 36.00, 100, 35, 36, 'p1.jpg');
INSERT INTO `easybuy_product` VALUES (19, '冷冻鸡凤爪', '泰森(Tyson) 冷冻鸡凤爪 454g/袋 2袋装', 56.00, 35, 35, 37, 'p2.jpg');
INSERT INTO `easybuy_product` VALUES (20, '周黑鸭 卤凤爪', '周黑鸭 卤凤爪 武汉特产卤味零食麻辣小吃鸡爪 真空小包装150g', 23.00, 26, 35, 38, 'p3.jpg');
INSERT INTO `easybuy_product` VALUES (21, '康师傅方便面泡面', '康师傅方便面泡面 日式豚骨2桶+酸酸辣辣豚骨2桶+海鲜豚骨2桶+藤椒豚骨2桶 桶装泡面整箱装', 40.00, 25, 39, 40, 'k1.jpg');
INSERT INTO `easybuy_product` VALUES (22, '统一 方便面泡面', '统一 方便面泡面 汤达人 日式豚骨味方便面 五连包', 21.00, 36, 39, 41, 'k2.jpg');
INSERT INTO `easybuy_product` VALUES (23, '今麦郎 方便面泡面 ', '今麦郎 方便面泡面 大今野拉面 红烧牛肉面 24袋 泡面整箱装', 35.00, 130, 39, 42, 'k3.jpg');
INSERT INTO `easybuy_product` VALUES (24, '碗装醇黑巧克力糖果', '德芙 Dove分享碗装醇黑巧克力66% 糖果巧克力 休闲零食 252g', 39.00, 52, 43, 44, 'y1.jpg');
INSERT INTO `easybuy_product` VALUES (25, '夹心喜糖巧克力糖果', '徐福记 奇欧比巧克力 散装软馅糖果零食 夹心喜糖巧克力批发500g 多种口味混合500g约45颗', 39.00, 25, 43, 45, 'y2.jpg');
INSERT INTO `easybuy_product` VALUES (26, '费列罗巧克力礼盒糖果', '费列罗巧克力礼盒装生日礼物情人节礼物送女友年货节糖果员工福利', 89.00, 100, 43, 46, 'y3.jpg');
INSERT INTO `easybuy_product` VALUES (27, ' 黑加仑葡萄干', '好想你 休闲零食 新疆特产 蜜饯果干 黑加仑葡萄干228g/袋', 18.00, 62, 47, 48, 'h1.jpg');
INSERT INTO `easybuy_product` VALUES (28, '玫瑰红黑加仑金凰后无核白葡萄干', '楼兰蜜语 蜜饯果干 玫瑰红黑加仑金凰后无核白葡萄干 新疆特产零食四色大葡萄干900g', 34.00, 42, 47, 49, 'h2.jpg');
INSERT INTO `easybuy_product` VALUES (29, '玫瑰红葡萄干', '西域美农 休闲零食 蜜饯果干 新疆特产 食品小吃 玫瑰红葡萄干250g', 15.00, 38, 47, 50, 'h3.jpg');
INSERT INTO `easybuy_product` VALUES (30, '乐事薯片', ' 乐事薯片超值分享装210g', 15.00, 77, 51, 52, 's1.jpg');
INSERT INTO `easybuy_product` VALUES (31, '上好佳薯片', '上好佳薯片组合包16g*5袋', 6.00, 200, 51, 53, 's2.jpg');
INSERT INTO `easybuy_product` VALUES (32, '可比克 薯片', '可比克 薯片 心有所薯 办公室休闲膨化零食 105g*3 组合装（番茄味+烧烤味+原味)', 17.00, 56, 51, 54, 's3.jpg');
INSERT INTO `easybuy_product` VALUES (33, '口味硬糖棒棒糖', '阿尔卑斯 精选多种口味硬糖棒棒糖(20支装)200克牛奶糖 儿童用糖 休闲零食(新老包装交替发货)', 10.00, 278, 55, 56, 't1.jpg');
INSERT INTO `easybuy_product` VALUES (34, '绿箭无糖薄荷糖口香糖', '绿箭无糖薄荷糖口香糖铁盒装23.8g/盒 约35粒 休闲零食糖果 冰柠薄荷味', 7.00, 54, 55, 57, 't2.jpg');
INSERT INTO `easybuy_product` VALUES (35, '大白兔 原味奶糖', '大白兔 原味奶糖 454g/袋 婚庆喜糖', 24.00, 130, 55, 58, 't3.jpg');
INSERT INTO `easybuy_product` VALUES (36, '猪肉脯', '来伊份 【前1500名第2份5折】原味/芝麻味猪肉干 猪肉脯猪200g来一份休闲零食 原味猪肉脯200g', 20.00, 34, 59, 60, 'r1.jpg');
INSERT INTO `easybuy_product` VALUES (37, '蜀道香 肉干肉脯', '蜀道香 肉干肉脯 休闲零食特产 手撕牛肉 独立小包装 天椒霸道麻辣牛肉干200g', 33.00, 45, 59, 61, 'r2.jpg');
INSERT INTO `easybuy_product` VALUES (38, '老四川肉干肉脯', '金角 老四川 休闲零食 肉干肉脯 五香牛肉干208g中华老字号', 49.00, 20, 59, 62, 'r3.jpg');
INSERT INTO `easybuy_product` VALUES (39, '伊利 纯牛奶', ' 伊利 纯牛奶250ml*24盒', 66.00, 180, 63, 64, 'n1.jpg');
INSERT INTO `easybuy_product` VALUES (40, '低脂高钙牛奶', '蒙牛 低脂高钙牛奶 250ml*16 礼盒装', 45.00, 58, 63, 65, 'n2.jpg');
INSERT INTO `easybuy_product` VALUES (41, '旺仔 牛奶 ', '沃尔玛】旺仔 牛奶 儿童牛奶 早餐奶 3L 125ml*24包', 52.00, 57, 63, 66, 'n3.jpg');
INSERT INTO `easybuy_product` VALUES (42, '广东特产鸡蛋卷', '元朗 鸡蛋卷 饼干糕点 礼盒送礼 广东特产680g', 66.00, 45, 67, 68, 'z1.jpg');
INSERT INTO `easybuy_product` VALUES (43, '广东特产广式饼酥糕点', '广州酒家 金装手信礼盒424g/盒 广东特产广式饼酥糕点下午茶点心 中华老字号手信', 66.00, 44, 67, 69, 'z2.jpg');
INSERT INTO `easybuy_product` VALUES (44, '广东广州特产传统糕点', '莲香楼杏仁饼铁盒400g点心广东广州特产传统糕点下午茶点休闲零食送礼手信礼盒', 46.00, 79, 67, 70, 'z3.jpg');

-- ----------------------------
-- Table structure for easybuy_product_category
-- ----------------------------
DROP TABLE IF EXISTS `easybuy_product_category`;
CREATE TABLE `easybuy_product_category`  (
  `EPC_ID` int(10) NOT NULL AUTO_INCREMENT,
  `EPC_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `EPC_PARENT_ID` decimal(10, 0) NOT NULL,
  PRIMARY KEY (`EPC_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of easybuy_product_category
-- ----------------------------
INSERT INTO `easybuy_product_category` VALUES (27, '瓜子', 0);
INSERT INTO `easybuy_product_category` VALUES (28, '洽洽', 27);
INSERT INTO `easybuy_product_category` VALUES (29, '百草味', 27);
INSERT INTO `easybuy_product_category` VALUES (30, '三只松鼠', 27);
INSERT INTO `easybuy_product_category` VALUES (31, '辣条', 0);
INSERT INTO `easybuy_product_category` VALUES (32, '卫龙', 31);
INSERT INTO `easybuy_product_category` VALUES (33, '口水娃', 31);
INSERT INTO `easybuy_product_category` VALUES (34, '良品铺子', 31);
INSERT INTO `easybuy_product_category` VALUES (35, '凤爪', 0);
INSERT INTO `easybuy_product_category` VALUES (36, '有友', 35);
INSERT INTO `easybuy_product_category` VALUES (37, '泰森', 35);
INSERT INTO `easybuy_product_category` VALUES (38, '周黑鸭', 35);
INSERT INTO `easybuy_product_category` VALUES (39, '泡面', 0);
INSERT INTO `easybuy_product_category` VALUES (40, '康师傅', 39);
INSERT INTO `easybuy_product_category` VALUES (41, '统一', 39);
INSERT INTO `easybuy_product_category` VALUES (42, '今麦郎', 39);
INSERT INTO `easybuy_product_category` VALUES (43, '巧克力', 0);
INSERT INTO `easybuy_product_category` VALUES (44, '德芙', 43);
INSERT INTO `easybuy_product_category` VALUES (45, '徐福记', 43);
INSERT INTO `easybuy_product_category` VALUES (46, '费列罗', 43);
INSERT INTO `easybuy_product_category` VALUES (47, '葡萄干', 0);
INSERT INTO `easybuy_product_category` VALUES (48, '好想你·', 47);
INSERT INTO `easybuy_product_category` VALUES (49, '楼兰蜜语', 47);
INSERT INTO `easybuy_product_category` VALUES (50, '西域美农', 47);
INSERT INTO `easybuy_product_category` VALUES (51, '薯片', 0);
INSERT INTO `easybuy_product_category` VALUES (52, '乐事', 51);
INSERT INTO `easybuy_product_category` VALUES (53, '上好佳', 51);
INSERT INTO `easybuy_product_category` VALUES (54, '可比克', 51);
INSERT INTO `easybuy_product_category` VALUES (55, '糖果', 0);
INSERT INTO `easybuy_product_category` VALUES (56, '阿尔卑斯', 55);
INSERT INTO `easybuy_product_category` VALUES (57, '绿箭', 55);
INSERT INTO `easybuy_product_category` VALUES (58, '大白兔', 55);
INSERT INTO `easybuy_product_category` VALUES (59, '肉脯', 0);
INSERT INTO `easybuy_product_category` VALUES (60, '来伊份', 59);
INSERT INTO `easybuy_product_category` VALUES (61, '蜀道香', 59);
INSERT INTO `easybuy_product_category` VALUES (62, '老四川', 59);
INSERT INTO `easybuy_product_category` VALUES (63, '牛奶', 0);
INSERT INTO `easybuy_product_category` VALUES (64, '伊利', 63);
INSERT INTO `easybuy_product_category` VALUES (65, '蒙牛', 63);
INSERT INTO `easybuy_product_category` VALUES (66, '沃尔玛', 63);
INSERT INTO `easybuy_product_category` VALUES (67, '特产', 0);
INSERT INTO `easybuy_product_category` VALUES (68, '元朗', 67);
INSERT INTO `easybuy_product_category` VALUES (69, '广州酒家', 67);
INSERT INTO `easybuy_product_category` VALUES (70, '莲香楼', 67);

-- ----------------------------
-- Table structure for easybuy_shop
-- ----------------------------
DROP TABLE IF EXISTS `easybuy_shop`;
CREATE TABLE `easybuy_shop`  (
  `es_id` int(11) NOT NULL AUTO_INCREMENT,
  `es_ep_file_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `es_ep_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `es_ep_price` decimal(10, 0) NULL DEFAULT NULL,
  `es_eod_quantity` int(11) NULL DEFAULT NULL,
  `es_ep_stock` int(11) NULL DEFAULT NULL,
  `es_ep_id` int(11) NULL DEFAULT NULL,
  `es_eu_user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `es_valid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`es_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of easybuy_shop
-- ----------------------------
INSERT INTO `easybuy_shop` VALUES (19, 't1.jpg', '口味硬糖棒棒糖', 10, 2, 280, 33, '搁浅', 2);
INSERT INTO `easybuy_shop` VALUES (22, 'l3.jpg', '香辣味面筋辣条', 14, 1, 120, 17, '123123', 2);
INSERT INTO `easybuy_shop` VALUES (23, 'n3.jpg', '旺仔 牛奶 ', 52, 1, 58, 41, '搁浅', 2);
INSERT INTO `easybuy_shop` VALUES (24, 't2.jpg', '绿箭无糖薄荷糖口香糖', 7, 1, 56, 34, '搁浅', 2);
INSERT INTO `easybuy_shop` VALUES (25, 'n2.jpg', '低脂高钙牛奶', 45, 1, 60, 40, '搁浅', 2);
INSERT INTO `easybuy_shop` VALUES (26, 'z3.jpg', '广东广州特产传统糕点', 46, 1, 80, 44, '搁浅', 2);
INSERT INTO `easybuy_shop` VALUES (27, 'q1.jpg', '洽洽五香瓜子', 23, 1, 30, 12, '搁浅', 2);
INSERT INTO `easybuy_shop` VALUES (28, 't2.jpg', '绿箭无糖薄荷糖口香糖', 7, 1, 55, 34, '123123', 2);
INSERT INTO `easybuy_shop` VALUES (29, 'q3.jpg', '葵花籽奶油味瓜子', 10, 1, 46, 14, '123123', 2);
INSERT INTO `easybuy_shop` VALUES (31, 'l2.jpg', '口水娃辣条辣片', 13, 2, 30, 16, '123123', 2);
INSERT INTO `easybuy_shop` VALUES (32, 's1.jpg', '乐事薯片', 15, 1, 78, 30, '123123', 2);
INSERT INTO `easybuy_shop` VALUES (33, 'n2.jpg', '低脂高钙牛奶', 45, 1, 59, 40, '123123', 2);
INSERT INTO `easybuy_shop` VALUES (34, 'z2.jpg', '广东特产广式饼酥糕点', 66, 1, 45, 43, '123123', 2);
INSERT INTO `easybuy_shop` VALUES (35, 'z1.jpg', '广东特产鸡蛋卷', 66, 1, 45, 42, '123123', 1);

-- ----------------------------
-- Table structure for easybuy_user
-- ----------------------------
DROP TABLE IF EXISTS `easybuy_user`;
CREATE TABLE `easybuy_user`  (
  `EU_USER_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `EU_USER_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `EU_PASSWORD` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `EU_SEX` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `EU_BIRTHDAY` datetime(0) NULL DEFAULT NULL,
  `EU_EMAIL` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EU_MOBILE` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EU_ADDRESS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EU_STATUS` int(6) NOT NULL,
  PRIMARY KEY (`EU_USER_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of easybuy_user
-- ----------------------------
INSERT INTO `easybuy_user` VALUES ('123123', '管理员', '123123', '男', '2019-01-09 00:00:00', '123123@qq.com', '13000000001', '墨尔本', 2);
INSERT INTO `easybuy_user` VALUES ('admin', '管理员', '123', '男', '2018-04-11 00:00:00', '2531174288@qq.com', '13666666666', '肇庆学院安安', 2);
INSERT INTO `easybuy_user` VALUES ('test1', '管理员', '123', '男', '2019-01-02 00:00:00', '123@qq.com', '13202610508', '肇庆学院', 2);
INSERT INTO `easybuy_user` VALUES ('搁浅', '箫荷', '123456', '女', '2019-01-07 00:00:00', '201624133125@163.com', '15323712312', '肇庆市', 1);
INSERT INTO `easybuy_user` VALUES ('蜕变', '林晓锋', '123456', '男', '2019-01-15 00:00:00', '2027134964@qq.com', '15521935616', '肇庆市', 1);
INSERT INTO `easybuy_user` VALUES ('风子', '林昌坤', '123', '男', '2019-01-01 00:00:00', '2531174288@qq.com', '13202610508', '肇庆学院托马斯宿舍', 1);

SET FOREIGN_KEY_CHECKS = 1;
