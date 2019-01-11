/*
 Navicat Premium Data Transfer

 Source Server         : Color-Cloud
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : flask_bbs

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 22/11/2018 15:34:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for classify
-- ----------------------------
DROP TABLE IF EXISTS `classify`;
CREATE TABLE `classify`  (
  `classify_id` int(11) NOT NULL AUTO_INCREMENT,
  `classify_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`classify_id`) USING BTREE,
  UNIQUE INDEX `classify_name`(`classify_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classify
-- ----------------------------
INSERT INTO `classify` VALUES (5, 'basketball');
INSERT INTO `classify` VALUES (1, 'fation');
INSERT INTO `classify` VALUES (6, 'football');
INSERT INTO `classify` VALUES (2, 'movie');
INSERT INTO `classify` VALUES (3, 'music');
INSERT INTO `classify` VALUES (4, 'picture');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `commentor` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `commentor_id` int(11) NULL DEFAULT NULL,
  `post_id` int(11) NULL DEFAULT NULL,
  `comment_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`comment_id`) USING BTREE,
  INDEX `commentor_id`(`commentor_id`) USING BTREE,
  INDEX `post_id`(`post_id`) USING BTREE,
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`commentor_id`) REFERENCES `user` (`u_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (1, 'json', 1, 1, 'ghjcvwy就看海关付款', '2018-11-19 16:59:28', 0);
INSERT INTO `comments` VALUES (2, 'request', 2, 2, 's\'d\'f山东分局更何况u', '2018-11-19 16:59:31', 0);
INSERT INTO `comments` VALUES (3, 'json', 1, 3, '法国航空苏尔古很疯狂u', '2018-11-19 16:59:33', 0);
INSERT INTO `comments` VALUES (4, 'return', 4, 4, 'iu法国vi与无色', '2018-11-19 16:59:36', 0);
INSERT INTO `comments` VALUES (5, 'script', 6, 5, '客房价格v恶意我说如果', '2018-11-19 16:59:39', 0);
INSERT INTO `comments` VALUES (6, 'return', 4, 6, 'er\'g\'h\'k二哥很快就有雇佣军', '2018-11-19 16:59:42', 0);

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts`  (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_classify_id` int(11) NULL DEFAULT NULL,
  `post_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `poster` int(11) NULL DEFAULT NULL,
  `post_content` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `click_rate` int(11) NULL DEFAULT NULL,
  `is_delete` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`post_id`) USING BTREE,
  INDEX `post_classify_id`(`post_classify_id`) USING BTREE,
  INDEX `poster`(`poster`) USING BTREE,
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`post_classify_id`) REFERENCES `classify` (`classify_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`poster`) REFERENCES `user` (`u_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES (1, 1, 'hi回法国滨海', 1, '吃饭v给v维持台海v', '2018-11-19 16:52:01', 853, 0);
INSERT INTO `posts` VALUES (2, 2, 'y\'f有风度与', 2, 'v与微软高级员工v吧', '2018-11-19 16:54:49', 64, 0);
INSERT INTO `posts` VALUES (3, 1, '士大夫v共和国', 4, 'b\'h不和女剑客会让他国家核事故', '2018-11-19 16:54:52', 789, 0);
INSERT INTO `posts` VALUES (4, 2, '得分是否', 4, 't\'yt\'y\'j他已经如今他的衣服让记忆', '2018-11-19 16:54:59', 9878, 0);
INSERT INTO `posts` VALUES (5, 3, ' 二分色地方是否', 6, 'h\'j好几年替人酷虎', '2018-11-22 16:55:02', 8989, 0);
INSERT INTO `posts` VALUES (6, 4, ' 萨芬', 3, '原声带iofg', '2018-11-22 16:55:05', 29485, 0);
INSERT INTO `posts` VALUES (7, 1, ' 色地方', 1, '吃饭v给v维持台海v', '2018-11-19 16:52:01', 853, 0);
INSERT INTO `posts` VALUES (8, 2, 'e\'f二分', 2, 'v与微软高级员工v吧', '2018-11-19 16:54:49', 64, 0);
INSERT INTO `posts` VALUES (9, 1, 'se\'d色的法国', 4, 'b\'h不和女剑客会让他国家核事故', '2018-11-19 16:54:52', 789, 0);
INSERT INTO `posts` VALUES (10, 2, ' e饿啊', 4, 't\'yt\'y\'j他已经如今他的衣服让记忆', '2018-11-19 16:54:59', 9878, 0);
INSERT INTO `posts` VALUES (11, 3, 'd的发射点', 6, 'h\'j好几年替人酷虎', '2018-11-22 16:55:02', 8989, 0);
INSERT INTO `posts` VALUES (12, 4, ' 违法', 3, '原声带iofg', '2018-11-22 16:55:05', 29485, 0);
INSERT INTO `posts` VALUES (13, 1, ' 富文为', 1, '吃饭v给v维持台海v', '2018-11-19 16:52:01', 853, 0);
INSERT INTO `posts` VALUES (14, 2, 'd\'s但是发给我二分', 2, 'v与微软高级员工v吧', '2018-11-19 16:54:49', 64, 0);
INSERT INTO `posts` VALUES (15, 1, 'e\'t儿童我色弱通过', 4, 'b\'h不和女剑客会让他国家核事故', '2018-11-19 16:54:52', 789, 0);
INSERT INTO `posts` VALUES (16, 2, 'eer\'t儿童五', 4, 't\'yt\'y\'j他已经如今他的衣服让记忆', '2018-11-19 16:54:59', 9878, 0);
INSERT INTO `posts` VALUES (17, 3, 'e儿童', 6, 'h\'j好几年替人酷虎', '2018-11-22 16:55:02', 8989, 0);
INSERT INTO `posts` VALUES (18, 4, '为人父通过', 3, '原声带iofg', '2018-11-22 16:55:05', 29485, 0);
INSERT INTO `posts` VALUES (19, 1, 'e而通过输入', 1, '吃饭v给v维持台海v', '2018-11-19 16:52:01', 853, 0);
INSERT INTO `posts` VALUES (20, 2, 'er而故事的', 2, 'v与微软高级员工v吧', '2018-11-19 16:54:49', 64, 0);
INSERT INTO `posts` VALUES (21, 1, 't图文他', 4, 'b\'h不和女剑客会让他国家核事故', '2018-11-19 16:54:52', 789, 0);
INSERT INTO `posts` VALUES (22, 2, 'y一台人影好', 4, 't\'yt\'y\'j他已经如今他的衣服让记忆', '2018-11-19 16:54:59', 9878, 0);
INSERT INTO `posts` VALUES (23, 3, 'g\'h给后人', 6, 'h\'j好几年替人酷虎', '2018-11-22 16:55:02', 8989, 0);
INSERT INTO `posts` VALUES (24, 4, 't桃花运', 3, '原声带iofg', '2018-11-22 16:55:05', 29485, 0);
INSERT INTO `posts` VALUES (25, 5, 'sdfd安抚', 5, '发生的发生大法师的第三方', '2018-11-15 16:32:35', 876, 0);
INSERT INTO `posts` VALUES (26, 5, 'sdfd安抚', 5, '发生的发生大法师的第三方', '2018-11-15 16:32:35', 876, 0);
INSERT INTO `posts` VALUES (27, 5, 'sdfd安抚', 6, '发生的发生大法师的第三方', '2018-11-09 16:36:55', 32, 0);
INSERT INTO `posts` VALUES (28, 5, 't桃花运', 5, '发生的发达省份', '2018-11-09 16:36:55', 21853, 0);
INSERT INTO `posts` VALUES (29, 5, 't桃花运', 1, '梵蒂冈梵蒂冈回复', '2018-11-09 16:36:55', 88, 0);
INSERT INTO `posts` VALUES (30, 5, 't桃花运', 2, '法规回复沟沟壑壑', '2018-11-09 16:36:55', 48, 0);
INSERT INTO `posts` VALUES (31, 5, 't图文他', 3, '如同一条也让', '2018-11-09 16:36:55', 846, 0);
INSERT INTO `posts` VALUES (32, 5, '防守打法', 4, '法规和房管局和法国', '2018-11-09 16:36:55', 21, 0);
INSERT INTO `posts` VALUES (33, 5, '个人股', 1, '好好干激光焊接', '2018-11-09 16:36:55', 32185, 0);
INSERT INTO `posts` VALUES (34, 6, '阿萨德', 2, '放电饭锅电饭锅如果', '2018-11-09 16:36:55', 89, 0);
INSERT INTO `posts` VALUES (35, 6, '黑寡妇', 3, '人文关怀', '2018-11-09 16:36:55', 35, 0);
INSERT INTO `posts` VALUES (36, 6, '非共和国', 4, '恢复供货的', '2018-11-09 16:36:55', 4, 0);
INSERT INTO `posts` VALUES (37, 6, '儿童热', 5, '法国东方哥特人头', '2018-11-09 16:36:55', 123, 0);
INSERT INTO `posts` VALUES (38, 6, '尔特让他给', 6, '导入法规和内容的', '2018-11-09 16:36:55', 32185, 0);
INSERT INTO `posts` VALUES (39, 6, '尔特让他热', 1, '地方个人个人个人是', '2018-11-09 16:36:55', 8531, 0);
INSERT INTO `posts` VALUES (40, 6, '儿童容易坏', 2, '电饭锅电饭锅山东人', '2018-11-09 16:36:55', 8, 0);
INSERT INTO `posts` VALUES (41, 6, '如何', 3, '恢复供货的发生过', '2018-11-09 16:36:55', 84132, 0);
INSERT INTO `posts` VALUES (42, 3, '阿萨德', 2, '放电饭锅电饭锅如果', '2018-11-09 16:36:55', 89, 0);
INSERT INTO `posts` VALUES (43, 3, '黑寡妇', 3, '人文关怀', '2018-11-09 16:36:55', 35, 0);
INSERT INTO `posts` VALUES (44, 3, '非共和国', 4, '恢复供货的', '2018-11-09 16:36:55', 4, 0);
INSERT INTO `posts` VALUES (45, 3, '儿童热', 5, '法国东方哥特人头', '2018-11-09 16:36:55', 123, 0);
INSERT INTO `posts` VALUES (46, 4, '尔特让他给', 6, '导入法规和内容的', '2018-11-09 16:36:55', 32185, 0);
INSERT INTO `posts` VALUES (47, 4, '尔特让他热', 1, '地方个人个人个人是', '2018-11-09 16:36:55', 8531, 0);
INSERT INTO `posts` VALUES (48, 4, '儿童容易坏', 2, '电饭锅电饭锅山东人', '2018-11-09 16:36:55', 8, 0);
INSERT INTO `posts` VALUES (49, 4, '如何', 3, '恢复供货的发生过', '2018-11-09 16:36:55', 84132, 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_delete` int(11) NULL DEFAULT NULL,
  `is_active` int(11) NULL DEFAULT NULL,
  `is_superuser` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`u_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'json', '123', '123@163.com', 'qwed', 0, 1, 0);
INSERT INTO `user` VALUES (2, 'request', '123', '123@163.com', 'adfqadd', 0, 1, 0);
INSERT INTO `user` VALUES (3, 'resonpose', '123', '123@163.com', 'dsadqwd', 0, 1, 0);
INSERT INTO `user` VALUES (4, 'return', '123', '123@163.com', 'wqdawsd', 0, 1, 0);
INSERT INTO `user` VALUES (5, 'render', '123', '123@163.com', 'scsadwqa', 0, 1, 0);
INSERT INTO `user` VALUES (6, 'script', '123', '123@163.com', 'qwd', 0, 1, 0);

-- ----------------------------
-- Table structure for user_to_user
-- ----------------------------
DROP TABLE IF EXISTS `user_to_user`;
CREATE TABLE `user_to_user`  (
  `u_id` int(11) NOT NULL,
  `n_uid` int(11) NOT NULL,
  PRIMARY KEY (`u_id`, `n_uid`) USING BTREE,
  INDEX `n_uid`(`n_uid`) USING BTREE,
  CONSTRAINT `user_to_user_ibfk_1` FOREIGN KEY (`n_uid`) REFERENCES `usernext` (`n_uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_to_user_ibfk_2` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_to_user
-- ----------------------------
INSERT INTO `user_to_user` VALUES (1, 1);
INSERT INTO `user_to_user` VALUES (2, 1);
INSERT INTO `user_to_user` VALUES (4, 1);
INSERT INTO `user_to_user` VALUES (1, 2);
INSERT INTO `user_to_user` VALUES (3, 2);
INSERT INTO `user_to_user` VALUES (4, 2);
INSERT INTO `user_to_user` VALUES (6, 2);
INSERT INTO `user_to_user` VALUES (1, 3);
INSERT INTO `user_to_user` VALUES (2, 4);
INSERT INTO `user_to_user` VALUES (3, 5);
INSERT INTO `user_to_user` VALUES (6, 5);
INSERT INTO `user_to_user` VALUES (2, 6);
INSERT INTO `user_to_user` VALUES (5, 6);

-- ----------------------------
-- Table structure for usernext
-- ----------------------------
DROP TABLE IF EXISTS `usernext`;
CREATE TABLE `usernext`  (
  `un_id` int(11) NOT NULL AUTO_INCREMENT,
  `n_uid` int(11) NOT NULL,
  `n_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`un_id`) USING BTREE,
  UNIQUE INDEX `n_uid`(`n_uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usernext
-- ----------------------------
INSERT INTO `usernext` VALUES (1, 1, 'json');
INSERT INTO `usernext` VALUES (2, 2, 'request');
INSERT INTO `usernext` VALUES (3, 3, 'response');
INSERT INTO `usernext` VALUES (4, 4, 'return');
INSERT INTO `usernext` VALUES (5, 5, 'render');
INSERT INTO `usernext` VALUES (6, 6, 'script');

SET FOREIGN_KEY_CHECKS = 1;
