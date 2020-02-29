/*
 Navicat Premium Data Transfer

 Source Server         : Database
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : weibo

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 29/02/2020 21:28:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dz
-- ----------------------------
DROP TABLE IF EXISTS `dz`;
CREATE TABLE `dz`  (
  `uname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `textname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dz
-- ----------------------------
INSERT INTO `dz` VALUES ('10000', '全玻璃iPhone外壳');
INSERT INTO `dz` VALUES ('test', '全玻璃iPhone外壳');
INSERT INTO `dz` VALUES ('测试', '全玻璃iPhone外壳');
INSERT INTO `dz` VALUES ('admin', '2333');

-- ----------------------------
-- Table structure for pl
-- ----------------------------
DROP TABLE IF EXISTS `pl`;
CREATE TABLE `pl`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pl
-- ----------------------------
INSERT INTO `pl` VALUES (1, 'admin', '测试评论是否可以正常使用', '2020-02-23 22:13:33', '全玻璃iPhone外壳');
INSERT INTO `pl` VALUES (2, '10000', '测试测试', '2020-02-23 22:13:55', '全玻璃iPhone外壳');
INSERT INTO `pl` VALUES (3, '23333', '测试不同文章', '2020-02-23 22:13:55', '2333');
INSERT INTO `pl` VALUES (4, '1235', '测试', '2020-02-23 22:13:55', '笑一笑');
INSERT INTO `pl` VALUES (5, '1235', '卧槽，真的牛逼', '2020-02-25 22:18:39', '全玻璃iPhone外壳');
INSERT INTO `pl` VALUES (6, 'admin', '玄学，真的难搞', '2020-02-25 22:20:58', '全玻璃iPhone外壳');
INSERT INTO `pl` VALUES (7, 'admin', '继续测试', '2020-02-25 22:22:21', '全玻璃iPhone外壳');
INSERT INTO `pl` VALUES (8, '1235', '继续测试', '2020-02-25 22:23:02', '全玻璃iPhone外壳');
INSERT INTO `pl` VALUES (9, '12315', '真的厉害', '2020-02-26 13:14:25', '全玻璃iPhone外壳');
INSERT INTO `pl` VALUES (10, 'admin', '测试测试', '2020-02-28 14:24:28', '2333');
INSERT INTO `pl` VALUES (11, 'admin', '测试评论233', '2020-02-28 14:47:16', '全玻璃iPhone外壳');
INSERT INTO `pl` VALUES (12, 'admin', '测试评论', '2020-02-28 14:47:58', '全玻璃iPhone外壳');
INSERT INTO `pl` VALUES (13, 'test', '测试', '2020-02-28 14:47:58', '动漫推荐');
INSERT INTO `pl` VALUES (14, 'test1', '测试', '2020-02-28 14:47:58', '动漫推荐');
INSERT INTO `pl` VALUES (15, 'test', '测试', '2020-02-28 14:47:58', '动漫推荐');
INSERT INTO `pl` VALUES (16, 'admin', '笑一笑', '2020-02-28 14:47:58', '笑一笑');
INSERT INTO `pl` VALUES (17, 'admin', '测试是啥', '2020-02-29 21:12:29', '笑一笑');
INSERT INTO `pl` VALUES (18, '10000', '自己评论', '2020-02-29 21:15:18', '测试');
INSERT INTO `pl` VALUES (19, '10000', '测试', '2020-02-29 21:15:59', '全玻璃iPhone外壳');
INSERT INTO `pl` VALUES (20, '10000', '测试', '2020-02-29 21:16:16', '全玻璃iPhone外壳');
INSERT INTO `pl` VALUES (21, '10000', '测试', '2020-02-29 21:16:29', '全玻璃iPhone外壳');
INSERT INTO `pl` VALUES (22, '10000', '测试评论', '2020-02-29 21:19:02', '新闻');
INSERT INTO `pl` VALUES (23, 'admin', '测试评论', '2020-02-29 21:24:48', '新闻');
INSERT INTO `pl` VALUES (24, 'admin', '测试评论', '2020-02-29 21:25:07', '新闻');

-- ----------------------------
-- Table structure for subr
-- ----------------------------
DROP TABLE IF EXISTS `subr`;
CREATE TABLE `subr`  (
  `sub` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `besub` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subr
-- ----------------------------
INSERT INTO `subr` VALUES ('admin', 'test1');
INSERT INTO `subr` VALUES ('测试', 'admin');
INSERT INTO `subr` VALUES ('test', 'admin');
INSERT INTO `subr` VALUES ('admin', '测试');
INSERT INTO `subr` VALUES ('admin', '10000');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `power` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sub` int(255) NULL DEFAULT NULL,
  `fans` int(255) NULL DEFAULT NULL,
  `owntext` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin', '管理员', 3, 2, 10);
INSERT INTO `user` VALUES (2, '10000', '10000', '用户', 0, 1, 4);
INSERT INTO `user` VALUES (3, 'test', '123456', '用户', 1, 0, 4);
INSERT INTO `user` VALUES (4, 'test1', '123456', '用户', 0, 0, 0);
INSERT INTO `user` VALUES (5, '测试', '123456', '用户', 1, 1, 0);
INSERT INTO `user` VALUES (6, 'test2', '123456', '用户', 0, 0, 0);
INSERT INTO `user` VALUES (7, 'test3', '123456', '用户', 0, 0, 0);
INSERT INTO `user` VALUES (8, 'test4', '123456', '用户', 0, 0, 0);
INSERT INTO `user` VALUES (9, 'test5', '123456', '用户', 0, 0, 0);

-- ----------------------------
-- Table structure for wz
-- ----------------------------
DROP TABLE IF EXISTS `wz`;
CREATE TABLE `wz`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dianzan` int(255) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wz
-- ----------------------------
INSERT INTO `wz` VALUES (1, '全玻璃iPhone外壳', '        <p>根据国外媒体报道，苹果一直在研发一款具有环绕式触摸屏的全玻璃iPhone。该专利被称为“带玻璃外壳的电子设备”，美国专利号为20200057525，专利包括该物体的外观图。</p>\r\n        <p>根据这份专利的描述来看，全玻璃iPhone外壳其实是由多块玻璃组成，但看起来更像是一个整体。通过苹果的技术，令其在视觉上和触觉上看起来是无缝的，\r\n            这样就很好的解决了批量生产中的工艺问题，毕竟要用一整块玻璃的难度和成本有点高！</p>', '社会', 3, 'admin', '2020-02-23 22:13:33');
INSERT INTO `wz` VALUES (2, '2333', '2333', '体育', 1, 'admin', '2020-02-23 12:12:32');
INSERT INTO `wz` VALUES (3, '笑一笑', '拍照时候别人看镜头：自然大方得体漂亮特别上相', '搞笑', 0, '10000', '2020-02-27 12:12:32');
INSERT INTO `wz` VALUES (4, '时尚优先', 'iphone很火', '时尚', 0, 'test', '2020-02-23 12:12:32');
INSERT INTO `wz` VALUES (5, '动漫推荐', '推荐看海贼王', '动漫', 0, 'admin', '2020-02-23 12:12:32');
INSERT INTO `wz` VALUES (6, '电影推荐', '今年奥斯卡：《寄生虫》', '电影', 0, 'admin', '2020-02-23 12:12:32');
INSERT INTO `wz` VALUES (7, '美女测试', '看啥呢，看？', '美女', 0, '10000', '2020-02-23 12:12:32');
INSERT INTO `wz` VALUES (8, '新闻', '【天津回应拾荒老人遭暴力执法已约谈物业负责人，严肃处理该工作人员】据红桥区咸阳北路街道，28日，发现有网民在新浪微博发布我街道某社区发生肢体冲突的视频后，第一时间予以核实处置。现将情况说明如下：28日，我街综合执法与物业公司联合清理彰武楼小区堆放杂物时，物业公司人员与视频中的老人发生肢体冲突，后社区负责人现场协调，物业公司与该工作人员向老人道歉，并得到老人谅解。我街已对物业公司负责人进行了约谈，责成严肃处理该工作人员', '社会', 0, '10000', '2020-02-23 12:12:32');
INSERT INTO `wz` VALUES (9, '测试1', '测试', '社会', 0, 'test', '2020-02-23 22:13:33');
INSERT INTO `wz` VALUES (10, '测试1', '测试', '社会', 0, 'test', '2020-02-23 22:13:33');
INSERT INTO `wz` VALUES (11, '测试', '测试时', '搞笑', 0, 'admin', '2020-02-29 18:45:23');
INSERT INTO `wz` VALUES (12, '测试2', '测试', '社会', 0, 'test', '2020-02-23 22:13:33');
INSERT INTO `wz` VALUES (13, '测试', '23333', '搞笑', 0, '10000', '2020-02-29 21:14:59');

SET FOREIGN_KEY_CHECKS = 1;
