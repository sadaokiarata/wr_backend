/*
 Navicat Premium Data Transfer

 Source Server         : 46.101.175.101_whorubserver
 Source Server Type    : MySQL
 Source Server Version : 100126
 Source Host           : 46.101.175.101:3306
 Source Schema         : whorub

 Target Server Type    : MySQL
 Target Server Version : 100126
 File Encoding         : 65001

 Date: 15/04/2018 07:17:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for advertisements
-- ----------------------------
DROP TABLE IF EXISTS `advertisements`;
CREATE TABLE `advertisements`  (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `post_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `post_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contact_method` tinyint(4) NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `show_email` tinyint(4) NULL DEFAULT NULL,
  `work_hour1` tinyint(4) NULL DEFAULT NULL,
  `work_hour2` tinyint(4) NULL DEFAULT NULL,
  `repost_interval` tinyint(4) NULL DEFAULT NULL,
  `repost_count` int(11) NOT NULL DEFAULT 0,
  `repost_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `post_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `category` int(11) NULL DEFAULT NULL,
  `post_city` int(11) NULL DEFAULT NULL,
  `opened` tinyint(4) NULL DEFAULT 1,
  `latitude` float NULL DEFAULT NULL,
  `longitude` float NULL DEFAULT NULL,
  `premium_open` tinyint(4) NOT NULL DEFAULT 0,
  `premium_period` tinyint(4) NULL DEFAULT NULL,
  `premium_interval` tinyint(4) NULL DEFAULT NULL,
  `premium_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `paid` int(4) NOT NULL DEFAULT 0,
  `movetotop_times` int(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`post_id`) USING BTREE,
  INDEX `advertisements_ibfk_2`(`user_id`) USING BTREE,
  INDEX `advertisements_ibfk_3`(`category`) USING BTREE,
  INDEX `post_city`(`post_city`) USING BTREE,
  CONSTRAINT `advertisements_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `advertisements_ibfk_3` FOREIGN KEY (`category`) REFERENCES `lookup_category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `advertisements_ibfk_4` FOREIGN KEY (`post_city`) REFERENCES `lookup_city` (`city_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 381 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of advertisements
-- ----------------------------
INSERT INTO `advertisements` VALUES (231, '4545', '4545', '45453487893247589437580973425897234895732489758934275893475089734285743208957348925789437500000000000000000349888888888888888888888888888890537849570893427589723458973428957423895738492758923475098374589732489574395783489570394872589347589304725890347598', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-17 00:06:41', NULL, 34, '2017-09-17 00:06:41', 4, 51, 1, 38.9598, -95.2552, 1, 1, 1, '2018-04-14 22:42:00', 0, 0);
INSERT INTO `advertisements` VALUES (232, '3453', '45345', '345345', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-17 00:07:17', NULL, 34, '2017-09-17 00:07:17', 4, 51, 1, 38.9598, -95.2552, 1, 1, 1, '2018-04-14 22:45:00', 0, 0);
INSERT INTO `advertisements` VALUES (233, '3434', '3434', '34343', '343434', '3434', 1, NULL, 0, 0, 0, 1, 0, '2017-09-17 02:47:23', NULL, 34, '2017-09-17 02:47:23', 4, 51, 0, 38.9598, -95.2552, 1, 1, 1, '2018-04-14 22:31:00', 0, 0);
INSERT INTO `advertisements` VALUES (234, NULL, '454', '7893247589437580973425897234895732489758934275893475089734285743208957348925789437500000000000000000349888888888888888888888888888890537849570893427589723458973428957423895738492758923475098374589732489574395783489570394872589347589304725890347598', '4545', NULL, 1, NULL, 0, 0, 8, 1, 96, '2017-09-21 22:13:13', NULL, 34, '2017-09-17 03:36:04', 1, 51, 0, 38.9598, -95.2552, 1, 1, 1, '2018-04-14 22:37:00', 0, 0);
INSERT INTO `advertisements` VALUES (235, '544545', '5454', '454545', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-17 03:36:49', NULL, 34, '2017-09-17 03:36:49', 4, 442, 0, 36.9907, -86.4436, 1, 1, 1, '2018-04-14 22:32:00', 0, 0);
INSERT INTO `advertisements` VALUES (236, '3434', '3434', '343434', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-18 23:50:52', '343434', 34, '2017-09-18 23:50:52', 4, 53, 0, 39.194, -96.5924, 1, 1, 1, '2018-04-14 22:36:00', 0, 0);
INSERT INTO `advertisements` VALUES (237, 'adsfa', 'asdf', 'asdfasdfsdf', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-19 02:18:36', NULL, 34, '2017-09-19 02:18:36', 4, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-19 02:18:36', 0, 0);
INSERT INTO `advertisements` VALUES (238, NULL, 'asdsd', 'asdsd', 'asdasd', NULL, 1, NULL, 0, 2, 9, 6, 1, '2017-09-19 03:57:31', NULL, 34, '2017-09-19 03:57:31', 1, 442, 0, 36.9907, -86.4436, 0, 1, 1, '2017-09-19 03:57:31', 0, 0);
INSERT INTO `advertisements` VALUES (239, '565', '5656', '5656', '5656', '5656', 1, NULL, 0, 0, 0, 1, 0, '2017-09-19 04:06:02', NULL, 41, '2017-09-19 04:06:02', 4, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-19 04:06:02', 0, 0);
INSERT INTO `advertisements` VALUES (240, NULL, '45', '4545', '454545', NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-19 04:07:47', NULL, 34, '2017-09-19 04:07:47', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-19 04:07:47', 0, 0);
INSERT INTO `advertisements` VALUES (241, NULL, 'This is my test', 'This is my test', 'This is my test', 'This is my test', 1, NULL, 0, 0, 0, 1, 0, '2017-09-20 00:25:17', NULL, 34, '2017-09-20 00:25:17', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-20 00:25:17', 0, 0);
INSERT INTO `advertisements` VALUES (242, '454', '4545', '4545', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-20 01:29:20', NULL, 34, '2017-09-20 01:29:20', 4, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-20 01:29:20', 0, 0);
INSERT INTO `advertisements` VALUES (243, NULL, '1212', '1212', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-20 03:08:29', NULL, 34, '2017-09-20 03:08:29', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-20 03:08:29', 0, 0);
INSERT INTO `advertisements` VALUES (244, NULL, '2132', '321323', '2323', '23434', 1, NULL, 0, 0, 0, 1, 0, '2017-09-20 03:09:51', NULL, 34, '2017-09-20 03:09:51', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-20 03:09:51', 0, 0);
INSERT INTO `advertisements` VALUES (245, NULL, '3434', '343434', '3434', NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-20 03:46:38', NULL, 34, '2017-09-20 03:46:38', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-20 03:46:38', 0, 0);
INSERT INTO `advertisements` VALUES (246, NULL, 'dfsdf', 'dafsdf', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-20 04:01:26', NULL, 34, '2017-09-20 04:01:26', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-20 04:01:26', 0, 0);
INSERT INTO `advertisements` VALUES (247, 'sdadf', 'asdfsadf', '454545', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-20 04:03:55', NULL, 34, '2017-09-20 04:03:55', 4, 442, 0, 36.9907, -86.4436, 0, 1, 1, '2017-09-20 04:03:55', 0, 0);
INSERT INTO `advertisements` VALUES (248, '1212', '1212', '12121212', '1212', NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-20 05:48:11', NULL, 34, '2017-09-20 05:48:11', 4, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-20 05:48:11', 0, 0);
INSERT INTO `advertisements` VALUES (249, NULL, '2323', '2323', '23', NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-20 05:51:18', NULL, 34, '2017-09-20 05:51:18', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-20 05:51:18', 0, 0);
INSERT INTO `advertisements` VALUES (250, NULL, '5656', '5656', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-20 05:54:33', NULL, 41, '2017-09-20 05:54:33', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-20 05:54:33', 0, 0);
INSERT INTO `advertisements` VALUES (251, NULL, '324', 'sdfasdf', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-20 05:55:09', NULL, 34, '2017-09-20 05:55:09', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-20 05:55:09', 0, 0);
INSERT INTO `advertisements` VALUES (252, NULL, '6776', '76767', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-20 05:55:42', NULL, 34, '2017-09-20 05:55:42', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-20 05:55:42', 0, 0);
INSERT INTO `advertisements` VALUES (253, NULL, '4545', '4545454545', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-20 06:13:48', NULL, 34, '2017-09-20 06:13:48', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-20 06:13:48', 0, 0);
INSERT INTO `advertisements` VALUES (254, 'asasa', 'sasasa', 'asasasasasasas', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-20 19:24:08', NULL, 34, '2017-09-20 19:24:08', 4, 442, 0, 36.9907, -86.4436, 0, 1, 1, '2017-09-20 19:24:08', 0, 0);
INSERT INTO `advertisements` VALUES (255, NULL, 'asd', 'asdf\ndfdf\ndf\ndfdf\ndfd\nfd\nfdf\ndf\ndfd', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-20 22:14:29', NULL, 34, '2017-09-20 22:14:29', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-20 22:14:29', 0, 0);
INSERT INTO `advertisements` VALUES (256, 'asdfasdf', 'asdfasdf', 'asdfasdfasdf', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-21 00:58:31', 'Tokyo Japan', 34, '2017-09-21 00:58:31', 4, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-21 00:58:31', 0, 0);
INSERT INTO `advertisements` VALUES (257, '3434', '343434', '343434', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-21 01:00:08', 'Tokyo Japan', 34, '2017-09-21 01:00:08', 4, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-21 01:00:08', 0, 0);
INSERT INTO `advertisements` VALUES (258, 'asdf', 'sadfsadf', 'asdfsadf', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-21 01:01:10', 'Tokyo Japan', 34, '2017-09-21 01:01:10', 4, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-21 01:01:10', 0, 0);
INSERT INTO `advertisements` VALUES (259, NULL, 'asdfasdf', 'adsfsdf', 'asdfasdf', NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-21 01:01:58', 'Tokyo Japan', 34, '2017-09-21 01:01:58', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-21 01:01:58', 0, 0);
INSERT INTO `advertisements` VALUES (260, NULL, 'sdfa', 'sdfasdf', 'sadfasdf', NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-21 01:13:47', 'Tokyo Japan', 34, '2017-09-21 01:13:47', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-21 01:13:47', 0, 0);
INSERT INTO `advertisements` VALUES (261, NULL, '2323', '2323', '2323', NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-21 01:15:08', 'Tokyo Japan', 34, '2017-09-21 01:15:08', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-21 01:15:08', 0, 0);
INSERT INTO `advertisements` VALUES (262, NULL, '123213', '213123', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-21 05:38:13', NULL, 41, '2017-09-21 05:38:13', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-21 05:38:13', 0, 0);
INSERT INTO `advertisements` VALUES (263, NULL, 'NewTitle', '4234234', '123213', NULL, 0, NULL, 0, 0, 0, 1, 0, '2017-09-21 05:42:00', NULL, 34, '2017-09-21 05:42:00', 1, 51, 1, 38.969, -95.2103, 0, 1, 1, '2017-09-21 05:42:00', 0, 0);
INSERT INTO `advertisements` VALUES (264, NULL, 'sdaf', 'adfsda', 'fsd', NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-22 06:35:20', NULL, 34, '2017-09-22 06:35:20', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-22 06:35:20', 0, 0);
INSERT INTO `advertisements` VALUES (265, NULL, '876786', '453453', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-22 06:36:12', NULL, 34, '2017-09-22 06:36:12', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-22 06:36:12', 0, 0);
INSERT INTO `advertisements` VALUES (266, NULL, '456', '456456456', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-22 06:40:31', NULL, 34, '2017-09-22 06:40:31', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-22 06:40:31', 0, 0);
INSERT INTO `advertisements` VALUES (267, NULL, 'asd', 'asdasdasd', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-22 06:52:38', NULL, 34, '2017-09-22 06:52:38', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-22 06:52:38', 0, 0);
INSERT INTO `advertisements` VALUES (268, NULL, 'adsf', 'asdfdf', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-22 06:54:12', NULL, 34, '2017-09-22 06:54:12', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-22 06:54:12', 0, 0);
INSERT INTO `advertisements` VALUES (269, NULL, '123', '23123', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-22 06:57:02', NULL, 34, '2017-09-22 06:57:02', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-22 06:57:02', 0, 0);
INSERT INTO `advertisements` VALUES (270, NULL, 'asdf', 'asdfasdfasdfs', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-22 06:59:11', NULL, 34, '2017-09-22 06:59:11', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-22 06:59:11', 0, 0);
INSERT INTO `advertisements` VALUES (271, NULL, 'asdf', 'dfadf', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-22 13:30:54', NULL, 34, '2017-09-22 13:30:54', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-22 13:30:54', 0, 0);
INSERT INTO `advertisements` VALUES (272, NULL, '54444', '45646\n546456', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-22 14:03:35', NULL, 34, '2017-09-22 14:03:35', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-22 14:03:35', 0, 0);
INSERT INTO `advertisements` VALUES (273, NULL, '343', '43434', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-22 14:05:32', NULL, 34, '2017-09-22 14:05:32', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-22 14:05:32', 0, 0);
INSERT INTO `advertisements` VALUES (274, NULL, 'asd', 'sadasd', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-22 14:07:44', NULL, 34, '2017-09-22 14:07:44', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-22 14:07:44', 0, 0);
INSERT INTO `advertisements` VALUES (275, NULL, '121', '212', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-22 14:17:00', NULL, 34, '2017-09-22 14:17:00', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-22 14:17:00', 0, 0);
INSERT INTO `advertisements` VALUES (276, NULL, 'asdasd', 'asdasd', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-22 14:19:31', NULL, 34, '2017-09-22 14:19:31', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-22 14:19:31', 0, 0);
INSERT INTO `advertisements` VALUES (277, NULL, 'asds', 'dasda', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-22 14:20:27', NULL, 34, '2017-09-22 14:20:27', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-22 14:20:27', 0, 0);
INSERT INTO `advertisements` VALUES (278, NULL, 'adsf', 'adsfasdf', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-22 14:20:56', NULL, 34, '2017-09-22 14:20:56', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-22 14:20:56', 0, 0);
INSERT INTO `advertisements` VALUES (279, NULL, 'asd', 'asdasd', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-22 14:39:47', NULL, 34, '2017-09-22 14:39:47', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-22 14:39:47', 0, 0);
INSERT INTO `advertisements` VALUES (299, NULL, 'sadsdfas', 'dfsadf', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-22 16:14:13', NULL, 34, '2017-09-22 16:14:13', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-22 16:14:13', 0, 0);
INSERT INTO `advertisements` VALUES (300, NULL, '435345', '435345', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-22 16:17:00', NULL, 34, '2017-09-22 16:17:00', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-22 16:17:00', 0, 0);
INSERT INTO `advertisements` VALUES (301, NULL, 'asdsad', 'asdasdasd', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-22 16:18:34', NULL, 34, '2017-09-22 16:18:34', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-22 16:18:34', 0, 0);
INSERT INTO `advertisements` VALUES (302, NULL, 'asdfsd', 'sdafsdf', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-22 16:19:09', NULL, 34, '2017-09-22 16:19:09', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-22 16:19:09', 0, 0);
INSERT INTO `advertisements` VALUES (303, NULL, '435', '45345345', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-22 16:20:05', NULL, 34, '2017-09-22 16:20:05', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-22 16:20:05', 0, 0);
INSERT INTO `advertisements` VALUES (304, NULL, 'New', 'New', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-22 16:21:56', NULL, 34, '2017-09-22 16:21:56', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-22 16:21:56', 0, 0);
INSERT INTO `advertisements` VALUES (305, '223', '2323', '2323', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-22 16:45:27', NULL, 34, '2017-09-22 16:45:27', 4, 51, 0, 38.9575, -95.3064, 0, 1, 1, '2017-09-22 16:45:27', 0, 0);
INSERT INTO `advertisements` VALUES (306, NULL, '656', '5656', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-22 22:31:28', NULL, 34, '2017-09-22 22:31:28', 1, 51, 0, 38.9598, -95.2552, 0, 1, 1, '2017-09-22 22:31:28', 0, 0);
INSERT INTO `advertisements` VALUES (307, NULL, 'BowlinngGreen', 'asdfsdfdsaf', 'https://www.com.com', NULL, 1, NULL, 0, 0, 0, 1, 0, '2017-09-23 15:21:42', NULL, 34, '2017-09-23 15:21:42', 1, 442, 0, 36.9907, -86.4436, 0, 1, 1, '2017-09-23 15:21:42', 0, 0);
INSERT INTO `advertisements` VALUES (309, 'Jenny', 'Got it popping', 'Come by and check us out, you will not regret', NULL, '3418409404', 0, NULL, 0, 9, 22, 1, 0, '2018-01-22 14:24:04', '1730 blake street, denver colorado, 80202', 59, '2017-10-21 22:35:07', 4, 761, 1, 39.7516, -104.997, 1, 2, 1, '2018-04-14 22:50:00', 0, 0);
INSERT INTO `advertisements` VALUES (310, 'Jenny', 'Few weeks and we will go beta!', 'Beta version coming soon', NULL, '2138489404', 1, NULL, 0, 0, 0, 1, 0, '2017-10-24 22:03:46', '4620 convoy street, san diego ca', 60, '2017-10-24 22:03:46', 4, 481, 1, 32.8243, -117.156, 1, 1, 1, '2018-04-14 22:53:00', 0, 0);
INSERT INTO `advertisements` VALUES (311, NULL, 'Website wil be live by end of this month', 'November is starting date for the whorub', NULL, '6613419559', 1, NULL, 0, 0, 0, 1, 0, '2017-10-26 19:39:58', '3183 wilshire blvd los angeles ca', 60, '2017-10-26 19:39:58', 1, 442, 1, 34.0624, -118.291, 0, 1, 1, '2017-10-26 19:39:58', 0, 0);
INSERT INTO `advertisements` VALUES (312, NULL, 'Website wil be live by end of this month', 'November is starting date for the whorub', NULL, '6613419559', 1, NULL, 0, 0, 0, 1, 0, '2017-10-26 19:39:58', '3183 wilshire blvd los angeles ca', 60, '2017-10-26 19:39:58', 1, 442, 1, 34.0624, -118.291, 0, 1, 1, '2017-10-26 19:39:58', 0, 0);
INSERT INTO `advertisements` VALUES (313, NULL, 'Here we go', 'Here we go', NULL, '7838989398', 1, NULL, 0, 0, 0, 1, 0, '2017-10-26 19:59:55', '3075 wilshire blvd los angeles ca', 60, '2017-10-26 19:59:55', 1, 450, 1, 34.0621, -118.289, 0, 1, 1, '2017-10-26 19:59:55', 0, 0);
INSERT INTO `advertisements` VALUES (314, '4545454', '545454', '54545', '4545454', '54545454545', 1, NULL, 0, 0, 0, 1, 0, '2017-10-30 09:24:57', NULL, 34, '2017-10-30 09:24:57', 4, 442, 0, 36.9907, -86.4436, 1, 1, 1, '2018-04-14 22:55:00', 0, 0);
INSERT INTO `advertisements` VALUES (315, '234567890', '33456789', '34567890', '34567890', '34567890', 1, NULL, 0, 0, 0, 1, 0, '2017-10-30 13:10:47', NULL, 34, '2017-10-30 13:10:47', 5, 442, 0, 36.9907, -86.4436, 1, 1, 1, '2018-04-14 23:00:00', 0, 0);
INSERT INTO `advertisements` VALUES (316, 'Timmy', 'Here we go again!', 'Please work!', NULL, '30483848939', 1, NULL, 0, 9, 22, 1, 1, '2017-10-30 21:06:48', '3075 wilshire blvd los angeles ca 90010', 60, '2017-10-30 21:06:48', 4, 499, 0, 34.0621, -118.289, 1, 2, 1, '2018-04-14 23:05:00', 0, 0);
INSERT INTO `advertisements` VALUES (317, 'asd', 'asdsd', 'asdsadasd', 'sadasdasd', '11111111111', 1, NULL, 0, 0, 0, 1, 0, '2017-10-31 11:30:25', NULL, 34, '2017-10-31 11:30:25', 4, 442, 0, 36.9907, -86.4436, 1, 1, 1, '2018-04-14 23:10:00', 0, 0);
INSERT INTO `advertisements` VALUES (319, NULL, '111121', '1212', 'http://www.com.ddd', '111111111111111', 1, NULL, 0, 0, 0, 1, 0, '2017-11-12 07:28:35', NULL, 34, '2017-11-12 07:28:35', 1, 442, 1, 36.9907, -86.4436, 0, 1, 1, '2017-11-12 07:28:35', 0, 0);
INSERT INTO `advertisements` VALUES (320, 'adsf', 'sadfd', 'fadsfadsfsadfasd', 'fs.co.dom', '3333333333333333', 1, NULL, 0, 0, 9, 1, 0, '2018-04-03 08:00:00', NULL, 34, '2017-11-12 07:33:05', 4, 442, 1, 36.9907, -86.4436, 1, 1, 1, '2018-04-14 22:18:00', 0, 0);
INSERT INTO `advertisements` VALUES (321, NULL, 'asd', 'asdsad', 's.comd.com', '111111', 1, NULL, 0, 0, 0, 1, 0, '2017-11-12 17:23:12', '1111', 34, '2017-11-12 17:23:12', 1, 442, 1, 31.8402, -89.9121, 1, 1, 1, '2018-04-14 22:20:00', 0, 0);
INSERT INTO `advertisements` VALUES (322, '454', '44545', '454545', '4545', '45454545454', 1, NULL, 0, 0, 0, 1, 0, '2017-11-13 08:41:31', '454545', 34, '2017-11-13 08:41:31', 4, 442, 1, 36.9907, -86.4436, 0, 1, 1, '2017-11-13 08:41:31', 0, 0);
INSERT INTO `advertisements` VALUES (323, 'Jenny', 'Here we go!  Things are working much better', 'Things are working much better', NULL, '2134850000', 1, NULL, 0, 9, 21, 1, 1, '2017-11-14 23:03:59', '9025 sydney court san diego ca 92122', 60, '2017-11-14 23:03:59', NULL, NULL, 0, 32.8717, -117.202, 1, 1, 1, '2018-04-14 22:23:00', 0, 0);
INSERT INTO `advertisements` VALUES (324, 'asdfsd', 'afsdfa', 'sdfasdfasdf', 'asdfasdfasdf', '3434343434', 1, NULL, 0, 0, 0, 1, 0, '2017-11-14 23:16:37', NULL, 34, '2017-11-14 23:16:37', 4, 442, 0, 36.9907, -86.4436, 0, 1, 1, '2017-11-14 23:16:37', 0, 0);
INSERT INTO `advertisements` VALUES (325, NULL, '343', '434343', '4343', '434343434', 1, NULL, 0, 0, 0, 1, 0, '2017-11-15 01:43:52', NULL, 34, '2017-11-15 01:43:52', 1, 442, 1, 36.9907, -86.4436, 0, 1, 1, '2017-11-15 01:43:52', 0, 0);
INSERT INTO `advertisements` VALUES (326, '1236', '24569', '3453453', 'http://3434.comdf', '3434234234234234', 1, NULL, 0, 0, 0, 1, 0, '2017-11-15 01:46:55', 'erewrewr', 34, '2017-11-15 01:46:55', 4, 442, 0, 25.1284, 121.782, 0, 1, 1, '2017-11-15 01:46:55', 0, 0);
INSERT INTO `advertisements` VALUES (327, 'dasfasdf', 'dsafdsfa', 'dsafdaf', NULL, '6631413434', 1, NULL, 0, 5, 18, 1, 0, '2018-01-22 14:24:04', '9025 sydney court san diego ca 92122', 59, '2017-11-15 02:30:14', 4, 595, 1, 32.8717, -117.202, 0, 1, 1, '2017-11-15 02:30:14', 0, 0);
INSERT INTO `advertisements` VALUES (328, NULL, 'dfgfdg', 'dsafdsf', NULL, '2321342234', 1, NULL, 0, 7, 17, 8, 10, '2017-11-15 02:31:54', '9025 sydney court san diego ca 92122', 59, '2017-11-15 02:31:54', 1, 598, 0, 32.8717, -117.202, 0, 1, 1, '2017-11-15 02:31:54', 0, 0);
INSERT INTO `advertisements` VALUES (330, NULL, 'kdfslfjdks', 'kdjlsfdsfkj', NULL, '5354343353', 1, NULL, 0, 10, 0, 1, 0, '2018-01-22 14:24:04', '9025 sydney court san diego ca 92122', 59, '2017-11-20 02:01:13', 1, 573, 1, 32.8717, -117.202, 0, 1, 1, '2017-11-20 02:01:13', 1, 0);
INSERT INTO `advertisements` VALUES (331, NULL, 'kldjsflafdj', 'kdflsjfksl', NULL, '6613418500', 1, NULL, 0, 9, 0, 1, 0, '2018-04-06 17:00:00', '9025 sydney court san diego ca 92122', 59, '2017-11-20 23:50:32', 1, 766, 1, 32.8717, -117.202, 1, 2, 1, '2018-04-14 22:24:00', 1, 0);
INSERT INTO `advertisements` VALUES (332, NULL, 'Relax', 'Finish this please!', NULL, '5134142323', 1, NULL, 0, 11, 0, 1, 0, '2018-04-03 19:00:00', '3075 wilshire blvd los angeles ca 90010', 60, '2017-11-21 00:03:40', 1, 766, 1, 34.0621, -118.289, 0, 1, 1, '2017-11-21 00:03:40', 1, 0);
INSERT INTO `advertisements` VALUES (333, 'fdsgfd', 'fgsdfg', 'fdgsfdg', NULL, '6623434343', 1, NULL, 0, 9, 0, 1, 0, '2018-02-27 17:00:00', '3075 wilshire blvd los angeles ca 90010', 59, '2017-11-21 15:45:54', 4, 180, 1, 34.0621, -118.289, 1, 4, 1, '2018-04-14 22:25:00', 1, 0);
INSERT INTO `advertisements` VALUES (334, NULL, 'kkjdjfsjldfsl', 'kldjslfkadfs', NULL, '2134592020', 1, NULL, 0, 10, 0, 1, 41, '2018-04-14 18:00:00', '3075 wilshire blvd los angeles ca 90010', 60, '2017-11-22 00:21:33', 1, 170, 1, 34.0621, -118.289, 1, 4, 1, '2018-04-14 22:27:00', 1, 0);
INSERT INTO `advertisements` VALUES (335, NULL, 'Hurry up!', 'Let\'s go live please!', NULL, '6192393232', 1, NULL, 0, 10, 0, 1, 41, '2018-04-14 18:00:00', '3075 wilshire blvd los angeles ca 90010', 60, '2017-11-22 22:08:11', 1, 766, 1, 34.0621, -118.289, 1, 3, 1, '2018-04-14 22:51:00', 1, 0);
INSERT INTO `advertisements` VALUES (336, NULL, 'Soon to be finished with this website...', 'We are soon to be finished with this website... I hope everything will be successful!', NULL, '6613418474', 1, NULL, 0, 10, 0, 1, 40, '2018-04-14 18:00:00', '9025 sydney court san diego ca 92122', 60, '2017-11-23 01:37:58', 1, 766, 1, 32.8717, -117.202, 1, 1, 1, '2018-04-14 22:52:00', 1, 0);
INSERT INTO `advertisements` VALUES (337, NULL, 'How hard is it to implement new function?', 'Can we change user interface for improvement?\n\nPlease let me know', NULL, '6718389499', 1, NULL, 0, 12, 0, 1, 41, '2018-04-14 20:00:00', '800 south harvard blvd los angeles ca 90010', 59, '2017-11-23 01:52:31', 1, 766, 1, 34.0576, -118.304, 1, 4, 1, '2018-04-14 22:38:00', 1, 0);
INSERT INTO `advertisements` VALUES (338, NULL, 'Time to launch, and I am hungry to be successful', 'Let\'s launch this asap.  When are we going to start to make money?  I hope soon', NULL, '2138404940', 1, NULL, 0, 11, 0, 1, 41, '2018-04-14 19:00:00', '3075 wilshire blvd los angeles ca 90010', 59, '2017-11-23 01:58:47', 1, 766, 1, 34.0621, -118.289, 1, 4, 1, '2018-04-14 22:56:00', 1, 0);
INSERT INTO `advertisements` VALUES (339, NULL, 'Time to go live!', 'Let\'s get this going! So excited to go live!', NULL, '6193418499', 1, NULL, 0, 11, 0, 1, 41, '2018-04-14 19:00:00', '9025 sydney court san diego ca 92122', 62, '2017-11-23 02:14:55', 1, 766, 1, 32.8717, -117.202, 1, 3, 1, '2018-04-14 22:46:00', 1, 0);
INSERT INTO `advertisements` VALUES (340, NULL, 'Hey Hey Hey', 'Let\'s see if this work, everyday reposting', 'http://www.bing.com', '2132432222', 1, NULL, 0, 8, 0, 1, 42, '2018-04-14 16:00:00', '9025 sydney court san diego ca 92122', 59, '2017-11-23 19:15:36', 1, 766, 1, 32.8717, -117.202, 1, 1, 1, '2018-04-14 22:58:00', 1, 0);
INSERT INTO `advertisements` VALUES (341, NULL, 'Get ready', 'We are getting ready to go live, and I am super excited!', NULL, '6613413434', 1, NULL, 0, 13, 0, 1, 46, '2018-04-14 21:00:00', '9025 sydney court san diego ca 92122', 60, '2017-11-26 20:48:05', 1, 766, 1, 32.8717, -117.202, 1, 4, 1, '2018-04-14 23:15:00', 1, 0);
INSERT INTO `advertisements` VALUES (342, NULL, '3434', '3434', '34343434', '3434343', 1, NULL, 0, 0, 0, 1, 0, '2017-11-27 17:10:12', NULL, 34, '2017-11-27 17:10:12', 1, 766, 1, 33.9773, -118.167, 0, 1, 1, '2017-11-27 17:10:12', 1, 0);
INSERT INTO `advertisements` VALUES (343, NULL, 'kdfjslf', 'dkljfslewou', NULL, '2134894948', 1, NULL, 0, 10, 0, 1, 41, '2018-04-14 18:00:00', '9025 sydney court san diego ca 92122', 59, '2017-11-27 21:17:11', 1, 766, 1, 32.8717, -117.202, 1, 3, 1, '2018-04-14 23:17:00', 1, 0);
INSERT INTO `advertisements` VALUES (344, NULL, 'alksdjfewf', 'sdl;kfapifakl', NULL, '66128387837', 1, NULL, 0, 0, 0, 1, 0, '2017-12-08 00:05:53', '3010 wilshire blvd los angeles ca 90010', 59, '2017-12-08 00:05:53', 1, 544, 1, 34.0615, -118.287, 0, 1, 1, '2017-12-08 00:05:53', 1, 0);
INSERT INTO `advertisements` VALUES (345, NULL, 'ffdgsfdg', 'fdgsdfgdsg', NULL, '661341553', 1, NULL, 0, 3, 0, 1, 438, '2018-04-14 11:00:00', '9025 sydney court san diego ca 92122', 60, '2017-12-25 11:31:57', 1, 766, 1, 32.8717, -117.202, 1, 4, 1, '2018-04-14 22:39:00', 0, 0);
INSERT INTO `advertisements` VALUES (346, NULL, 'ffdgsfdg', 'fdgsdfgdsg', NULL, '661341553', 1, NULL, 0, 3, 0, 1, 438, '2018-04-14 11:00:00', '9025 sydney court san diego ca 92122', 60, '2017-12-25 11:34:11', 1, 766, 1, 32.8717, -117.202, 1, 4, 1, '2018-04-14 22:47:00', 1, 0);
INSERT INTO `advertisements` VALUES (347, NULL, 'adsfd', 'asdfas', 'www.whorub.com', '341341341', 0, NULL, 0, 10, 0, 1, 441, '2018-04-14 18:00:00', '9025 sydney court san diego ca 92122', 60, '2018-01-05 19:22:54', 1, 766, 1, 32.8717, -117.202, 1, 4, 1, '2018-04-14 22:21:00', 1, 0);
INSERT INTO `advertisements` VALUES (348, NULL, 'adsfd', 'asdfas', 'www.whorub.com', '341341341', 0, NULL, 0, 10, 0, 1, 441, '2018-04-14 18:00:00', '9025 sydney court san diego ca 92122', 60, '2018-01-05 19:22:55', 1, 766, 1, 32.8717, -117.202, 1, 4, 1, '2018-04-14 22:22:00', 0, 0);
INSERT INTO `advertisements` VALUES (349, NULL, 'Hello', 'Here we go Testing!', 'www.whorub.com', '663493939', 1, NULL, 0, 9, 0, 1, 442, '2018-04-14 17:00:00', '9025 sydney court sd ca 92122', 59, '2018-01-08 17:19:24', 1, 766, 1, 32.8717, -117.202, 1, 4, 1, '2018-04-14 23:04:00', 1, 0);
INSERT INTO `advertisements` VALUES (350, NULL, 'Hello 2', 'Hot and ready', 'www.whorub.com', '6341341341', 1, NULL, 0, 10, 0, 1, 441, '2018-04-14 18:00:00', '9025 sydney court sd ca 92122', 59, '2018-01-08 17:36:24', 1, 766, 1, 32.8717, -117.202, 1, 4, 1, '2018-04-14 22:41:00', 1, 0);
INSERT INTO `advertisements` VALUES (351, NULL, 'Hello 3', 'Get Ready!', 'www.whorub.com', '3452323423', 1, NULL, 0, 11, 0, 1, 441, '2018-04-14 19:00:00', '9025 sydney court sd ca 92122', 59, '2018-01-08 20:32:51', 1, 766, 1, 32.8717, -117.202, 1, 4, 1, '2018-04-14 23:12:00', 1, 0);
INSERT INTO `advertisements` VALUES (352, NULL, 'Hello 4', 'here we go', 'www.whorub.com', '55132341343', 1, NULL, 0, 0, 0, 1, 0, '2018-01-22 14:24:04', '3075 wilshire blvd los angeles ca 90010', 59, '2018-01-08 20:42:07', 1, 766, 1, 34.0621, -118.289, 1, 4, 1, '2018-04-14 22:28:00', 1, 0);
INSERT INTO `advertisements` VALUES (353, NULL, 'Hello New 1', 'NEw 1', 'www.whorub.com', '518181818181', 1, NULL, 0, 13, 0, 1, 440, '2018-04-14 21:00:00', '9025 sydney court sd ca 92122', 59, '2018-01-16 17:53:01', 1, 766, 1, 32.8717, -117.202, 1, 4, 1, '2018-04-14 22:26:00', 0, 0);
INSERT INTO `advertisements` VALUES (354, NULL, 'Hello New 2', 'NEw 2', 'www.whorub.com', '6134134134', 1, NULL, 0, 13, 0, 1, 440, '2018-04-14 21:00:00', '3075 wilshire blvd los angeles ca 90010', 59, '2018-01-17 18:08:23', 1, 766, 1, 34.0621, -118.289, 1, 4, 1, '2018-04-14 22:54:00', 0, 0);
INSERT INTO `advertisements` VALUES (355, NULL, 'Test1', '10am', NULL, '66134134134', 1, NULL, 0, 9, 0, 1, 444, '2018-04-14 17:00:00', '9025 sydney court sd ca 92122', 59, '2018-01-23 09:03:29', 1, 766, 1, 32.8717, -117.202, 1, 4, 1, '2018-04-14 23:01:00', 1, 0);
INSERT INTO `advertisements` VALUES (356, NULL, 'Test2', '11am', NULL, '51341341341', 1, NULL, 0, 11, 0, 1, 443, '2018-04-14 19:00:00', '3075 wilshire blvd la ca 90010', 59, '2018-01-23 09:05:39', 1, 766, 1, 34.0621, -118.289, 1, 4, 1, '2018-04-14 23:06:00', 1, 0);
INSERT INTO `advertisements` VALUES (357, NULL, 'Test 3', '12pm', NULL, '53423443414', 1, NULL, 0, 13, 0, 1, 442, '2018-04-14 21:00:00', '9025 sydney court sd ca 92122', 59, '2018-01-23 09:07:54', 1, 766, 1, 32.8717, -117.202, 1, 1, 1, '2018-04-14 23:14:00', 0, 0);
INSERT INTO `advertisements` VALUES (358, NULL, 'Test 5', 'Test 5', NULL, '3238848848', 1, NULL, 0, 9, 0, 1, 48, '2018-04-14 17:00:00', '9025 sydney court sd ca 92122', 59, '2018-02-08 03:29:14', 1, 766, 1, 32.8717, -117.202, 1, 4, 1, '2018-04-14 22:44:00', 1, 0);
INSERT INTO `advertisements` VALUES (359, 'Test2-----', 'Test2-------123213', 'asdfasdfasdf', 'sadfasdf', '111111111', 1, NULL, 0, 0, 0, 1, 0, '2018-02-08 04:36:05', NULL, 34, '2018-02-08 04:36:05', 4, 766, 1, 34.0288, -118.199, 0, 1, 1, '2018-02-08 04:36:05', 1, 0);
INSERT INTO `advertisements` VALUES (360, NULL, 'Test 6', '1 pm auto repost', NULL, '21348593839323', 1, NULL, 0, 13, 0, 1, 49, '2018-04-14 21:00:00', '9025 sydney court sd ca 92122', 59, '2018-02-08 06:03:10', 1, 766, 1, 32.8717, -117.202, 1, 4, 1, '2018-04-14 22:35:00', 1, 0);
INSERT INTO `advertisements` VALUES (361, NULL, 'Test1pm1', 'Test1pm1', 'www.whorub.com', '61341341498', 1, NULL, 0, 11, 0, 1, 455, '2018-04-14 19:00:00', '9025 sydney court sd ca 92122', 59, '2018-02-21 18:06:45', 1, 766, 1, 32.8725, -117.202, 1, 4, 1, '2018-04-14 22:57:00', 0, 0);
INSERT INTO `advertisements` VALUES (362, NULL, 'Test1pm1', 'Test1pm1', 'www.whorub.com', '61341341498', 1, NULL, 0, 11, 0, 1, 455, '2018-04-14 19:00:00', '9025 sydney court sd ca 92122', 59, '2018-02-21 18:07:42', 1, 766, 1, 32.8725, -117.202, 1, 4, 1, '2018-04-14 22:59:00', 1, 0);
INSERT INTO `advertisements` VALUES (363, NULL, 'Test1pm2', 'Test1pm2', 'www.whorub.com', '65613341411111111111', 1, NULL, 0, 11, 0, 1, 455, '2018-04-14 19:00:00', '9025 sydney court sd ca 92122', 59, '2018-02-21 18:09:23', 1, 766, 1, 32.8725, -117.202, 1, 4, 1, '2018-04-14 23:02:00', 1, 0);
INSERT INTO `advertisements` VALUES (364, NULL, 'Test1pm3', 'Test1pm3', 'www.whorub.com', '32323422342342342342', 1, NULL, 0, 11, 0, 1, 455, '2018-04-14 19:00:00', '9025 sydney court sd ca 92122', 59, '2018-02-21 18:12:34', 1, 766, 1, 32.8725, -117.202, 1, 4, 1, '2018-04-14 23:08:00', 1, 0);
INSERT INTO `advertisements` VALUES (365, NULL, 'Test1pm3', 'Test1pm3', 'www.whorub.com', '23234234342', 1, NULL, 0, 11, 0, 1, 455, '2018-04-14 19:00:00', '9025 sydney ct sd ca 92122', 59, '2018-02-21 18:14:54', 1, 766, 1, 32.8725, -117.202, 1, 4, 1, '2018-04-14 23:13:00', 1, 0);
INSERT INTO `advertisements` VALUES (366, NULL, 'test1pm4', 'test1pm4', 'www.whorub.com', '65324324243242432432', 1, NULL, 0, 11, 0, 1, 455, '2018-04-14 19:00:00', '9025 sydney ct sd ca 921222', 59, '2018-02-21 18:16:42', 1, 766, 1, 33.9518, -118.229, 1, 4, 1, '2018-04-14 23:16:00', 1, 0);
INSERT INTO `advertisements` VALUES (367, NULL, 'Test1pm5', 'Test1pm5', 'www.whorub.com', '619343412', 1, NULL, 0, 11, 0, 1, 0, '2018-02-21 19:00:00', '9025 sydney ct sd ca 92122', 59, '2018-02-21 18:29:08', 1, 766, 1, 32.8725, -117.202, 1, 4, 1, '2018-04-14 22:33:00', 0, 0);
INSERT INTO `advertisements` VALUES (368, NULL, 'Test1pm5', 'Test1pm5', 'www.whorub.com', '619343412', 1, NULL, 0, 11, 0, 1, 455, '2018-04-14 19:00:00', '9025 sydney ct sd ca 92122', 59, '2018-02-21 18:29:51', 1, 766, 1, 32.8725, -117.202, 1, 4, 1, '2018-04-14 22:34:00', 1, 0);
INSERT INTO `advertisements` VALUES (369, NULL, 'Test1pm6', 'Test1pm6', 'www.whorub.com', '6183883838383', 1, NULL, 0, 11, 0, 1, 455, '2018-04-14 19:00:00', '9025 sydney ct sd ca 92122', 59, '2018-02-21 18:34:12', 1, 766, 1, 32.8725, -117.202, 1, 4, 1, '2018-04-14 22:40:00', 1, 0);
INSERT INTO `advertisements` VALUES (370, NULL, 'Test1pm7', 'Test1pm7', 'www.whorub.com', '212341341434334', 1, NULL, 0, 11, 0, 1, 455, '2018-04-14 19:00:00', '9025 sydney court sd ca 92122', 59, '2018-02-21 18:55:30', 1, 766, 1, 32.8725, -117.202, 1, 4, 1, '2018-04-14 23:07:00', 1, 0);
INSERT INTO `advertisements` VALUES (371, NULL, 'Test1pm8', 'Test1pm8', 'www.whorub.com', '6223343242342', 1, NULL, 0, 11, 0, 1, 455, '2018-04-14 19:00:00', NULL, 59, '2018-02-21 18:57:02', 1, 766, 1, 33.9561, -118.226, 1, 4, 1, '2018-04-14 23:09:00', 1, 0);
INSERT INTO `advertisements` VALUES (372, NULL, 'Test1pm9', 'Test1pm9', 'www.whorub.com', '43434343434', 1, NULL, 0, 11, 0, 1, 455, '2018-04-14 19:00:00', '9025 sydney ct sd ca 92122', 59, '2018-02-21 18:58:18', 1, 766, 1, 32.8725, -117.202, 1, 4, 1, '2018-04-14 23:11:00', 1, 0);
INSERT INTO `advertisements` VALUES (373, NULL, 'Test1pm10', 'Test1pm10', 'www.whorub.com', '53434342342342342', 1, NULL, 0, 11, 0, 1, 456, '2018-04-14 19:00:00', '9025 sydney ct sd ca 92122', 59, '2018-02-21 19:14:23', 1, 766, 1, 32.8725, -117.202, 1, 4, 1, '2018-04-14 22:30:00', 1, 0);
INSERT INTO `advertisements` VALUES (374, NULL, 'Test11am1', 'Test11am1', 'whorub.com', '6194838383', 1, NULL, 0, 11, 0, 1, 456, '2018-04-14 19:00:00', '9025 sydney ct sd ca 92122', 59, '2018-02-22 03:19:17', 1, 99, 1, 32.8725, -117.202, 1, 4, 1, '2018-04-14 22:29:00', 1, 0);
INSERT INTO `advertisements` VALUES (376, NULL, 'Test', 'TEst', 'www.whorub.com', '6193434343', 1, NULL, 0, 11, 0, 1, 460, '2018-04-14 19:00:00', '9025 sydney ct sd ca 92122', 60, '2018-02-22 04:28:51', 1, 766, 1, 32.8725, -117.202, 1, 4, 1, '2018-04-14 22:43:00', 1, 0);
INSERT INTO `advertisements` VALUES (377, NULL, 'Test11am11', 'Test11am11', 'whorub.com', '6193419399', 1, NULL, 0, 11, 0, 1, 456, '2018-04-14 19:00:00', '9025 sydney court sd ca 92122', 60, '2018-02-22 05:42:31', 1, 766, 1, 32.8725, -117.202, 1, 4, 1, '2018-04-14 23:03:00', 1, 0);
INSERT INTO `advertisements` VALUES (378, 'Test1', 'Test Tilte', 'Test Description', NULL, NULL, 1, NULL, 0, 0, 0, 1, 0, '2018-03-01 03:49:06', NULL, 65, '2018-03-01 03:49:06', 6, 766, 1, 34.0112, -118.179, 1, 4, 1, '2018-04-14 22:19:00', 1, 0);
INSERT INTO `advertisements` VALUES (379, NULL, 'New hotties', 'Sacramento’s best with hottest ladies', NULL, '9166663932', 0, NULL, 0, 10, 0, 1, 12, '2018-04-14 18:00:00', '5321 Elkhorn blvd Sacramento Ca 95842', 59, '2018-04-07 16:50:45', 1, 716, 1, 38.6872, -121.341, 1, 1, 1, '2018-04-14 22:48:00', 0, 0);
INSERT INTO `advertisements` VALUES (380, NULL, 'New hotties', 'Sacramento’s best with hottest ladies', NULL, '9166663932', 0, NULL, 0, 10, 0, 1, 12, '2018-04-14 18:00:00', '5321 Elkhorn blvd Sacramento Ca 95842', 59, '2018-04-07 16:50:46', 1, 716, 1, 38.6872, -121.341, 1, 1, 1, '2018-04-14 22:49:00', 1, 0);

-- ----------------------------
-- Table structure for conversations
-- ----------------------------
DROP TABLE IF EXISTS `conversations`;
CREATE TABLE `conversations`  (
  `chat_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `contact_id` int(11) NULL DEFAULT NULL,
  `conv_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `conv_direction` int(11) NULL DEFAULT NULL,
  `conv_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `conv_read` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`chat_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 270 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of conversations
-- ----------------------------
INSERT INTO `conversations` VALUES (80, 307, 38, '7676', 0, '2017-09-23 21:55:20', 1);
INSERT INTO `conversations` VALUES (81, 307, 38, '334343', 1, '2017-09-23 22:35:47', 1);
INSERT INTO `conversations` VALUES (82, 307, 38, 'asdsdf', 1, '2017-09-23 22:35:47', 1);
INSERT INTO `conversations` VALUES (83, 307, 38, '333', 1, '2017-09-23 22:35:47', 1);
INSERT INTO `conversations` VALUES (84, 307, 38, '66666', 1, '2017-09-23 22:35:47', 1);
INSERT INTO `conversations` VALUES (85, 307, 38, 'Hello', 1, '2017-09-23 22:35:47', 1);
INSERT INTO `conversations` VALUES (86, 307, 38, '5656', 0, '2017-09-23 21:55:20', 1);
INSERT INTO `conversations` VALUES (87, 307, 38, '454545', 0, '2017-09-23 21:55:20', 1);
INSERT INTO `conversations` VALUES (88, 307, 38, '1212132', 0, '2017-09-23 21:55:20', 1);
INSERT INTO `conversations` VALUES (89, 307, 38, '987897897', 0, '2017-09-23 21:55:20', 1);
INSERT INTO `conversations` VALUES (90, 307, 38, '907978', 0, '2017-09-23 21:55:20', 1);
INSERT INTO `conversations` VALUES (91, 307, 38, '908989', 0, '2017-09-23 21:55:20', 1);
INSERT INTO `conversations` VALUES (92, 307, 38, '12121', 0, '2017-09-23 21:55:20', 1);
INSERT INTO `conversations` VALUES (93, 307, 38, '454545', 1, '2017-09-23 22:35:47', 1);
INSERT INTO `conversations` VALUES (94, 307, 38, '45435345345', 1, '2017-09-23 22:35:47', 1);
INSERT INTO `conversations` VALUES (95, 307, 38, '454545', 1, '2017-09-23 22:35:47', 1);
INSERT INTO `conversations` VALUES (96, 307, 38, '4545', 1, '2017-09-23 22:35:47', 1);
INSERT INTO `conversations` VALUES (97, 307, 38, '4545', 1, '2017-09-23 22:35:47', 1);
INSERT INTO `conversations` VALUES (98, 307, 38, '454545', 1, '2017-09-23 22:35:47', 1);
INSERT INTO `conversations` VALUES (99, 307, 38, '4545', 1, '2017-09-23 22:35:47', 1);
INSERT INTO `conversations` VALUES (100, 307, 38, '', 1, '2017-09-23 22:35:47', 1);
INSERT INTO `conversations` VALUES (101, 307, 38, '343434', 1, '2017-09-23 22:35:47', 1);
INSERT INTO `conversations` VALUES (102, 307, 38, '', 1, '2017-09-23 22:35:47', 1);
INSERT INTO `conversations` VALUES (103, 307, 38, '3434', 1, '2017-09-23 22:35:47', 1);
INSERT INTO `conversations` VALUES (104, 307, 38, '', 1, '2017-09-23 22:35:47', 1);
INSERT INTO `conversations` VALUES (105, 307, 38, '', 1, '2017-09-23 22:35:47', 1);
INSERT INTO `conversations` VALUES (106, 307, 38, 'undefined', 1, '2017-09-23 22:35:47', 1);
INSERT INTO `conversations` VALUES (107, 307, 38, '343434', 1, '2017-09-23 22:35:47', 1);
INSERT INTO `conversations` VALUES (108, 307, 38, '232323', 1, '2017-09-23 22:35:47', 1);
INSERT INTO `conversations` VALUES (109, 307, 38, '2323', 1, '2017-09-23 22:35:47', 1);
INSERT INTO `conversations` VALUES (110, 307, 38, 'undefined', 1, '2017-09-23 22:35:47', 1);
INSERT INTO `conversations` VALUES (122, 307, 38, '', 1, '2017-09-23 22:35:47', 1);
INSERT INTO `conversations` VALUES (123, 307, 38, 'undefined', 1, '2017-09-23 22:35:47', 1);
INSERT INTO `conversations` VALUES (124, 307, 38, '', 1, '2017-09-23 22:35:47', 1);
INSERT INTO `conversations` VALUES (125, 307, 38, '565656', 1, '2017-09-23 22:35:47', 1);
INSERT INTO `conversations` VALUES (126, 307, 38, '', 1, '2017-09-23 22:35:47', 1);
INSERT INTO `conversations` VALUES (127, 307, 38, '4545', 1, '2017-09-23 22:35:47', 1);
INSERT INTO `conversations` VALUES (128, 307, 38, '454545', 1, '2017-09-23 22:35:47', 1);
INSERT INTO `conversations` VALUES (129, 307, 38, '4545', 1, '2017-09-23 22:35:47', 1);
INSERT INTO `conversations` VALUES (130, 307, 38, '454545', 1, '2017-09-23 22:35:47', 1);
INSERT INTO `conversations` VALUES (131, 307, 38, '33434', 0, '2017-09-23 22:37:20', 1);
INSERT INTO `conversations` VALUES (132, 307, 38, '3434', 0, '2017-09-23 22:37:20', 1);
INSERT INTO `conversations` VALUES (133, 307, 38, '343434', 0, '2017-09-23 22:37:20', 1);
INSERT INTO `conversations` VALUES (134, 307, 38, '3434', 1, '2017-09-23 23:46:03', 1);
INSERT INTO `conversations` VALUES (135, 307, 38, '343434', 1, '2017-09-23 23:46:03', 1);
INSERT INTO `conversations` VALUES (136, 307, 38, '343434', 1, '2017-09-23 23:46:03', 1);
INSERT INTO `conversations` VALUES (137, 307, 38, '555', 1, '2017-09-23 23:46:03', 1);
INSERT INTO `conversations` VALUES (138, 307, 38, '232323', 1, '2017-09-23 23:46:03', 1);
INSERT INTO `conversations` VALUES (139, 307, 38, '232323', 1, '2017-09-23 23:46:03', 1);
INSERT INTO `conversations` VALUES (140, 307, 39, '3434', 0, '2017-09-23 23:11:57', 1);
INSERT INTO `conversations` VALUES (141, 307, 39, '3434', 1, '2017-09-23 23:13:16', 1);
INSERT INTO `conversations` VALUES (142, 307, 39, 'e54545', 0, '2017-09-23 23:13:22', 1);
INSERT INTO `conversations` VALUES (143, 307, 39, 'erer', 1, '2017-09-23 23:14:17', 1);
INSERT INTO `conversations` VALUES (144, 307, 39, '343434', 1, '2017-09-23 23:14:17', 1);
INSERT INTO `conversations` VALUES (145, 307, 39, '3434', 1, '2017-09-23 23:14:17', 1);
INSERT INTO `conversations` VALUES (146, 307, 39, '4545', 0, '2017-09-23 23:14:21', 1);
INSERT INTO `conversations` VALUES (147, 307, 39, '4545', 1, '2017-09-23 23:17:39', 1);
INSERT INTO `conversations` VALUES (148, 307, 38, 'http://33434.3434.com', 1, '2017-09-23 23:46:03', 1);
INSERT INTO `conversations` VALUES (149, 307, 39, 'u6786', 0, '2017-09-23 23:18:58', 1);
INSERT INTO `conversations` VALUES (150, 307, 38, '786876', 1, '2017-09-23 23:46:03', 1);
INSERT INTO `conversations` VALUES (151, 307, 39, 'uyi', 0, '2017-09-23 23:18:58', 1);
INSERT INTO `conversations` VALUES (152, 307, 39, '7897', 1, '2017-09-23 23:19:09', 1);
INSERT INTO `conversations` VALUES (153, 307, 39, 'uiyuiy', 0, '2017-09-23 23:19:32', 1);
INSERT INTO `conversations` VALUES (154, 307, 39, '343434', 1, '2017-09-23 23:20:33', 1);
INSERT INTO `conversations` VALUES (155, 307, 39, '5656', 0, '2017-09-23 23:26:58', 1);
INSERT INTO `conversations` VALUES (156, 307, 39, '89897', 0, '2017-09-23 23:26:58', 1);
INSERT INTO `conversations` VALUES (157, 307, 39, '555', 1, '2017-09-23 23:27:06', 1);
INSERT INTO `conversations` VALUES (158, 307, 39, '677', 0, '2017-09-23 23:29:02', 1);
INSERT INTO `conversations` VALUES (159, 307, 39, '5454545', 1, '2017-09-23 23:29:19', 1);
INSERT INTO `conversations` VALUES (160, 307, 39, '444', 0, '2017-09-23 23:30:47', 1);
INSERT INTO `conversations` VALUES (161, 307, 39, '4545', 1, '2017-09-23 23:31:51', 1);
INSERT INTO `conversations` VALUES (162, 307, 39, '4545', 1, '2017-09-23 23:31:51', 1);
INSERT INTO `conversations` VALUES (163, 307, 39, '555', 0, '2017-09-23 23:32:00', 1);
INSERT INTO `conversations` VALUES (164, 307, 39, 'rgjkodfljdfgdfg', 1, '2017-09-23 23:32:12', 1);
INSERT INTO `conversations` VALUES (165, 307, 39, '897', 0, '2017-09-23 23:32:21', 1);
INSERT INTO `conversations` VALUES (166, 307, 39, 'asdasd', 1, '2017-09-23 23:34:05', 1);
INSERT INTO `conversations` VALUES (167, 307, 39, 'fgdfg', 0, '2017-09-23 23:37:57', 1);
INSERT INTO `conversations` VALUES (168, 307, 39, '4454545', 0, '2017-09-23 23:38:22', 1);
INSERT INTO `conversations` VALUES (169, 307, 39, '5656', 1, '2017-09-23 23:39:03', 1);
INSERT INTO `conversations` VALUES (170, 307, 39, '565656', 0, '2017-09-23 23:39:15', 1);
INSERT INTO `conversations` VALUES (171, 307, 39, '345678', 1, '2017-09-23 23:39:28', 1);
INSERT INTO `conversations` VALUES (172, 307, 39, '56566', 0, '2017-09-23 23:39:39', 1);
INSERT INTO `conversations` VALUES (173, 307, 39, '54656456', 1, '2017-09-23 23:39:43', 1);
INSERT INTO `conversations` VALUES (174, 307, 39, 'Hello', 0, '2017-09-23 23:39:54', 1);
INSERT INTO `conversations` VALUES (175, 307, 39, 'I am here', 1, '2017-09-23 23:40:13', 1);
INSERT INTO `conversations` VALUES (176, 307, 39, 'dfsgdfg', 0, '2017-09-23 23:40:59', 1);
INSERT INTO `conversations` VALUES (177, 307, 39, '456456546', 1, '2017-09-23 23:41:08', 1);
INSERT INTO `conversations` VALUES (178, 307, 39, 'WhR', 0, '2017-09-23 23:41:19', 1);
INSERT INTO `conversations` VALUES (179, 307, 38, '5656', 1, '2017-09-23 23:46:03', 1);
INSERT INTO `conversations` VALUES (180, 307, 39, '565656', 1, '2017-09-23 23:42:13', 1);
INSERT INTO `conversations` VALUES (181, 307, 39, 'sdasd', 1, '2017-09-23 23:43:33', 1);
INSERT INTO `conversations` VALUES (182, 307, 38, 'sadasd', 1, '2017-09-23 23:46:03', 1);
INSERT INTO `conversations` VALUES (183, 307, 39, 'asdfdfsdf', 1, '2017-09-23 23:44:03', 1);
INSERT INTO `conversations` VALUES (184, 307, 38, 'sadfsdf', 1, '2017-09-23 23:46:03', 1);
INSERT INTO `conversations` VALUES (185, 307, 38, 'adsfasdf', 1, '2017-09-23 23:46:03', 1);
INSERT INTO `conversations` VALUES (186, 307, 38, 'dfdfdf', 1, '2017-09-23 23:46:03', 1);
INSERT INTO `conversations` VALUES (187, 307, 38, '4545', 0, '2017-09-23 23:46:09', 1);
INSERT INTO `conversations` VALUES (188, 307, 38, '454545', 1, '2017-09-23 23:46:58', 1);
INSERT INTO `conversations` VALUES (189, 307, 38, '566565', 1, '2017-09-23 23:47:08', 1);
INSERT INTO `conversations` VALUES (190, 307, 38, 'fgfgfg', 1, '2017-09-23 23:47:08', 1);
INSERT INTO `conversations` VALUES (191, 307, 38, '565656', 0, '2017-09-23 23:47:14', 1);
INSERT INTO `conversations` VALUES (192, 307, 38, 'fhfghfghggggggg', 0, '2017-09-23 23:47:19', 1);
INSERT INTO `conversations` VALUES (193, 307, 38, 'sdfsdf', 1, '2017-09-24 00:00:38', 1);
INSERT INTO `conversations` VALUES (194, 307, 38, '66787', 0, '2017-09-24 00:01:47', 1);
INSERT INTO `conversations` VALUES (195, 307, 38, '78678', 0, '2017-09-24 00:02:54', 1);
INSERT INTO `conversations` VALUES (196, 307, 38, '87897', 0, '2017-09-24 00:02:54', 1);
INSERT INTO `conversations` VALUES (197, 308, 60, 'Hi! How much can I purchase this for?', 0, '2017-10-21 22:07:55', 1);
INSERT INTO `conversations` VALUES (198, 308, 60, 'Hello?', 0, '2017-11-03 22:38:05', 1);
INSERT INTO `conversations` VALUES (199, 309, 60, 'Hello', 0, '2017-11-03 22:37:37', 1);
INSERT INTO `conversations` VALUES (200, 308, 60, 'It\'s 250909 dollars, please let me know if you are interested.', 1, '2017-11-03 22:38:43', 1);
INSERT INTO `conversations` VALUES (201, 316, 34, 'sdfgfdg', 0, '2017-11-15 01:49:21', 1);
INSERT INTO `conversations` VALUES (202, 316, 34, 'sfdfg', 0, '2017-11-15 01:49:26', 1);
INSERT INTO `conversations` VALUES (203, 316, 34, '576667', 0, '2017-11-15 01:59:24', 1);
INSERT INTO `conversations` VALUES (204, 328, 34, 'dsfdfdf', 0, '2017-11-19 16:54:45', 1);
INSERT INTO `conversations` VALUES (205, 328, 34, 'Hi', 1, '2017-11-19 18:16:15', 1);
INSERT INTO `conversations` VALUES (206, 329, 0, 'sadsadsad', 1, '2017-11-19 17:06:07', 0);
INSERT INTO `conversations` VALUES (207, 328, 34, '7676', 0, '2017-11-19 18:16:24', 1);
INSERT INTO `conversations` VALUES (208, 330, 60, 'Hello', 0, '2017-11-20 02:26:41', 1);
INSERT INTO `conversations` VALUES (209, 330, 60, 'I want to know if this is working ok', 0, '2017-11-20 02:26:51', 1);
INSERT INTO `conversations` VALUES (210, 332, 0, 'Hello', 1, '2017-11-22 22:15:12', 0);
INSERT INTO `conversations` VALUES (211, 332, 0, 'How is everything?', 1, '2017-11-22 22:15:22', 0);
INSERT INTO `conversations` VALUES (212, 336, 59, 'Hello, when are you going to be finished with this website?', 0, '2017-11-23 01:44:03', 1);
INSERT INTO `conversations` VALUES (213, 340, 60, 'Hi', 0, '2017-11-23 20:15:48', 1);
INSERT INTO `conversations` VALUES (214, 340, 60, 'Do you know when you will be going live?', 0, '2017-11-23 20:15:57', 1);
INSERT INTO `conversations` VALUES (215, 338, 0, 'Hello', 1, '2017-11-23 20:22:58', 0);
INSERT INTO `conversations` VALUES (216, 338, 0, 'How\'s everything?', 1, '2017-11-23 20:23:01', 0);
INSERT INTO `conversations` VALUES (217, 331, 60, 'Hi how are you?', 0, '2017-11-23 20:33:53', 1);
INSERT INTO `conversations` VALUES (218, 352, 60, 'Hello', 0, '2018-01-08 21:05:17', 1);
INSERT INTO `conversations` VALUES (219, 350, 60, 'Hi!', 0, '2018-01-08 21:05:33', 1);
INSERT INTO `conversations` VALUES (220, 351, 60, 'Hello!', 0, '2018-01-08 21:05:45', 1);
INSERT INTO `conversations` VALUES (221, 349, 60, 'Hello', 0, '2018-01-10 08:54:18', 1);
INSERT INTO `conversations` VALUES (222, 349, 60, 'How are you?', 0, '2018-01-10 08:54:23', 1);
INSERT INTO `conversations` VALUES (223, 352, 60, 'How are you?', 0, '2018-01-10 08:54:33', 1);
INSERT INTO `conversations` VALUES (224, 351, 60, 'Hello', 0, '2018-01-10 08:54:49', 1);
INSERT INTO `conversations` VALUES (225, 334, 34, 'asdasd', 0, '2018-01-21 16:08:14', 1);
INSERT INTO `conversations` VALUES (226, 351, 60, 'dsfsdaf', 1, '2018-01-22 14:03:38', 1);
INSERT INTO `conversations` VALUES (227, 351, 60, '222', 1, '2018-01-22 14:03:48', 1);
INSERT INTO `conversations` VALUES (228, 356, 0, 'Hello', 1, '2018-02-08 03:53:19', 0);
INSERT INTO `conversations` VALUES (229, 356, 0, 'How are you today?', 1, '2018-02-08 03:53:24', 0);
INSERT INTO `conversations` VALUES (230, 347, 59, 'Hello How are you?', 0, '2018-02-21 18:24:44', 1);
INSERT INTO `conversations` VALUES (231, 366, 0, 'How are you?', 1, '2018-02-21 18:25:00', 0);
INSERT INTO `conversations` VALUES (232, 360, 60, 'Hello How are you?', 0, '2018-02-22 05:45:12', 1);
INSERT INTO `conversations` VALUES (233, 373, 60, 'sup you good?', 0, '2018-02-22 05:45:55', 1);
INSERT INTO `conversations` VALUES (234, 355, 60, 'Hello', 0, '2018-02-26 02:29:04', 1);
INSERT INTO `conversations` VALUES (235, 341, 65, 'Test 1', 0, '2018-02-28 04:32:04', 1);
INSERT INTO `conversations` VALUES (236, 377, 65, 'Hi how are you?', 0, '2018-02-28 05:02:31', 1);
INSERT INTO `conversations` VALUES (237, 377, 59, 'What\'s good? Raining!!! Can we meet?', 0, '2018-02-28 05:03:43', 1);
INSERT INTO `conversations` VALUES (238, 377, 65, 'Test 1', 1, '2018-02-28 05:17:09', 1);
INSERT INTO `conversations` VALUES (239, 377, 59, 'Test 2', 1, '2018-02-28 05:17:17', 1);
INSERT INTO `conversations` VALUES (240, 377, 59, 'Test 3', 0, '2018-02-28 05:18:48', 1);
INSERT INTO `conversations` VALUES (241, 377, 59, 'Test 4', 0, '2018-02-28 05:18:51', 1);
INSERT INTO `conversations` VALUES (242, 377, 65, 'Test ', 0, '2018-02-28 05:19:56', 1);
INSERT INTO `conversations` VALUES (243, 377, 65, 'TEST 2', 0, '2018-02-28 05:19:59', 1);
INSERT INTO `conversations` VALUES (244, 377, 65, 'TEST 3', 0, '2018-02-28 05:20:00', 1);
INSERT INTO `conversations` VALUES (245, 377, 65, 'Test 4', 0, '2018-02-28 05:20:03', 1);
INSERT INTO `conversations` VALUES (246, 377, 65, 'Test 5', 0, '2018-02-28 05:20:05', 1);
INSERT INTO `conversations` VALUES (247, 377, 65, 'TEST 5', 0, '2018-02-28 05:22:07', 1);
INSERT INTO `conversations` VALUES (248, 377, 59, 'HELLO !!!!!!@@@', 1, '2018-02-28 05:23:17', 1);
INSERT INTO `conversations` VALUES (249, 377, 59, 'TEST 1212313123', 1, '2018-02-28 05:23:39', 1);
INSERT INTO `conversations` VALUES (250, 377, 65, 'TEST 21223920983', 1, '2018-02-28 05:24:34', 1);
INSERT INTO `conversations` VALUES (251, 377, 65, 'TEst 29038429384', 1, '2018-02-28 05:24:37', 1);
INSERT INTO `conversations` VALUES (252, 377, 65, 'Test 2939023', 1, '2018-02-28 05:24:39', 1);
INSERT INTO `conversations` VALUES (253, 377, 65, 'dsfsjfpowi', 0, '2018-02-28 05:26:15', 1);
INSERT INTO `conversations` VALUES (254, 377, 65, 'TEST 389242]', 0, '2018-02-28 05:26:20', 1);
INSERT INTO `conversations` VALUES (255, 377, 65, 'Test 0923029', 0, '2018-02-28 05:26:22', 1);
INSERT INTO `conversations` VALUES (256, 377, 65, 'TesT 123213', 0, '2018-02-28 05:26:28', 1);
INSERT INTO `conversations` VALUES (257, 377, 65, 'Test 12390832', 0, '2018-02-28 05:26:30', 1);
INSERT INTO `conversations` VALUES (258, 377, 65, 'TEST 239820934', 1, '2018-02-28 05:27:53', 1);
INSERT INTO `conversations` VALUES (259, 377, 65, 'Test 233', 1, '2018-02-28 05:27:55', 1);
INSERT INTO `conversations` VALUES (260, 377, 65, 'Test 211', 1, '2018-02-28 05:27:58', 1);
INSERT INTO `conversations` VALUES (261, 377, 65, 'Test 231', 1, '2018-02-28 05:28:02', 1);
INSERT INTO `conversations` VALUES (262, 377, 65, 'kdjflskjfuew', 0, '2018-03-02 05:06:43', 1);
INSERT INTO `conversations` VALUES (263, 377, 65, 'TEST 1', 0, '2018-03-02 05:06:51', 1);
INSERT INTO `conversations` VALUES (264, 356, 60, 'TEST 1', 0, '2018-03-02 05:19:57', 1);
INSERT INTO `conversations` VALUES (265, 335, 65, 'who is working today?', 0, '2018-03-03 01:48:17', 1);
INSERT INTO `conversations` VALUES (266, 341, 65, 'ffd', 1, '2018-03-13 01:13:14', 1);
INSERT INTO `conversations` VALUES (267, 341, 65, 'Test 1', 1, '2018-03-13 01:13:21', 1);
INSERT INTO `conversations` VALUES (268, 341, 65, 'Test 2', 1, '2018-03-13 01:15:33', 1);
INSERT INTO `conversations` VALUES (269, 341, 65, 'Test 3', 1, '2018-03-13 01:15:36', 1);

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups`  (
  `group_id` int(11) NOT NULL,
  `group_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of groups
-- ----------------------------
INSERT INTO `groups` VALUES (0, 'user');
INSERT INTO `groups` VALUES (1, 'admin');

-- ----------------------------
-- Table structure for lookup_category
-- ----------------------------
DROP TABLE IF EXISTS `lookup_category`;
CREATE TABLE `lookup_category`  (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_code` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_online` tinyint(1) NOT NULL DEFAULT 1,
  `change_timestamp` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `change_user_id` int(11) NOT NULL,
  `created_timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_user_id` int(11) NOT NULL,
  `category_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `category_credit` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`category_id`) USING BTREE,
  UNIQUE INDEX `category_name`(`category_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of lookup_category
-- ----------------------------
INSERT INTO `lookup_category` VALUES (1, '', 'Massage', 1, '2018-02-08 06:41:56', 0, '2017-08-18 20:12:51', 0, 0, 500);
INSERT INTO `lookup_category` VALUES (4, '', '420', 1, '2018-04-13 18:15:47', 1, '2017-04-10 00:47:15', 1, 0, 500);
INSERT INTO `lookup_category` VALUES (5, '', 'Business for sale', 1, '2018-03-01 04:03:42', 1, '2017-04-10 00:48:00', 1, 0, 500);
INSERT INTO `lookup_category` VALUES (6, '', 'Jobs', 1, '2018-02-08 06:42:09', 1, '2017-04-10 00:48:09', 1, 0, 500);

-- ----------------------------
-- Table structure for lookup_city
-- ----------------------------
DROP TABLE IF EXISTS `lookup_city`;
CREATE TABLE `lookup_city`  (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city_slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `latitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `longitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pop` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state_id` int(11) NULL DEFAULT NULL,
  `opened` tinyint(4) NULL DEFAULT NULL,
  `credit` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`city_id`) USING BTREE,
  INDEX `state_id`(`state_id`) USING BTREE,
  CONSTRAINT `lookup_city_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `lookup_state` (`state_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 784 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of lookup_city
-- ----------------------------
INSERT INTO `lookup_city` VALUES (1, 'Mankato', 'mankato', '44.16362083', '-93.99915674', '45731.5', 'Minnesota', 23, 1, 200);
INSERT INTO `lookup_city` VALUES (2, 'Albert Lea', 'albertlea', '43.64778668', '-93.36870427', '19063.5', 'Minnesota', 23, 0, 200);
INSERT INTO `lookup_city` VALUES (3, 'Willmar', 'willmar', '45.12188275', '-95.04330489', '18432', 'Minnesota', 23, 0, 200);
INSERT INTO `lookup_city` VALUES (4, 'Brainerd', 'brainerd', '46.35800885', '-94.20084986', '21202.5', 'Minnesota', 23, 1, 200);
INSERT INTO `lookup_city` VALUES (5, 'Crookston', 'crookston', '47.77376223', '-96.60773137', '8215.5', 'Minnesota', 23, 0, 200);
INSERT INTO `lookup_city` VALUES (6, 'Hardin', 'hardin', '45.731768', '-107.612486', '3975.5', 'Montana', 26, 0, 200);
INSERT INTO `lookup_city` VALUES (7, 'Glendive', 'glendive', '47.10858319', '-104.7104926', '5277.5', 'Montana', 26, 0, 200);
INSERT INTO `lookup_city` VALUES (8, 'Dillon', 'dillon', '45.21567548', '-112.6839852', '4213.5', 'Montana', 26, 0, 200);
INSERT INTO `lookup_city` VALUES (9, 'Polson', 'polson', '47.68800519', '-114.156686', '5079', 'Montana', 26, 0, 200);
INSERT INTO `lookup_city` VALUES (10, 'Devils Lake', 'devilslake', '48.11221702', '-98.85968693', '7312', 'North Dakota', 34, 0, 200);
INSERT INTO `lookup_city` VALUES (11, 'Burley', 'burley', '42.53581321', '-113.7918763', '11644.5', 'Idaho', 12, 0, 200);
INSERT INTO `lookup_city` VALUES (12, 'Wallace', 'wallace', '47.47421979', '-115.9268881', '1028', 'Idaho', 12, 0, 200);
INSERT INTO `lookup_city` VALUES (13, 'Kennewick', 'kennewick', '46.21137697', '-119.1360979', '82331', 'Washington', 47, 0, 200);
INSERT INTO `lookup_city` VALUES (14, 'Centralia', 'centralia', '46.71641075', '-122.9529708', '16993.5', 'Washington', 47, 0, 200);
INSERT INTO `lookup_city` VALUES (15, 'Glendale', 'glendale', '33.58194114', '-112.1958238', '363360.5', 'Arizona', 3, 0, 200);
INSERT INTO `lookup_city` VALUES (16, 'Safford', 'safford', '32.83382143', '-109.7068801', '9746.5', 'Arizona', 3, 0, 200);
INSERT INTO `lookup_city` VALUES (17, 'Casa Grande', 'casagrande', '32.87937421', '-111.7566258', '38396.5', 'Arizona', 3, 0, 200);
INSERT INTO `lookup_city` VALUES (18, 'Mesa', 'mesa', '33.42391461', '-111.7360844', '762217.5', 'Arizona', 3, 0, 200);
INSERT INTO `lookup_city` VALUES (19, 'Lake Havasu City', 'lakehavasucity', '34.49829348', '-114.3082789', '55442.5', 'Arizona', 3, 0, 200);
INSERT INTO `lookup_city` VALUES (20, 'Berkeley', 'berkeley', '37.87390139', '-122.271152', '298257', 'California', 5, 0, 200);
INSERT INTO `lookup_city` VALUES (21, 'National City', 'nationalcity', '32.67194501', '-117.0980052', '104291', 'California', 5, 0, 200);
INSERT INTO `lookup_city` VALUES (22, 'Mendocino', 'mendocino', '39.30776735', '-123.7994308', '548', 'California', 5, 1, 200);
INSERT INTO `lookup_city` VALUES (23, 'Paso Robles', 'pasorobles', '35.6265967', '-120.6899823', '26221', 'California', 5, 0, 200);
INSERT INTO `lookup_city` VALUES (24, 'Riverside', 'riverside', '33.94194501', '-117.3980386', '297554', 'California', 5, 0, 200);
INSERT INTO `lookup_city` VALUES (25, 'Delano', 'delano', '35.76193728', '-119.2430681', '42396.5', 'California', 5, 0, 200);
INSERT INTO `lookup_city` VALUES (26, 'San Mateo', 'sanmateo', '37.55691815', '-122.3130616', '361806.5', 'California', 5, 1, 200);
INSERT INTO `lookup_city` VALUES (27, 'Vallejo', 'vallejo', '38.11194887', '-122.258052', '133367.5', 'California', 5, 0, 200);
INSERT INTO `lookup_city` VALUES (28, 'Glenwood Springs', 'glenwoodsprings', '39.54658999', '-107.3247', '11272', 'Colorado', 6, 0, 200);
INSERT INTO `lookup_city` VALUES (29, 'Aurora', 'aurora', '39.69585736', '-104.808497', '431966.5', 'Colorado', 6, 0, 200);
INSERT INTO `lookup_city` VALUES (30, 'Greeley', 'greeley', '40.41919822', '-104.739974', '106142.5', 'Colorado', 6, 0, 200);
INSERT INTO `lookup_city` VALUES (31, 'Tonopah', 'tonopah', '38.06699038', '-117.2289791', '1993', 'Nevada', 28, 0, 200);
INSERT INTO `lookup_city` VALUES (32, 'Deming', 'deming', '32.26109153', '-107.7557848', '15523', 'New Mexico', 31, 0, 200);
INSERT INTO `lookup_city` VALUES (33, 'Truth or Consequences', 'truthorconsequences', '33.13359641', '-107.2528956', '6479', 'New Mexico', 31, 0, 200);
INSERT INTO `lookup_city` VALUES (34, 'Las Vegas', 'lasvegas', '35.59701194', '-105.2225027', '15521', 'New Mexico', 31, 0, 200);
INSERT INTO `lookup_city` VALUES (35, 'Farmington', 'farmington', '36.75415061', '-108.1860944', '42917.5', 'New Mexico', 31, 1, 200);
INSERT INTO `lookup_city` VALUES (36, 'Springfield', 'springfield', '44.05194806', '-122.9780339', '55531.5', 'Oregon', 37, 0, 200);
INSERT INTO `lookup_city` VALUES (37, 'Tillamook', 'tillamook', '45.45524742', '-123.8425031', '6351.5', 'Oregon', 37, 0, 200);
INSERT INTO `lookup_city` VALUES (38, 'Ontario', 'ontario', '44.02662661', '-116.9618895', '11578', 'Oregon', 37, 0, 200);
INSERT INTO `lookup_city` VALUES (39, 'La Grande', 'lagrande', '45.32468691', '-118.0866012', '13646', 'Oregon', 37, 0, 200);
INSERT INTO `lookup_city` VALUES (40, 'Richfield', 'richfield', '38.77247703', '-112.0832984', '7308.5', 'Utah', 44, 0, 200);
INSERT INTO `lookup_city` VALUES (41, 'Nephi', 'nephi', '39.71027508', '-111.8354841', '4960', 'Utah', 44, 0, 200);
INSERT INTO `lookup_city` VALUES (42, 'Lander', 'lander', '42.83300437', '-108.7325985', '6742', 'Wyoming', 50, 0, 200);
INSERT INTO `lookup_city` VALUES (43, 'Powell', 'powell', '44.75867495', '-108.7584367', '6054', 'Wyoming', 50, 0, 200);
INSERT INTO `lookup_city` VALUES (44, 'Paragould', 'paragould', '36.05708722', '-90.50288436', '22886', 'Arkansas', 4, 0, 200);
INSERT INTO `lookup_city` VALUES (45, 'Iowa City', 'iowacity', '41.66108624', '-91.52997929', '81343', 'Iowa', 15, 1, 200);
INSERT INTO `lookup_city` VALUES (46, 'Ottumwa', 'ottumwa', '41.01288291', '-92.414809', '25287.5', 'Iowa', 15, 0, 200);
INSERT INTO `lookup_city` VALUES (47, 'Spencer', 'spencer', '43.14528505', '-95.14717452', '10938.5', 'Iowa', 15, 0, 200);
INSERT INTO `lookup_city` VALUES (48, 'Ft. Dodge', 'ft.dodge', '42.50682273', '-94.1802568', '26284', 'Iowa', 15, 1, 200);
INSERT INTO `lookup_city` VALUES (49, 'Hutchinson', 'hutchinson', '38.06549176', '-97.92349085', '42536.5', 'Kansas', 16, 0, 200);
INSERT INTO `lookup_city` VALUES (50, 'Kansas City', 'kansascity', '39.11358052', '-94.63014638', '324221.5', 'Kansas', 16, 0, 200);
INSERT INTO `lookup_city` VALUES (51, 'Lawrence', 'lawrence', '38.95975242', '-95.25522994', '88020', 'Kansas', 16, 1, 200);
INSERT INTO `lookup_city` VALUES (52, 'Garden City', 'gardencity', '37.97521303', '-100.8640866', '27494.5', 'Kansas', 16, 0, 200);
INSERT INTO `lookup_city` VALUES (53, 'Manhattan', 'manhattan', '39.19402753', '-96.59243514', '51289', 'Kansas', 16, 1, 200);
INSERT INTO `lookup_city` VALUES (54, 'Hays', 'hays', '38.87936973', '-99.322191', '20638.5', 'Kansas', 16, 0, 200);
INSERT INTO `lookup_city` VALUES (55, 'Goodland', 'goodland', '39.34848838', '-101.7110374', '4258.5', 'Kansas', 16, 0, 200);
INSERT INTO `lookup_city` VALUES (56, 'Independence', 'independence', '39.09111391', '-94.41528121', '130695', 'Missouri', 25, 0, 200);
INSERT INTO `lookup_city` VALUES (57, 'Kirksville', 'kirksville', '40.19368227', '-92.58280908', '18083', 'Missouri', 25, 1, 200);
INSERT INTO `lookup_city` VALUES (58, 'Kearney', 'kearney', '40.70070559', '-99.08114628', '30155.5', 'Nebraska', 27, 0, 200);
INSERT INTO `lookup_city` VALUES (59, 'Grand Island', 'grandisland', '40.92226829', '-98.35798629', '45208.5', 'Nebraska', 27, 1, 200);
INSERT INTO `lookup_city` VALUES (60, 'Alliance', 'alliance', '42.10139528', '-102.8701915', '8269', 'Nebraska', 27, 0, 200);
INSERT INTO `lookup_city` VALUES (61, 'Bartlesville', 'bartlesville', '36.74720013', '-95.98058618', '24935', 'Oklahoma', 36, 0, 200);
INSERT INTO `lookup_city` VALUES (62, 'Enid', 'enid', '36.39554201', '-97.8780931', '45963.5', 'Oklahoma', 36, 0, 200);
INSERT INTO `lookup_city` VALUES (63, 'Ardmore', 'ardmore', '34.1810777', '-97.12940495', '24467.5', 'Oklahoma', 36, 0, 200);
INSERT INTO `lookup_city` VALUES (64, 'McAlester', 'mcalester', '34.93299562', '-95.76597396', '19894', 'Oklahoma', 36, 0, 200);
INSERT INTO `lookup_city` VALUES (65, 'Stillwater', 'stillwater', '36.13535118', '-97.06829757', '45212', 'Oklahoma', 36, 1, 200);
INSERT INTO `lookup_city` VALUES (66, 'Lead', 'lead', '44.35084454', '-103.7657699', '2311', 'South Dakota', 41, 0, 200);
INSERT INTO `lookup_city` VALUES (67, 'Slidell', 'slidell', '30.27495953', '-89.78109379', '56019', 'Louisiana', 18, 0, 200);
INSERT INTO `lookup_city` VALUES (68, 'Lake Charles', 'lakecharles', '30.22638369', '-93.21718897', '77065', 'Louisiana', 18, 1, 200);
INSERT INTO `lookup_city` VALUES (69, 'Metairie', 'metairie', '29.98386619', '-90.15277653', '270171', 'Louisiana', 18, 0, 200);
INSERT INTO `lookup_city` VALUES (70, 'New Iberia', 'newiberia', '30.00358075', '-91.81830794', '34985', 'Louisiana', 18, 0, 200);
INSERT INTO `lookup_city` VALUES (71, 'Bryan', 'bryan', '30.67418581', '-96.36968388', '108156.5', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (72, 'San Marcos', 'sanmarcos', '29.88307131', '-97.94111251', '58553.5', 'Texas', 43, 1, 200);
INSERT INTO `lookup_city` VALUES (73, 'Longview', 'longview', '32.50053428', '-94.74027429', '75658', 'Texas', 43, 1, 200);
INSERT INTO `lookup_city` VALUES (74, 'McAllen', 'mcallen', '26.20303754', '-98.22972538', '243291', 'Texas', 43, 1, 200);
INSERT INTO `lookup_city` VALUES (75, 'Harlingen', 'harlingen', '26.19755983', '-97.69019759', '86749', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (76, 'Alice', 'alice', '27.75046246', '-98.07048446', '21122', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (77, 'New Braunfels', 'newbraunfels', '29.6978113', '-98.12632084', '45270', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (78, 'Cleburne', 'cleburne', '32.35152529', '-97.39248967', '32263', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (79, 'Brownwood', 'brownwood', '31.70789532', '-98.98231511', '20261', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (80, 'Alpine', 'alpine', '30.36071657', '-103.6650009', '6429.5', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (81, 'Van Horn', 'vanhorn', '31.04248374', '-104.8322423', '1797', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (82, 'Big Spring', 'bigspring', '32.24318565', '-101.4751862', '23987', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (83, 'Vernon', 'vernon', '34.15105369', '-99.29038416', '11574.5', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (84, 'Childress', 'childress', '34.4248871', '-100.2139195', '5662', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (85, 'Hereford', 'hereford', '34.82191713', '-102.3985924', '15023.5', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (86, 'Dalhart', 'dalhart', '36.06080792', '-102.5186109', '6763.5', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (87, 'Texas City', 'texascity', '29.41087791', '-94.96276717', '55717.5', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (88, 'Pasadena', 'pasadena', '29.66086265', '-95.14774296', '388767.5', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (89, 'Baytown', 'baytown', '29.75584393', '-94.96772811', '76687.5', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (90, 'Arlington', 'grandprairie', '32.68476076', '-97.02023849', '545107.5', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (91, 'New London', 'newlondon', '41.3555235', '-72.10002832', '61236', 'Connecticut', 7, 0, 200);
INSERT INTO `lookup_city` VALUES (92, 'Stamford', 'stamford', '41.05334556', '-73.53919112', '434781.5', 'Connecticut', 7, 0, 200);
INSERT INTO `lookup_city` VALUES (93, 'Waterbury', 'waterbury', '41.55000775', '-73.05002202', '174236', 'Connecticut', 7, 0, 200);
INSERT INTO `lookup_city` VALUES (94, 'New Bedford', 'newbedford', '41.6561253', '-70.94469833', '115082.5', 'Massachusetts', 21, 0, 200);
INSERT INTO `lookup_city` VALUES (95, 'Springfield', 'springfield', '42.12002464', '-72.57999903', '287003.5', 'Massachusetts', 21, 1, 200);
INSERT INTO `lookup_city` VALUES (96, 'Salem', 'salem', '42.5224989', '-70.88309175', '188982', 'Massachusetts', 21, 0, 200);
INSERT INTO `lookup_city` VALUES (97, 'Pittsfield', 'pittsfield', '42.44819582', '-73.25982833', '45202', 'Massachusetts', 21, 0, 200);
INSERT INTO `lookup_city` VALUES (98, 'Montpelier', 'montpelier', '44.25997154', '-72.57581323', '8183', 'Vermont', 45, 0, 200);
INSERT INTO `lookup_city` VALUES (99, 'Auburn', 'auburn', '32.60970074', '-85.48083948', '61881', 'Alabama', 1, 1, 200);
INSERT INTO `lookup_city` VALUES (100, 'Florence', 'florence', '34.79969627', '-87.67724288', '40806.5', 'Alabama', 1, 0, 200);
INSERT INTO `lookup_city` VALUES (101, 'Winter Haven', 'winterhaven', '28.02191876', '-81.73300623', '68435', 'Florida', 9, 0, 200);
INSERT INTO `lookup_city` VALUES (102, 'Melbourne', 'melbourne', '28.08331036', '-80.60832035', '170870', 'Florida', 9, 0, 200);
INSERT INTO `lookup_city` VALUES (103, 'Homestead', 'homestead', '25.46830202', '-80.47778569', '60673', 'Florida', 9, 0, 200);
INSERT INTO `lookup_city` VALUES (104, 'Sanford', 'sanford', '28.78995974', '-81.27998478', '189374.5', 'Florida', 9, 0, 200);
INSERT INTO `lookup_city` VALUES (105, 'Miami Beach', 'miamibeach', '25.80991953', '-80.13178111', '248538', 'Florida', 9, 0, 200);
INSERT INTO `lookup_city` VALUES (106, 'Coral Springs', 'coralsprings', '26.27083701', '-80.27082158', '185548', 'Florida', 9, 0, 200);
INSERT INTO `lookup_city` VALUES (107, 'Port Charlotte', 'portcharlotte', '27.00004315', '-82.10569666', '56806', 'Florida', 9, 0, 200);
INSERT INTO `lookup_city` VALUES (108, 'Spring Hill', 'springhill', '28.47894513', '-82.54771102', '91887.5', 'Florida', 9, 0, 200);
INSERT INTO `lookup_city` VALUES (109, 'Palm Coast', 'palmcoast', '29.53800193', '-81.22329574', '45030', 'Florida', 9, 1, 200);
INSERT INTO `lookup_city` VALUES (110, 'Palatka', 'palatka', '29.64768516', '-81.65130579', '16094.5', 'Florida', 9, 0, 200);
INSERT INTO `lookup_city` VALUES (111, 'Leesburg', 'leesburg', '28.81050112', '-81.88333297', '33929', 'Florida', 9, 0, 200);
INSERT INTO `lookup_city` VALUES (112, 'Lake City', 'lakecity', '30.18971926', '-82.63974675', '20159.5', 'Florida', 9, 1, 200);
INSERT INTO `lookup_city` VALUES (113, 'Crestview', 'crestview', '30.75420677', '-86.57260746', '19552.5', 'Florida', 9, 0, 200);
INSERT INTO `lookup_city` VALUES (114, 'Panama City', 'panamacity', '30.15861005', '-85.65527328', '68852.5', 'Florida', 9, 1, 200);
INSERT INTO `lookup_city` VALUES (115, 'Dalton', 'dalton', '34.76972394', '-84.97030217', '45077.5', 'Georgia', 10, 0, 200);
INSERT INTO `lookup_city` VALUES (116, 'Marietta', 'marietta', '33.95561342', '-84.54324813', '61360', 'Georgia', 10, 0, 200);
INSERT INTO `lookup_city` VALUES (117, 'Waycross', 'waycross', '31.21381695', '-82.35490625', '17445.5', 'Georgia', 10, 0, 200);
INSERT INTO `lookup_city` VALUES (118, 'La Grange', 'lagrange', '33.03647056', '-85.03187464', '28887', 'Georgia', 10, 0, 200);
INSERT INTO `lookup_city` VALUES (119, 'Southaven', 'southaven', '34.96891075', '-90.00345748', '79923', 'Mississippi', 24, 0, 200);
INSERT INTO `lookup_city` VALUES (120, 'Meridian', 'meridian', '32.36418601', '-88.70361434', '40863.5', 'Mississippi', 24, 1, 200);
INSERT INTO `lookup_city` VALUES (121, 'Laurel', 'laurel', '31.69737917', '-89.1392725', '23366', 'Mississippi', 24, 0, 200);
INSERT INTO `lookup_city` VALUES (122, 'Spartanburg', 'spartanburg', '34.94942873', '-81.93227055', '81059', 'South Carolina', 40, 0, 200);
INSERT INTO `lookup_city` VALUES (123, 'Orangeburg', 'orangeburg', '33.49680422', '-80.86223251', '24192.5', 'South Carolina', 40, 0, 200);
INSERT INTO `lookup_city` VALUES (124, 'Galesburg', 'galesburg', '40.94777061', '-90.37108362', '32078.5', 'Illinois', 13, 0, 200);
INSERT INTO `lookup_city` VALUES (125, 'Joliet', 'joliet', '41.52998313', '-88.10667403', '362946.5', 'Illinois', 13, 0, 200);
INSERT INTO `lookup_city` VALUES (126, 'Cape Girardeau', 'capegirardeau', '37.30582237', '-89.51808659', '38165.5', 'Illinois', 13, 0, 200);
INSERT INTO `lookup_city` VALUES (127, 'Rockford', 'rockford', '42.26970542', '-89.06969019', '204371.5', 'Illinois', 13, 1, 200);
INSERT INTO `lookup_city` VALUES (128, 'Evanston', 'evanston', '42.04834943', '-87.69995467', '212243', 'Illinois', 13, 0, 200);
INSERT INTO `lookup_city` VALUES (129, 'Rock Island', 'rockisland', '41.49339622', '-90.53461369', '102055.5', 'Illinois', 13, 0, 200);
INSERT INTO `lookup_city` VALUES (130, 'Elgin', 'elgin', '42.03946108', '-88.28991866', '244050', 'Illinois', 13, 0, 200);
INSERT INTO `lookup_city` VALUES (131, 'Richmond', 'richmond', '39.82889833', '-84.89028121', '41015.5', 'Indiana', 14, 1, 200);
INSERT INTO `lookup_city` VALUES (132, 'Terre Haute', 'terrehaute', '39.46664654', '-87.41387394', '65149.5', 'Indiana', 14, 1, 200);
INSERT INTO `lookup_city` VALUES (133, 'Lafayette', 'lafayette', '40.41720868', '-86.87824772', '98104', 'Indiana', 14, 1, 200);
INSERT INTO `lookup_city` VALUES (134, 'Marion', 'marion', '40.55833701', '-85.65917485', '34249', 'Indiana', 14, 0, 200);
INSERT INTO `lookup_city` VALUES (135, 'South Bend', 'southbend', '41.68330711', '-86.25001734', '171791', 'Indiana', 14, 1, 200);
INSERT INTO `lookup_city` VALUES (136, 'New Albany', 'newalbany', '38.3108773', '-85.82128382', '78381.5', 'Indiana', 14, 0, 200);
INSERT INTO `lookup_city` VALUES (137, 'Elkhart', 'elkhart', '41.68294537', '-85.96879419', '100295', 'Indiana', 14, 0, 200);
INSERT INTO `lookup_city` VALUES (138, 'Hopkinsville', 'hopkinsville', '36.86548749', '-87.4886239', '31630', 'Kentucky', 17, 0, 200);
INSERT INTO `lookup_city` VALUES (139, 'London', 'london', '37.12888226', '-84.08335372', '7844', 'Kentucky', 17, 0, 200);
INSERT INTO `lookup_city` VALUES (140, 'Madisonville', 'madisonville', '37.33274579', '-87.5022148', '20858.5', 'Kentucky', 17, 0, 200);
INSERT INTO `lookup_city` VALUES (141, 'Rocky Mount', 'rockymount', '35.93799888', '-77.79076624', '57179', 'North Carolina', 33, 0, 200);
INSERT INTO `lookup_city` VALUES (142, 'Salisbury', 'salisbury', '35.67078005', '-80.4744784', '33907', 'North Carolina', 33, 0, 200);
INSERT INTO `lookup_city` VALUES (143, 'Durham', 'durham', '35.99995892', '-78.91999964', '257114.5', 'North Carolina', 33, 0, 200);
INSERT INTO `lookup_city` VALUES (144, 'Lumberton', 'lumberton', '34.62720034', '-79.01190617', '27049.5', 'North Carolina', 33, 0, 200);
INSERT INTO `lookup_city` VALUES (145, 'Zanesville', 'zanesville', '39.94028688', '-82.01332503', '32514', 'Ohio', 35, 1, 200);
INSERT INTO `lookup_city` VALUES (146, 'Mansfield', 'mansfield', '40.75832481', '-82.51554244', '64039', 'Ohio', 35, 1, 200);
INSERT INTO `lookup_city` VALUES (147, 'Bowling Green', 'bowlinggreen', '41.37474713', '-83.65139042', '33147.5', 'Ohio', 35, 0, 200);
INSERT INTO `lookup_city` VALUES (148, 'Springfield', 'springfield', '39.92000388', '-83.799986', '74450.5', 'Ohio', 35, 0, 200);
INSERT INTO `lookup_city` VALUES (149, 'Lancaster', 'lancaster', '39.71921511', '-82.6053044', '42356', 'Ohio', 35, 0, 200);
INSERT INTO `lookup_city` VALUES (150, 'Johnson City', 'johnsoncity', '36.31332481', '-82.35361434', '68070.5', 'Tennessee', 42, 1, 200);
INSERT INTO `lookup_city` VALUES (151, 'Kingsport', 'kingsport', '36.54832338', '-82.56194788', '50709.5', 'Tennessee', 42, 0, 200);
INSERT INTO `lookup_city` VALUES (152, 'Columbia', 'columbia', '35.61499534', '-87.03526656', '74866', 'Tennessee', 42, 0, 200);
INSERT INTO `lookup_city` VALUES (153, 'Barlett', 'barlett', '35.22290041', '-89.84109013', '164843.5', 'Tennessee', 42, 0, 200);
INSERT INTO `lookup_city` VALUES (154, 'Blacksburg', 'blacksburg', '37.22941876', '-80.41419784', '53845.5', 'Virginia', 46, 0, 200);
INSERT INTO `lookup_city` VALUES (155, 'Harrisonburg', 'harrisonburg', '38.44942181', '-78.86917586', '42131.5', 'Virginia', 46, 1, 200);
INSERT INTO `lookup_city` VALUES (156, 'Petersburg', 'petersburg', '37.22776512', '-77.40223698', '76158.5', 'Virginia', 46, 0, 200);
INSERT INTO `lookup_city` VALUES (157, 'Hampton', 'hampton', '37.03002525', '-76.34994979', '256601.5', 'Virginia', 46, 1, 200);
INSERT INTO `lookup_city` VALUES (158, 'Sheboygan', 'sheboygan', '43.75082949', '-87.71442407', '51148', 'Wisconsin', 49, 1, 200);
INSERT INTO `lookup_city` VALUES (159, 'Waukesha', 'waukesha', '43.0116498', '-88.23136926', '159012', 'Wisconsin', 49, 0, 200);
INSERT INTO `lookup_city` VALUES (160, 'La Crosse', 'lacrosse', '43.80136904', '-91.23942855', '69599.5', 'Wisconsin', 49, 1, 200);
INSERT INTO `lookup_city` VALUES (161, 'Eau Claire', 'eauclaire', '44.81135907', '-91.49835331', '71296', 'Wisconsin', 49, 1, 200);
INSERT INTO `lookup_city` VALUES (162, 'Tomah', 'tomah', '43.98505292', '-90.50389205', '10796.5', 'Wisconsin', 49, 0, 200);
INSERT INTO `lookup_city` VALUES (163, 'Janesville', 'janesville', '42.68262596', '-89.02157943', '65476.5', 'Wisconsin', 49, 1, 200);
INSERT INTO `lookup_city` VALUES (164, 'Appleton', 'appleton', '44.26867902', '-88.40050623', '136888.5', 'Wisconsin', 49, 1, 200);
INSERT INTO `lookup_city` VALUES (165, 'Parkersburg', 'parkersburg', '39.26665875', '-81.56164718', '46749.5', 'West Virginia', 48, 1, 200);
INSERT INTO `lookup_city` VALUES (166, 'White Sulphur Springs', 'whitesulphursprings', '37.79388043', '-80.30348108', '2154', 'West Virginia', 48, 0, 200);
INSERT INTO `lookup_city` VALUES (167, 'Clarksburg', 'clarksburg', '39.28327272', '-80.33691573', '22502.5', 'West Virginia', 48, 0, 200);
INSERT INTO `lookup_city` VALUES (168, 'Dover', 'dover', '39.15808657', '-75.524703', '54662.5', 'Delaware', 8, 0, 200);
INSERT INTO `lookup_city` VALUES (169, 'St. Charles', 'st.charles', '38.60305585', '-76.93893193', '52792', 'Maryland', 20, 0, 200);
INSERT INTO `lookup_city` VALUES (170, 'Annapolis', 'annapolis', '38.9783301', '-76.49249923', '58776', 'Maryland', 20, 1, 200);
INSERT INTO `lookup_city` VALUES (171, 'Hagerstown', 'hagerstown', '39.64164878', '-77.72027958', '58487.5', 'Maryland', 20, 0, 200);
INSERT INTO `lookup_city` VALUES (172, 'Paterson', 'paterson', '40.91999453', '-74.17000533', '151205', 'New Jersey', 30, 0, 200);
INSERT INTO `lookup_city` VALUES (173, 'Saratoga Springs', 'saratogasprings', '43.08296328', '-73.78501591', '41891', 'New York', 32, 0, 200);
INSERT INTO `lookup_city` VALUES (174, 'Poughkeepsie', 'poughkeepsie', '41.70023114', '-73.92141585', '100670.5', 'New York', 32, 0, 200);
INSERT INTO `lookup_city` VALUES (175, 'Plattsburg', 'plattsburg', '44.69498374', '-73.45798161', '24233.5', 'New York', 32, 1, 200);
INSERT INTO `lookup_city` VALUES (176, 'Beaver Falls', 'beaverfalls', '40.75194277', '-80.31942326', '64814.5', 'Pennsylvania', 38, 0, 200);
INSERT INTO `lookup_city` VALUES (177, 'Altoona', 'altoona', '40.51859784', '-78.39496708', '62784.5', 'Pennsylvania', 38, 1, 200);
INSERT INTO `lookup_city` VALUES (178, 'Williamsport', 'williamsport', '41.24108604', '-77.0013829', '43791.5', 'Pennsylvania', 38, 1, 200);
INSERT INTO `lookup_city` VALUES (179, 'Lancaster', 'lancaster', '40.03777447', '-76.30576644', '209489', 'Pennsylvania', 38, 1, 200);
INSERT INTO `lookup_city` VALUES (180, 'Allentown', 'allentown', '40.59998822', '-75.50002751', '300980.5', 'Pennsylvania', 38, 1, 200);
INSERT INTO `lookup_city` VALUES (181, 'Waterville', 'waterville', '44.5518917', '-69.64578536', '20529', 'Maine', 19, 0, 200);
INSERT INTO `lookup_city` VALUES (182, 'Calais', 'calais', '45.16598859', '-67.24239201', '1781.5', 'Maine', 19, 0, 200);
INSERT INTO `lookup_city` VALUES (183, 'Houlton', 'houlton', '46.12551658', '-67.83971989', '6051.5', 'Maine', 19, 0, 200);
INSERT INTO `lookup_city` VALUES (184, 'Benton Harbor', 'bentonharbor', '42.11663983', '-86.45419092', '34637.5', 'Michigan', 22, 0, 200);
INSERT INTO `lookup_city` VALUES (185, 'Battle Creek', 'battlecreek', '42.32109764', '-85.17974675', '62454', 'Michigan', 22, 1, 200);
INSERT INTO `lookup_city` VALUES (186, 'Bay City', 'baycity', '43.5944566', '-83.88889531', '51558.5', 'Michigan', 22, 0, 200);
INSERT INTO `lookup_city` VALUES (187, 'Alpena', 'alpena', '45.06160219', '-83.43269576', '14524', 'Michigan', 22, 0, 200);
INSERT INTO `lookup_city` VALUES (188, 'Iron Mountain', 'ironmountain', '45.82246014', '-88.06409265', '12011', 'Michigan', 22, 0, 200);
INSERT INTO `lookup_city` VALUES (189, 'Ironwood', 'ironwood', '46.4558065', '-90.15939112', '6400', 'Michigan', 22, 0, 200);
INSERT INTO `lookup_city` VALUES (190, 'Sand Point', 'sandpoint', '55.33970868', '-160.4971908', '667', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (191, 'Hydaburg', 'hydaburg', '55.21397992', '-132.8006385', '382', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (192, 'Mekoryuk', 'mekoryuk', '60.38864671', '-166.1899372', '99', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (193, 'Atqasuk', 'atqasuk', '70.4693795', '-157.395778', '201', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (194, 'Port Heiden', 'portheiden', '56.94909365', '-158.6268915', '102', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (195, 'Perryville', 'perryville', '55.91861391', '-159.1511489', '113', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (196, 'Dillingham', 'dillingham', '59.05656031', '-158.4803121', '1710', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (197, 'Goodnews Bay', 'goodnewsbay', '59.12099265', '-161.5871302', '230', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (198, 'Nyac', 'nyac', '61.00414329', '-159.9404806', '75', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (199, 'Tununak', 'tununak', '60.58548667', '-165.2557892', '352', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (200, 'Mountain Village', 'mountainvillage', '62.08552431', '-163.729009', '755', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (201, 'Emmonak', 'emmonak', '62.77698081', '-164.5229916', '100', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (202, 'Kaltag', 'kaltag', '64.32719627', '-158.7218986', '190', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (203, 'Teller', 'teller', '65.26359906', '-166.3607864', '83', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (204, 'Koyukuk', 'koyukuk', '64.88028912', '-157.7008499', '101', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (205, 'Kobuk', 'kobuk', '66.9072455', '-156.8809774', '151', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (206, 'Selawik', 'selawik', '66.60387901', '-160.0093911', '832', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (207, 'Talkeetna', 'talkeetna', '62.3237785', '-150.1094269', '1078', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (208, 'Whittier', 'whittier', '60.78415672', '-148.6776797', '177', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (209, 'Montana', 'montana', '62.07968487', '-150.0727625', '10', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (210, 'Lake Minchumina', 'lakeminchumina', '63.88283063', '-152.3121865', '32', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (211, 'Cantwell', 'cantwell', '63.39159446', '-148.9507896', '222', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (212, 'Gulkana', 'gulkana', '62.27135276', '-145.3821961', '119', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (213, 'Eagle', 'eagle', '64.78799501', '-141.1999966', '104', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (214, 'Nenana', 'nenana', '64.56379681', '-149.0930032', '75', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (215, 'Big Delta', 'bigdelta', '64.15252993', '-145.8421939', '591', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (216, 'Allakaket', 'allakaket', '66.56548342', '-152.6454995', '97', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (217, 'Tanana', 'tanana', '65.17187339', '-152.0787899', '291.5', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (218, 'Virginia', 'virginia', '47.52367413', '-92.53640365', '8709', 'Minnesota', 23, 0, 200);
INSERT INTO `lookup_city` VALUES (219, 'Winona', 'winona', '44.0504236', '-91.63919743', '29757.5', 'Minnesota', 23, 0, 200);
INSERT INTO `lookup_city` VALUES (220, 'Rochester', 'rochester', '44.02205324', '-92.46968937', '102433', 'Minnesota', 23, 1, 200);
INSERT INTO `lookup_city` VALUES (221, 'Lakeville', 'lakeville', '44.65010276', '-93.24251042', '156151', 'Minnesota', 23, 0, 200);
INSERT INTO `lookup_city` VALUES (222, 'Ely', 'ely', '47.90042116', '-91.82569767', '3687', 'Minnesota', 23, 0, 200);
INSERT INTO `lookup_city` VALUES (223, 'Moorhead', 'moorhead', '46.87430808', '-96.74219344', '34332.5', 'Minnesota', 23, 0, 200);
INSERT INTO `lookup_city` VALUES (224, 'St. Cloud', 'st.cloud', '45.56120994', '-94.16222172', '85974', 'Minnesota', 23, 1, 200);
INSERT INTO `lookup_city` VALUES (225, 'Miles City', 'milescity', '46.4088843', '-105.8399844', '8399.5', 'Montana', 26, 0, 200);
INSERT INTO `lookup_city` VALUES (226, 'Bozeman', 'bozeman', '45.68009157', '-111.0378325', '39049.5', 'Montana', 26, 1, 200);
INSERT INTO `lookup_city` VALUES (227, 'Glasgow', 'glasgow', '48.18396975', '-106.6352588', '3144', 'Montana', 26, 0, 200);
INSERT INTO `lookup_city` VALUES (228, 'Dickinson', 'dickinson', '46.88399742', '-102.7888011', '15987.5', 'North Dakota', 34, 0, 200);
INSERT INTO `lookup_city` VALUES (229, 'Jamestown', 'jamestown', '46.90601158', '-98.70297815', '14954.5', 'North Dakota', 34, 0, 200);
INSERT INTO `lookup_city` VALUES (230, 'Williston', 'williston', '48.15678794', '-103.6280005', '12767.5', 'North Dakota', 34, 0, 200);
INSERT INTO `lookup_city` VALUES (231, 'Lihue', 'lihue', '21.98151227', '-159.3710063', '10694.5', 'Hawaii', 11, 0, 200);
INSERT INTO `lookup_city` VALUES (232, 'Wahiawa', 'wahiawa', '21.50309186', '-158.0236209', '95336', 'Hawaii', 11, 0, 200);
INSERT INTO `lookup_city` VALUES (233, 'Wailuku', 'wailuku', '20.89147544', '-156.5047213', '32769.5', 'Hawaii', 11, 0, 200);
INSERT INTO `lookup_city` VALUES (234, 'Montpelier', 'montpelier', '42.32262209', '-111.2969123', '2775.5', 'Idaho', 12, 0, 200);
INSERT INTO `lookup_city` VALUES (235, 'Twin Falls', 'twinfalls', '42.5609538', '-114.4605693', '42958.5', 'Idaho', 12, 1, 200);
INSERT INTO `lookup_city` VALUES (236, 'Caldwell', 'caldwell', '43.66096417', '-116.6705378', '83403', 'Idaho', 12, 0, 200);
INSERT INTO `lookup_city` VALUES (237, 'Salmon', 'salmon', '45.17567792', '-113.8949966', '3297', 'Idaho', 12, 0, 200);
INSERT INTO `lookup_city` VALUES (238, 'Coeur d\'Alene', 'coeurd\'alene', '47.67808331', '-116.7794458', '34514', 'Idaho', 12, 0, 200);
INSERT INTO `lookup_city` VALUES (239, 'Richland', 'richland', '46.29181134', '-119.2911013', '39940.5', 'Washington', 47, 0, 200);
INSERT INTO `lookup_city` VALUES (240, 'Bellingham', 'bellingham', '48.76013613', '-122.4869269', '86565.5', 'Washington', 47, 1, 200);
INSERT INTO `lookup_city` VALUES (241, 'Longview', 'longview', '46.13871991', '-122.9369511', '51290', 'Washington', 47, 0, 200);
INSERT INTO `lookup_city` VALUES (242, 'Walla Walla', 'wallawalla', '46.06515851', '-118.3418828', '37864', 'Washington', 47, 0, 200);
INSERT INTO `lookup_city` VALUES (243, 'Aberdeen', 'aberdeen', '46.97489626', '-123.8143911', '24400', 'Washington', 47, 0, 200);
INSERT INTO `lookup_city` VALUES (244, 'Bremerton', 'bremerton', '47.57359552', '-122.6420175', '82039.5', 'Washington', 47, 0, 200);
INSERT INTO `lookup_city` VALUES (245, 'Everett', 'everett', '47.9604175', '-122.1999677', '291948', 'Washington', 47, 1, 200);
INSERT INTO `lookup_city` VALUES (246, 'Bullhead City', 'bullheadcity', '35.14817629', '-114.5674878', '37989', 'Arizona', 3, 0, 200);
INSERT INTO `lookup_city` VALUES (247, 'Winslow', 'winslow', '35.28470542', '-110.7006954', '9931', 'Arizona', 3, 0, 200);
INSERT INTO `lookup_city` VALUES (248, 'Gila Bend', 'gilabend', '32.95037762', '-112.7246546', '2012', 'Arizona', 3, 0, 200);
INSERT INTO `lookup_city` VALUES (249, 'Tombstone', 'tombstone', '31.71314048', '-110.066884', '1396.5', 'Arizona', 3, 0, 200);
INSERT INTO `lookup_city` VALUES (250, 'Willcox', 'willcox', '32.25321088', '-109.8313945', '4451.5', 'Arizona', 3, 0, 200);
INSERT INTO `lookup_city` VALUES (251, 'Scottsdale', 'scottsdale', '33.69234784', '-111.8680402', '15401', 'Arizona', 3, 0, 200);
INSERT INTO `lookup_city` VALUES (252, 'Kingman', 'kingman', '35.18987917', '-114.0522221', '33306.5', 'Arizona', 3, 0, 200);
INSERT INTO `lookup_city` VALUES (253, 'Grand Canyon', 'grandcanyon', '36.05478762', '-112.1385922', '1068.5', 'Arizona', 3, 0, 200);
INSERT INTO `lookup_city` VALUES (254, 'Arcata', 'arcata', '40.88519045', '-124.0882245', '19052', 'California', 5, 0, 200);
INSERT INTO `lookup_city` VALUES (255, 'Stockton', 'stockton', '37.95813397', '-121.289739', '488506.5', 'California', 5, 1, 200);
INSERT INTO `lookup_city` VALUES (256, 'Barstow', 'barstow', '34.89901837', '-117.0218858', '21119', 'California', 5, 0, 200);
INSERT INTO `lookup_city` VALUES (257, 'Victorville', 'victoriaville', '34.5365082', '-117.2903191', '83496', 'California', 5, 0, 200);
INSERT INTO `lookup_city` VALUES (258, 'Pasadena', 'pasadena', '34.16038129', '-118.1388719', '144618', 'California', 5, 0, 200);
INSERT INTO `lookup_city` VALUES (259, 'Visalia', 'visalia', '36.32502952', '-119.3160094', '114699.5', 'California', 5, 1, 200);
INSERT INTO `lookup_city` VALUES (260, 'El Centro', 'elcentro', '32.79237693', '-115.5580475', '41661.5', 'California', 5, 0, 200);
INSERT INTO `lookup_city` VALUES (261, 'San Luis Obispo', 'sanluisobispo', '35.28318097', '-120.6585889', '54759', 'California', 5, 1, 200);
INSERT INTO `lookup_city` VALUES (262, 'Merced', 'merced', '37.30261843', '-120.481933', '84355', 'California', 5, 1, 200);
INSERT INTO `lookup_city` VALUES (263, 'Yuba City', 'yubacity', '39.14103334', '-121.6157656', '84324.5', 'California', 5, 0, 200);
INSERT INTO `lookup_city` VALUES (264, 'Redding', 'redding', '40.58704327', '-122.3905762', '93871.5', 'California', 5, 1, 200);
INSERT INTO `lookup_city` VALUES (265, 'Santa Rosa', 'santarosa', '38.45040367', '-122.6999889', '193455', 'California', 5, 0, 200);
INSERT INTO `lookup_city` VALUES (266, 'Oceanside', 'oceanside', '33.2204645', '-117.3349675', '396474.5', 'California', 5, 0, 200);
INSERT INTO `lookup_city` VALUES (267, 'Modesto', 'modesto', '37.65541343', '-120.9899899', '269697', 'California', 5, 1, 200);
INSERT INTO `lookup_city` VALUES (268, 'Irvine', 'irvine', '33.68041058', '-117.8299502', '1611303.5', 'California', 5, 0, 200);
INSERT INTO `lookup_city` VALUES (269, 'Ukiah', 'ukiah', '39.15423667', '-123.2108621', '21826.5', 'California', 5, 0, 200);
INSERT INTO `lookup_city` VALUES (270, 'Needles', 'needles', '34.84842714', '-114.6133507', '6246.5', 'California', 5, 0, 200);
INSERT INTO `lookup_city` VALUES (271, 'Bishop', 'bishop', '37.36395835', '-118.394076', '4249', 'California', 5, 0, 200);
INSERT INTO `lookup_city` VALUES (272, 'Palm Springs', 'palmsprings', '33.77735557', '-116.5330526', '216461', 'California', 5, 1, 200);
INSERT INTO `lookup_city` VALUES (273, 'Santa Maria', 'santamaria', '34.94012697', '-120.4366386', '98092.5', 'California', 5, 1, 200);
INSERT INTO `lookup_city` VALUES (274, 'Tulare', 'tulare', '36.20702639', '-119.3441213', '53005.5', 'California', 5, 0, 200);
INSERT INTO `lookup_city` VALUES (275, 'Mt. Shasta', 'mt.shasta', '41.3103583', '-122.3093925', '3742.5', 'California', 5, 0, 200);
INSERT INTO `lookup_city` VALUES (276, 'Crescent City', 'crescentcity', '41.7564551', '-124.2004916', '9439.5', 'California', 5, 0, 200);
INSERT INTO `lookup_city` VALUES (277, 'Fort Collins', 'fortcollins', '40.56068829', '-105.0588693', '178818.5', 'Colorado', 6, 1, 200);
INSERT INTO `lookup_city` VALUES (278, 'Pueblo', 'pueblo', '38.2803882', '-104.6300066', '108244', 'Colorado', 6, 1, 200);
INSERT INTO `lookup_city` VALUES (279, 'Lamar', 'lamar', '38.08649823', '-102.6194058', '8567', 'Colorado', 6, 0, 200);
INSERT INTO `lookup_city` VALUES (280, 'Trinidad', 'trinidad', '37.17133445', '-104.5063965', '8701.5', 'Colorado', 6, 0, 200);
INSERT INTO `lookup_city` VALUES (281, 'Gunnison', 'gunnison', '38.54476483', '-106.92829', '6273', 'Colorado', 6, 0, 200);
INSERT INTO `lookup_city` VALUES (282, 'Durango', 'durango', '37.27564333', '-107.8799891', '19127.5', 'Colorado', 6, 0, 200);
INSERT INTO `lookup_city` VALUES (283, 'Montrose', 'montrose', '38.47727541', '-107.8655197', '18463.5', 'Colorado', 6, 0, 200);
INSERT INTO `lookup_city` VALUES (284, 'Craig', 'craig', '40.51728009', '-107.5503968', '9315.5', 'Colorado', 6, 0, 200);
INSERT INTO `lookup_city` VALUES (285, 'Boulder', 'boulder', '40.03844627', '-105.246093', '106897.5', 'Colorado', 6, 1, 200);
INSERT INTO `lookup_city` VALUES (286, 'Boulder City', 'bouldercity', '35.97895245', '-114.8315802', '15072.5', 'Nevada', 28, 0, 200);
INSERT INTO `lookup_city` VALUES (287, 'Winnemucca', 'winnemucca', '40.97337628', '-117.7346847', '7997.5', 'Nevada', 28, 0, 200);
INSERT INTO `lookup_city` VALUES (288, 'Roswell', 'roswell', '33.39453656', '-104.5224679', '45082.5', 'New Mexico', 31, 1, 200);
INSERT INTO `lookup_city` VALUES (289, 'Clovis', 'clovis', '34.40506919', '-103.2047706', '33477.5', 'New Mexico', 31, 1, 200);
INSERT INTO `lookup_city` VALUES (290, 'Las Cruces', 'lascruces', '32.31261293', '-106.7778083', '97675.5', 'New Mexico', 31, 1, 200);
INSERT INTO `lookup_city` VALUES (291, 'Hobbs', 'hobbs', '32.71261436', '-103.1406143', '28375.5', 'New Mexico', 31, 0, 200);
INSERT INTO `lookup_city` VALUES (292, 'Socorro', 'socorro', '34.06211855', '-106.8989895', '8117', 'New Mexico', 31, 0, 200);
INSERT INTO `lookup_city` VALUES (293, 'Gallup', 'gallup', '35.52407066', '-108.7339938', '21627', 'New Mexico', 31, 0, 200);
INSERT INTO `lookup_city` VALUES (294, 'Raton', 'raton', '36.89739768', '-104.439889', '6820', 'New Mexico', 31, 0, 200);
INSERT INTO `lookup_city` VALUES (295, 'Tucumcari', 'tucumcari', '35.16980288', '-103.725514', '5259.5', 'New Mexico', 31, 0, 200);
INSERT INTO `lookup_city` VALUES (296, 'Roseburg', 'roseburg', '43.21843304', '-123.3560987', '25454.5', 'Oregon', 37, 1, 200);
INSERT INTO `lookup_city` VALUES (297, 'Pendleton', 'pendleton', '45.67259849', '-118.7874886', '16669', 'Oregon', 37, 0, 200);
INSERT INTO `lookup_city` VALUES (298, 'John Day', 'johnday', '44.41652529', '-118.9520264', '1437.5', 'Oregon', 37, 0, 200);
INSERT INTO `lookup_city` VALUES (299, 'Grants Pass', 'grantspass', '42.43954002', '-123.3271857', '36690', 'Oregon', 37, 0, 200);
INSERT INTO `lookup_city` VALUES (300, 'Corvallis', 'corvallis', '44.57235557', '-123.2799793', '54865.5', 'Oregon', 37, 1, 200);
INSERT INTO `lookup_city` VALUES (301, 'Albany', 'albany', '44.62049217', '-123.086942', '48066.5', 'Oregon', 37, 0, 200);
INSERT INTO `lookup_city` VALUES (302, 'Astoria', 'astoria', '46.18838096', '-123.8299974', '9773', 'Oregon', 37, 0, 200);
INSERT INTO `lookup_city` VALUES (303, 'Logan', 'logan', '41.73593955', '-111.8335979', '58664', 'Utah', 44, 1, 200);
INSERT INTO `lookup_city` VALUES (304, 'Parowan', 'parowan', '37.84253379', '-112.8272065', '2533', 'Utah', 44, 0, 200);
INSERT INTO `lookup_city` VALUES (305, 'Kanab', 'kanab', '37.04738853', '-112.5254936', '2861', 'Utah', 44, 0, 200);
INSERT INTO `lookup_city` VALUES (306, 'Monticello', 'monticello', '37.87178265', '-109.3421995', '1811.5', 'Utah', 44, 0, 200);
INSERT INTO `lookup_city` VALUES (307, 'Moab', 'moab', '38.57370363', '-109.5491895', '5309', 'Utah', 44, 0, 200);
INSERT INTO `lookup_city` VALUES (308, 'Price', 'price', '39.59979087', '-110.8100169', '9175', 'Utah', 44, 0, 200);
INSERT INTO `lookup_city` VALUES (309, 'Cedar City', 'cedarcity', '37.67742759', '-113.061094', '25371.5', 'Utah', 44, 0, 200);
INSERT INTO `lookup_city` VALUES (310, 'Vernal', 'vernal', '40.45539756', '-109.5280022', '11175.5', 'Utah', 44, 0, 200);
INSERT INTO `lookup_city` VALUES (311, 'Ogden', 'ogden', '41.23237856', '-111.9680341', '227774', 'Utah', 44, 1, 200);
INSERT INTO `lookup_city` VALUES (312, 'Green River', 'greenriver', '41.51455772', '-109.4649827', '10239.5', 'Wyoming', 50, 0, 200);
INSERT INTO `lookup_city` VALUES (313, 'Rawlins', 'rawlins', '41.7906649', '-107.234292', '8458', 'Wyoming', 50, 0, 200);
INSERT INTO `lookup_city` VALUES (314, 'Douglas', 'douglas', '42.75647158', '-105.3845341', '5838', 'Wyoming', 50, 0, 200);
INSERT INTO `lookup_city` VALUES (315, 'Riverton', 'riverton', '43.02816042', '-108.3950481', '10350', 'Wyoming', 50, 0, 200);
INSERT INTO `lookup_city` VALUES (316, 'Thermopolis', 'thermopolis', '43.64597801', '-108.2146715', '3195', 'Wyoming', 50, 0, 200);
INSERT INTO `lookup_city` VALUES (317, 'Gillette', 'gillette', '44.28317425', '-105.5052503', '26107', 'Wyoming', 50, 0, 200);
INSERT INTO `lookup_city` VALUES (318, 'Jonesboro', 'jonesboro', '35.84257835', '-90.70416406', '58322', 'Arkansas', 4, 1, 200);
INSERT INTO `lookup_city` VALUES (319, 'Texarkana', 'texarkana', '33.44210472', '-94.03747481', '52169', 'Arkansas', 4, 0, 200);
INSERT INTO `lookup_city` VALUES (320, 'Pine Bluff', 'pinebluff', '34.22869753', '-92.00305119', '51472', 'Arkansas', 4, 0, 200);
INSERT INTO `lookup_city` VALUES (321, 'Hot Springs', 'hotsprings', '34.50395205', '-93.05500248', '40826', 'Arkansas', 4, 0, 200);
INSERT INTO `lookup_city` VALUES (322, 'Fort Smith', 'fortsmith', '35.38622377', '-94.39835718', '87986.5', 'Arkansas', 4, 1, 200);
INSERT INTO `lookup_city` VALUES (323, 'Fayetteville', 'fayetteville', '36.06297833', '-94.15720911', '108267.5', 'Arkansas', 4, 1, 200);
INSERT INTO `lookup_city` VALUES (324, 'Conway', 'conway', '35.09128054', '-92.4513184', '56759.5', 'Arkansas', 4, 0, 200);
INSERT INTO `lookup_city` VALUES (325, 'El Dorado', 'eldorado', '33.21392743', '-92.66251998', '21384.5', 'Arkansas', 4, 0, 200);
INSERT INTO `lookup_city` VALUES (326, 'Davenport', 'davenport', '41.55398684', '-90.58753036', '178282.5', 'Iowa', 15, 0, 200);
INSERT INTO `lookup_city` VALUES (327, 'Burlington', 'burlington', '40.80793418', '-91.11276961', '27690.5', 'Iowa', 15, 0, 200);
INSERT INTO `lookup_city` VALUES (328, 'Dubuque', 'dubuque', '42.50093162', '-90.66445073', '59834', 'Iowa', 15, 1, 200);
INSERT INTO `lookup_city` VALUES (329, 'Waterloo', 'waterloo', '42.49315432', '-92.34279789', '82091.5', 'Iowa', 15, 1, 200);
INSERT INTO `lookup_city` VALUES (330, 'Sioux City', 'siouxcity', '42.50038902', '-96.39999211', '87090', 'Iowa', 15, 0, 200);
INSERT INTO `lookup_city` VALUES (331, 'Council Bluffs', 'councilbluffs', '41.26227338', '-95.86080021', '80284.5', 'Iowa', 15, 0, 200);
INSERT INTO `lookup_city` VALUES (332, 'Ames', 'ames', '42.05385297', '-93.61972254', '56855', 'Iowa', 15, 1, 200);
INSERT INTO `lookup_city` VALUES (333, 'Mason City', 'masoncity', '43.15401837', '-93.20083338', '27327', 'Iowa', 15, 1, 200);
INSERT INTO `lookup_city` VALUES (334, 'Emporia', 'emporia', '38.40423077', '-96.18137496', '27796.5', 'Kansas', 16, 0, 200);
INSERT INTO `lookup_city` VALUES (335, 'Salina', 'salina', '38.82467023', '-97.6071794', '46877', 'Kansas', 16, 1, 200);
INSERT INTO `lookup_city` VALUES (336, 'Dodge City', 'dodgecity', '37.76005821', '-100.018195', '25237.5', 'Kansas', 16, 0, 200);
INSERT INTO `lookup_city` VALUES (337, 'Coffeyville', 'coffeyville', '37.03806093', '-95.6263184', '10955', 'Kansas', 16, 0, 200);
INSERT INTO `lookup_city` VALUES (338, 'St. Charles', 'st.charles', '38.78428509', '-90.50616581', '213139.5', 'Missouri', 25, 0, 200);
INSERT INTO `lookup_city` VALUES (339, 'Poplar Bluff', 'poplarbluff', '36.76019676', '-90.40268376', '18575', 'Missouri', 25, 0, 200);
INSERT INTO `lookup_city` VALUES (340, 'Joplin', 'joplin', '37.08459556', '-94.51307886', '60290.5', 'Missouri', 25, 1, 200);
INSERT INTO `lookup_city` VALUES (341, 'Columbia', 'columbia', '38.95207847', '-92.33390955', '244754', 'Missouri', 25, 1, 200);
INSERT INTO `lookup_city` VALUES (342, 'St. Joseph', 'st.joseph', '39.76903119', '-94.84639185', '74878.5', 'Missouri', 25, 1, 200);
INSERT INTO `lookup_city` VALUES (343, 'McCook', 'mccook', '40.20559369', '-100.6261683', '8003', 'Nebraska', 27, 0, 200);
INSERT INTO `lookup_city` VALUES (344, 'Norfolk', 'norfolk', '42.02871238', '-97.43359827', '24562', 'Nebraska', 27, 0, 200);
INSERT INTO `lookup_city` VALUES (345, 'North Platte', 'northplatte', '41.13628623', '-100.7705005', '24709.5', 'Nebraska', 27, 1, 200);
INSERT INTO `lookup_city` VALUES (346, 'Sidney', 'sidney', '41.13980023', '-102.9782727', '6221.5', 'Nebraska', 27, 0, 200);
INSERT INTO `lookup_city` VALUES (347, 'Scottsbluff', 'scottsbluff', '41.86750775', '-103.6606859', '20172', 'Nebraska', 27, 1, 200);
INSERT INTO `lookup_city` VALUES (348, 'Chadron', 'chadron', '42.82791424', '-103.0030774', '5686.5', 'Nebraska', 27, 0, 200);
INSERT INTO `lookup_city` VALUES (349, 'Lawton', 'lawton', '34.59903668', '-98.40997278', '85795.5', 'Oklahoma', 36, 1, 200);
INSERT INTO `lookup_city` VALUES (350, 'Norman', 'norman', '35.22791302', '-97.34414636', '113525', 'Oklahoma', 36, 1, 200);
INSERT INTO `lookup_city` VALUES (351, 'Muskogee', 'muskogee', '35.74821718', '-95.36943486', '38995.5', 'Oklahoma', 36, 0, 200);
INSERT INTO `lookup_city` VALUES (352, 'Ponca City', 'poncacity', '36.7073576', '-97.08527328', '24843', 'Oklahoma', 36, 0, 200);
INSERT INTO `lookup_city` VALUES (353, 'Shawnee', 'shawnee', '35.34278973', '-96.93378382', '29160', 'Oklahoma', 36, 0, 200);
INSERT INTO `lookup_city` VALUES (354, 'Woodward', 'woodward', '36.43342084', '-99.39769027', '12339.5', 'Oklahoma', 36, 0, 200);
INSERT INTO `lookup_city` VALUES (355, 'Guymon', 'guymon', '36.68580853', '-101.4795012', '10843.5', 'Oklahoma', 36, 0, 200);
INSERT INTO `lookup_city` VALUES (356, 'Yankton', 'yankton', '42.88201947', '-97.39248967', '14495', 'South Dakota', 41, 0, 200);
INSERT INTO `lookup_city` VALUES (357, 'Brookings', 'brookings', '44.30676455', '-96.78803044', '20313.5', 'South Dakota', 41, 0, 200);
INSERT INTO `lookup_city` VALUES (358, 'Mitchell', 'mitchell', '43.71429425', '-98.02619776', '14973', 'South Dakota', 41, 0, 200);
INSERT INTO `lookup_city` VALUES (359, 'Aberdeen', 'aberdeen', '45.46511761', '-98.48640222', '24854', 'South Dakota', 41, 1, 200);
INSERT INTO `lookup_city` VALUES (360, 'Mobridge', 'mobridge', '45.54012596', '-100.4347071', '3083.5', 'South Dakota', 41, 0, 200);
INSERT INTO `lookup_city` VALUES (361, 'Houma', 'houma', '29.59593121', '-90.71948613', '48196', 'Louisiana', 18, 1, 200);
INSERT INTO `lookup_city` VALUES (362, 'Monroe', 'monroe', '32.50960349', '-92.11919397', '76674.5', 'Louisiana', 18, 1, 200);
INSERT INTO `lookup_city` VALUES (363, 'Conroe', 'conroe', '30.31206321', '-95.45586369', '41643', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (364, 'Nacogdoches', 'nacogdoches', '31.60374147', '-94.65526656', '30691', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (365, 'Eagle Pass', 'eaglepass', '28.71102399', '-100.4892774', '39683', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (366, 'Edinburg', 'edinburg', '26.30318646', '-98.1599622', '114573.5', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (367, 'Kingsville', 'kingsville', '27.51595481', '-97.8558464', '24560.5', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (368, 'Port Arthur', 'portarthur', '29.89898765', '-93.92859257', '54972', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (369, 'Huntsville', 'huntsville', '30.72376935', '-95.55058659', '34444.5', 'Texas', 43, 1, 200);
INSERT INTO `lookup_city` VALUES (370, 'Killeen', 'killeen', '31.11728538', '-97.72748214', '120464', 'Texas', 43, 1, 200);
INSERT INTO `lookup_city` VALUES (371, 'Lufkin', 'lufkin', '31.33843467', '-94.72887964', '38465.5', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (372, 'Del Rio', 'delrio', '29.36294802', '-100.8963843', '35803.5', 'Texas', 43, 1, 200);
INSERT INTO `lookup_city` VALUES (373, 'San Angelo', 'sanangelo', '31.4640084', '-100.4366966', '87297.5', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (374, 'Sherman', 'sherman', '33.63599469', '-96.60858403', '38696', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (375, 'Beaumont', 'beaumont', '30.08626304', '-94.10168278', '107455.5', 'Texas', 43, 1, 200);
INSERT INTO `lookup_city` VALUES (376, 'Bay City', 'baycity', '28.98111086', '-95.96435978', '17487', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (377, 'Port Lavaca', 'portlavaca', '28.61601687', '-96.62969385', '10715.5', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (378, 'Falfurrias', 'falfurrias', '27.22690269', '-98.14489852', '5152.5', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (379, 'Beeville', 'beeville', '28.40597801', '-97.75083989', '11748', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (380, 'Fort Stockton', 'fortstockton', '30.89169191', '-102.8849968', '7434', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (381, 'Pecos', 'pecos', '31.41579429', '-103.4998947', '7991', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (382, 'Dumas', 'dumas', '35.86239626', '-101.9668875', '13551.5', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (383, 'Denton', 'denton', '33.21576194', '-97.12883651', '138952.5', 'Texas', 43, 1, 200);
INSERT INTO `lookup_city` VALUES (384, 'Midland', 'midland', '32.030718', '-102.0974996', '98141.5', 'Texas', 43, 1, 200);
INSERT INTO `lookup_city` VALUES (385, 'Temple', 'temple', '31.10209251', '-97.36300826', '58432', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (386, 'New Haven', 'newhaven', '41.33038291', '-72.90000533', '707883', 'Connecticut', 7, 1, 200);
INSERT INTO `lookup_city` VALUES (387, 'Lowell', 'lowell', '42.63368837', '-71.31669112', '415074', 'Massachusetts', 21, 1, 200);
INSERT INTO `lookup_city` VALUES (388, 'Worcester', 'worcester', '42.27042889', '-71.80002079', '232290.5', 'Massachusetts', 21, 1, 200);
INSERT INTO `lookup_city` VALUES (389, 'Manchester', 'manchester', '42.99599184', '-71.45528731', '153221.5', 'New Hampshire', 29, 0, 200);
INSERT INTO `lookup_city` VALUES (390, 'Newport', 'newport', '41.49039899', '-71.31335799', '35893', 'Rhode Island', 39, 1, 200);
INSERT INTO `lookup_city` VALUES (391, 'Dothan', 'dothan', '31.22345461', '-85.39058659', '61715', 'Alabama', 1, 1, 200);
INSERT INTO `lookup_city` VALUES (392, 'Tuscaloosa', 'tuscaloosa', '33.22511538', '-87.54417607', '100594.5', 'Alabama', 1, 1, 200);
INSERT INTO `lookup_city` VALUES (393, 'Gadsden', 'gadsden', '34.01455039', '-86.00664718', '39265', 'Alabama', 1, 1, 200);
INSERT INTO `lookup_city` VALUES (394, 'Enterprise', 'enterprise', '31.32781516', '-85.84399561', '23388.5', 'Alabama', 1, 0, 200);
INSERT INTO `lookup_city` VALUES (395, 'Selma', 'selma', '32.40756838', '-87.0211589', '19553', 'Alabama', 1, 0, 200);
INSERT INTO `lookup_city` VALUES (396, 'Coral Gables', 'coralgables', '25.71541872', '-80.29107874', '98700.5', 'Florida', 9, 0, 200);
INSERT INTO `lookup_city` VALUES (397, 'Cape Coral', 'capecoral', '26.60290977', '-81.97968368', '117387.5', 'Florida', 9, 0, 200);
INSERT INTO `lookup_city` VALUES (398, 'Naples', 'naples', '26.14205935', '-81.79499211', '141902', 'Florida', 9, 0, 200);
INSERT INTO `lookup_city` VALUES (399, 'Fort Pierce', 'fortpierce', '27.44678591', '-80.3258053', '132984', 'Florida', 9, 0, 200);
INSERT INTO `lookup_city` VALUES (400, 'Kissimmee', 'kissimmee', '28.29205731', '-81.4077806', '144589.5', 'Florida', 9, 0, 200);
INSERT INTO `lookup_city` VALUES (401, 'Titusville', 'titusville', '28.61234784', '-80.80779138', '47505.5', 'Florida', 9, 0, 200);
INSERT INTO `lookup_city` VALUES (402, 'St. Augustine', 'st.augustine', '29.89487937', '-81.31471135', '44214', 'Florida', 9, 1, 200);
INSERT INTO `lookup_city` VALUES (403, 'Ocala', 'ocala', '29.1873515', '-82.14026819', '95470', 'Florida', 9, 1, 200);
INSERT INTO `lookup_city` VALUES (404, 'Fort Lauderdale', 'fortlauderdale', '26.13606488', '-80.14178552', '1103781.5', 'Florida', 9, 1, 200);
INSERT INTO `lookup_city` VALUES (405, 'Apalachicola', 'apalachicola', '29.72561322', '-84.99252303', '2134', 'Florida', 9, 0, 200);
INSERT INTO `lookup_city` VALUES (406, 'Vero Beach', 'verobeach', '27.64225201', '-80.39112431', '51650.5', 'Florida', 9, 0, 200);
INSERT INTO `lookup_city` VALUES (407, 'Valdosta', 'valdosta', '30.8328583', '-83.27859664', '53420', 'Georgia', 10, 1, 200);
INSERT INTO `lookup_city` VALUES (408, 'Albany', 'albany', '31.57873008', '-84.15582992', '82280', 'Georgia', 10, 1, 200);
INSERT INTO `lookup_city` VALUES (409, 'Athens', 'athens', '33.96129783', '-83.3780221', '78017.5', 'Georgia', 10, 1, 200);
INSERT INTO `lookup_city` VALUES (410, 'Macon', 'macon', '32.85038373', '-83.63004806', '104932.5', 'Georgia', 10, 1, 200);
INSERT INTO `lookup_city` VALUES (411, 'Columbus', 'columbus', '32.47043276', '-84.98001734', '202225', 'Georgia', 10, 1, 200);
INSERT INTO `lookup_city` VALUES (412, 'Douglas', 'douglas', '31.50777834', '-82.85068994', '12159', 'Georgia', 10, 0, 200);
INSERT INTO `lookup_city` VALUES (413, 'Dublin', 'dublin', '32.53745709', '-82.91828272', '19258.5', 'Georgia', 10, 0, 200);
INSERT INTO `lookup_city` VALUES (414, 'Gulfport', 'gulfport', '30.3675637', '-89.09276371', '76646', 'Mississippi', 24, 0, 200);
INSERT INTO `lookup_city` VALUES (415, 'Hattiesburg', 'hattiesburg', '31.32727256', '-89.2902452', '53498.5', 'Mississippi', 24, 1, 200);
INSERT INTO `lookup_city` VALUES (416, 'Tupelo', 'tupelo', '34.25792055', '-88.70333012', '33928', 'Mississippi', 24, 0, 200);
INSERT INTO `lookup_city` VALUES (417, 'Greenville', 'greenville', '33.41037539', '-91.06168746', '36539.5', 'Mississippi', 24, 0, 200);
INSERT INTO `lookup_city` VALUES (418, 'Natchez', 'natchez', '31.55480389', '-91.38750737', '20490.5', 'Mississippi', 24, 0, 200);
INSERT INTO `lookup_city` VALUES (419, 'Florence', 'florence', '34.19567629', '-79.76279057', '43977.5', 'South Carolina', 40, 1, 200);
INSERT INTO `lookup_city` VALUES (420, 'Greenville', 'greenville', '34.85292299', '-82.3941545', '203256.5', 'South Carolina', 40, 1, 200);
INSERT INTO `lookup_city` VALUES (421, 'Sumter', 'sumter', '33.92065432', '-80.34172164', '27012', 'South Carolina', 40, 0, 200);
INSERT INTO `lookup_city` VALUES (422, 'Anderson', 'anderson', '34.50374534', '-82.6502629', '43475.5', 'South Carolina', 40, 0, 200);
INSERT INTO `lookup_city` VALUES (423, 'Aiken', 'aiken', '33.5494625', '-81.72060388', '36716.5', 'South Carolina', 40, 0, 200);
INSERT INTO `lookup_city` VALUES (424, 'Beaufort', 'beaufort', '32.43216636', '-80.68950403', '21941', 'South Carolina', 40, 0, 200);
INSERT INTO `lookup_city` VALUES (425, 'Rock Hill', 'rockhill', '34.94038535', '-81.03000004', '77165', 'South Carolina', 40, 0, 200);
INSERT INTO `lookup_city` VALUES (426, 'Decatur', 'decatur', '39.8407064', '-88.95473596', '74967.5', 'Illinois', 13, 1, 200);
INSERT INTO `lookup_city` VALUES (427, 'Alton', 'alton', '38.89099693', '-90.18422164', '57386', 'Illinois', 13, 0, 200);
INSERT INTO `lookup_city` VALUES (428, 'Quincy', 'quincy', '39.9359719', '-91.40972823', '43419.5', 'Illinois', 13, 0, 200);
INSERT INTO `lookup_city` VALUES (429, 'Urbana', 'urbana', '40.10999229', '-88.20418746', '91792.5', 'Illinois', 13, 0, 200);
INSERT INTO `lookup_city` VALUES (430, 'Bloomington', 'bloomington', '40.48459475', '-88.99359664', '99842.5', 'Illinois', 13, 1, 200);
INSERT INTO `lookup_city` VALUES (431, 'Kankakee', 'kankakee', '41.12036989', '-87.86110763', '48115.5', 'Illinois', 13, 0, 200);
INSERT INTO `lookup_city` VALUES (432, 'Waukegan', 'waukegan', '42.36404075', '-87.8447262', '144539', 'Illinois', 13, 0, 200);
INSERT INTO `lookup_city` VALUES (433, 'Aurora', 'aurora', '41.76539512', '-88.29999557', '273949.5', 'Illinois', 13, 0, 200);
INSERT INTO `lookup_city` VALUES (434, 'Carbondale', 'carbondale', '37.72683026', '-89.22024947', '28473', 'Illinois', 13, 1, 200);
INSERT INTO `lookup_city` VALUES (435, 'Belleville', 'belleville', '38.52515362', '-90.0002277', '92409.5', 'Illinois', 13, 0, 200);
INSERT INTO `lookup_city` VALUES (436, 'Bloomington', 'bloomington', '39.16565716', '-86.52640873', '85781.5', 'Indiana', 14, 1, 200);
INSERT INTO `lookup_city` VALUES (437, 'Muncie', 'muncie', '40.19375979', '-85.38637496', '75388', 'Indiana', 14, 1, 200);
INSERT INTO `lookup_city` VALUES (438, 'Kokomo', 'kokomo', '40.48676516', '-86.13364201', '53674', 'Indiana', 14, 1, 200);
INSERT INTO `lookup_city` VALUES (439, 'Gary', 'gary', '41.58039349', '-87.33000309', '335737', 'Indiana', 14, 0, 200);
INSERT INTO `lookup_city` VALUES (440, 'Fort Wayne', 'fortwayne', '41.08039817', '-85.12998234', '264793', 'Indiana', 14, 1, 200);
INSERT INTO `lookup_city` VALUES (441, 'Covington', 'covington', '39.0840084', '-84.50859908', '313064.5', 'Kentucky', 17, 0, 200);
INSERT INTO `lookup_city` VALUES (442, 'Bowling Green', 'bowlinggreen', '36.99069948', '-86.44364893', '61349', 'Kentucky', 17, 1, 200);
INSERT INTO `lookup_city` VALUES (443, 'Paducah', 'paducah', '37.08371706', '-88.60000309', '33812', 'Kentucky', 17, 0, 200);
INSERT INTO `lookup_city` VALUES (444, 'Owensboro', 'owensboro', '37.77457928', '-87.11332381', '61151.5', 'Kentucky', 17, 1, 200);
INSERT INTO `lookup_city` VALUES (445, 'Jacksonville', 'jacksonville', '34.75432436', '-77.43055567', '72651.5', 'North Carolina', 33, 0, 200);
INSERT INTO `lookup_city` VALUES (446, 'Goldsboro', 'goldsboro', '35.38513857', '-77.99305363', '42922.5', 'North Carolina', 33, 0, 200);
INSERT INTO `lookup_city` VALUES (447, 'Greenville', 'greenville', '35.61287661', '-77.3666836', '81661', 'North Carolina', 33, 0, 200);
INSERT INTO `lookup_city` VALUES (448, 'Fayetteville', 'fayetteville', '35.06293601', '-78.88359359', '184040.5', 'North Carolina', 33, 1, 200);
INSERT INTO `lookup_city` VALUES (449, 'Hickory', 'hickory', '35.7334894', '-81.34140222', '64898', 'North Carolina', 33, 1, 200);
INSERT INTO `lookup_city` VALUES (450, 'Asheville', 'asheville', '35.60119773', '-82.55414474', '105775', 'North Carolina', 33, 1, 200);
INSERT INTO `lookup_city` VALUES (451, 'Winston-Salem', 'winston-salem', '36.10543052', '-80.25999536', '237491.5', 'North Carolina', 33, 1, 200);
INSERT INTO `lookup_city` VALUES (452, 'Kitty Hawk', 'kittyhawk', '36.07731854', '-75.70471786', '2109.5', 'North Carolina', 33, 0, 200);
INSERT INTO `lookup_city` VALUES (453, 'Akron', 'akron', '41.07039878', '-81.51999597', '451155', 'Ohio', 35, 1, 200);
INSERT INTO `lookup_city` VALUES (454, 'Lima', 'lima', '40.74287355', '-84.10526453', '54135', 'Ohio', 35, 0, 200);
INSERT INTO `lookup_city` VALUES (455, 'Oak Ridge', 'oakridge', '36.01065594', '-84.26972477', '30471.5', 'Tennessee', 42, 0, 200);
INSERT INTO `lookup_city` VALUES (456, 'Murfreesboro', 'murfreesboro', '35.84596315', '-86.39026717', '100237', 'Tennessee', 42, 0, 200);
INSERT INTO `lookup_city` VALUES (457, 'Clarksville', 'clarksville', '36.5300816', '-87.35943282', '122115', 'Tennessee', 42, 1, 200);
INSERT INTO `lookup_city` VALUES (458, 'Jackson', 'jackson', '35.61486615', '-88.81389185', '62638', 'Tennessee', 42, 0, 200);
INSERT INTO `lookup_city` VALUES (459, 'Alexandria', 'alexandria', '38.82043276', '-77.09998153', '127273', 'Virginia', 46, 0, 200);
INSERT INTO `lookup_city` VALUES (460, 'Fredericksburg', 'fredericksburg', '38.30351341', '-77.46078638', '76848', 'Virginia', 46, 1, 200);
INSERT INTO `lookup_city` VALUES (461, 'Roanoke', 'roanoke', '37.27119916', '-79.94161686', '144669.5', 'Virginia', 46, 1, 200);
INSERT INTO `lookup_city` VALUES (462, 'Danville', 'danville', '36.58625388', '-79.39531946', '43176', 'Virginia', 46, 1, 200);
INSERT INTO `lookup_city` VALUES (463, 'Winchester', 'winchester', '39.1787313', '-78.16663477', '39418', 'Virginia', 46, 0, 200);
INSERT INTO `lookup_city` VALUES (464, 'Bristol', 'bristol', '36.61152366', '-82.17600244', '31276.5', 'Virginia', 46, 0, 200);
INSERT INTO `lookup_city` VALUES (465, 'Superior', 'superior', '46.72124249', '-92.10389775', '27474', 'Wisconsin', 49, 0, 200);
INSERT INTO `lookup_city` VALUES (466, 'West Bend', 'westbend', '43.42570721', '-88.18333602', '31980.5', 'Wisconsin', 49, 0, 200);
INSERT INTO `lookup_city` VALUES (467, 'Fond du Lac', 'fonddulac', '43.77343793', '-88.44691166', '48079.5', 'Wisconsin', 49, 0, 200);
INSERT INTO `lookup_city` VALUES (468, 'Oshkosh', 'oshkosh', '44.02510215', '-88.54251306', '67857.5', 'Wisconsin', 49, 0, 200);
INSERT INTO `lookup_city` VALUES (469, 'Rhinelander', 'rhinelander', '45.63991315', '-89.41207239', '9633', 'Wisconsin', 49, 0, 200);
INSERT INTO `lookup_city` VALUES (470, 'Racine', 'racine', '42.72771364', '-87.81183415', '105458.5', 'Wisconsin', 49, 1, 200);
INSERT INTO `lookup_city` VALUES (471, 'Marinette', 'marinette', '45.10038535', '-87.63047571', '19170', 'Wisconsin', 49, 0, 200);
INSERT INTO `lookup_city` VALUES (472, 'Wheeling', 'wheeling', '40.06431032', '-80.72107833', '40940', 'West Virginia', 48, 1, 200);
INSERT INTO `lookup_city` VALUES (473, 'Morgantown', 'morgantown', '39.62981488', '-79.95606043', '43882.5', 'West Virginia', 48, 1, 200);
INSERT INTO `lookup_city` VALUES (474, 'Huntington', 'huntington', '38.41957867', '-82.44528833', '66957', 'West Virginia', 48, 1, 200);
INSERT INTO `lookup_city` VALUES (475, 'Beckley', 'beckley', '37.78018618', '-81.18301396', '27358', 'West Virginia', 48, 0, 200);
INSERT INTO `lookup_city` VALUES (476, 'Wilmington', 'wilmington', '39.74626772', '-75.54689803', '116205.5', 'Delaware', 8, 0, 200);
INSERT INTO `lookup_city` VALUES (477, 'Cumberland', 'cumberland', '39.65317263', '-78.76277409', '20831.5', 'Maryland', 20, 1, 200);
INSERT INTO `lookup_city` VALUES (478, 'Atlantic City', 'atlanticcity', '39.36463727', '-74.4233232', '58563.5', 'New Jersey', 30, 0, 200);
INSERT INTO `lookup_city` VALUES (479, 'Newark', 'newark', '40.70042137', '-74.17000533', '280123', 'New Jersey', 30, 0, 200);
INSERT INTO `lookup_city` VALUES (480, 'Schenectady', 'schenectady', '42.81458173', '-73.93996769', '104767.5', 'New York', 32, 0, 200);
INSERT INTO `lookup_city` VALUES (481, 'Binghamton', 'binghamton', '42.09901817', '-75.91832239', '92687.5', 'New York', 32, 1, 200);
INSERT INTO `lookup_city` VALUES (482, 'Utica', 'utica', '43.10117922', '-75.23306706', '81870', 'New York', 32, 1, 200);
INSERT INTO `lookup_city` VALUES (483, 'Watertown', 'watertown', '43.97515688', '-75.91106185', '30938', 'New York', 32, 1, 200);
INSERT INTO `lookup_city` VALUES (484, 'Niagara Falls', 'niagarafalls', '43.09482302', '-79.0369434', '117567', 'New York', 32, 0, 200);
INSERT INTO `lookup_city` VALUES (485, 'Jamestown', 'jamestown', '42.09736452', '-79.23553593', '37916.5', 'New York', 32, 0, 200);
INSERT INTO `lookup_city` VALUES (486, 'Elmira', 'elmira', '42.09012982', '-76.80803552', '46201', 'New York', 32, 1, 200);
INSERT INTO `lookup_city` VALUES (487, 'York', 'york', '39.96292116', '-76.72804041', '128798.5', 'Pennsylvania', 38, 1, 200);
INSERT INTO `lookup_city` VALUES (488, 'Johnstown', 'johnstown', '40.32708498', '-78.92222172', '45821.5', 'Pennsylvania', 38, 0, 200);
INSERT INTO `lookup_city` VALUES (489, 'Scranton', 'scranton', '41.40929283', '-75.66267908', '114701', 'Pennsylvania', 38, 1, 200);
INSERT INTO `lookup_city` VALUES (490, 'State College', 'statecollege', '40.79372316', '-77.8602452', '64880.5', 'Pennsylvania', 38, 0, 200);
INSERT INTO `lookup_city` VALUES (491, 'Erie', 'erie', '42.12992067', '-80.08499313', '138991.5', 'Pennsylvania', 38, 1, 200);
INSERT INTO `lookup_city` VALUES (492, 'Wilkes Barre', 'wilkesbarre', '41.24904421', '-75.87793726', '99824.5', 'Pennsylvania', 38, 0, 200);
INSERT INTO `lookup_city` VALUES (493, 'Bar Harbor', 'barharbor', '44.38789654', '-68.20437464', '4483.5', 'Maine', 19, 0, 200);
INSERT INTO `lookup_city` VALUES (494, 'Lewiston', 'lewiston', '44.10070477', '-70.21525965', '46689', 'Maine', 19, 0, 200);
INSERT INTO `lookup_city` VALUES (495, 'Presque Isle', 'presqueisle', '46.79340863', '-68.00216476', '9466', 'Maine', 19, 0, 200);
INSERT INTO `lookup_city` VALUES (496, 'Ann Arbor', 'annarbor', '42.30037539', '-83.71999089', '189893', 'Michigan', 22, 1, 200);
INSERT INTO `lookup_city` VALUES (497, 'Kalamazoo', 'kalamazoo', '42.29215883', '-85.58718958', '128759.5', 'Michigan', 22, 1, 200);
INSERT INTO `lookup_city` VALUES (498, 'Muskegon', 'muskegon', '43.23458193', '-86.24836369', '70644.5', 'Michigan', 22, 0, 200);
INSERT INTO `lookup_city` VALUES (499, 'Flint', 'flint', '43.0128642', '-83.68753809', '206235', 'Michigan', 22, 1, 200);
INSERT INTO `lookup_city` VALUES (500, 'Grand Rapids', 'grandrapids', '42.96371991', '-85.66994938', '361934.5', 'Michigan', 22, 1, 200);
INSERT INTO `lookup_city` VALUES (501, 'Pontiac', 'pontiac', '42.65185264', '-83.29022384', '67994', 'Michigan', 22, 0, 200);
INSERT INTO `lookup_city` VALUES (502, 'Cadillac', 'cadillac', '44.25121238', '-85.41360844', '12177.5', 'Michigan', 22, 0, 200);
INSERT INTO `lookup_city` VALUES (503, 'Traverse City', 'traversecity', '44.76844179', '-85.62217452', '28807', 'Michigan', 22, 0, 200);
INSERT INTO `lookup_city` VALUES (504, 'Petoskey', 'petoskey', '45.37375368', '-84.95518681', '9424', 'Michigan', 22, 0, 200);
INSERT INTO `lookup_city` VALUES (505, 'Escanaba', 'escanaba', '45.7456948', '-87.06436039', '14970', 'Michigan', 22, 0, 200);
INSERT INTO `lookup_city` VALUES (506, 'Marquette', 'marquette', '46.54673118', '-87.40658757', '23711', 'Michigan', 22, 0, 200);
INSERT INTO `lookup_city` VALUES (507, 'Hancock', 'hancock', '47.12729006', '-88.5808053', '10322.5', 'Michigan', 22, 0, 200);
INSERT INTO `lookup_city` VALUES (508, 'Wrangell', 'wrangell', '56.47126752', '-132.3715949', '1658.5', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (509, 'Shishmaref', 'shishmaref', '66.25697512', '-166.0718893', '254', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (510, 'Hoonah', 'hoonah', '58.11540489', '-135.438617', '361', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (511, 'Atka', 'atka', '52.19648968', '-174.2004887', '61', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (512, 'Nikolski', 'nikolski', '52.93843406', '-168.8676876', '18', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (513, 'Karluk', 'karluk', '57.57228558', '-154.4550273', '96', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (514, 'False Pass', 'falsepass', '54.85121136', '-163.415023', '35', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (515, 'Kivalina', 'kivalina', '67.73149224', '-164.4859034', '374', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (516, 'Newhalen', 'newhalen', '59.72034568', '-154.8971967', '160', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (517, 'Pilot Point', 'pilotpoint', '57.56455996', '-157.5691266', '68', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (518, 'Chignik', 'chignik', '56.295671', '-158.4022282', '118', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (519, 'King Salmon', 'kingsalmon', '58.68870323', '-156.6613784', '292', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (520, 'Quinhagak', 'quinhagak', '59.74923281', '-161.9157864', '250', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (521, 'Aniak', 'aniak', '61.5787077', '-159.5221857', '501', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (522, 'Kotlit', 'kotlit', '63.03458783', '-163.5532833', '1002', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (523, 'Unalakleet', 'unalakleet', '63.87342552', '-160.7880516', '741', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (524, 'Koyuk', 'koyuk', '64.94026874', '-161.1574717', '254', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (525, 'McGrath', 'mcgrath', '62.9568148', '-155.5957845', '138', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (526, 'Hughes', 'hughes', '66.04918418', '-154.2549878', '78', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (527, 'Ambler', 'ambler', '67.08648521', '-157.8514091', '258', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (528, 'Wales', 'wales', '65.60959861', '-168.0875027', '99', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (529, 'Kotzebue', 'kotzebue', '66.89869305', '-162.5965975', '2873.5', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (530, 'Wasilla', 'wasilla', '61.58173077', '-149.439442', '8521', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (531, 'Circle', 'circle', '65.82589032', '-144.0605197', '100', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (532, 'Denali Park', 'denalipark', '63.73309816', '-148.9140994', '1063', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (533, 'Yakutat', 'yakutat', '59.54730715', '-139.7272183', '109', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (534, 'Homer', 'homer', '59.64293439', '-151.5482797', '5021.5', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (535, 'Tanacross', 'tanacross', '63.38570335', '-143.346403', '136', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (536, 'Wiseman', 'wiseman', '67.4104706', '-150.1074891', '14', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (537, 'Kailua-Kona', 'kailua-kona', '19.6405556', '-155.9955556', '9870', 'Hawaii', 11, 1, 200);
INSERT INTO `lookup_city` VALUES (538, 'Butte', 'butte', '46.0038961', '-112.5338394', '31478', 'Montana', 26, 1, 200);
INSERT INTO `lookup_city` VALUES (539, 'Grand Forks', 'grandforks', '47.92527753', '-97.0324858', '53496', 'North Dakota', 34, 1, 200);
INSERT INTO `lookup_city` VALUES (540, 'Pocatello', 'pocatello', '42.87134829', '-112.4447234', '57327', 'Idaho', 12, 0, 200);
INSERT INTO `lookup_city` VALUES (541, 'Tacoma', 'tacoma', '47.21131594', '-122.5150131', '460273', 'Washington', 47, 1, 200);
INSERT INTO `lookup_city` VALUES (542, 'Yuma', 'yuma', '32.68527753', '-114.6236084', '88402.5', 'Arizona', 3, 1, 200);
INSERT INTO `lookup_city` VALUES (543, 'Prescott', 'prescott', '34.59001914', '-112.4477723', '47587', 'Arizona', 3, 1, 200);
INSERT INTO `lookup_city` VALUES (544, 'Long Beach', 'longbeach', '33.78696739', '-118.1580439', '1249195.5', 'California', 5, 1, 200);
INSERT INTO `lookup_city` VALUES (545, 'Grand Junction', 'grandjunction', '39.09385276', '-108.5499998', '75076', 'Colorado', 6, 0, 200);
INSERT INTO `lookup_city` VALUES (546, 'Ely', 'ely', '39.24702171', '-114.887675', '3911', 'Nevada', 28, 0, 200);
INSERT INTO `lookup_city` VALUES (547, 'Carson City', 'carsoncity', '39.16384849', '-119.7663953', '53767', 'Nevada', 28, 0, 200);
INSERT INTO `lookup_city` VALUES (548, 'Carlsbad', 'carlsbad', '32.420565', '-104.2282998', '25240', 'New Mexico', 31, 0, 200);
INSERT INTO `lookup_city` VALUES (549, 'Alamogordo', 'alamogordo', '32.89947634', '-105.9597187', '33710.5', 'New Mexico', 31, 0, 200);
INSERT INTO `lookup_city` VALUES (550, 'Medford', 'medford', '42.32662701', '-122.8744227', '89081.5', 'Oregon', 37, 1, 200);
INSERT INTO `lookup_city` VALUES (551, 'Klamath Falls', 'klamathfalls', '42.22500531', '-121.7805359', '31090.5', 'Oregon', 37, 1, 200);
INSERT INTO `lookup_city` VALUES (552, 'St. George', 'st.george', '37.10415509', '-113.583336', '79988', 'Utah', 44, 1, 200);
INSERT INTO `lookup_city` VALUES (553, 'Provo', 'provo', '40.24889854', '-111.63777', '231238', 'Utah', 44, 1, 200);
INSERT INTO `lookup_city` VALUES (554, 'Laramie', 'laramie', '41.31136599', '-105.5905681', '25587.5', 'Wyoming', 50, 0, 200);
INSERT INTO `lookup_city` VALUES (555, 'Little Rock', 'littlerock', '34.73608258', '-92.33109318', '227555', 'Arkansas', 4, 1, 200);
INSERT INTO `lookup_city` VALUES (556, 'Wichita', 'wichita', '37.71998313', '-97.32998702', '378543.5', 'Kansas', 16, 1, 200);
INSERT INTO `lookup_city` VALUES (557, 'Jefferson City', 'jeffersoncity', '38.57662335', '-92.17332503', '45511', 'Missouri', 25, 0, 200);
INSERT INTO `lookup_city` VALUES (558, 'Rapid City', 'rapidcity', '44.08055096', '-103.2305571', '67760', 'South Dakota', 41, 1, 200);
INSERT INTO `lookup_city` VALUES (559, 'Lafayette', 'lafayette', '30.19997703', '-92.01994938', '135205.5', 'Louisiana', 18, 1, 200);
INSERT INTO `lookup_city` VALUES (560, 'Galveston', 'galveston', '29.301143', '-94.7974801', '62516', 'Texas', 43, 1, 200);
INSERT INTO `lookup_city` VALUES (561, 'Freeport', 'freeport', '28.95948427', '-95.35687748', '43762', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (562, 'Victoria', 'victoria', '28.80499758', '-97.00334029', '63126.5', 'Texas', 43, 1, 200);
INSERT INTO `lookup_city` VALUES (563, 'Odessa', 'odessa', '31.84556134', '-102.3672248', '98655', 'Texas', 43, 1, 200);
INSERT INTO `lookup_city` VALUES (564, 'Wichita Falls', 'wichitafalls', '33.91362632', '-98.49306848', '97429', 'Texas', 43, 1, 200);
INSERT INTO `lookup_city` VALUES (565, 'Waco', 'waco', '31.54917116', '-97.14638066', '143157', 'Texas', 43, 1, 200);
INSERT INTO `lookup_city` VALUES (566, 'Lubbock', 'lubbock', '33.58000327', '-101.8799677', '212343.5', 'Texas', 43, 1, 200);
INSERT INTO `lookup_city` VALUES (567, 'Hartford', 'hartford', '41.77002016', '-72.67996708', '518509.5', 'Connecticut', 7, 1, 200);
INSERT INTO `lookup_city` VALUES (568, 'Providence', 'providence', '41.82110231', '-71.4149797', '663726.5', 'Rhode Island', 39, 1, 200);
INSERT INTO `lookup_city` VALUES (569, 'Birmingham', 'birmingham', '33.53000633', '-86.82499516', '670142', 'Alabama', 1, 1, 200);
INSERT INTO `lookup_city` VALUES (570, 'Mobile', 'mobile', '30.68002525', '-88.04998499', '221870', 'Alabama', 1, 1, 200);
INSERT INTO `lookup_city` VALUES (571, 'Pensacola', 'pensacola', '30.42112632', '-87.21693506', '145319.5', 'Florida', 9, 1, 200);
INSERT INTO `lookup_city` VALUES (572, 'St. Petersburg', 'st.petersburg', '27.77053876', '-82.67938257', '523314.5', 'Florida', 9, 0, 200);
INSERT INTO `lookup_city` VALUES (573, 'Biloxi', 'biloxi', '30.39580487', '-88.88530868', '43857', 'Mississippi', 24, 1, 200);
INSERT INTO `lookup_city` VALUES (574, 'Springfield', 'springfield', '39.82000999', '-89.65001652', '125345', 'Illinois', 13, 1, 200);
INSERT INTO `lookup_city` VALUES (575, 'Frankfort', 'frankfort', '38.2008065', '-84.87335718', '32214.5', 'Kentucky', 17, 0, 200);
INSERT INTO `lookup_city` VALUES (576, 'Greensboro', 'greensboro', '36.07000633', '-79.80002344', '310328', 'North Carolina', 33, 1, 200);
INSERT INTO `lookup_city` VALUES (577, 'Dayton', 'dayton', '39.750376', '-84.19998743', '466067', 'Ohio', 35, 1, 200);
INSERT INTO `lookup_city` VALUES (578, 'Virginia Beach', 'virginiabeach', '36.85321433', '-75.97831873', '877475.5', 'Virginia', 46, 1, 200);
INSERT INTO `lookup_city` VALUES (579, 'Madison', 'madison', '43.07301556', '-89.40111699', '276036', 'Wisconsin', 49, 1, 200);
INSERT INTO `lookup_city` VALUES (580, 'Green Bay', 'greenbay', '44.5299809', '-88.00001388', '149811.5', 'Wisconsin', 49, 1, 200);
INSERT INTO `lookup_city` VALUES (581, 'Trenton', 'trenton', '40.2169625', '-74.74335535', '225713', 'New Jersey', 30, 0, 200);
INSERT INTO `lookup_city` VALUES (582, 'Lansing', 'lansing', '42.73352724', '-84.54673629', '198821.5', 'Michigan', 22, 1, 200);
INSERT INTO `lookup_city` VALUES (583, 'Gambell', 'gambell', '63.77971031', '-171.7310787', '681', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (584, 'Palmer', 'palmer', '61.59971417', '-149.1126919', '9848', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (585, 'Seward', 'seward', '60.1261607', '-149.4699827', '2900', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (586, 'Duluth', 'duluth', '46.78333173', '-92.10637822', '82026.5', 'Minnesota', 23, 1, 200);
INSERT INTO `lookup_city` VALUES (587, 'Bemidji', 'bemidji', '47.47357383', '-94.88018823', '14063.5', 'Minnesota', 23, 1, 200);
INSERT INTO `lookup_city` VALUES (588, 'Havre', 'havre', '48.54523968', '-109.6776829', '10266.5', 'Montana', 26, 0, 200);
INSERT INTO `lookup_city` VALUES (589, 'Kalispell', 'kalispell', '48.19776735', '-114.3159786', '25040', 'Montana', 26, 1, 200);
INSERT INTO `lookup_city` VALUES (590, 'Idaho Falls', 'idahofalls', '43.46668662', '-112.0333014', '65787', 'Idaho', 12, 0, 200);
INSERT INTO `lookup_city` VALUES (591, 'Lewiston', 'lewiston', '46.41660992', '-117.016589', '40096.5', 'Idaho', 12, 1, 200);
INSERT INTO `lookup_city` VALUES (592, 'Yakima', 'yakima', '46.60223167', '-120.5046965', '93846', 'Washington', 47, 1, 200);
INSERT INTO `lookup_city` VALUES (593, 'Wenatchee', 'wenatchee', '47.42362856', '-120.3090237', '45892', 'Washington', 47, 1, 200);
INSERT INTO `lookup_city` VALUES (594, 'Douglas', 'douglas', '31.35864016', '-109.5483627', '23438.5', 'Arizona', 3, 0, 200);
INSERT INTO `lookup_city` VALUES (595, 'Bakersfield', 'bakersfield', '35.36997154', '-119.0199809', '367259', 'California', 5, 1, 200);
INSERT INTO `lookup_city` VALUES (596, 'Oakland', 'oakland', '37.76892071', '-122.2211034', '953044', 'California', 5, 1, 200);
INSERT INTO `lookup_city` VALUES (597, 'Lancaster', 'lancaster', '34.69804873', '-118.135823', '225799', 'California', 5, 0, 200);
INSERT INTO `lookup_city` VALUES (598, 'Chico', 'chico', '39.72862022', '-121.8363982', '83226.5', 'California', 5, 1, 200);
INSERT INTO `lookup_city` VALUES (599, 'Monterey', 'monterey', '36.6002582', '-121.8935781', '77297.5', 'California', 5, 1, 200);
INSERT INTO `lookup_city` VALUES (600, 'Salinas', 'salinas', '36.68221702', '-121.6416555', '152737.5', 'California', 5, 0, 200);
INSERT INTO `lookup_city` VALUES (601, 'Los Alamos', 'losalamos', '35.89110252', '-106.2977084', '11997', 'New Mexico', 31, 0, 200);
INSERT INTO `lookup_city` VALUES (602, 'Eugene', 'eugene', '44.05001019', '-123.1000161', '195183', 'Oregon', 37, 1, 200);
INSERT INTO `lookup_city` VALUES (603, 'Coos Bay', 'coosbay', '43.36661521', '-124.2165888', '23685', 'Oregon', 37, 0, 200);
INSERT INTO `lookup_city` VALUES (604, 'Bend', 'bend', '44.071921', '-121.3099962', '70598.5', 'Oregon', 37, 1, 200);
INSERT INTO `lookup_city` VALUES (605, 'Cody', 'cody', '44.52321128', '-109.0571007', '8976.5', 'Wyoming', 50, 0, 200);
INSERT INTO `lookup_city` VALUES (606, 'Cedar Rapids', 'cedarrapids', '41.96998212', '-91.66002303', '149338.5', 'Iowa', 15, 1, 200);
INSERT INTO `lookup_city` VALUES (607, 'Springfield', 'springfield', '37.18001609', '-93.31999923', '180691', 'Missouri', 25, 1, 200);
INSERT INTO `lookup_city` VALUES (608, 'Lincoln', 'lincoln', '40.81997479', '-96.68000086', '244146', 'Nebraska', 27, 1, 200);
INSERT INTO `lookup_city` VALUES (609, 'Alexandria', 'alexandria', '31.31109784', '-92.44501388', '60876', 'Louisiana', 18, 1, 200);
INSERT INTO `lookup_city` VALUES (610, 'Abilene', 'abilene', '32.4486253', '-99.73278609', '108008', 'Texas', 43, 1, 200);
INSERT INTO `lookup_city` VALUES (611, 'Brownsville', 'brownsville', '25.91997988', '-97.50000248', '174707', 'Texas', 43, 1, 200);
INSERT INTO `lookup_city` VALUES (612, 'Tyler', 'tyler', '32.35108604', '-95.30078272', '101561.5', 'Texas', 43, 1, 200);
INSERT INTO `lookup_city` VALUES (613, 'Concord', 'concord', '43.20807192', '-71.53804712', '42646.5', 'New Hampshire', 29, 0, 200);
INSERT INTO `lookup_city` VALUES (614, 'Huntsville', 'huntsville', '34.71995953', '-86.60999536', '185474.5', 'Alabama', 1, 1, 200);
INSERT INTO `lookup_city` VALUES (615, 'Key West', 'keywest', '24.55523114', '-81.78274479', '27011.5', 'Florida', 9, 1, 200);
INSERT INTO `lookup_city` VALUES (616, 'West Palm Beach', 'westpalmbeach', '26.74501996', '-80.12362126', '675521.5', 'Florida', 9, 1, 200);
INSERT INTO `lookup_city` VALUES (617, 'Sarasota', 'sarasota', '27.33612083', '-82.53078699', '321223.5', 'Florida', 9, 1, 200);
INSERT INTO `lookup_city` VALUES (618, 'Daytona Beach', 'daytonabeach', '29.21055422', '-81.0230754', '140775.5', 'Florida', 9, 1, 200);
INSERT INTO `lookup_city` VALUES (619, 'Gainesville', 'gainesville', '29.65138002', '-82.32503727', '158390.5', 'Florida', 9, 1, 200);
INSERT INTO `lookup_city` VALUES (620, 'Ft. Myers', 'ft.myers', '26.64029767', '-81.86049199', '120810.5', 'Florida', 9, 1, 200);
INSERT INTO `lookup_city` VALUES (621, 'Brunswick', 'brunswick', '31.1496865', '-81.49165145', '31785.5', 'Georgia', 10, 1, 200);
INSERT INTO `lookup_city` VALUES (622, 'Augusta', 'augusta', '33.46081158', '-81.98498051', '152895.5', 'Georgia', 10, 1, 200);
INSERT INTO `lookup_city` VALUES (623, 'Vicksburg', 'vicksburg', '32.3524813', '-90.8777452', '24669.5', 'Mississippi', 24, 0, 200);
INSERT INTO `lookup_city` VALUES (624, 'Myrtle Beach', 'myrtlebeach', '33.68891136', '-78.8869784', '37333.5', 'South Carolina', 40, 1, 200);
INSERT INTO `lookup_city` VALUES (625, 'Charleston', 'charleston', '32.79237693', '-79.99210474', '254295', 'South Carolina', 40, 1, 200);
INSERT INTO `lookup_city` VALUES (626, 'Peoria', 'peoria', '40.69998212', '-89.67004114', '142622', 'Illinois', 13, 1, 200);
INSERT INTO `lookup_city` VALUES (627, 'Evansville', 'evansville', '37.97469627', '-87.5558291', '144788', 'Indiana', 14, 1, 200);
INSERT INTO `lookup_city` VALUES (628, 'Louisville', 'louisville', '38.22501691', '-85.74870427', '595819.5', 'Kentucky', 17, 1, 200);
INSERT INTO `lookup_city` VALUES (629, 'Lexington', 'lexington', '38.05001467', '-84.50002079', '244972', 'Kentucky', 17, 1, 200);
INSERT INTO `lookup_city` VALUES (630, 'Charlotte', 'charlotte', '35.20499453', '-80.83003809', '943574.5', 'North Carolina', 33, 1, 200);
INSERT INTO `lookup_city` VALUES (631, 'Youngstown', 'youngstown', '41.09969932', '-80.64973902', '194765', 'Ohio', 35, 1, 200);
INSERT INTO `lookup_city` VALUES (632, 'Canton', 'canton', '40.79886497', '-81.37863509', '168410', 'Ohio', 35, 1, 200);
INSERT INTO `lookup_city` VALUES (633, 'Toledo', 'toledo', '41.67002626', '-83.57997359', '388449', 'Ohio', 35, 1, 200);
INSERT INTO `lookup_city` VALUES (634, 'Columbus', 'columbus', '39.97997438', '-82.9900096', '1003418', 'Ohio', 35, 1, 200);
INSERT INTO `lookup_city` VALUES (635, 'Chattanooga', 'chattanooga', '35.06998985', '-85.25000086', '206571.5', 'Tennessee', 42, 1, 200);
INSERT INTO `lookup_city` VALUES (636, 'Charlottesville', 'charlottesville', '38.02918907', '-78.47692591', '61314', 'Virginia', 46, 1, 200);
INSERT INTO `lookup_city` VALUES (637, 'Lynchburg', 'lynchburg', '37.4136194', '-79.14246668', '84581', 'Virginia', 46, 1, 200);
INSERT INTO `lookup_city` VALUES (638, 'Wausau', 'wausau', '44.95915367', '-89.6299919', '56100.5', 'Wisconsin', 49, 1, 200);
INSERT INTO `lookup_city` VALUES (639, 'Albany', 'albany', '42.67001691', '-73.81994918', '484286', 'New York', 32, 1, 200);
INSERT INTO `lookup_city` VALUES (640, 'Ithaca', 'ithaca', '42.44057355', '-76.4969434', '45544.5', 'New York', 32, 1, 200);
INSERT INTO `lookup_city` VALUES (641, 'Harrisburg', 'harrisburg', '40.27359987', '-76.88474919', '289210', 'Pennsylvania', 38, 1, 200);
INSERT INTO `lookup_city` VALUES (642, 'Bangor', 'bangor', '44.80115297', '-68.77834477', '40843', 'Maine', 19, 0, 200);
INSERT INTO `lookup_city` VALUES (643, 'Portland', 'portland', '43.67216158', '-70.2455274', '99504', 'Maine', 19, 0, 200);
INSERT INTO `lookup_city` VALUES (644, 'Saginaw', 'saginaw', '43.4194802', '-83.95082951', '89457.5', 'Michigan', 22, 1, 200);
INSERT INTO `lookup_city` VALUES (645, 'Ketchikan', 'ketchikan', '55.3562193', '-131.6639895', '8121', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (646, 'Unalaska', 'unalaska', '53.868584', '-166.5316028', '1938.5', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (647, 'Togiak', 'togiak', '59.07036101', '-160.3783234', '236', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (648, 'Red Devil', 'reddevil', '61.76099632', '-157.3125273', '24', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (649, 'Hooper Bay', 'hooperbay', '61.53108787', '-166.0965648', '623', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (650, 'Wainwright', 'wainwright', '70.63688865', '-160.0383041', '174', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (651, 'Galena', 'galena', '64.73329551', '-156.9269953', '485', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (652, 'Kaktovik', 'kaktovik', '70.08785552', '-143.6029132', '101', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (653, 'Skagway', 'skagway', '59.45832033', '-135.3138959', '955', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (654, 'Cordova', 'cordova', '60.5427761', '-145.7574962', '1622.5', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (655, 'Kenai', 'kenai', '60.55435162', '-151.2580131', '6580.5', 'Alaska', 2, 1, 200);
INSERT INTO `lookup_city` VALUES (656, 'Fort Yukon', 'fortyukon', '66.56468243', '-145.2737789', '833', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (657, 'Santa Cruz', 'santacruz', '36.97194629', '-122.0263904', '101530.5', 'California', 5, 1, 200);
INSERT INTO `lookup_city` VALUES (658, 'San Bernardino', 'sanbernardino', '34.12038373', '-117.3000342', '973690.5', 'California', 5, 0, 200);
INSERT INTO `lookup_city` VALUES (659, 'Bridgeport', 'bridgeport', '41.17997866', '-73.19996118', '578545', 'Connecticut', 7, 1, 200);
INSERT INTO `lookup_city` VALUES (660, 'Rochester', 'rochester', '43.17042564', '-77.61994979', '483177', 'New York', 32, 1, 200);
INSERT INTO `lookup_city` VALUES (661, 'International Falls', 'internationalfalls', '48.60112775', '-93.4108464', '10832', 'Minnesota', 23, 0, 200);
INSERT INTO `lookup_city` VALUES (662, 'St. Paul', 'st.paul', '44.94398663', '-93.08497481', '509961', 'Minnesota', 23, 0, 200);
INSERT INTO `lookup_city` VALUES (663, 'Billings', 'billings', '45.78830202', '-108.5400004', '102151.5', 'Montana', 26, 1, 200);
INSERT INTO `lookup_city` VALUES (664, 'Great Falls', 'greatfalls', '47.50029055', '-111.299987', '61316.5', 'Montana', 26, 1, 200);
INSERT INTO `lookup_city` VALUES (665, 'Missoula', 'missoula', '46.87224103', '-113.9930526', '68010', 'Montana', 26, 1, 200);
INSERT INTO `lookup_city` VALUES (666, 'Minot', 'minot', '48.23249392', '-101.2958173', '37162', 'North Dakota', 34, 1, 200);
INSERT INTO `lookup_city` VALUES (667, 'Fargo', 'fargo', '46.8772278', '-96.7894257', '127472.5', 'North Dakota', 34, 1, 200);
INSERT INTO `lookup_city` VALUES (668, 'Hilo', 'hilo', '19.69999778', '-155.0900273', '47720.5', 'Hawaii', 11, 0, 200);
INSERT INTO `lookup_city` VALUES (669, 'Olympia', 'olympia', '47.03804486', '-122.899434', '100950', 'Washington', 47, 1, 200);
INSERT INTO `lookup_city` VALUES (670, 'Spokane', 'spokane', '47.66999595', '-117.4199494', '272483.5', 'Washington', 47, 1, 200);
INSERT INTO `lookup_city` VALUES (671, 'Vancouver', 'vancouver', '45.63030133', '-122.6399925', '343796.5', 'Washington', 47, 0, 200);
INSERT INTO `lookup_city` VALUES (672, 'Flagstaff', 'flagstaff', '35.19809572', '-111.6505083', '60779.5', 'Arizona', 3, 1, 200);
INSERT INTO `lookup_city` VALUES (673, 'Tucson', 'tucson', '32.20499676', '-110.8899862', '670953.5', 'Arizona', 3, 1, 200);
INSERT INTO `lookup_city` VALUES (674, 'Santa Barbara', 'santabarbara', '34.43498985', '-119.7199899', '135021', 'California', 5, 1, 200);
INSERT INTO `lookup_city` VALUES (675, 'Fresno', 'fresno', '36.7477169', '-119.7729841', '540768', 'California', 5, 1, 200);
INSERT INTO `lookup_city` VALUES (676, 'Eureka', 'eureka', '40.80222394', '-124.1474974', '34012', 'California', 5, 0, 200);
INSERT INTO `lookup_city` VALUES (677, 'Colorado Springs', 'coloradosprings', '38.86296246', '-104.7919863', '427272', 'Colorado', 6, 1, 200);
INSERT INTO `lookup_city` VALUES (678, 'Reno', 'reno', '39.52997601', '-119.8200096', '265363.5', 'Nevada', 28, 1, 200);
INSERT INTO `lookup_city` VALUES (679, 'Elko', 'elko', '40.83250633', '-115.7619886', '17537', 'Nevada', 28, 1, 200);
INSERT INTO `lookup_city` VALUES (680, 'Albuquerque', 'albuquerque', '35.10497479', '-106.6413308', '725723', 'New Mexico', 31, 1, 200);
INSERT INTO `lookup_city` VALUES (681, 'Salem', 'salem', '44.92807029', '-123.0238967', '187966', 'Oregon', 37, 1, 200);
INSERT INTO `lookup_city` VALUES (682, 'Casper', 'casper', '42.86661989', '-106.3124878', '56149', 'Wyoming', 50, 0, 200);
INSERT INTO `lookup_city` VALUES (683, 'Topeka', 'topeka', '39.05000531', '-95.66998499', '126830.5', 'Kansas', 16, 1, 200);
INSERT INTO `lookup_city` VALUES (684, 'Kansas City', 'kansascity', '39.10708851', '-94.60409422', '955272.5', 'Missouri', 25, 1, 200);
INSERT INTO `lookup_city` VALUES (685, 'Tulsa', 'tulsa', '36.12000327', '-95.93002079', '669434', 'Oklahoma', 36, 1, 200);
INSERT INTO `lookup_city` VALUES (686, 'Sioux Falls', 'siouxfalls', '43.54998903', '-96.7299978', '148030', 'South Dakota', 41, 1, 200);
INSERT INTO `lookup_city` VALUES (687, 'Shreveport', 'shreveport', '32.50001752', '-93.77002344', '224099', 'Louisiana', 18, 1, 200);
INSERT INTO `lookup_city` VALUES (688, 'Baton Rouge', 'batonrouge', '30.45794578', '-91.14015812', '322710.5', 'Louisiana', 18, 1, 200);
INSERT INTO `lookup_city` VALUES (689, 'Ft. Worth', 'ft.worth', '32.73997703', '-97.34003809', '1090830', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (690, 'Corpus Christi', 'corpuschristi', '27.74281435', '-97.40189478', '249977.5', 'Texas', 43, 1, 200);
INSERT INTO `lookup_city` VALUES (691, 'Austin', 'austin', '30.26694969', '-97.74277836', '919684', 'Texas', 43, 1, 200);
INSERT INTO `lookup_city` VALUES (692, 'Amarillo', 'amarillo', '35.22998008', '-101.8299966', '178526', 'Texas', 43, 0, 200);
INSERT INTO `lookup_city` VALUES (693, 'El Paso', 'elpaso', '31.77998395', '-106.5099952', '658331', 'Texas', 43, 1, 200);
INSERT INTO `lookup_city` VALUES (694, 'Laredo', 'laredo', '27.50613629', '-99.50721847', '322768.5', 'Texas', 43, 1, 200);
INSERT INTO `lookup_city` VALUES (695, 'Burlington', 'burlington', '44.47579816', '-73.21246688', '66204', 'Vermont', 45, 0, 200);
INSERT INTO `lookup_city` VALUES (696, 'Montgomery', 'montgomery', '32.36160219', '-86.27918868', '194491.5', 'Alabama', 1, 1, 200);
INSERT INTO `lookup_city` VALUES (697, 'Tallahassee', 'tallahassee', '30.44998761', '-84.28003422', '187402.5', 'Florida', 9, 1, 200);
INSERT INTO `lookup_city` VALUES (698, 'Orlando', 'orlando', '28.50997683', '-81.38003036', '778985', 'Florida', 9, 1, 200);
INSERT INTO `lookup_city` VALUES (699, 'Jacksonville', 'jacksonville', '30.33002077', '-81.66998682', '904953.5', 'Florida', 9, 1, 200);
INSERT INTO `lookup_city` VALUES (700, 'Savannah', 'savannah', '32.02110618', '-81.10999516', '155848.5', 'Georgia', 10, 1, 200);
INSERT INTO `lookup_city` VALUES (701, 'Columbia', 'columbia', '34.0399752', '-80.89998214', '257185.5', 'South Carolina', 40, 1, 200);
INSERT INTO `lookup_city` VALUES (702, 'Indianapolis', 'indianapolis', '39.74998842', '-86.17004806', '1104641.5', 'Indiana', 14, 1, 200);
INSERT INTO `lookup_city` VALUES (703, 'Wilmington', 'wilmington', '34.22551943', '-77.94502039', '126992', 'North Carolina', 33, 1, 200);
INSERT INTO `lookup_city` VALUES (704, 'Knoxville', 'knoxville', '35.97001243', '-83.92003036', '417137', 'Tennessee', 42, 1, 200);
INSERT INTO `lookup_city` VALUES (705, 'Richmond', 'richmond', '37.55001935', '-77.449986', '551443', 'Virginia', 46, 1, 200);
INSERT INTO `lookup_city` VALUES (706, 'Charleston', 'charleston', '38.34973798', '-81.63272811', '87113', 'West Virginia', 48, 1, 200);
INSERT INTO `lookup_city` VALUES (707, 'Baltimore', 'baltimore', '39.29999005', '-76.61998499', '1432946', 'Maryland', 20, 1, 200);
INSERT INTO `lookup_city` VALUES (708, 'Syracuse', 'syracuse', '43.04999371', '-76.15001367', '403873.5', 'New York', 32, 1, 200);
INSERT INTO `lookup_city` VALUES (709, 'Augusta', 'augusta', '44.31056276', '-69.77998906', '21301', 'Maine', 19, 0, 200);
INSERT INTO `lookup_city` VALUES (710, 'Sault Ste. Marie', 'saultste.marie', '46.49526145', '-84.34527572', '50173.5', 'Michigan', 22, 0, 200);
INSERT INTO `lookup_city` VALUES (711, 'Sitka', 'sitka', '57.06039769', '-135.3275494', '8110', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (712, 'Helena', 'helena', '46.59274904', '-112.035291', '33032.5', 'Montana', 26, 1, 200);
INSERT INTO `lookup_city` VALUES (713, 'Bismarck', 'bismarck', '46.80831728', '-100.7833163', '60288.5', 'North Dakota', 34, 1, 200);
INSERT INTO `lookup_city` VALUES (714, 'Boise', 'boise', '43.60859011', '-116.2274899', '242029', 'Idaho', 12, 1, 200);
INSERT INTO `lookup_city` VALUES (715, 'San Jose', 'sanjose', '37.29998293', '-121.8499891', '1281471.5', 'California', 5, 1, 200);
INSERT INTO `lookup_city` VALUES (716, 'Sacramento', 'sacramento', '38.57502138', '-121.4700381', '1035949', 'California', 5, 1, 200);
INSERT INTO `lookup_city` VALUES (717, 'Las Vegas', 'lasvegas', '36.20999778', '-115.2200061', '1150717', 'Nevada', 28, 1, 200);
INSERT INTO `lookup_city` VALUES (718, 'Santa Fe', 'santafe', '35.68692893', '-105.9372394', '80943', 'New Mexico', 31, 1, 200);
INSERT INTO `lookup_city` VALUES (719, 'Portland', 'portland', '45.52002382', '-122.6799901', '1207756.5', 'Oregon', 37, 1, 200);
INSERT INTO `lookup_city` VALUES (720, 'Salt Lake City', 'saltlakecity', '40.7750163', '-111.9300519', '572013', 'Utah', 44, 1, 200);
INSERT INTO `lookup_city` VALUES (721, 'Cheyenne', 'cheyenne', '41.14000694', '-104.8197107', '64185', 'Wyoming', 50, 0, 200);
INSERT INTO `lookup_city` VALUES (722, 'Des Moines', 'desmoines', '41.57998008', '-93.61998092', '286917.5', 'Iowa', 15, 1, 200);
INSERT INTO `lookup_city` VALUES (723, 'Omaha', 'omaha', '41.24000083', '-96.00999007', '643034', 'Nebraska', 27, 1, 200);
INSERT INTO `lookup_city` VALUES (724, 'Oklahoma City', 'oklahomacity', '35.47004295', '-97.51868351', '660475', 'Oklahoma', 36, 1, 200);
INSERT INTO `lookup_city` VALUES (725, 'Pierre', 'pierre', '44.36833701', '-100.350552', '13734.5', 'South Dakota', 41, 1, 200);
INSERT INTO `lookup_city` VALUES (726, 'San Antonio', 'sanantonio', '29.48733319', '-98.50730534', '1364905', 'Texas', 43, 1, 200);
INSERT INTO `lookup_city` VALUES (727, 'Jackson', 'jackson', '32.29881533', '-90.18499679', '213799', 'Mississippi', 24, 1, 200);
INSERT INTO `lookup_city` VALUES (728, 'Raleigh', 'raleigh', '35.81878135', '-78.64469344', '789991.5', 'North Carolina', 33, 0, 200);
INSERT INTO `lookup_city` VALUES (729, 'Cleveland', 'cleveland', '41.4699868', '-81.69499821', '1169757', 'Ohio', 35, 1, 200);
INSERT INTO `lookup_city` VALUES (730, 'Cincinnati', 'cincinnati', '39.16188479', '-84.45692265', '971191', 'Ohio', 35, 1, 200);
INSERT INTO `lookup_city` VALUES (731, 'Nashville', 'nashville', '36.16997438', '-86.77998499', '703926', 'Tennessee', 42, 1, 200);
INSERT INTO `lookup_city` VALUES (732, 'Memphis', 'memphis', '35.1199868', '-89.99999516', '753843.5', 'Tennessee', 42, 1, 200);
INSERT INTO `lookup_city` VALUES (733, 'Norfolk', 'norfolk', '36.84995872', '-76.28000574', '645336', 'Virginia', 46, 1, 200);
INSERT INTO `lookup_city` VALUES (734, 'Milwaukee', 'milwaukee', '43.05265505', '-87.91996708', '983590', 'Wisconsin', 49, 1, 200);
INSERT INTO `lookup_city` VALUES (735, 'Buffalo', 'buffalo', '42.87997825', '-78.88000208', '647778.5', 'New York', 32, 0, 200);
INSERT INTO `lookup_city` VALUES (736, 'Pittsburgh', 'pittsburgh', '40.4299986', '-79.99998539', '1535267.5', 'Pennsylvania', 38, 1, 200);
INSERT INTO `lookup_city` VALUES (737, 'Kodiak', 'kodiak', '57.78999839', '-152.4069869', '7804.5', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (738, 'Cold Bay', 'coldbay', '55.20000144', '-162.7150916', '154', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (739, 'Bethel', 'bethel', '60.79330345', '-161.7557961', '5440.5', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (740, 'Point Hope', 'pointhope', '68.34772605', '-166.8080201', '461', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (741, 'Barrow', 'barrow', '71.29056968', '-156.78858', '3412', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (742, 'Nome', 'nome', '64.50610008', '-165.4063744', '3021', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (743, 'Valdez', 'valdez', '61.13599571', '-146.348287', '3283', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (744, 'Juneau', 'juneau', '58.31412661', '-134.419997', '26172', 'Alaska', 2, 1, 200);
INSERT INTO `lookup_city` VALUES (745, 'Fairbanks', 'fairbanks', '64.83698427', '-147.7106586', '43608.5', 'Alaska', 2, 1, 200);
INSERT INTO `lookup_city` VALUES (746, 'Prudhoe Bay', 'prudhoebay', '70.29218101', '-148.6693598', '2337', 'Alaska', 2, 0, 200);
INSERT INTO `lookup_city` VALUES (747, 'Minneapolis', 'minneapolis', '44.97997927', '-93.25178634', '1491886.5', 'Minnesota', 23, 1, 200);
INSERT INTO `lookup_city` VALUES (748, 'Honolulu', 'honolulu', '21.30687644', '-157.8579979', '578828.5', 'Hawaii', 11, 1, 200);
INSERT INTO `lookup_city` VALUES (749, 'Seattle', 'seattle', '47.57000205', '-122.339985', '1821684.5', 'Washington', 47, 1, 200);
INSERT INTO `lookup_city` VALUES (750, 'Phoenix', 'phoenix', '33.53997988', '-112.0699917', '2436022.5', 'Arizona', 3, 1, 200);
INSERT INTO `lookup_city` VALUES (751, 'San Diego', 'sandiego', '32.82002382', '-117.1799899', '1938570.5', 'California', 5, 1, 200);
INSERT INTO `lookup_city` VALUES (752, 'St. Louis', 'st.louis', '38.63501772', '-90.23998051', '1259958', 'Missouri', 25, 1, 200);
INSERT INTO `lookup_city` VALUES (753, 'New Orleans', 'neworleans', '29.99500246', '-90.03996688', '527428.5', 'Louisiana', 18, 1, 200);
INSERT INTO `lookup_city` VALUES (754, 'Dallas', 'dallas', '32.82002382', '-96.84001693', '3004852', 'Texas', 43, 1, 200);
INSERT INTO `lookup_city` VALUES (755, 'Boston', 'boston', '42.32996014', '-71.07001367', '2528070.5', 'Massachusetts', 21, 1, 200);
INSERT INTO `lookup_city` VALUES (756, 'Tampa', 'tampa', '27.94698793', '-82.45862085', '1319232.5', 'Florida', 9, 1, 200);
INSERT INTO `lookup_city` VALUES (757, 'Philadelphia', 'philadelphia', '39.99997316', '-75.16999597', '3504775', 'Pennsylvania', 38, 1, 200);
INSERT INTO `lookup_city` VALUES (758, 'Detroit', 'detroit', '42.32996014', '-83.08005579', '2526135', 'Michigan', 22, 1, 200);
INSERT INTO `lookup_city` VALUES (759, 'Anchorage', 'anchorage', '61.21996991', '-149.9002149', '252068', 'Alaska', 2, 1, 200);
INSERT INTO `lookup_city` VALUES (760, 'San Francisco', 'sanfrancisco', '37.74000775', '-122.4599777', '2091036', 'California', 5, 1, 200);
INSERT INTO `lookup_city` VALUES (761, 'Denver', 'denver', '39.73918805', '-104.984016', '1930799.5', 'Colorado', 6, 1, 200);
INSERT INTO `lookup_city` VALUES (762, 'Houston', 'houston', '29.81997438', '-95.33997929', '4053287', 'Texas', 43, 1, 200);
INSERT INTO `lookup_city` VALUES (763, 'Miami', 'miami', '25.7876107', '-80.22410608', '2983947', 'Florida', 9, 1, 200);
INSERT INTO `lookup_city` VALUES (764, 'Atlanta', 'atlanta', '33.83001385', '-84.39994938', '2464454', 'Georgia', 10, 1, 200);
INSERT INTO `lookup_city` VALUES (765, 'Chicago', 'chicago', '41.82999066', '-87.75005497', '5915976', 'Illinois', 13, 1, 200);
INSERT INTO `lookup_city` VALUES (766, 'Los Angeles', 'losangeles', '33.98997825', '-118.1799805', '8097410', 'California', 5, 1, 200);
INSERT INTO `lookup_city` VALUES (767, 'Washington, D.C.', 'washington,d.c.', '38.89954938', '-77.00941858', '2445216.5', 'District of Columbia', 52, 0, 200);
INSERT INTO `lookup_city` VALUES (768, 'New York', 'newyork', '40.74997906', '-73.98001693', '13524139', 'New York', 32, 0, 200);
INSERT INTO `lookup_city` VALUES (769, 'Faribault', 'faribault', '44.29048647', '-93.26801274', '24004.5', 'Minnesota', 23, 0, 200);
INSERT INTO `lookup_city` VALUES (770, 'Atlantic City', 'atlanticcity', '39.3643', '-74.4229', '0', 'New Jersey', 30, 1, 200);
INSERT INTO `lookup_city` VALUES (771, 'East Brunswick', 'eastbrunswick', '40.432838', '-74.399071', '0', 'New Jersey', 30, 1, 200);
INSERT INTO `lookup_city` VALUES (772, 'Elizabeth', 'elizabeth', '40.666058', '-74.200974', '0', 'New Jersey', 30, 1, 200);
INSERT INTO `lookup_city` VALUES (773, 'Jersey CIty', 'jerseycIty', '40.7281575', '-74.0776417', '0', 'New Jersey', 30, 1, 200);
INSERT INTO `lookup_city` VALUES (774, 'Newark', 'Newark', '40.735657', '-74.172363', '0', 'New Jersey', 30, 1, 200);
INSERT INTO `lookup_city` VALUES (775, 'North Jersey', 'northjersey', '39.833851', '-74.871826', '0', 'New Jersey', 30, 1, 200);
INSERT INTO `lookup_city` VALUES (776, 'Woodbridge', 'woodbridge', '40.332736', '-74.170456', '0', 'New Jersey', 30, 1, 200);
INSERT INTO `lookup_city` VALUES (777, 'Maine', 'maine', '45.367584', '-68.972168', '0', 'Maine', 19, 1, 200);
INSERT INTO `lookup_city` VALUES (778, 'Portland', 'portland', '43.6615', '-70.25553', '0', 'Maine', 19, 1, 200);
INSERT INTO `lookup_city` VALUES (779, 'Manchester', 'manchester', '42.9956', '-71.4548', '0', 'New Hampshire', 29, 1, 200);
INSERT INTO `lookup_city` VALUES (780, 'New Hampshire', 'newhampshire', '43.193852', '-71.454391', '0', 'New Hampshire', 29, 1, 200);
INSERT INTO `lookup_city` VALUES (781, 'Burlington', 'burlington', '44.4759', '-73.2121', '0', 'Vermont', 45, 1, 200);
INSERT INTO `lookup_city` VALUES (782, 'Cheyenne', 'cheyenne', '41.1400', '-104.8202', '0', 'Wyoming', 50, 1, 200);
INSERT INTO `lookup_city` VALUES (783, 'Wilmington', 'wilmington', '37.7391', '-75.5398', '0', 'Delaware', 8, 1, 200);

-- ----------------------------
-- Table structure for lookup_state
-- ----------------------------
DROP TABLE IF EXISTS `lookup_state`;
CREATE TABLE `lookup_state`  (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `state_code` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state_slug` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state_timezone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state_online` tinyint(1) NOT NULL DEFAULT 1,
  `created_timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `state_popul` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`state_id`) USING BTREE,
  UNIQUE INDEX `state_name`(`state_name`) USING BTREE,
  UNIQUE INDEX `state_slug`(`state_slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of lookup_state
-- ----------------------------
INSERT INTO `lookup_state` VALUES (1, 'AL', 'Alabama', 'alabama', 'America/Los_Angeles', 1, '2017-09-13 01:28:01', 4863300);
INSERT INTO `lookup_state` VALUES (2, 'AK', 'Alaska', 'alaska', 'America/Denver', 1, '2017-09-13 01:28:01', 741894);
INSERT INTO `lookup_state` VALUES (3, 'AZ', 'Arizona', 'arizona', 'America/New_York', 1, '2017-09-13 01:28:01', 6931071);
INSERT INTO `lookup_state` VALUES (4, 'AR', 'Arkansas', 'arkansas', 'America/Chicago', 1, '2017-09-13 01:28:01', 2988248);
INSERT INTO `lookup_state` VALUES (5, 'CA', 'California', 'california', 'America/New_York', 1, '2017-09-13 01:28:01', 39250017);
INSERT INTO `lookup_state` VALUES (6, 'CO', 'Colorado', 'colorado', 'America/New_York', 1, '2017-09-13 01:28:01', 5540545);
INSERT INTO `lookup_state` VALUES (7, 'CT', 'Connecticut', 'connecticut', 'America/Los_Angeles', 1, '2017-09-13 01:28:01', 3576452);
INSERT INTO `lookup_state` VALUES (8, 'DE', 'Delaware', 'delaware', 'America/New_York', 1, '2017-09-13 01:28:01', 952065);
INSERT INTO `lookup_state` VALUES (9, 'FL', 'Florida', 'florida', 'America/Chicago', 1, '2017-09-13 01:28:01', 20612439);
INSERT INTO `lookup_state` VALUES (10, 'GA', 'Georgia ', 'georgia', 'America/Los_Angeles', 1, '2017-09-13 01:28:01', 10310371);
INSERT INTO `lookup_state` VALUES (11, 'HI', 'Hawaii', 'hawaii', 'America/Los_Angeles', 1, '2017-09-13 01:28:01', 1428557);
INSERT INTO `lookup_state` VALUES (12, 'ID', 'Idaho', 'idaho', 'America/Los_Angeles', 1, '2017-09-13 01:28:01', 1683140);
INSERT INTO `lookup_state` VALUES (13, 'IL', 'Illinois', 'illinois', 'America/Los_Angeles', 1, '2017-09-13 01:28:01', 12801539);
INSERT INTO `lookup_state` VALUES (14, 'IN', 'Indiana', 'indiana', 'America/Los_Angeles', 1, '2017-09-13 01:28:01', 6633053);
INSERT INTO `lookup_state` VALUES (15, 'IA', 'Iowa', 'iowa', 'America/Los_Angeles', 1, '2017-09-13 01:28:01', 3134693);
INSERT INTO `lookup_state` VALUES (16, 'KS', 'Kansas', 'kansas', 'America/Los_Angeles', 1, '2017-09-13 01:28:01', 2907289);
INSERT INTO `lookup_state` VALUES (17, 'KY', 'Kentucky', 'kentucky', 'America/Los_Angeles', 1, '2017-09-13 01:28:01', 4436974);
INSERT INTO `lookup_state` VALUES (18, 'LA', 'Louisiana', 'louisiana', 'America/Los_Angeles', 1, '2017-09-13 01:28:02', 4681666);
INSERT INTO `lookup_state` VALUES (19, 'ME', 'Maine', 'maine', 'America/Los_Angeles', 1, '2017-09-13 01:28:02', 1331479);
INSERT INTO `lookup_state` VALUES (20, 'MD', 'Maryland', 'maryland', 'America/Los_Angeles', 1, '2017-09-13 01:28:02', 6016447);
INSERT INTO `lookup_state` VALUES (21, 'MA', 'Massachusetts', 'massachusetts', 'America/Los_Angeles', 1, '2017-09-13 01:28:02', 6811779);
INSERT INTO `lookup_state` VALUES (22, 'MI', 'Michigan', 'michigan', 'America/Los_Angeles', 1, '2017-09-13 01:28:02', 9928300);
INSERT INTO `lookup_state` VALUES (23, 'MN', 'Minnesota', 'minnesota', 'America/Los_Angeles', 1, '2017-09-13 01:28:02', 5519952);
INSERT INTO `lookup_state` VALUES (24, 'MS', 'Mississippi', 'mississippi', 'America/Los_Angeles', 1, '2017-09-13 01:28:02', 2988726);
INSERT INTO `lookup_state` VALUES (25, 'MO', 'Missouri', 'missouri', 'America/Los_Angeles', 1, '2017-09-13 01:28:02', 6093000);
INSERT INTO `lookup_state` VALUES (26, 'MT', 'Montana', 'montana', 'America/Los_Angeles', 1, '2017-09-13 01:28:02', 1042520);
INSERT INTO `lookup_state` VALUES (27, 'NE', 'Nebraska', 'nebraska', 'America/Los_Angeles', 1, '2017-09-13 01:28:02', 1907116);
INSERT INTO `lookup_state` VALUES (28, 'NV', 'Nevada', 'nevada', 'America/Los_Angeles', 1, '2017-09-13 01:28:02', 2940058);
INSERT INTO `lookup_state` VALUES (29, 'NH', 'New Hampshire', 'newhampshire', 'America/Los_Angeles', 1, '2017-09-13 01:28:02', 1334795);
INSERT INTO `lookup_state` VALUES (30, 'NJ', 'New Jersey', 'newjersey', 'America/Los_Angeles', 1, '2017-09-13 01:28:02', 8944469);
INSERT INTO `lookup_state` VALUES (31, 'NM', 'New Mexico', 'newmexico', 'America/Los_Angeles', 1, '2017-09-13 01:28:02', 2081015);
INSERT INTO `lookup_state` VALUES (32, 'NY', 'New York', 'newyork', 'America/Los_Angeles', 1, '2017-09-13 01:28:02', 19745289);
INSERT INTO `lookup_state` VALUES (33, 'NC', 'North Carolina', 'northcarolina', 'America/Los_Angeles', 1, '2017-09-13 01:28:02', 10146788);
INSERT INTO `lookup_state` VALUES (34, 'ND', 'North Dakota', 'northdakota', 'America/Los_Angeles', 1, '2017-09-13 01:28:02', 757952);
INSERT INTO `lookup_state` VALUES (35, 'OH', 'Ohio', 'ohio', 'America/Los_Angeles', 1, '2017-09-13 01:28:02', 11614373);
INSERT INTO `lookup_state` VALUES (36, 'OK', 'Oklahoma', 'oklahoma', 'America/Los_Angeles', 1, '2017-09-13 01:28:02', 3923561);
INSERT INTO `lookup_state` VALUES (37, 'OR', 'Oregon', 'oregon', 'America/Los_Angeles', 1, '2017-09-13 01:28:02', 4093465);
INSERT INTO `lookup_state` VALUES (38, 'PA', 'Pennsylvania', 'pennsylvania', 'America/Los_Angeles', 1, '2017-09-13 01:28:02', 12784227);
INSERT INTO `lookup_state` VALUES (39, 'RI', 'Rhode Island', 'rhodeisland', 'America/Los_Angeles', 1, '2017-09-13 01:28:02', 1056426);
INSERT INTO `lookup_state` VALUES (40, 'SC', 'South Carolina', 'southcarolina', 'America/Los_Angeles', 1, '2017-09-13 01:28:02', 4961119);
INSERT INTO `lookup_state` VALUES (41, 'SD', 'South Dakota', 'southdakota', 'America/Los_Angeles', 1, '2017-09-13 01:28:02', 865454);
INSERT INTO `lookup_state` VALUES (42, 'TN', 'Tennessee', 'tennessee', 'America/Los_Angeles', 1, '2017-09-13 01:28:03', 6651194);
INSERT INTO `lookup_state` VALUES (43, 'TX', 'Texas', 'texas', 'America/Los_Angeles', 1, '2017-09-13 01:28:03', 27862596);
INSERT INTO `lookup_state` VALUES (44, 'UT', 'Utah', 'utah', 'America/Los_Angeles', 1, '2017-09-13 01:28:03', 3051217);
INSERT INTO `lookup_state` VALUES (45, 'VT', 'Vermont', 'vermont', 'America/Los_Angeles', 1, '2017-09-13 01:28:03', 624594);
INSERT INTO `lookup_state` VALUES (46, 'VA', 'Virginia', 'virginia', 'America/Los_Angeles', 1, '2017-09-13 01:28:03', 8411808);
INSERT INTO `lookup_state` VALUES (47, 'WA', 'Washington', 'washington', 'America/Los_Angeles', 1, '2017-09-13 01:28:03', 7288000);
INSERT INTO `lookup_state` VALUES (48, 'WV', 'West Virginia', 'westvirginia', 'America/Los_Angeles', 1, '2017-09-13 01:28:03', 1831102);
INSERT INTO `lookup_state` VALUES (49, 'WI', 'Wisconsin', 'wisconsin', 'America/Los_Angeles', 1, '2017-09-13 01:28:03', 5778708);
INSERT INTO `lookup_state` VALUES (50, 'WY', 'Wyoming', 'wyoming', 'America/Los_Angeles', 1, '2017-09-13 01:28:03', 585501);
INSERT INTO `lookup_state` VALUES (51, 'AS', 'American Samoa', 'americansamoa', 'America/New_York', 0, '2017-09-14 02:59:03', 55519);
INSERT INTO `lookup_state` VALUES (52, 'DC', 'District Of Columbia', 'districtofcolumbia', 'America/New_York', 0, '2017-09-14 02:59:11', 681170);
INSERT INTO `lookup_state` VALUES (53, 'FM', 'Federated States Of Micronesia', 'federatedstatesofmicronesia', 'America/New_York', 0, '2017-09-14 02:59:22', 106104);
INSERT INTO `lookup_state` VALUES (54, 'GU', 'Guam', 'guam', 'America/Los_Angeles', 0, '2017-09-14 02:59:42', 159358);
INSERT INTO `lookup_state` VALUES (55, 'MH', 'Marshall Islands', 'marshallislands', 'America/Los_Angeles', 0, '2017-09-14 02:59:44', 53263);
INSERT INTO `lookup_state` VALUES (56, 'MP', 'Northern Mariana Islands', 'northernmarianaislands', 'America/Los_Angeles', 0, '2017-09-14 02:59:47', 53467);
INSERT INTO `lookup_state` VALUES (57, 'PR', 'Puerto Rico', 'puertorico', 'America/Los_Angeles', 0, '2017-09-14 02:59:50', 3725789);
INSERT INTO `lookup_state` VALUES (58, 'PW', 'Palau', 'palau', 'America/Los_Angeles', 0, '2017-09-14 02:59:53', 21413);
INSERT INTO `lookup_state` VALUES (59, 'VI', 'Virgin Islands', 'virginislands', 'America/Los_Angeles', 0, '2017-09-14 02:59:58', 106405);

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages`  (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NULL DEFAULT NULL,
  `sender_id` int(255) NULL DEFAULT NULL,
  `message_content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `message_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `read_already` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of messages
-- ----------------------------
INSERT INTO `messages` VALUES (23, 80, 34, 'dsddsfsdfsdfsdf', '2017-08-17 21:41:22', 0);
INSERT INTO `messages` VALUES (24, 80, 34, 'asdfasdfdf', '2017-08-17 21:41:27', 0);
INSERT INTO `messages` VALUES (25, 83, 34, '3434343434', '2017-08-17 21:42:57', 0);
INSERT INTO `messages` VALUES (26, 83, 34, 'asdasdsadasd', '2017-08-17 21:48:34', 0);
INSERT INTO `messages` VALUES (27, 83, 34, 'asdsadasd', '2017-08-17 21:54:10', 1);
INSERT INTO `messages` VALUES (28, 83, 34, 'dsdfsfdsf', '2017-08-17 21:56:30', 1);
INSERT INTO `messages` VALUES (29, 83, 34, '45454545', '2017-08-17 21:59:43', 0);
INSERT INTO `messages` VALUES (30, 83, 34, 'asdasdasdsdasd', '2017-08-17 22:02:46', 0);
INSERT INTO `messages` VALUES (31, 84, 34, 'dfsafasdfdsaf', '2017-08-17 22:16:39', 1);
INSERT INTO `messages` VALUES (32, 84, 34, 'ewrewrewr', '2017-08-17 22:19:07', 0);
INSERT INTO `messages` VALUES (33, 84, 34, 'asdsadasd', '2017-08-17 22:30:39', 1);
INSERT INTO `messages` VALUES (34, 85, 34, 'dfdfdfd', '2017-08-17 22:54:14', 0);
INSERT INTO `messages` VALUES (35, 89, 34, 'rrtrtrtrtrt', '2017-08-18 00:17:28', 1);
INSERT INTO `messages` VALUES (36, 89, 34, '6767676767', '2017-09-05 00:24:48', 0);
INSERT INTO `messages` VALUES (37, 89, 34, '565656', '2017-08-18 00:29:47', 1);
INSERT INTO `messages` VALUES (38, 89, 34, '44545454545', '2017-08-18 00:29:58', 1);
INSERT INTO `messages` VALUES (39, 76, 34, '121212', '2017-08-18 14:00:38', 0);
INSERT INTO `messages` VALUES (40, 118, 34, '56565656', '2017-08-18 16:04:08', 0);
INSERT INTO `messages` VALUES (44, 124, 45, 'This ad contains irregular activity.', '2017-08-20 12:43:29', 1);
INSERT INTO `messages` VALUES (45, 206, 34, '3434', '2017-09-13 03:47:05', 1);
INSERT INTO `messages` VALUES (47, 206, 34, '333', '2017-09-13 03:47:28', 1);
INSERT INTO `messages` VALUES (48, 206, 34, '33', '2017-09-13 03:49:44', 1);
INSERT INTO `messages` VALUES (49, 206, 34, '33', '2017-09-13 04:10:33', 0);
INSERT INTO `messages` VALUES (50, 206, 34, '3dsfd', '2017-09-13 04:15:13', 1);
INSERT INTO `messages` VALUES (51, 206, 34, 'trtrtfds', '2017-09-13 04:15:56', 0);
INSERT INTO `messages` VALUES (52, 206, 34, 'xczvccvt', '2017-09-13 04:16:36', 0);
INSERT INTO `messages` VALUES (53, 206, 34, 'dfsad', '2017-09-13 04:17:25', 0);
INSERT INTO `messages` VALUES (54, 206, 34, 'xcvzxc', '2017-09-13 04:18:43', 0);
INSERT INTO `messages` VALUES (55, 206, 34, '23Hello\nI am very interesting', '2017-09-13 04:22:45', 0);
INSERT INTO `messages` VALUES (56, 197, 34, '3434', '2017-09-13 21:50:12', 0);
INSERT INTO `messages` VALUES (57, 211, 34, 'This is very good testing environment\nThanks for your effort', '2017-09-13 22:09:21', 0);
INSERT INTO `messages` VALUES (58, 211, 34, 'That is good service status', '2017-09-13 22:10:03', 0);
INSERT INTO `messages` VALUES (59, 210, 34, '4545', '2017-09-13 22:16:42', 0);
INSERT INTO `messages` VALUES (60, 219, 34, '434545', '2017-09-14 05:08:11', 0);
INSERT INTO `messages` VALUES (61, 210, 34, '4654654', '2017-09-14 21:17:44', 0);
INSERT INTO `messages` VALUES (62, 210, 34, 'asdfdf', '2017-09-16 00:33:30', 0);
INSERT INTO `messages` VALUES (63, 234, NULL, '4545454545', '2017-09-17 04:50:00', 0);
INSERT INTO `messages` VALUES (64, 234, NULL, '45454545', '2017-09-17 04:50:13', 0);
INSERT INTO `messages` VALUES (65, 234, NULL, '798987978978', '2017-09-17 04:50:32', 0);
INSERT INTO `messages` VALUES (66, 235, 34, '343434', '2017-09-17 06:00:09', 0);
INSERT INTO `messages` VALUES (67, 234, 34, '87678678', '2017-09-17 14:03:55', 0);
INSERT INTO `messages` VALUES (68, 236, 34, 'adsfsdaff', '2017-09-19 19:35:09', 0);
INSERT INTO `messages` VALUES (69, 252, 34, '23232333', '2017-09-20 06:02:50', 0);
INSERT INTO `messages` VALUES (70, 252, 34, '3434343434', '2017-09-20 06:02:56', 0);
INSERT INTO `messages` VALUES (71, 246, 34, '3434', '2017-09-20 21:18:39', 0);
INSERT INTO `messages` VALUES (72, 254, 34, 'erererer', '2017-09-20 21:54:34', 0);
INSERT INTO `messages` VALUES (73, 305, 34, '3333345556', '2017-09-22 22:41:13', 0);
INSERT INTO `messages` VALUES (74, 305, 34, '9999999', '2017-09-22 22:41:24', 0);
INSERT INTO `messages` VALUES (75, 247, 34, '5656', '2017-09-23 02:08:05', 0);
INSERT INTO `messages` VALUES (76, 253, 34, '343434', '2017-09-23 02:10:17', 0);
INSERT INTO `messages` VALUES (77, 253, 34, 'sadf', '2017-09-23 02:20:01', 0);

-- ----------------------------
-- Table structure for reports
-- ----------------------------
DROP TABLE IF EXISTS `reports`;
CREATE TABLE `reports`  (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NULL DEFAULT NULL,
  `reporter_id` int(255) NULL DEFAULT NULL,
  `report_content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `report_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `read_already` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`report_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of reports
-- ----------------------------
INSERT INTO `reports` VALUES (25, 83, 34, '3434343434', '2017-08-17 21:42:57', 1);
INSERT INTO `reports` VALUES (26, 83, 34, 'asdasdsadasd', '2017-08-17 21:48:34', 0);
INSERT INTO `reports` VALUES (27, 83, 34, 'asdsadasd', '2017-08-17 21:54:10', 1);
INSERT INTO `reports` VALUES (28, 83, 34, 'dsdfsfdsf', '2017-08-17 21:56:30', 0);
INSERT INTO `reports` VALUES (29, 83, 34, '45454545', '2017-08-17 21:59:43', 1);
INSERT INTO `reports` VALUES (30, 83, 34, 'asdasdasdsdasd', '2017-08-17 22:02:46', 0);
INSERT INTO `reports` VALUES (31, 84, 34, 'dfsafasdfdsaf', '2017-08-17 22:16:39', 1);
INSERT INTO `reports` VALUES (32, 84, 34, 'ewrewrewr', '2017-08-17 22:19:07', 1);
INSERT INTO `reports` VALUES (33, 84, 34, 'asdsadasd', '2017-08-17 22:30:39', 1);
INSERT INTO `reports` VALUES (34, 85, 34, 'dfdfdfd', '2017-08-17 22:54:14', 1);
INSERT INTO `reports` VALUES (35, 89, 34, 'rrtrtrtrtrt', '2017-08-18 00:17:28', 0);
INSERT INTO `reports` VALUES (36, 89, 34, '6767676767', '2017-08-18 00:24:48', 1);
INSERT INTO `reports` VALUES (37, 89, 34, '565656', '2017-08-18 00:29:47', 1);
INSERT INTO `reports` VALUES (38, 89, 34, '44545454545', '2017-08-18 00:29:58', 0);
INSERT INTO `reports` VALUES (39, 76, 34, '121212', '2017-08-18 14:00:38', 0);
INSERT INTO `reports` VALUES (40, 118, 34, '56565656', '2017-08-18 16:04:08', 1);
INSERT INTO `reports` VALUES (44, 124, 45, 'This ad contains irregular activity.', '2017-08-20 12:43:29', 1);
INSERT INTO `reports` VALUES (45, 98, 34, 'The Ad contains invalid information', '2017-09-05 00:56:26', 1);
INSERT INTO `reports` VALUES (46, 139, 34, 'This ad contains irregular contents\nThanks', '2017-09-07 17:50:41', 0);
INSERT INTO `reports` VALUES (48, 179, 34, '45454545', '2017-09-07 23:52:31', 0);
INSERT INTO `reports` VALUES (49, 175, NULL, '343434', '2017-09-08 01:09:08', 0);
INSERT INTO `reports` VALUES (50, 178, NULL, '3434', '2017-09-08 02:14:13', 0);
INSERT INTO `reports` VALUES (51, 154, NULL, 'sdfsadfdf', '2017-09-08 02:28:01', 0);
INSERT INTO `reports` VALUES (52, 181, NULL, '232323', '2017-09-08 17:11:40', 0);
INSERT INTO `reports` VALUES (53, 165, NULL, '34343', '2017-09-08 17:47:18', 0);
INSERT INTO `reports` VALUES (54, 179, NULL, '6352323', '2017-09-08 17:51:10', 0);
INSERT INTO `reports` VALUES (55, 149, NULL, '9889898989', '2017-09-08 18:02:12', 0);
INSERT INTO `reports` VALUES (56, 181, 34, '56565', '2017-09-08 19:27:49', 0);
INSERT INTO `reports` VALUES (57, 165, 34, '56565', '2017-09-08 19:36:15', 0);
INSERT INTO `reports` VALUES (58, 183, 34, '2323354', '2017-09-08 21:18:20', 0);
INSERT INTO `reports` VALUES (59, 165, 34, 'rr656546', '2017-09-09 00:36:00', 0);
INSERT INTO `reports` VALUES (60, 165, 34, '45656', '2017-09-09 00:36:05', 0);
INSERT INTO `reports` VALUES (61, 165, 34, 'r565656', '2017-09-09 00:36:09', 0);
INSERT INTO `reports` VALUES (62, 189, 34, '3434', '2017-09-09 00:37:59', 0);
INSERT INTO `reports` VALUES (65, 190, 34, 'asdsad', '2017-09-09 03:14:00', 0);
INSERT INTO `reports` VALUES (66, 190, 34, 'asdsd', '2017-09-09 03:14:06', 0);
INSERT INTO `reports` VALUES (67, 206, 34, '345345345345', '2017-09-13 03:17:37', 0);
INSERT INTO `reports` VALUES (68, 206, 34, 'This is new Report', '2017-09-13 03:20:08', 0);
INSERT INTO `reports` VALUES (69, 206, 34, '324234234324', '2017-09-13 04:15:18', 0);
INSERT INTO `reports` VALUES (70, 206, 34, '454545', '2017-09-13 04:15:52', 0);
INSERT INTO `reports` VALUES (71, 210, 34, '232323', '2017-09-14 21:17:49', 0);
INSERT INTO `reports` VALUES (72, 210, 34, 'dsfdf', '2017-09-16 00:33:24', 0);
INSERT INTO `reports` VALUES (73, 234, 34, 'dfgdfgdfgfdg', '2017-09-17 20:44:16', 0);
INSERT INTO `reports` VALUES (74, 254, 34, 'dfdfdf', '2017-09-20 21:54:38', 0);
INSERT INTO `reports` VALUES (75, 332, 60, 'This is not working properly', '2017-11-22 22:17:58', 0);
INSERT INTO `reports` VALUES (76, 341, 65, 'This ad was no good.  Exploits younger female', '2018-02-28 04:33:14', 0);

-- ----------------------------
-- Table structure for reviews
-- ----------------------------
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews`  (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `writer_id` int(11) NULL DEFAULT NULL,
  `review_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `review_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `review_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `origin_id` int(11) NOT NULL DEFAULT -1,
  `review_like` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `city_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`review_id`) USING BTREE,
  INDEX `review_writer`(`writer_id`) USING BTREE,
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`writer_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of reviews
-- ----------------------------
INSERT INTO `reviews` VALUES (2, 34, 'dfdkjherer', '232323', '2017-09-14 03:12:25', -1, '-23,+34', NULL);
INSERT INTO `reviews` VALUES (3, 34, '11111', '3434', '2017-09-14 12:38:40', -1, ',+34', NULL);
INSERT INTO `reviews` VALUES (4, 34, '343434', '343434', '2017-09-14 12:39:05', -1, '', NULL);
INSERT INTO `reviews` VALUES (5, 34, '343434', '343434', '2017-09-14 12:39:14', -1, ',+34', NULL);
INSERT INTO `reviews` VALUES (6, 34, '343445', '343445', '2017-09-14 12:39:44', -1, ',-34', NULL);
INSERT INTO `reviews` VALUES (7, 34, '1111', 'dsasdff\nasdfsadfa\nsdfasdf\nasdf\nasfdfadsf', '2017-09-14 12:45:00', -1, '', NULL);
INSERT INTO `reviews` VALUES (8, 34, '323', '3343434', '2017-09-14 12:50:12', -1, ',-34', NULL);
INSERT INTO `reviews` VALUES (9, 34, '434', '343434', '2017-09-14 12:55:56', -1, ',+34', NULL);
INSERT INTO `reviews` VALUES (10, 34, '3434', 'adsfsdafsdf4', '2017-09-14 12:57:19', -1, '', NULL);
INSERT INTO `reviews` VALUES (11, 34, '34', '56565656', '2017-09-14 12:57:31', -1, '', NULL);
INSERT INTO `reviews` VALUES (12, 34, '34', '45454', '2017-09-14 12:57:45', -1, '', NULL);
INSERT INTO `reviews` VALUES (13, 34, '3434', 'asdsd4', '2017-09-14 12:58:47', -1, '', NULL);
INSERT INTO `reviews` VALUES (14, 34, '33', 'dfdf4', '2017-09-14 13:01:10', -1, ',-34', NULL);
INSERT INTO `reviews` VALUES (15, 34, '33', 'asdfdsaf4', '2017-09-14 13:01:56', -1, ',-34', NULL);
INSERT INTO `reviews` VALUES (16, 34, '3434', '343434', '2017-09-14 13:02:29', -1, ',-34', NULL);
INSERT INTO `reviews` VALUES (17, 34, '123213', '123123123213123', '2017-09-14 13:04:09', -1, '', NULL);
INSERT INTO `reviews` VALUES (18, 34, '343', '343434', '2017-09-14 13:09:23', -1, ',-34', NULL);
INSERT INTO `reviews` VALUES (19, 34, 'sadsdfas', 'fasdfsadfsdfasd', '2017-09-14 13:12:45', -1, '', NULL);
INSERT INTO `reviews` VALUES (20, 34, '454', '5454545', '2017-09-14 13:53:47', -1, ',+34', NULL);
INSERT INTO `reviews` VALUES (21, 34, 'asdf', 'adsfsdfd', '2017-09-14 14:00:52', 14, '', NULL);
INSERT INTO `reviews` VALUES (22, 34, '3434', '343434', '2017-09-14 14:12:07', 14, '', NULL);
INSERT INTO `reviews` VALUES (23, 34, 'kjh', 'asdfasdf\nasdf\nasdfa\nsdfasdf', '2017-09-14 14:18:32', -1, '+12;+24,+36,-34', NULL);
INSERT INTO `reviews` VALUES (24, 34, '23423', '4234234234', '2017-09-14 14:20:39', 23, '', NULL);
INSERT INTO `reviews` VALUES (25, 34, 'kjh', '454545', '2017-09-14 14:30:32', 23, '', NULL);
INSERT INTO `reviews` VALUES (26, 34, '34343', 'kjh', '2017-09-14 14:33:08', 23, '', NULL);
INSERT INTO `reviews` VALUES (27, 34, 'asd', 'sadasd', '2017-09-14 14:34:45', 23, '', NULL);
INSERT INTO `reviews` VALUES (28, 34, '4545', '454545', '2017-09-14 14:52:22', 4, '', NULL);
INSERT INTO `reviews` VALUES (29, 34, '454', '454545', '2017-09-14 14:52:32', 4, '', NULL);
INSERT INTO `reviews` VALUES (30, 34, '4545', '35454564', '2017-09-14 14:53:03', 4, '', NULL);
INSERT INTO `reviews` VALUES (31, 34, '454', '454545\n45\n45\n4\n545\n45\n45\n4545', '2017-09-14 14:53:32', 4, '', NULL);
INSERT INTO `reviews` VALUES (32, 34, 'dsaf', 'dfsdfsdf', '2017-09-14 14:57:08', 4, '', NULL);
INSERT INTO `reviews` VALUES (33, 34, '343', '3434kjh', '2017-09-14 15:27:25', -1, '', NULL);
INSERT INTO `reviews` VALUES (34, 34, 'sdaf', 'dsafdsfasdf', '2017-09-14 16:43:51', 12, '', NULL);
INSERT INTO `reviews` VALUES (35, 34, 'sdafdf', 'sdafasdfsdfdsf', '2017-09-14 16:43:56', 12, '', NULL);
INSERT INTO `reviews` VALUES (36, 34, '4545', '45454545', '2017-09-14 16:49:16', 23, '', NULL);
INSERT INTO `reviews` VALUES (37, 34, '3434', '34343434kjh', '2017-09-14 16:49:51', 33, '', NULL);
INSERT INTO `reviews` VALUES (38, 34, '3434', '343434', '2017-09-14 16:49:55', 33, '', NULL);
INSERT INTO `reviews` VALUES (39, 34, '454', '5454545', '2017-09-14 16:50:07', 33, '', NULL);
INSERT INTO `reviews` VALUES (40, 34, '67', '676767', '2017-09-14 16:51:30', 33, '', NULL);
INSERT INTO `reviews` VALUES (41, 34, '4545', '4545454545', '2017-09-14 16:57:47', -1, '', NULL);
INSERT INTO `reviews` VALUES (42, 34, '565656', '544564564', '2017-09-14 17:02:56', -1, '', NULL);
INSERT INTO `reviews` VALUES (43, 34, '45454', '45454545454545', '2017-09-14 17:10:12', -1, ',-34', NULL);
INSERT INTO `reviews` VALUES (44, 34, '454', '454545', '2017-09-14 18:17:45', 4, '', NULL);
INSERT INTO `reviews` VALUES (45, 34, '3434', '343434343', '2017-09-14 18:22:26', 23, '', NULL);
INSERT INTO `reviews` VALUES (46, 34, '12', '1212', '2017-09-14 18:28:43', 33, '', NULL);
INSERT INTO `reviews` VALUES (47, 34, '3343', '434343434', '2017-09-14 18:31:02', -1, ',-34', NULL);
INSERT INTO `reviews` VALUES (48, 34, '545', '454545', '2017-09-14 18:49:21', 6, '', NULL);
INSERT INTO `reviews` VALUES (49, 34, '34', '34343434', '2017-09-14 18:49:26', 6, '', NULL);
INSERT INTO `reviews` VALUES (50, 34, '45', '45454545', '2017-09-14 18:49:53', 6, '', NULL);
INSERT INTO `reviews` VALUES (51, 34, '4545', '4545454545', '2017-09-14 18:58:51', 47, '', NULL);
INSERT INTO `reviews` VALUES (52, 34, '45', '4545454545', '2017-09-14 18:58:57', 47, '', NULL);
INSERT INTO `reviews` VALUES (53, 34, 'There are some problems in it', 'Thanks', '2017-09-14 19:14:23', -1, ',-34', NULL);
INSERT INTO `reviews` VALUES (54, 34, 'dsfsdfsdfsdfsdf', 'dsfdsf', '2017-09-14 19:14:48', 47, '', NULL);
INSERT INTO `reviews` VALUES (55, 34, '初めまして', '初めまして', '2017-09-14 19:20:06', -1, ',-34', NULL);
INSERT INTO `reviews` VALUES (56, 34, '3355', '３４３４３４', '2017-09-14 19:22:28', -1, '', NULL);
INSERT INTO `reviews` VALUES (57, 34, '危ないから幼いて下さい', '危ないから幼いて下さい', '2017-09-14 19:24:03', -1, '', NULL);
INSERT INTO `reviews` VALUES (58, 34, 'Agree with you', '445', '2017-09-14 19:24:17', 57, '', NULL);
INSERT INTO `reviews` VALUES (59, 34, '11212', '1\n1\n1\n1\n1\n1\n1\n1', '2017-09-14 19:30:52', -1, '', NULL);
INSERT INTO `reviews` VALUES (60, 34, '78787878', '78787878', '2017-09-14 19:37:02', -1, ',+34', NULL);
INSERT INTO `reviews` VALUES (61, 34, '565656565', '56556', '2017-09-14 19:40:01', 9, '', NULL);
INSERT INTO `reviews` VALUES (62, 34, '3434', '34343434', '2017-09-14 20:41:50', 60, '', NULL);
INSERT INTO `reviews` VALUES (63, 34, 'Bad client', 'ddkdd', '2017-09-14 22:51:57', -1, ',+34', NULL);
INSERT INTO `reviews` VALUES (64, 34, 'Reply something', 'asdfadsfasdfadsf', '2017-09-14 22:52:51', 63, '', NULL);
INSERT INTO `reviews` VALUES (65, 34, 'asdf', 'asdfasdf', '2017-09-14 22:54:31', 63, '', NULL);
INSERT INTO `reviews` VALUES (66, 34, 'You are right', 'I will add search function in the review', '2017-09-14 22:54:49', 63, '', NULL);
INSERT INTO `reviews` VALUES (67, 34, '454', '4545', '2017-09-15 01:41:41', 63, '', NULL);
INSERT INTO `reviews` VALUES (68, 34, '454554', '4545', '2017-09-15 02:40:17', 14, '', NULL);
INSERT INTO `reviews` VALUES (69, 34, '4343', '34343434', '2017-09-15 02:49:28', -1, '', NULL);
INSERT INTO `reviews` VALUES (70, 34, '33 44', '33434', '2017-09-15 04:20:55', -1, ',-34', NULL);
INSERT INTO `reviews` VALUES (71, 34, '5555555555555', '555555555555555555555555', '2017-09-15 12:57:05', 19, '', NULL);
INSERT INTO `reviews` VALUES (72, 60, 'Jerry', 'Relax massage is terrible with service!', '2017-11-20 23:48:16', -1, ',-60', 766);
INSERT INTO `reviews` VALUES (74, 59, 'jeff', 'he was a nice customer', '2017-11-23 19:06:00', -1, ',+59', 751);
INSERT INTO `reviews` VALUES (75, 34, 'New Title', 'ddd', '2018-01-19 04:15:29', -1, ',-34', 430);
INSERT INTO `reviews` VALUES (76, 34, 'ddddd', 'dddd', '2018-01-19 04:15:53', 75, '', 430);
INSERT INTO `reviews` VALUES (77, 34, 'df', 'dfdfdf', '2018-01-19 04:16:07', 75, '', 430);
INSERT INTO `reviews` VALUES (78, 60, 'Jay 2134581000', 'Here we are going for beta testing', '2018-02-20 05:06:20', -1, '', 751);
INSERT INTO `reviews` VALUES (79, 59, 'Tom 2138595959', 'He was a nice customer.  We would like to have him back anytime', '2018-02-22 21:27:46', -1, '', 751);
INSERT INTO `reviews` VALUES (80, 59, 'Tom 6193434884', 'Was he really?', '2018-02-22 21:33:11', 74, '', 751);
INSERT INTO `reviews` VALUES (81, 59, 'Jeff 2139494949', 'WRONG PERSON', '2018-02-23 03:22:29', 78, '', 751);
INSERT INTO `reviews` VALUES (82, 59, 'Jay 9169393939', 'WRONG PERSON', '2018-02-23 03:24:49', 78, '', 751);
INSERT INTO `reviews` VALUES (83, 59, 'Lisa 213984949484', 'WRONG PERSON', '2018-02-23 03:25:03', 78, '', 751);
INSERT INTO `reviews` VALUES (84, 59, 'James 3232323838', 'WRONG PERSON', '2018-02-23 03:25:17', 78, '', 751);
INSERT INTO `reviews` VALUES (85, 59, 'Lisa 23232324234', 'she\'s bad', '2018-02-23 03:50:11', 79, '', 751);
INSERT INTO `reviews` VALUES (86, 59, 'Drake 2329309302', 'Drake was not good', '2018-02-23 03:50:24', 79, '', 751);
INSERT INTO `reviews` VALUES (87, 59, '21345** Tom', 'This guy Tom is a bad bad guy', '2018-02-23 06:35:20', -1, ',+34', 751);
INSERT INTO `reviews` VALUES (88, 60, '2134581000 Jay', 'He\'s a good person.  He\'ll be successful', '2018-02-26 02:29:32', -1, ',+65', 766);
INSERT INTO `reviews` VALUES (89, 65, NULL, 'I saw him today, and he is a good guy.  Btw his email is dohtem213@yahoo.com', '2018-02-28 03:59:03', 88, '', 766);
INSERT INTO `reviews` VALUES (90, 65, '2134581000 Jay', 'He\'s a nice guy', '2018-03-03 01:46:05', -1, '', 595);
INSERT INTO `reviews` VALUES (91, 60, '2134581000 Jay', 'He\'s a nice guy', '2018-03-06 04:00:31', -1, '', 751);
INSERT INTO `reviews` VALUES (92, 60, NULL, 'TEST 1', '2018-03-07 03:00:20', 78, '', 751);
INSERT INTO `reviews` VALUES (93, 60, NULL, 'Test 2', '2018-03-07 03:00:35', 78, '', 751);

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings`  (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `setting_value` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`setting_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES (1, 'premium', '3400');

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `Id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Title` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Status` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('1', '34', 'done');
INSERT INTO `task` VALUES ('2', '34', 'pending');
INSERT INTO `task` VALUES ('3', '34', 'done');
INSERT INTO `task` VALUES ('4', '34', 'done');
INSERT INTO `task` VALUES ('5', '34', 'pending');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `opened` tinyint(11) NOT NULL DEFAULT 1,
  `budget` int(11) NULL DEFAULT 0,
  `created_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `group_id` int(11) NULL DEFAULT 0,
  `verifycode` int(4) NOT NULL DEFAULT 0,
  `forget` int(11) NULL DEFAULT NULL,
  `suspended` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `users_ibfk_1`(`group_id`) USING BTREE,
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (34, 'sadaokiarata@yahoo.com', 'bcbe3365e6ac95ea2c0343a2395834dd', '2b1524986db728fbe56f5bc9e4e78086', 0, 21000, '2017-08-15 00:30:27', 1, 0, 5446, NULL);
INSERT INTO `users` VALUES (38, 'user1@outlook.com', 'bcbe3365e6ac95ea2c0343a2395834dd', 'e777cc7bad8bc2134f901736d5f0f56b', 1, 1000, '2017-08-15 00:30:29', 0, 0, NULL, NULL);
INSERT INTO `users` VALUES (39, 'user2@outlook.com', 'bcbe3365e6ac95ea2c0343a2395834dd', '9e227847b77706cfc4e81d804c87c7fa', 1, 600, '2017-08-15 14:55:37', 0, 0, NULL, NULL);
INSERT INTO `users` VALUES (40, 'user3@outlook.com', '77963b7a931377ad4ab5ad6a9cd718aa', '60f62b607298ff96a908007f1498b76d', 1, 400, '2017-08-15 00:30:29', 0, 0, NULL, NULL);
INSERT INTO `users` VALUES (41, 'user4@outlook.com', '77963b7a931377ad4ab5ad6a9cd718aa', '8800e4876235f7cf5207321af04385a5', 0, 400, '2017-08-15 00:30:30', 0, 0, NULL, NULL);
INSERT INTO `users` VALUES (43, 'a--', 'db89494b8a130452239eee884ca4606f', 'db89494b8a130452239eee884ca4606f', 1, 0, '2017-08-14 19:09:06', 0, 0, NULL, NULL);
INSERT INTO `users` VALUES (46, 'aa', '594f803b380a41396ed63dca39503542', '0b4e7a0e5fe84ad35fb5f95b9ceeac79', 0, 0, '2017-08-14 19:10:19', 0, 1000, NULL, NULL);
INSERT INTO `users` VALUES (47, 'a@a.com', 'bcbe3365e6ac95ea2c0343a2395834dd', '525e858676e1e9e44c58703a2ef73993', 0, 400, '2017-09-06 22:23:02', 0, 1225, NULL, NULL);
INSERT INTO `users` VALUES (48, 'ssssssss@yahoo.com', 'bcbe3365e6ac95ea2c0343a2395834dd', '345cf42827e533dc39226c0ec3029f67', 1, 200, '2017-09-07 17:48:10', 0, 2000, NULL, NULL);
INSERT INTO `users` VALUES (51, 'andrewchristen@outlook.com', 'bcbe3365e6ac95ea2c0343a2395834dd', '823c4b27767446fba3a7b61cdf6d90c7', 0, 400, '2017-09-16 19:04:38', 0, 0, NULL, NULL);
INSERT INTO `users` VALUES (54, 'seoyura@outlook.com', 'bcbe3365e6ac95ea2c0343a2395834dd', 'e530bf3cdba54590dab3c38fe478e790', 1, 0, '2017-09-16 20:06:32', 0, 0, 3830, NULL);
INSERT INTO `users` VALUES (59, 'jmins500@gmail.com', '3b712de48137572f3849aabd5666a4e3', '89acbfdbf88ea656f7e93ebfd5adadb1', 1, 0, '2017-10-18 15:20:16', 0, 0, 2729, NULL);
INSERT INTO `users` VALUES (60, 'dohtem213@yahoo.com', '81dc9bdb52d04dc20036dbd8313ed055', 'd2a4323c2ca8a5a2de29b69960954ff6', 1, 0, '2017-10-21 22:01:54', 0, 0, 4090, NULL);
INSERT INTO `users` VALUES (61, 'wanderstover@gmail.com', 'bcbe3365e6ac95ea2c0343a2395834dd', '4ea6052a08e462fbeeb2a5539cf69201', 0, 0, '2017-11-13 04:39:15', 0, 1225, NULL, NULL);
INSERT INTO `users` VALUES (62, 'supreme.one@yahoo.com', '285f89b802bcb2651801455c86d78f2a', '61e530b51cb961988e0744b7af05437e', 1, 0, '2017-11-22 01:21:11', 0, 0, NULL, NULL);
INSERT INTO `users` VALUES (63, 'heehan0703@gmail.com', '0c08fba6b54d68084f757c8fe61802df', '4b90d212ee8f58f383d6bb643d752280', 1, 0, '2017-12-18 03:47:56', 0, 0, NULL, NULL);
INSERT INTO `users` VALUES (64, 'fxskin1@gmail.com', '25d55ad283aa400af464c76d713c07ad', 'e1e63c5e415db5509b4ebc70e226a3aa', 1, 0, '2018-02-07 19:41:02', 0, 0, NULL, NULL);
INSERT INTO `users` VALUES (65, 'jaeme77@yahoo.com', '81dc9bdb52d04dc20036dbd8313ed055', 'e0cf8499fff558401603a40122f6c2aa', 1, 0, '2018-02-28 03:43:32', 0, 0, NULL, NULL);
INSERT INTO `users` VALUES (66, 'sc1ssch@gmail.com', '237841c6048c022291b6000de5d437dc', '066d1b4ae752e69fdf63411fbd990f08', 1, 0, '2018-04-07 00:59:52', 0, 5516, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
