/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : internship

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 24/03/2020 22:11:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for appraisal
-- ----------------------------
DROP TABLE IF EXISTS `appraisal`;
CREATE TABLE `appraisal` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `stuno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学号',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '实习内容',
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '自我总结',
  `corp_teacher_opinion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '校外导师意见',
  `corp_teacher_grade` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '校外导师打分',
  `corp_opinion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '实习单位意见',
  `teacher_grade` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学院导师成绩评定',
  `synth_grade` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '综合实习成绩评定',
  `leader_opinion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学院实习领导小组意见',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='实习鉴定表';

-- ----------------------------
-- Records of appraisal
-- ----------------------------
BEGIN;
INSERT INTO `appraisal` VALUES (6, '201603739', '这次实习内容非常好', '实习总结起来：挣了很多钱', '的', NULL, '嘿嘿', NULL, NULL, NULL, '2020-03-08 16:46:55', '2020-03-24 17:29:19');
INSERT INTO `appraisal` VALUES (7, '201604234', NULL, NULL, NULL, '优秀', NULL, '不及格', '不及格', '撒旦', '2020-03-08 19:24:58', '2020-03-08 19:52:52');
COMMIT;

-- ----------------------------
-- Table structure for appraisaldate
-- ----------------------------
DROP TABLE IF EXISTS `appraisaldate`;
CREATE TABLE `appraisaldate` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `stuno` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学号',
  `corpteacher` datetime DEFAULT NULL COMMENT '校外导师填表时间',
  `corp` datetime DEFAULT NULL COMMENT '实习单位填表时间',
  `teacher` datetime DEFAULT NULL COMMENT '学院导师填表时间',
  `synth` datetime DEFAULT NULL COMMENT '综合成绩评定时间',
  `leader` datetime DEFAULT NULL COMMENT '学院领导填表时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_stuno` (`stuno`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='鉴定表的时间项';

-- ----------------------------
-- Records of appraisaldate
-- ----------------------------
BEGIN;
INSERT INTO `appraisaldate` VALUES (5, '201604253', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `appraisaldate` VALUES (6, '201603739', '2020-03-08 19:53:35', NULL, '2020-03-08 19:53:35', '2020-03-08 19:53:35', '2020-03-08 19:53:35');
COMMIT;

-- ----------------------------
-- Table structure for corporation
-- ----------------------------
DROP TABLE IF EXISTS `corporation`;
CREATE TABLE `corporation` (
  `id` bigint(20) unsigned NOT NULL COMMENT ' 主键',
  `stuno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 学号,表示这条记录由某个学生填写',
  `creditcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '统一社会信用代码',
  `corpname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业名称',
  `regcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业注册号',
  `type` varchar(255) DEFAULT NULL COMMENT '类型 (如：有限责任公司)',
  `legalperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '法人',
  `registercapital` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT ' 注册资本',
  `createdate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT ' 创建日期',
  `startbusiness` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '开始营业日期',
  `endbusiness` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT ' 营业期限截止日期',
  `regauthority` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '工商信息登记机关',
  `approvaldate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '核准日期',
  `regstatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT ' 登记状态',
  `address` varchar(255) DEFAULT NULL COMMENT '住所地址',
  `business_scope` varchar(255) DEFAULT NULL COMMENT '经营范围',
  `ischecked` tinyint(1) DEFAULT '0' COMMENT ' 表示该公司信息后台管理员是否已经核实,默\r\n认未核实',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT ' 数据库记录创建日期',
  `modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ' 数据库记录修改日期',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniquestuno` (`stuno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='实习企业信息表\r\n';

-- ----------------------------
-- Records of corporation
-- ----------------------------
BEGIN;
INSERT INTO `corporation` VALUES (1236575268804902914, '201604253', '213', '234', '324', '324', '324', '324', '34', '6', '7', '7', '8', '6', '5', '7', 0, '2020-03-08 16:51:33', '2020-03-08 16:51:33');
COMMIT;

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件后缀pdf jpg png exe',
  `url` text COLLATE utf8mb4_general_ci COMMENT 'url',
  `size` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件大小',
  `upload` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='文件存储';

-- ----------------------------
-- Records of file
-- ----------------------------
BEGIN;
INSERT INTO `file` VALUES (1, 'exe', 'https://image.ruankun.xyz/www.jpg', '13', '2020-03-08 16:32:37');
INSERT INTO `file` VALUES (2, 'jpg', 'https://image.ruankun.xyz/www.jpg', '1', '2020-03-08 16:32:42');
INSERT INTO `file` VALUES (3, 'png', 'https://image.ruankun.xyz/www.png', '3', '2020-03-08 16:32:59');
COMMIT;

-- ----------------------------
-- Table structure for notification
-- ----------------------------
DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '内容',
  `publisher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '教务处-实习管理' COMMENT '发布者',
  `readnum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '阅读数量',
  `praise` int(10) NOT NULL DEFAULT '0' COMMENT '点赞',
  `low` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '踩',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='实习单位发布通知\n';

-- ----------------------------
-- Records of notification
-- ----------------------------
BEGIN;
INSERT INTO `notification` VALUES (1, '嘿嘿', '2020-03-08 12:33:22', '2020-03-08 12:33:22', '嘿嘿不好', '教务处-实习管理', 0, 0, 0);
INSERT INTO `notification` VALUES (12, '哒', '2020-03-08 12:33:39', '2020-03-08 12:33:39', ' 是的初速度是', '教务处-实习管理', 0, 0, 0);
INSERT INTO `notification` VALUES (13, '打算', '2020-03-08 12:33:49', '2020-03-08 12:33:49', '初速度', '教务处-实习管理', 0, 0, 0);
INSERT INTO `notification` VALUES (14, '第三次', '2020-03-08 12:33:54', '2020-03-08 12:33:54', '初速度', '教务处-实习管理', 0, 0, 0);
INSERT INTO `notification` VALUES (15, '打算 ', '2020-03-08 12:34:00', '2020-03-08 12:34:00', '吃的是草实对称', '教务处-实习管理', 0, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for pdf
-- ----------------------------
DROP TABLE IF EXISTS `pdf`;
CREATE TABLE `pdf` (
  `id` bigint(20) unsigned NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'pdf地址',
  `stuno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'pdf转换执行学生',
  `report` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否是报告册,不是就是鉴定表',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `converting` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否正在转换',
  `failed` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否转换失败',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of pdf
-- ----------------------------
BEGIN;
INSERT INTO `pdf` VALUES (24872665700423181, 'image.ruankun.xyz/2f6ff6db0b2a19067c89535c63467830.pdf', '201603739', 1, '2020-03-23 15:27:31', 0, 0);
INSERT INTO `pdf` VALUES (78744326126400485, 'image.ruankun.xyz/4369f24f4da07633978581935571713e.pdf', '201603739', 1, '2020-03-23 15:29:11', 0, 0);
INSERT INTO `pdf` VALUES (94191507865967088, 'image.ruankun.xyz/8c4b8aae9a0badcec50b6f811b7603bc.pdf', '201604234', 0, '2020-03-23 22:59:30', 0, 0);
INSERT INTO `pdf` VALUES (110009523045502360, 'image.ruankun.xyz/3c6a37d30d34b5988ee986185aff08e3.pdf', '201603739', 1, '2020-03-23 15:38:59', 0, 0);
INSERT INTO `pdf` VALUES (180626316519208448, 'image.ruankun.xyz/c40fdad7435dded11de3dad70533214b.pdf', '201603739', 1, '2020-03-23 15:42:51', 0, 0);
INSERT INTO `pdf` VALUES (215561619209457054, 'image.ruankun.xyz/bbd01e37c254100b8db365983153c3ac.pdf', '201603739', 1, '2020-03-23 15:58:45', 0, 0);
INSERT INTO `pdf` VALUES (218380371770865270, 'image.ruankun.xyz/176ee5030d4deeb0d1a89e0ba666e1c2.pdf', '201603739', 1, '2020-03-23 15:28:29', 0, 0);
INSERT INTO `pdf` VALUES (330576744027988128, 'image.ruankun.xyz/068abc80215d433886a85e1c6cbdb3ab.pdf', '201603739', 1, '2020-03-23 15:56:26', 0, 1);
INSERT INTO `pdf` VALUES (364831334634242604, 'image.ruankun.xyz/9e23acf86d08c15f01045072f0c9a49d.pdf', '201603739', 1, '2020-03-23 15:20:25', 0, 0);
INSERT INTO `pdf` VALUES (402705361719770201, 'image.ruankun.xyz/983149882316559fc171763eac248ce8.pdf', '201603739', 1, '2020-03-23 15:59:18', 0, 0);
INSERT INTO `pdf` VALUES (438839319802558108, 'image.ruankun.xyz/7e4bd473cc58635c21e62bcc69c6edc6.pdf', '201603739', 1, '2020-03-23 15:38:50', 0, 0);
INSERT INTO `pdf` VALUES (537392133379187168, 'image.ruankun.xyz/981a489dbe86a7db7225507b5d220f48.pdf', '201603739', 1, '2020-03-23 15:55:24', 0, 1);
INSERT INTO `pdf` VALUES (564581082916645463, 'image.ruankun.xyz/cbeff15d897b3da1c685853c78303f82.pdf', '201603739', 1, '2020-03-23 15:29:48', 0, 0);
INSERT INTO `pdf` VALUES (597335796515309533, 'image.ruankun.xyz/02a1d21cc0fc0736e59e769a69500c2b.pdf', '201603739', 1, '2020-03-23 15:42:44', 0, 0);
INSERT INTO `pdf` VALUES (625994701510109449, 'image.ruankun.xyz/4214e2fb8c6a46e7da7b75be18aa4047.pdf', '201603739', 1, '2020-03-23 15:56:21', 0, 1);
INSERT INTO `pdf` VALUES (648530869501438503, 'image.ruankun.xyz/c69916fab82a10aa0966381f181d5a32.pdf', '201603739', 1, '2020-03-23 15:55:30', 0, 1);
INSERT INTO `pdf` VALUES (673388292092448615, 'image.ruankun.xyz/af209ba5c15eb7fe515962830413b9aa.pdf', '201604234', 0, '2020-03-23 23:14:03', 0, 0);
INSERT INTO `pdf` VALUES (686765971861223174, 'image.ruankun.xyz/c5ebad333493ddeb8e9581e339bc6a18.pdf', '201603739', 1, '2020-03-23 15:21:21', 0, 0);
INSERT INTO `pdf` VALUES (687138148841773389, 'image.ruankun.xyz/2950c802519a9553927dccd4cb26955f.pdf', '201603739', 1, '2020-03-23 15:29:38', 0, 0);
INSERT INTO `pdf` VALUES (689537597412342199, 'image.ruankun.xyz/68e92e12486d1eec30c060446fc96d8f.pdf', '201603739', 1, '2020-03-23 15:34:10', 0, 0);
INSERT INTO `pdf` VALUES (700233204532890353, 'image.ruankun.xyz/f6057393d78f3621eb67c0da58525574.pdf', '201603739', 1, '2020-03-23 15:42:59', 0, 0);
INSERT INTO `pdf` VALUES (702788322525623779, 'image.ruankun.xyz/8b036ab837c6b0a97b1e8a57c40bd15f.pdf', '201603739', 1, '2020-03-23 15:20:17', 0, 0);
INSERT INTO `pdf` VALUES (704416941149242066, 'image.ruankun.xyz/b7178db75408b5cc91b0c48f766fcab6.pdf', '201603739', 1, '2020-03-23 15:28:02', 0, 0);
INSERT INTO `pdf` VALUES (752528357402322947, 'image.ruankun.xyz/b0751553ed3df8b08ccba150f1d14d35.pdf', '201603739', 1, '2020-03-23 15:56:17', 0, 1);
INSERT INTO `pdf` VALUES (861250957986360248, 'image.ruankun.xyz/b8df8ee21190e389674ec8f182b2cd00.pdf', '201603739', 1, '2020-03-23 15:38:51', 0, 0);
INSERT INTO `pdf` VALUES (876454830005323329, 'image.ruankun.xyz/7414489c869b389fd439a4ef09f51c69.pdf', '201603739', 1, '2020-03-23 15:58:49', 0, 0);
INSERT INTO `pdf` VALUES (1040311911038290537, 'image.ruankun.xyz/22c3adf5a6bf889f021dbeef8a6fd4e5.pdf', '201603739', 1, '2020-03-23 15:56:11', 0, 1);
INSERT INTO `pdf` VALUES (1045462718989243267, 'image.ruankun.xyz/0b9d6dd03aee7e53ae7f03f8692807ee.pdf', '201603739', 1, '2020-03-23 15:20:29', 0, 0);
INSERT INTO `pdf` VALUES (1178295926750126545, '-', '201603739', 1, '2020-03-23 16:00:13', 1, 1);
INSERT INTO `pdf` VALUES (1323899368812019232, 'image.ruankun.xyz/d88f7b89a936c20123e8e0a5608b53d6.pdf', '201603739', 1, '2020-03-23 15:26:14', 0, 0);
INSERT INTO `pdf` VALUES (1351740708571836119, 'image.ruankun.xyz/2939dd225b15815d769a25ad2c3fbb99.pdf', '201603739', 1, '2020-03-23 15:42:54', 0, 0);
INSERT INTO `pdf` VALUES (1396534408871461819, 'image.ruankun.xyz/7cf6f9c1c3d3b5f94dd4d25273e0a9d7.pdf', '201603739', 1, '2020-03-23 15:32:57', 0, 0);
INSERT INTO `pdf` VALUES (1447959263198323209, 'image.ruankun.xyz/469f416af8a37cd099e655225ba390f7.pdf', '201603739', 1, '2020-03-23 15:29:24', 0, 0);
INSERT INTO `pdf` VALUES (1479843433793380687, 'image.ruankun.xyz/f61138ca0e8760631fc0398f229bd9d5.pdf', '201603739', 1, '2020-03-23 15:59:05', 0, 0);
INSERT INTO `pdf` VALUES (1516395370327644236, 'image.ruankun.xyz/9432bfe9dab58106617924086b7afd2b.pdf', '201604234', 1, '2020-03-23 23:14:01', 0, 0);
INSERT INTO `pdf` VALUES (1627055918114200570, 'image.ruankun.xyz/55550780d12c84fefe48ae81e5840578.pdf', '201604234', 1, '2020-03-23 23:10:01', 0, 0);
INSERT INTO `pdf` VALUES (1736017101625012758, 'image.ruankun.xyz/a8c7b43519b540c72ce685158185c2a6.pdf', '201603739', 1, '2020-03-23 15:20:13', 0, 0);
INSERT INTO `pdf` VALUES (1762058787536709920, 'image.ruankun.xyz/d1dd7141e0692a0705e1726dd5847e33.pdf', '201603739', 1, '2020-03-23 15:55:21', 0, 1);
INSERT INTO `pdf` VALUES (1774900267783540769, 'image.ruankun.xyz/775bda6845af8b6512273467848d1ff5.pdf', '201603739', 1, '2020-03-23 15:26:45', 0, 0);
INSERT INTO `pdf` VALUES (1775008994455710631, 'image.ruankun.xyz/38490c352c9da7a2ef688ff72c9c71af.pdf', '201603739', 1, '2020-03-23 15:56:28', 0, 1);
INSERT INTO `pdf` VALUES (1853899488415604548, 'image.ruankun.xyz/f099ba4554b49ce50122c85969a92439.pdf', '201603739', 1, '2020-03-23 15:56:10', 0, 1);
INSERT INTO `pdf` VALUES (1905473017240963203, 'image.ruankun.xyz/2ab74e30fe8f480b71edf3f9bf0d6f7d.pdf', '201604234', 1, '2020-03-23 23:31:40', 0, 0);
INSERT INTO `pdf` VALUES (1969552146856591166, 'image.ruankun.xyz/60d8fa35d0231fe0c9b65bfcc398a3ee.pdf', '201603739', 1, '2020-03-23 15:55:34', 0, 1);
INSERT INTO `pdf` VALUES (1984692270417669210, 'image.ruankun.xyz/312168c189327c6655348d1ded939916.pdf', '201603739', 1, '2020-03-23 15:24:33', 0, 0);
INSERT INTO `pdf` VALUES (1993542015801783742, 'image.ruankun.xyz/bc95b4116fcb2a8217c714b63517c643.pdf', '201603739', 1, '2020-03-23 15:21:45', 0, 0);
INSERT INTO `pdf` VALUES (2245135678934319644, 'image.ruankun.xyz/2ed4f480672d479a0f5d42da17077e57.pdf', '201604234', 1, '2020-03-23 22:43:18', 0, 0);
INSERT INTO `pdf` VALUES (2308750159555820733, 'image.ruankun.xyz/d99f3fecf80ea7c5b9e37c99fc995953.pdf', '201603739', 1, '2020-03-23 15:56:19', 0, 1);
INSERT INTO `pdf` VALUES (2315831215271229965, 'image.ruankun.xyz/f46df9ede0bd53deb9cd8c897306bf65.pdf', '201603739', 1, '2020-03-23 15:25:59', 0, 0);
INSERT INTO `pdf` VALUES (2360670986421989698, 'image.ruankun.xyz/a529f09a809fc9c516c102863e7be6d0.pdf', '201603739', 1, '2020-03-23 15:42:40', 0, 0);
INSERT INTO `pdf` VALUES (2378552253680491786, 'image.ruankun.xyz/93cb1efeca5cb965ddb1292e104f1770.pdf', '201603739', 1, '2020-03-23 15:55:38', 0, 1);
INSERT INTO `pdf` VALUES (2380941047540624703, 'image.ruankun.xyz/d522ec43dd875fc6cd317cdfdf3531bd.pdf', '201603739', 1, '2020-03-23 15:39:02', 0, 0);
INSERT INTO `pdf` VALUES (2416253057741975291, 'image.ruankun.xyz/76aea205b251037150822de0f50cd364.pdf', '201603739', 1, '2020-03-24 17:28:43', 0, 0);
INSERT INTO `pdf` VALUES (2419923566948151555, 'image.ruankun.xyz/28730f39f7cf7ce0c7446086411252ce.pdf', '201603739', 1, '2020-03-23 15:27:19', 0, 0);
INSERT INTO `pdf` VALUES (2455180697697861174, 'image.ruankun.xyz/7d2e8c2ec6e54f51f1c2c42b800a76de.pdf', '201603739', 1, '2020-03-23 15:42:50', 0, 0);
INSERT INTO `pdf` VALUES (2472940364781950454, 'image.ruankun.xyz/fbc6a03cf5d3132749aa726130a79a1a.pdf', '201603739', 1, '2020-03-23 15:36:24', 0, 0);
INSERT INTO `pdf` VALUES (2482539631992625653, 'image.ruankun.xyz/c79a193fb23b7440b73e2798c9097611.pdf', '201603739', 1, '2020-03-23 15:42:48', 0, 0);
INSERT INTO `pdf` VALUES (2551687542193585516, 'image.ruankun.xyz/ed7123045789112a61df77f41738d8e2.pdf', '201603739', 1, '2020-03-23 15:20:16', 0, 0);
INSERT INTO `pdf` VALUES (2557267039888058685, 'image.ruankun.xyz/fafe1b2fd3517fdf6de54c79a7e64f12.pdf', '201603739', 1, '2020-03-23 15:43:00', 0, 0);
INSERT INTO `pdf` VALUES (2644182938033461963, 'image.ruankun.xyz/68e2964a94d5534245e9769cebe50b11.pdf', '201603739', 1, '2020-03-23 15:30:13', 0, 0);
INSERT INTO `pdf` VALUES (2679628813954589699, 'image.ruankun.xyz/4b8316766f5365271d6786dbf065bc84.pdf', '201604234', 1, '2020-03-23 23:24:16', 0, 0);
INSERT INTO `pdf` VALUES (2762990248380906099, 'image.ruankun.xyz/f89d822bac66480a566c4c3b93ea0e1f.pdf', '201603739', 1, '2020-03-23 15:20:15', 0, 0);
INSERT INTO `pdf` VALUES (2795457722362562448, 'image.ruankun.xyz/4a74a34dd3b94ebb4834dc1c5be59d91.pdf', '201603739', 1, '2020-03-23 15:38:08', 0, 0);
INSERT INTO `pdf` VALUES (2952356318509518983, 'image.ruankun.xyz/f1d5f880635c4fe886398c967438008f.pdf', '201603739', 1, '2020-03-23 15:36:47', 0, 0);
INSERT INTO `pdf` VALUES (2960635612511831225, 'image.ruankun.xyz/648067ee7ff31d1711277ef9426ce74f.pdf', '201604234', 1, '2020-03-23 23:30:01', 0, 0);
INSERT INTO `pdf` VALUES (2963963499448546500, 'image.ruankun.xyz/72ab7b86b66eb047f58c53b4d9f5866e.pdf', '201604234', 1, '2020-03-23 22:51:20', 0, 0);
INSERT INTO `pdf` VALUES (3036780185732894397, 'image.ruankun.xyz/503b616593ecb1d50905b850b12afdc6.pdf', '201604234', 1, '2020-03-23 22:46:28', 0, 0);
INSERT INTO `pdf` VALUES (3068597600202338137, 'image.ruankun.xyz/77d1414110336d649b745ef10ce9d762.pdf', '201603739', 1, '2020-03-23 15:38:58', 0, 0);
INSERT INTO `pdf` VALUES (3070222891296420139, 'image.ruankun.xyz/4220365c5c704cad69c8db77846ca4f3.pdf', '201603739', 1, '2020-03-23 15:43:03', 0, 0);
INSERT INTO `pdf` VALUES (3136704221918988289, 'image.ruankun.xyz/4e40b9b6c7308367348cca7aa1b2087d.pdf', '201603739', 1, '2020-03-23 15:29:15', 0, 0);
INSERT INTO `pdf` VALUES (3309096135523466188, 'image.ruankun.xyz/941e95106fdc716aa88153dfbceac962.pdf', '201603739', 1, '2020-03-23 15:55:16', 0, 1);
INSERT INTO `pdf` VALUES (3326434893265892809, 'image.ruankun.xyz/5020b5595654c6f37763516fbd3086be.pdf', '201603739', 1, '2020-03-23 15:30:19', 0, 0);
INSERT INTO `pdf` VALUES (3336543772298700980, '-', '201603739', 1, '2020-03-23 15:55:52', 1, 0);
INSERT INTO `pdf` VALUES (3390279527592649509, 'image.ruankun.xyz/5512ada866ffc891580744822ba0106b.pdf', '201603739', 1, '2020-03-23 15:56:08', 0, 1);
INSERT INTO `pdf` VALUES (3416609742536332508, 'image.ruankun.xyz/7fff770e18365ed6822e6f8f29749914.pdf', '201603739', 1, '2020-03-23 15:20:28', 0, 0);
INSERT INTO `pdf` VALUES (3542118109401188146, 'image.ruankun.xyz/4c4f7bb2e2d695600d349efa86d437f6.pdf', '201603739', 1, '2020-03-23 15:59:11', 0, 0);
INSERT INTO `pdf` VALUES (3739516300114319436, 'image.ruankun.xyz/a79194b5d0b5c9ff589803e7639cc289.pdf', '201603739', 1, '2020-03-23 15:20:08', 0, 0);
INSERT INTO `pdf` VALUES (3780343169923211442, 'image.ruankun.xyz/a109d9e0357bc6161f4adc666b65a674.pdf', '201603739', 1, '2020-03-23 15:29:35', 0, 0);
INSERT INTO `pdf` VALUES (3793197325957413706, 'image.ruankun.xyz/0f6ce8abcccd58d0cb28351b58652236.pdf', '201603739', 1, '2020-03-23 15:20:21', 0, 0);
INSERT INTO `pdf` VALUES (3827537796951266989, 'image.ruankun.xyz/600d0af6dcbd21c58fa8f4912f5d84f6.pdf', '201603739', 1, '2020-03-23 15:20:33', 0, 0);
INSERT INTO `pdf` VALUES (3835403124985814725, 'image.ruankun.xyz/9c763f9f0886f5921b78d6d90b5fe4a4.pdf', '201603739', 1, '2020-03-23 15:56:18', 0, 1);
INSERT INTO `pdf` VALUES (3840208239259053349, 'image.ruankun.xyz/dfc9bb14de73e66a3a00f2b10d936522.pdf', '201603739', 1, '2020-03-23 15:56:13', 0, 1);
INSERT INTO `pdf` VALUES (3846530134091147424, 'image.ruankun.xyz/7102f4a80136102c12057575a188cb3d.pdf', '201603739', 1, '2020-03-23 15:55:18', 0, 1);
INSERT INTO `pdf` VALUES (3966752036881404193, 'image.ruankun.xyz/3e4a1567a0a14e1be148e2b32d89e13a.pdf', '201603739', 1, '2020-03-23 15:39:03', 0, 0);
INSERT INTO `pdf` VALUES (4003723235969954737, 'image.ruankun.xyz/846ca181d05a45fd7cb89177e045a727.pdf', '201603739', 1, '2020-03-23 15:58:55', 0, 0);
INSERT INTO `pdf` VALUES (4037530928307596879, 'image.ruankun.xyz/58914b7eb71b80e0350d01b51864bb08.pdf', '201603739', 1, '2020-03-23 15:55:41', 0, 1);
INSERT INTO `pdf` VALUES (4082855025892520003, 'image.ruankun.xyz/c9e030c2776e371db3fb1cc38464c797.pdf', '201603739', 1, '2020-03-23 15:20:26', 0, 0);
INSERT INTO `pdf` VALUES (4100578924938646972, 'image.ruankun.xyz/be124db7f76991e23a1369761bf4993b.pdf', '201604234', 0, '2020-03-23 23:32:33', 0, 0);
INSERT INTO `pdf` VALUES (4102129842427762640, '-', '201603739', 1, '2020-03-23 15:44:06', 1, 0);
INSERT INTO `pdf` VALUES (4156815709713634213, 'image.ruankun.xyz/53a986f23e3593af614abd72c4a41180.pdf', '201603739', 1, '2020-03-23 15:32:03', 0, 0);
INSERT INTO `pdf` VALUES (4174262597514733705, 'image.ruankun.xyz/e92abd704c62df37caa85f33ffa923fb.pdf', '201603739', 1, '2020-03-23 15:34:06', 0, 0);
INSERT INTO `pdf` VALUES (4213752382707574252, 'image.ruankun.xyz/b953ac5ce63d490e0825ea15ea8b5a41.pdf', '201603739', 1, '2020-03-23 15:43:13', 0, 0);
INSERT INTO `pdf` VALUES (4289939633840361896, 'image.ruankun.xyz/ae4d7e719588b0d52d35af60c063374c.pdf', '201603739', 1, '2020-03-23 15:58:51', 0, 0);
INSERT INTO `pdf` VALUES (4310640103950843190, 'image.ruankun.xyz/dbd761694bdf5fb619f98c15a66d0aca.pdf', '201603739', 1, '2020-03-23 15:39:04', 0, 0);
INSERT INTO `pdf` VALUES (4311550238455529865, 'image.ruankun.xyz/23b51d6bb0ce0339047b385e013d18f2.pdf', '201603739', 1, '2020-03-23 15:55:25', 0, 1);
INSERT INTO `pdf` VALUES (4366404229371198297, 'image.ruankun.xyz/ceb224f863858c3a78f529bd54f3eaa2.pdf', '201603739', 1, '2020-03-23 15:42:42', 0, 0);
INSERT INTO `pdf` VALUES (4391394826379314295, 'image.ruankun.xyz/58a0b31df36bafc06ac0dd4aa8f037ac.pdf', '201603739', 1, '2020-03-23 15:56:14', 0, 1);
INSERT INTO `pdf` VALUES (4399283488530202096, 'image.ruankun.xyz/28debfd2d51a04ab97e4dbe3a1fef905.pdf', '201603739', 1, '2020-03-23 15:31:31', 0, 0);
INSERT INTO `pdf` VALUES (4405064590840241453, 'image.ruankun.xyz/e06278644e1b1954ce1d1247b1373d1e.pdf', '201603739', 1, '2020-03-24 17:21:11', 0, 0);
INSERT INTO `pdf` VALUES (4432433123040800606, 'image.ruankun.xyz/7b22c5cc9b7f52fc1bbf8d831b7dfbcf.pdf', '201603739', 1, '2020-03-23 15:38:54', 0, 0);
INSERT INTO `pdf` VALUES (4530201982940998053, 'image.ruankun.xyz/a08b1abb169c2182a4b74492342d0f48.pdf', '201603739', 1, '2020-03-23 15:20:11', 0, 0);
INSERT INTO `pdf` VALUES (4543141074572714711, '-', '201603739', 1, '2020-03-23 15:56:29', 1, 0);
INSERT INTO `pdf` VALUES (4544626618024746164, 'image.ruankun.xyz/d81371de96aad9495bf4f6812db63eed.pdf', '201603739', 1, '2020-03-23 15:59:00', 0, 0);
INSERT INTO `pdf` VALUES (4639030819423764328, 'image.ruankun.xyz/4976455e28cd96f5ef9473356df96040.pdf', '201603739', 1, '2020-03-23 15:24:01', 0, 0);
INSERT INTO `pdf` VALUES (4668680295655664283, 'image.ruankun.xyz/ff02b1021c3fa09231283e142fab9372.pdf', '201603739', 1, '2020-03-23 15:33:30', 0, 0);
INSERT INTO `pdf` VALUES (4719621787463424071, 'image.ruankun.xyz/025f8b0d8f1379cf70d9d2643f32df1b.pdf', '201603739', 1, '2020-03-23 15:55:27', 0, 1);
INSERT INTO `pdf` VALUES (4738839157704658695, 'image.ruankun.xyz/e9e763a324328dae209a1817db3e22ef.pdf', '201604234', 1, '2020-03-23 22:44:19', 0, 0);
INSERT INTO `pdf` VALUES (4743199914096300688, 'image.ruankun.xyz/537e15b4cea68c6b8f484a9151ba4a61.pdf', '201603739', 1, '2020-03-23 15:56:20', 0, 1);
INSERT INTO `pdf` VALUES (4788616753638312115, '-', '201603739', 1, '2020-03-23 15:38:44', 1, 1);
INSERT INTO `pdf` VALUES (4868591987806656815, 'image.ruankun.xyz/63f1fdcef5e8ad1bc8ff85d12bd21106.pdf', '201603739', 1, '2020-03-23 15:59:12', 0, 0);
INSERT INTO `pdf` VALUES (4953741101822296671, 'image.ruankun.xyz/67e0661fb7b5e7935fb4e502fb664f57.pdf', '201604234', 0, '2020-03-23 22:58:25', 0, 0);
INSERT INTO `pdf` VALUES (4970136799940758516, 'image.ruankun.xyz/b4830a56a3b44be407f9ef36d0f51834.pdf', '201603739', 1, '2020-03-23 15:39:11', 0, 0);
INSERT INTO `pdf` VALUES (4973281134789547079, 'image.ruankun.xyz/de7ddaa62ca07aa20ad6af3f6773b6ee.pdf', '201603739', 1, '2020-03-23 15:20:34', 0, 0);
INSERT INTO `pdf` VALUES (5064752535673291940, 'image.ruankun.xyz/fcc12a33a7b958334919435e164976e8.pdf', '201603739', 1, '2020-03-23 15:38:57', 0, 0);
INSERT INTO `pdf` VALUES (5066669048464924939, 'image.ruankun.xyz/ced7b5108fe02a97032a5cc5b3b7ab9e.pdf', '201603739', 1, '2020-03-24 17:31:40', 0, 0);
INSERT INTO `pdf` VALUES (5070800355711983637, 'image.ruankun.xyz/f38f3e9519bcdb7a2f86ee017fefbeb6.pdf', '201603739', 1, '2020-03-23 15:42:56', 0, 0);
INSERT INTO `pdf` VALUES (5104124574056447629, 'image.ruankun.xyz/0ccecc2bcec3c3ec3efb81e146278533.pdf', '201603739', 1, '2020-03-23 15:30:51', 0, 0);
INSERT INTO `pdf` VALUES (5163439915395349799, 'image.ruankun.xyz/646fe44aa6149f57b14dfd1cb9f17715.pdf', '201603739', 1, '2020-03-23 15:20:24', 0, 0);
INSERT INTO `pdf` VALUES (5234674929548065344, 'image.ruankun.xyz/590d6f5a0ec8420c629d357f6b8b4188.pdf', '201603739', 1, '2020-03-23 15:28:11', 0, 0);
INSERT INTO `pdf` VALUES (5281870463110327719, 'image.ruankun.xyz/6f15daf4f3d364cee0ac5e36f65f1ac2.pdf', '201603739', 1, '2020-03-23 15:55:40', 0, 1);
INSERT INTO `pdf` VALUES (5379982121538288291, 'image.ruankun.xyz/f133a9eb5c2c1f52fdb6da374b3c7cb5.pdf', '201603739', 1, '2020-03-23 15:20:22', 0, 0);
INSERT INTO `pdf` VALUES (5421796071689934156, 'image.ruankun.xyz/848cf2e9b48f46059c05e5d79e9872a4.pdf', '201603739', 1, '2020-03-23 15:29:58', 0, 0);
INSERT INTO `pdf` VALUES (5434062823941559613, 'image.ruankun.xyz/25b93b3caae331b6d76a3b08b78d420d.pdf', '201604234', 0, '2020-03-23 23:16:58', 0, 0);
INSERT INTO `pdf` VALUES (5449731432214567766, 'image.ruankun.xyz/a699fef07a79f7d96f02ecaebd0963ce.pdf', '201603739', 1, '2020-03-23 15:59:02', 0, 0);
INSERT INTO `pdf` VALUES (5456599359477383265, 'image.ruankun.xyz/611c8fe87930a40144d0f6c1136ff0f0.pdf', '201603739', 1, '2020-03-23 15:42:57', 0, 0);
INSERT INTO `pdf` VALUES (5501059967689820996, 'image.ruankun.xyz/f828c12317c8bccbb1efd514f4f9fc45.pdf', '201603739', 1, '2020-03-23 15:29:27', 0, 0);
INSERT INTO `pdf` VALUES (5510736823190770138, 'image.ruankun.xyz/b9d868cf681016e092c9a89c3a940c69.pdf', '201603739', 1, '2020-03-23 15:37:14', 0, 0);
INSERT INTO `pdf` VALUES (5526246765246488819, 'image.ruankun.xyz/1ef6ee7e91f335b2189f50eb7f768d2f.pdf', '201603739', 1, '2020-03-23 15:38:53', 0, 0);
INSERT INTO `pdf` VALUES (5545312168152086103, 'image.ruankun.xyz/b4902c99182b203a74c3fb72988d8c34.pdf', '201603739', 1, '2020-03-23 15:35:05', 0, 0);
INSERT INTO `pdf` VALUES (5560440798909877258, 'image.ruankun.xyz/c3c12fc78153beb4a6a99156265364d9.pdf', '201603739', 1, '2020-03-23 15:29:54', 0, 0);
INSERT INTO `pdf` VALUES (5575584958165614195, 'image.ruankun.xyz/800734f5f5f8e03bae6271e3371a5aec.pdf', '201603739', 1, '2020-03-23 15:33:49', 0, 0);
INSERT INTO `pdf` VALUES (5629779418383828848, 'image.ruankun.xyz/0c610a303d6eaae7e6e6bbe0c1f46160.pdf', '201603739', 1, '2020-03-23 15:29:10', 0, 0);
INSERT INTO `pdf` VALUES (5716754210150676505, 'image.ruankun.xyz/eedd93dbf6626fb2c9c37344a2570f52.pdf', '201603739', 1, '2020-03-23 15:58:53', 0, 0);
INSERT INTO `pdf` VALUES (5752147748027178960, 'image.ruankun.xyz/0bdbfb47228cefcff9ed70d8a10cc863.pdf', '201603739', 1, '2020-03-23 15:43:04', 0, 0);
INSERT INTO `pdf` VALUES (5780440657283287533, 'image.ruankun.xyz/de129686b31a5349177df83d36f55b9d.pdf', '201603739', 1, '2020-03-23 15:55:22', 0, 1);
INSERT INTO `pdf` VALUES (5788192817454368136, 'image.ruankun.xyz/289ad21e505bf9257a9b3e5d847f609d.pdf', '201603739', 1, '2020-03-23 15:42:58', 0, 0);
INSERT INTO `pdf` VALUES (5821644488085617957, 'image.ruankun.xyz/021a65721bb0bc44380c81db4f1e82b3.pdf', '201603739', 1, '2020-03-23 15:42:53', 0, 0);
INSERT INTO `pdf` VALUES (5832585558903310672, 'image.ruankun.xyz/1e3ecac0a9602e4c673cc018914031fe.pdf', '201603739', 1, '2020-03-23 15:55:19', 0, 1);
INSERT INTO `pdf` VALUES (5849294511672730255, 'image.ruankun.xyz/57713b3880447980d8b25d626905d3cc.pdf', '201603739', 1, '2020-03-23 15:36:00', 0, 0);
INSERT INTO `pdf` VALUES (5860463561430075201, 'image.ruankun.xyz/5cbee102c0045ab50795ca2de430daf3.pdf', '201603739', 1, '2020-03-23 15:55:32', 0, 1);
INSERT INTO `pdf` VALUES (5914784239326766203, 'image.ruankun.xyz/ff77036d33703c21ecf62e11f77eeac9.pdf', '201603739', 1, '2020-03-23 15:20:35', 0, 0);
INSERT INTO `pdf` VALUES (6009033448840404445, 'image.ruankun.xyz/cc7cbd6a50d6a5305dc15aee0443e471.pdf', '201603739', 1, '2020-03-23 15:58:56', 0, 0);
INSERT INTO `pdf` VALUES (6026439365948222754, 'image.ruankun.xyz/3d395ddee8bc1b74721534dc55e794a0.pdf', '201603739', 1, '2020-03-23 15:28:23', 0, 0);
INSERT INTO `pdf` VALUES (6152491825726880779, 'image.ruankun.xyz/adeb778b4c75ea1dd3d4725fadb5d332.pdf', '201603739', 1, '2020-03-23 15:56:05', 0, 1);
INSERT INTO `pdf` VALUES (6155113114417891467, 'image.ruankun.xyz/71167366b556d0c733de2082e466f9e3.pdf', '201603739', 1, '2020-03-23 15:58:48', 0, 0);
INSERT INTO `pdf` VALUES (6156417431320715259, 'image.ruankun.xyz/6cdff17386bba719e4a340559f64943b.pdf', '201603739', 1, '2020-03-23 15:59:09', 0, 0);
INSERT INTO `pdf` VALUES (6180614244515092495, 'image.ruankun.xyz/bb2b01454960fd50b9bee48a9ff5c454.pdf', '201604234', 0, '2020-03-23 22:48:25', 0, 0);
INSERT INTO `pdf` VALUES (6190113238205116227, 'image.ruankun.xyz/e5828587aa68c761e9782e5c48bf9a57.pdf', '201603739', 1, '2020-03-23 15:56:25', 0, 1);
INSERT INTO `pdf` VALUES (6232825807697984245, 'image.ruankun.xyz/139abb9c38ce1db203aefa6e994885b6.pdf', '201603739', 1, '2020-03-23 15:58:59', 0, 0);
INSERT INTO `pdf` VALUES (6257945675591343282, 'image.ruankun.xyz/bd90744812d92ab37d947d1e723bd540.pdf', '201603739', 1, '2020-03-23 15:43:05', 0, 0);
INSERT INTO `pdf` VALUES (6264184805558680316, 'image.ruankun.xyz/89bd33fe04aee121d1a5dce872131a88.pdf', '201603739', 1, '2020-03-23 13:03:44', 0, 0);
INSERT INTO `pdf` VALUES (6309504404835789027, 'image.ruankun.xyz/26f665605f59857a14754da76f1281a6.pdf', '201603739', 1, '2020-03-23 15:59:03', 0, 0);
INSERT INTO `pdf` VALUES (6314811482443244615, 'image.ruankun.xyz/6dc0cf0a5b6a60f68b613a2eb231e9d1.pdf', '201603739', 1, '2020-03-23 15:38:46', 0, 0);
INSERT INTO `pdf` VALUES (6345376573555608247, 'image.ruankun.xyz/89dce64c5c4d99a75d88382a5d3e2130.pdf', '201603739', 1, '2020-03-23 15:30:45', 0, 0);
INSERT INTO `pdf` VALUES (6346180077062090688, 'image.ruankun.xyz/9f06ff84e4135ac69739d46c3e12c652.pdf', '201603739', 1, '2020-03-23 15:59:01', 0, 0);
INSERT INTO `pdf` VALUES (6363801280962927092, 'image.ruankun.xyz/1711eed83bab00cb472f68d6da03b689.pdf', '201603739', 1, '2020-03-23 15:42:52', 0, 0);
INSERT INTO `pdf` VALUES (6369776789439590843, 'image.ruankun.xyz/514eba3ec264c35fb92916e5fba3f6f1.pdf', '201603739', 1, '2020-03-23 15:55:39', 0, 1);
INSERT INTO `pdf` VALUES (6392925456311201553, 'image.ruankun.xyz/31e51c48b4fab764eb555387b791950a.pdf', '201604234', 1, '2020-03-23 23:17:48', 0, 0);
INSERT INTO `pdf` VALUES (6400033780841602495, 'image.ruankun.xyz/f6284ba45db442bb779cb3abc8814268.pdf', '201603739', 1, '2020-03-23 15:58:54', 0, 0);
INSERT INTO `pdf` VALUES (6423317190873251565, 'image.ruankun.xyz/ae2a8299332f80f283fedd0dfd718e8f.pdf', '201603739', 1, '2020-03-23 15:55:14', 0, 1);
INSERT INTO `pdf` VALUES (6475758235345746327, 'image.ruankun.xyz/331a0e48f58a8babd282b92911d54c5c.pdf', '201603739', 1, '2020-03-23 15:28:16', 0, 0);
INSERT INTO `pdf` VALUES (6494459358935550763, 'image.ruankun.xyz/20e5760a23c6e3681afd089d4b64a926.pdf', '201603739', 1, '2020-03-23 15:23:04', 0, 0);
INSERT INTO `pdf` VALUES (6505757231102060537, 'image.ruankun.xyz/7fa66d9460fea098e8efe87a95608531.pdf', '201603739', 1, '2020-03-23 15:59:07', 0, 0);
INSERT INTO `pdf` VALUES (6532006525670429707, 'image.ruankun.xyz/c11b4ae70714bdd05177d5b0c78bdd68.pdf', '201603739', 1, '2020-03-23 15:55:29', 0, 1);
INSERT INTO `pdf` VALUES (6555355796568291693, 'image.ruankun.xyz/b7dc0db554626e113333c664ae9ebee3.pdf', '201604234', 1, '2020-03-23 23:07:40', 0, 0);
INSERT INTO `pdf` VALUES (6559941675587608602, 'image.ruankun.xyz/a67cae628580bd5f1916206439eb4f4a.pdf', '201603739', 1, '2020-03-23 15:30:34', 0, 0);
INSERT INTO `pdf` VALUES (6560792706944601889, 'image.ruankun.xyz/fc769d28cdcfe9cf53a9e137d473c21a.pdf', '201603739', 1, '2020-03-23 15:22:46', 0, 0);
INSERT INTO `pdf` VALUES (6582568115259205957, 'image.ruankun.xyz/db6cf40bb431d56411b089282b40dd2e.pdf', '201604234', 0, '2020-03-23 23:08:58', 0, 0);
INSERT INTO `pdf` VALUES (6656224544797540867, 'image.ruankun.xyz/4e9dc16f0815ae124dda8ee308f247f0.pdf', '201603739', 1, '2020-03-23 15:20:32', 0, 0);
INSERT INTO `pdf` VALUES (6802148799098725803, 'image.ruankun.xyz/e1919f6cf4eff1182acfe894eb7e2df4.pdf', '201603739', 1, '2020-03-23 15:59:08', 0, 0);
INSERT INTO `pdf` VALUES (6812158581970476107, 'image.ruankun.xyz/aca47a4cd8f64609320f3e6e734eb013.pdf', '201603739', 1, '2020-03-23 15:24:09', 0, 0);
INSERT INTO `pdf` VALUES (6913195039064897372, 'image.ruankun.xyz/8fd31038148ae38570ce8c0f9cfb31f4.pdf', '201603739', 1, '2020-03-23 15:55:33', 0, 1);
INSERT INTO `pdf` VALUES (6980306776041161667, 'image.ruankun.xyz/1519b06d0c3d85d4f274812f94261896.pdf', '201603739', 1, '2020-03-23 15:36:36', 0, 0);
INSERT INTO `pdf` VALUES (7044384811261362112, 'image.ruankun.xyz/8b363d1ce478da81eb3bfdda1c51fb82.pdf', '201603739', 1, '2020-03-23 15:55:28', 0, 1);
INSERT INTO `pdf` VALUES (7139216328815381813, 'image.ruankun.xyz/d93b1e72f893b183eb4bf4f894d13aa3.pdf', '201603739', 1, '2020-03-23 15:42:45', 0, 0);
INSERT INTO `pdf` VALUES (7158045142644457151, 'image.ruankun.xyz/22912888ea610748492637c498f5f899.pdf', '201603739', 1, '2020-03-23 15:42:42', 0, 0);
INSERT INTO `pdf` VALUES (7166033393070013334, 'image.ruankun.xyz/fec6cd01ea1c1577db2e48226dd9ef54.pdf', '201603739', 1, '2020-03-23 15:30:41', 0, 0);
INSERT INTO `pdf` VALUES (7177605364091015071, 'image.ruankun.xyz/54d5fb05bac8d420c4c87e473e38ab90.pdf', '201603739', 1, '2020-03-23 15:30:10', 0, 0);
INSERT INTO `pdf` VALUES (7179409343290209677, 'image.ruankun.xyz/194d00e4d5332523b16c2f3823faffa9.pdf', '201603739', 1, '2020-03-23 15:55:26', 0, 1);
INSERT INTO `pdf` VALUES (7321400405275543599, 'image.ruankun.xyz/09fbb2b2f24db1c2d76c01244eef5606.pdf', '201604234', 0, '2020-03-23 23:25:33', 0, 0);
INSERT INTO `pdf` VALUES (7330843314122849073, 'image.ruankun.xyz/12aeaf3317568942b8896183d7904eb5.pdf', '201603739', 1, '2020-03-23 15:36:16', 0, 0);
INSERT INTO `pdf` VALUES (7355900889311976534, 'image.ruankun.xyz/927a4f02ab47a46c34d8baad394f1fd5.pdf', '201603739', 1, '2020-03-23 15:30:26', 0, 0);
INSERT INTO `pdf` VALUES (7375546168696420015, 'image.ruankun.xyz/e47cfc2fc1fa9603953734bd52b0489e.pdf', '201603739', 1, '2020-03-23 15:35:49', 0, 0);
INSERT INTO `pdf` VALUES (7506021751504014025, 'image.ruankun.xyz/83e993f7a7c247a8a44a3d7af5466b31.pdf', '201603739', 1, '2020-03-23 15:30:00', 0, 0);
INSERT INTO `pdf` VALUES (7525374054054539747, 'image.ruankun.xyz/85213e0d93033a0e16fed1089e56dbdc.pdf', '201603739', 1, '2020-03-23 15:42:46', 0, 0);
INSERT INTO `pdf` VALUES (7525943385917054887, 'image.ruankun.xyz/535fb529e2888645ea36b151b5861a1d.pdf', '201603739', 1, '2020-03-23 15:56:22', 0, 1);
INSERT INTO `pdf` VALUES (7537807519828197872, 'image.ruankun.xyz/a8085ac7d1be606b7494ed07852d6cfd.pdf', '201603739', 1, '2020-03-23 15:56:12', 0, 1);
INSERT INTO `pdf` VALUES (7605337464370369581, 'image.ruankun.xyz/aff6f75d01d9f938943bbab5e82a4082.pdf', '201603739', 1, '2020-03-23 15:21:03', 0, 0);
INSERT INTO `pdf` VALUES (7651794306351049024, 'image.ruankun.xyz/7975e8b7a5524eff53abc46c910d674a.pdf', '201603739', 1, '2020-03-23 15:27:07', 0, 0);
INSERT INTO `pdf` VALUES (7879476812841051100, 'image.ruankun.xyz/5e36a7bc07033a6c8a8c517c801c420d.pdf', '201603739', 1, '2020-03-23 15:55:47', 0, 1);
INSERT INTO `pdf` VALUES (7909342231312426392, 'image.ruankun.xyz/186069b1a15219470d1707b166c4e73c.pdf', '201603739', 1, '2020-03-23 15:58:50', 0, 0);
INSERT INTO `pdf` VALUES (7909450925585257514, 'image.ruankun.xyz/6f9279d6cb2b9a099b86191a4392aa2e.pdf', '201604234', 1, '2020-03-23 22:44:30', 0, 0);
INSERT INTO `pdf` VALUES (7911894687950587673, 'image.ruankun.xyz/ee90878ba16a9719da8b41fd7583c83e.pdf', '201603739', 1, '2020-03-23 15:36:08', 0, 0);
INSERT INTO `pdf` VALUES (8047730934541113402, 'image.ruankun.xyz/9ea17b24684e12c73e1bc17bd7121b8f.pdf', '201603739', 1, '2020-03-23 15:31:00', 0, 0);
INSERT INTO `pdf` VALUES (8053841681533888902, 'image.ruankun.xyz/f7905c1ac4204bc25345ff337bc95060.pdf', '201603739', 1, '2020-03-23 15:56:28', 0, 1);
INSERT INTO `pdf` VALUES (8056140978068003838, 'image.ruankun.xyz/8bcf292f3417808447ce4da62705f951.pdf', '201604234', 0, '2020-03-23 23:24:38', 0, 0);
INSERT INTO `pdf` VALUES (8137265550648365639, 'image.ruankun.xyz/8e9010e9ff2987371793e9c2411b1a19.pdf', '201603739', 1, '2020-03-23 15:42:49', 0, 0);
INSERT INTO `pdf` VALUES (8148029954493469003, 'image.ruankun.xyz/38ff513f516d3aed845a3efd2482dd21.pdf', '201603739', 1, '2020-03-23 15:38:56', 0, 0);
INSERT INTO `pdf` VALUES (8156475230370463285, 'image.ruankun.xyz/e85df498caad5488db6b3279e7d78ac2.pdf', '201603739', 1, '2020-03-23 15:43:02', 0, 0);
INSERT INTO `pdf` VALUES (8163259874756046357, 'image.ruankun.xyz/430d3817650901763203f4b9c46490aa.pdf', '201604234', 0, '2020-03-23 22:47:52', 0, 0);
INSERT INTO `pdf` VALUES (8185131791883008052, 'image.ruankun.xyz/e687c3a676938e0b6fab9971ac8ba5f9.pdf', '201603739', 1, '2020-03-23 15:39:00', 0, 0);
INSERT INTO `pdf` VALUES (8241798984010317606, 'image.ruankun.xyz/30124a80bbd93289d5708a7cae8f3561.pdf', '201603739', 1, '2020-03-23 15:34:31', 0, 0);
INSERT INTO `pdf` VALUES (8259069008545465486, 'image.ruankun.xyz/75412e48f62131ee3a8e940289355d4d.pdf', '201603739', 1, '2020-03-23 15:56:27', 0, 1);
INSERT INTO `pdf` VALUES (8294485570256133421, 'image.ruankun.xyz/1ab74930bd60f63b646466348265748a.pdf', '201603739', 1, '2020-03-23 15:29:03', 0, 0);
INSERT INTO `pdf` VALUES (8310777647139356613, 'image.ruankun.xyz/d4e2112a49c2705fc8998f3441ab0a4b.pdf', '201603739', 1, '2020-03-23 15:55:37', 0, 1);
INSERT INTO `pdf` VALUES (8328081263899730161, 'image.ruankun.xyz/d217c68581d98c5b2e7316c7b2ff170e.pdf', '201603739', 1, '2020-03-23 15:28:53', 0, 0);
INSERT INTO `pdf` VALUES (8355519057317021728, 'image.ruankun.xyz/4d06214fa6d25fc2b57de7f122eb6ef8.pdf', '201603739', 1, '2020-03-23 15:43:01', 0, 0);
INSERT INTO `pdf` VALUES (8445427685094818532, 'image.ruankun.xyz/f13bfff193a79d919697d56e87be531f.pdf', '201603739', 1, '2020-03-23 15:30:06', 0, 0);
INSERT INTO `pdf` VALUES (8448822200908565307, 'image.ruankun.xyz/b1ba71c826a49d0e3694af5aa8097d99.pdf', '201603739', 1, '2020-03-23 15:55:20', 0, 1);
INSERT INTO `pdf` VALUES (8452926280515478836, 'image.ruankun.xyz/932e1c1fb684b2acee16efc6ba6a8088.pdf', '201603739', 1, '2020-03-23 15:20:12', 0, 0);
INSERT INTO `pdf` VALUES (8461635623328605140, 'image.ruankun.xyz/3161e1e1f954588a6966d3dd69e476a3.pdf', '201603739', 1, '2020-03-23 15:20:18', 0, 0);
INSERT INTO `pdf` VALUES (8476368232522186425, 'image.ruankun.xyz/4710db9d12150d52acab5bb716e0ba44.pdf', '201603739', 1, '2020-03-23 15:42:38', 0, 0);
INSERT INTO `pdf` VALUES (8513519766635240084, 'image.ruankun.xyz/4196e258a175a6f73f23f247c37380ab.pdf', '201603739', 1, '2020-03-23 15:28:41', 0, 0);
INSERT INTO `pdf` VALUES (8555126420484198416, 'image.ruankun.xyz/e0a8eac11fd26a544bd67b86e8821bd7.pdf', '201603739', 1, '2020-03-23 15:56:23', 0, 1);
INSERT INTO `pdf` VALUES (8670101514716123918, 'image.ruankun.xyz/0d7dfa1ce04eecb89501b32007709f4c.pdf', '201603739', 1, '2020-03-23 15:36:50', 0, 0);
INSERT INTO `pdf` VALUES (8899814331535535521, 'image.ruankun.xyz/99225afff3829df9533138dfc4b894a4.pdf', '201603739', 1, '2020-03-23 15:29:43', 0, 0);
INSERT INTO `pdf` VALUES (8936389429735082252, '-', '201603739', 1, '2020-03-23 15:43:22', 1, 1);
INSERT INTO `pdf` VALUES (8955700782483269328, 'image.ruankun.xyz/3e6f4cdfe86b2b4ef4317a4531ed277c.pdf', '201603739', 1, '2020-03-23 15:25:30', 0, 0);
INSERT INTO `pdf` VALUES (8956559988084435466, 'image.ruankun.xyz/dbb85e236d8827f87ca32abefcbf56fe.pdf', '201603739', 1, '2020-03-23 15:59:06', 0, 0);
INSERT INTO `pdf` VALUES (8965665218038805668, 'image.ruankun.xyz/83ccd5146b93d0b1492e51d63a1bfea9.pdf', '201603739', 1, '2020-03-23 15:58:57', 0, 0);
INSERT INTO `pdf` VALUES (8998509197504826869, 'image.ruankun.xyz/8fcb17242a0524b5063f469c2dd67520.pdf', '201603739', 1, '2020-03-23 15:42:43', 0, 0);
INSERT INTO `pdf` VALUES (9015945645730932397, 'image.ruankun.xyz/50edfa3ecb64721455ac72fc7360f8f5.pdf', '201604234', 0, '2020-03-23 22:55:47', 0, 0);
INSERT INTO `pdf` VALUES (9130364392770109325, 'image.ruankun.xyz/f8dd557f442573de4a8443ad43911cd1.pdf', '201603739', 1, '2020-03-23 15:42:55', 0, 0);
INSERT INTO `pdf` VALUES (9131392762772855805, '-', '201603739', 1, '2020-03-23 15:55:48', 1, 1);
INSERT INTO `pdf` VALUES (9172639935744841281, 'image.ruankun.xyz/e56361eec18d2f8b2bf64c45202460ad.pdf', '201603739', 1, '2020-03-23 15:55:36', 0, 1);
INSERT INTO `pdf` VALUES (9195476379390620319, 'image.ruankun.xyz/0576bd9923d67c35690d4b91b860974e.pdf', '201603739', 1, '2020-03-23 15:24:45', 0, 0);
INSERT INTO `pdf` VALUES (9202812751131738804, 'image.ruankun.xyz/f37759c1d80bc444d96aa33f72872be5.pdf', '201603739', 1, '2020-03-23 15:55:35', 0, 1);
INSERT INTO `pdf` VALUES (9218869351410434840, 'image.ruankun.xyz/4777929202926929023c37aa58610eb6.pdf', '201603739', 1, '2020-03-23 15:20:20', 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `stuno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '关联学生学号',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `stage1_guide_way` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '第一阶段指导方式',
  `stage1_summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '第一阶段实习总结',
  `stage1_comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '第一阶段学院实习指导教师评语',
  `stage1_grade` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '第一阶段实习成绩评定',
  `stage2_guide_way` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '第二阶段实习指导方式',
  `stage2_summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '第二阶段实习总结',
  `stage2_comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '第二阶段学院实习导师评语',
  `stage2_grade` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '第二阶段实习成绩评定',
  `total_eval` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '学院实习指导老师总评价',
  `total_grade` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学院实习指导老师总评优良中差',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_stuno` (`stuno`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of report
-- ----------------------------
BEGIN;
INSERT INTO `report` VALUES (12, '201603739', '2020-03-06 20:28:01', '2020-03-23 12:52:06', 'qq', '第一阶段总结还不错', 'qq', '优秀', '1qq', 'qq', 'qq', '优秀', 'qq', '优秀');
INSERT INTO `report` VALUES (13, '201604221', '2020-03-08 00:47:23', '2020-03-08 00:47:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `report` VALUES (14, '201604196', '2020-03-08 10:33:07', '2020-03-08 10:33:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `report` VALUES (15, '201604253', '2020-03-08 16:54:46', '2020-03-08 17:02:08', '123', '123', NULL, NULL, '123456', '123456', NULL, NULL, NULL, NULL);
INSERT INTO `report` VALUES (16, '201604234', '2020-03-08 19:54:31', '2020-03-08 19:54:31', NULL, NULL, '你好啊', '不及格', NULL, NULL, '嘿嘿第二阶段', '不及格', '憨批娃娃, 你实习的是个锤子哦, 搞锤子', '不及格');
COMMIT;

-- ----------------------------
-- Table structure for reportdate
-- ----------------------------
DROP TABLE IF EXISTS `reportdate`;
CREATE TABLE `reportdate` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `stuno` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '学号',
  `stage1_duration` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '阶段1时间段',
  `stage1_fill` datetime DEFAULT NULL COMMENT '阶段1填写时间',
  `stage1_grade` datetime DEFAULT NULL COMMENT '阶段1评价评分时间',
  `stage2_duration` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '阶段2时间段',
  `stage2_fill` datetime DEFAULT NULL COMMENT '阶段2填写时间',
  `stage2_grade` datetime DEFAULT NULL COMMENT '阶段2评分评价时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_stuno` (`stuno`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of reportdate
-- ----------------------------
BEGIN;
INSERT INTO `reportdate` VALUES (1, '201604253', '1-2', '2020-03-08 16:57:38', NULL, '1-2', '2020-03-08 17:02:08', NULL);
INSERT INTO `reportdate` VALUES (2, '201604234', NULL, NULL, '2020-03-08 19:59:35', NULL, NULL, '2020-03-08 20:00:26');
COMMIT;

-- ----------------------------
-- Table structure for stage
-- ----------------------------
DROP TABLE IF EXISTS `stage`;
CREATE TABLE `stage` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `collegecode` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '学院代码',
  `stage` int(11) DEFAULT NULL COMMENT '阶段1,阶段2,阶段3',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `isreport` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 控制报告册 0控制鉴定表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='状态控制表,当前填写第几阶段，实习报告册1和鉴定表0，分别为三个阶段。报告册：学生填写阶段1，学生填写阶段2，教师评定阶段。鉴定表：学生实习总结，学生实习陈述，教师总结评定。';

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `stuno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '姓名',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '男' COMMENT '性别',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '电话',
  `qq` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'qq',
  `wechat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '微信',
  `idcard` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '身份证号',
  `college` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学院',
  `collegecode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学院代码',
  `major` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '专业',
  `majorcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '专业代码',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态1启用 0停用',
  `corp` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '实习企业',
  `position` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '实习岗位',
  `starttime` datetime DEFAULT NULL COMMENT '实习开始时间',
  `endtime` datetime DEFAULT NULL COMMENT '实习结束时间',
  `teachno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '导师工号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_stuno` (`stuno`),
  UNIQUE KEY `uniqueidcard` (`idcard`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=507 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='学生信息';

-- ----------------------------
-- Records of student
-- ----------------------------
BEGIN;
INSERT INTO `student` VALUES (7, '201604253', 'e10adc3949ba59abbe56e057f20f883e', '杨丽', 11, '女', '11', '11', '21', '512021199712023767', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-08 17:04:06', 1, '234', '22', NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (8, '201604252', 'e10adc3949ba59abbe56e057f20f883e', '袁成敬', NULL, '女', NULL, NULL, NULL, '513223199608290421', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (9, '201604251', 'e10adc3949ba59abbe56e057f20f883e', '张爱璐', NULL, '女', NULL, NULL, NULL, '511025199607032885', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (10, '201604250', 'e10adc3949ba59abbe56e057f20f883e', '张倩', NULL, '女', NULL, NULL, NULL, '500228199803307361', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (11, '201604249', 'e10adc3949ba59abbe56e057f20f883e', '郑沁雪', NULL, '女', NULL, NULL, NULL, '510132199712274024', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (12, '201604248', 'e10adc3949ba59abbe56e057f20f883e', '邓婕', NULL, '女', NULL, NULL, NULL, '500227199712166325', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (13, '201604247', 'e10adc3949ba59abbe56e057f20f883e', '高银骏', NULL, '女', NULL, NULL, NULL, '510107199803303429', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (14, '201604246', 'e10adc3949ba59abbe56e057f20f883e', '郭思豆', NULL, '女', NULL, NULL, NULL, '513822199809300186', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (15, '201604245', 'e10adc3949ba59abbe56e057f20f883e', '胡甜', NULL, '女', NULL, NULL, NULL, '511323199808270226', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (16, '201604244', 'e10adc3949ba59abbe56e057f20f883e', '雷萍', NULL, '女', NULL, NULL, NULL, '511528199710281624', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (17, '201604243', 'e10adc3949ba59abbe56e057f20f883e', '李惠', NULL, '女', NULL, NULL, NULL, '510122199709258768', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (18, '201604242', 'e10adc3949ba59abbe56e057f20f883e', '李施璇', NULL, '女', NULL, NULL, NULL, '659001199807010629', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (19, '201604241', 'e10adc3949ba59abbe56e057f20f883e', '梁玉', NULL, '女', NULL, NULL, NULL, '510626199705015120', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (20, '201604240', 'e10adc3949ba59abbe56e057f20f883e', '卢茜', NULL, '女', NULL, NULL, NULL, '513425199611308622', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (21, '201604239', 'e10adc3949ba59abbe56e057f20f883e', '马丹', NULL, '女', NULL, NULL, NULL, '511902199905150542', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (22, '201604238', 'e10adc3949ba59abbe56e057f20f883e', '任钰璟', NULL, '女', NULL, NULL, NULL, '513002199708210086', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (23, '201604237', 'e10adc3949ba59abbe56e057f20f883e', '谭茜文', NULL, '女', NULL, NULL, NULL, '500238199805100148', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (24, '201604236', 'e10adc3949ba59abbe56e057f20f883e', '王维一', NULL, '女', NULL, NULL, NULL, '511381199804063506', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (25, '201604234', 'e10adc3949ba59abbe56e057f20f883e', '武刚婷', NULL, '女', NULL, NULL, NULL, '510603199701171703', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (26, '201604233', 'e10adc3949ba59abbe56e057f20f883e', '熊亚利', NULL, '女', NULL, NULL, NULL, '510902199701146081', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (27, '201604232', 'e10adc3949ba59abbe56e057f20f883e', '陈佳慧', NULL, '女', NULL, NULL, NULL, '510121199802288463', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (28, '201604231', 'e10adc3949ba59abbe56e057f20f883e', '阿苏木加', NULL, '男', NULL, NULL, NULL, '513434199605043070', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (29, '201604230', 'e10adc3949ba59abbe56e057f20f883e', '陈跃', NULL, '男', NULL, NULL, NULL, '511522199808084778', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (30, '201604228', 'e10adc3949ba59abbe56e057f20f883e', '何健', NULL, '男', NULL, NULL, NULL, '500101199807298639', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (31, '201604227', 'e10adc3949ba59abbe56e057f20f883e', '康朝勇', NULL, '男', NULL, NULL, NULL, '500231199510212076', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (32, '201604226', 'e10adc3949ba59abbe56e057f20f883e', '梁加兴', NULL, '男', NULL, NULL, NULL, '510921199708035017', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (33, '201604225', 'e10adc3949ba59abbe56e057f20f883e', '卢锐', NULL, '男', NULL, NULL, NULL, '510122199804156030', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (34, '201604224', 'e10adc3949ba59abbe56e057f20f883e', '罗柯', NULL, '男', NULL, NULL, NULL, '510122199708110016', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (35, '201604223', 'e10adc3949ba59abbe56e057f20f883e', '彭鑫', NULL, '男', NULL, NULL, NULL, '500242199801213270', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (36, '201604222', 'e10adc3949ba59abbe56e057f20f883e', '邱佳烨', NULL, '男', NULL, NULL, NULL, '513902199803040395', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (37, '201604221', 'e10adc3949ba59abbe56e057f20f883e', '宋运杰', NULL, '男', NULL, NULL, NULL, '510112199711290713', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (38, '201604220', 'e10adc3949ba59abbe56e057f20f883e', '汪晓山', NULL, '男', NULL, NULL, NULL, '510322199711140516', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (39, '201604219', 'e10adc3949ba59abbe56e057f20f883e', '吴雨衡', NULL, '男', NULL, NULL, NULL, '511133199805263030', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (40, '201604218', 'e10adc3949ba59abbe56e057f20f883e', '薛世鸿', NULL, '男', NULL, NULL, NULL, '510182199711067078', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (41, '201604217', 'e10adc3949ba59abbe56e057f20f883e', '喻杰', NULL, '男', NULL, NULL, NULL, '513701199711250136', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (42, '201604216', 'e10adc3949ba59abbe56e057f20f883e', '章强', NULL, '男', NULL, NULL, NULL, '411526199805285437', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (43, '201604215', 'e10adc3949ba59abbe56e057f20f883e', '赵安琪', NULL, '女', NULL, NULL, NULL, '510105199712013263', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (44, '201604214', 'e10adc3949ba59abbe56e057f20f883e', '张琳', NULL, '女', NULL, NULL, NULL, '510824199805055523', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (45, '201604213', 'e10adc3949ba59abbe56e057f20f883e', '曾欣缘', NULL, '女', NULL, NULL, NULL, '510122199812025364', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (46, '201604212', 'e10adc3949ba59abbe56e057f20f883e', '叶日各', NULL, '女', NULL, NULL, NULL, '513401199507218124', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (47, '201604211', 'e10adc3949ba59abbe56e057f20f883e', '薛思慧', NULL, '女', NULL, NULL, NULL, '511521199808110060', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (48, '201604210', 'e10adc3949ba59abbe56e057f20f883e', '谢抒伶', NULL, '女', NULL, NULL, NULL, '500102199811170044', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (49, '201604209', 'e10adc3949ba59abbe56e057f20f883e', '吴静', NULL, '女', NULL, NULL, NULL, '513922199811292002', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (50, '201604208', 'e10adc3949ba59abbe56e057f20f883e', '王韵汐', NULL, '女', NULL, NULL, NULL, '511502199810090688', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (51, '201604207', 'e10adc3949ba59abbe56e057f20f883e', '王蒻馨', NULL, '女', NULL, NULL, NULL, '210102199807264727', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (52, '201604206', 'e10adc3949ba59abbe56e057f20f883e', '孙秀丽', NULL, '女', NULL, NULL, NULL, '513432199512063627', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (53, '201604205', 'e10adc3949ba59abbe56e057f20f883e', '屈琳', NULL, '女', NULL, NULL, NULL, '513721199808138381', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (54, '201604204', 'e10adc3949ba59abbe56e057f20f883e', '罗可而', NULL, '女', NULL, NULL, NULL, '511102199801183426', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (55, '201604203', 'e10adc3949ba59abbe56e057f20f883e', '刘雨佳', NULL, '女', NULL, NULL, NULL, '654126199803132125', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (56, '201604202', 'e10adc3949ba59abbe56e057f20f883e', '李奕苇', NULL, '女', NULL, NULL, NULL, '510522199705193583', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (57, '201604201', 'e10adc3949ba59abbe56e057f20f883e', '李圣琳', NULL, '女', NULL, NULL, NULL, '500231199808240045', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (58, '201604200', 'e10adc3949ba59abbe56e057f20f883e', '李宏颖', NULL, '女', NULL, NULL, NULL, '341602199901018984', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (59, '201604199', 'e10adc3949ba59abbe56e057f20f883e', '赖雨佳', NULL, '女', NULL, NULL, NULL, '510108199803242423', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (60, '201604198', 'e10adc3949ba59abbe56e057f20f883e', '胡洁铃', NULL, '女', NULL, NULL, NULL, '510623199704134129', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (61, '201604196', 'e10adc3949ba59abbe56e057f20f883e', '付园', NULL, '女', NULL, NULL, NULL, '510524199605055645', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (62, '201604195', 'e10adc3949ba59abbe56e057f20f883e', '代香怡', NULL, '女', NULL, NULL, NULL, '510105199808203264', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (63, '201604194', 'e10adc3949ba59abbe56e057f20f883e', '邹磊', NULL, '男', NULL, NULL, NULL, '513336199608200016', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (64, '201604193', 'e10adc3949ba59abbe56e057f20f883e', '张文韬', NULL, '男', NULL, NULL, NULL, '510824199704025632', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (65, '201604192', 'e10adc3949ba59abbe56e057f20f883e', '银雪松', NULL, '男', NULL, NULL, NULL, '500224199806093359', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (66, '201604191', 'e10adc3949ba59abbe56e057f20f883e', '谢华', NULL, '男', NULL, NULL, NULL, '510703199608183617', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (67, '201604190', 'e10adc3949ba59abbe56e057f20f883e', '王文豪', NULL, '男', NULL, NULL, NULL, '511302199710291430', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (68, '201604189', 'e10adc3949ba59abbe56e057f20f883e', '汪健', NULL, '男', NULL, NULL, NULL, '341021199711278378', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (69, '201604187', 'e10adc3949ba59abbe56e057f20f883e', '秦成鑫', NULL, '男', NULL, NULL, NULL, '41052319970107933X', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (70, '201604186', 'e10adc3949ba59abbe56e057f20f883e', '彭绍钦', NULL, '男', NULL, NULL, NULL, '510125199808205636', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (71, '201604185', 'e10adc3949ba59abbe56e057f20f883e', '罗江南', NULL, '男', NULL, NULL, NULL, '510522199604301274', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (72, '201604182', 'e10adc3949ba59abbe56e057f20f883e', '黄麟', NULL, '男', NULL, NULL, NULL, '513722199812275211', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (73, '201604181', 'e10adc3949ba59abbe56e057f20f883e', '何虎', NULL, '男', NULL, NULL, NULL, '511381199808197632', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (74, '201604180', 'e10adc3949ba59abbe56e057f20f883e', '德宁', NULL, '男', NULL, NULL, NULL, '513228199708250015', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (75, '201604179', 'e10adc3949ba59abbe56e057f20f883e', '陈怡帆', NULL, '男', NULL, NULL, NULL, '511304199710147415', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (76, '201604178', 'e10adc3949ba59abbe56e057f20f883e', '许琪', NULL, '女', NULL, NULL, NULL, '510623199802031625', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (77, '201604177', 'e10adc3949ba59abbe56e057f20f883e', '杨雨嘉', NULL, '女', NULL, NULL, NULL, '500110199805310426', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (78, '201604176', 'e10adc3949ba59abbe56e057f20f883e', '曾佩琳', NULL, '女', NULL, NULL, NULL, '652801199706155025', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (79, '201604175', 'e10adc3949ba59abbe56e057f20f883e', '张佳鑫', NULL, '女', NULL, NULL, NULL, '511304199803091860', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (80, '201604173', 'e10adc3949ba59abbe56e057f20f883e', '周庆箐', NULL, '女', NULL, NULL, NULL, '510106199809295523', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (81, '201604172', 'e10adc3949ba59abbe56e057f20f883e', '陈伦迪', NULL, '女', NULL, NULL, NULL, '510322199804130325', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (82, '201604171', 'e10adc3949ba59abbe56e057f20f883e', '范华尹', NULL, '女', NULL, NULL, NULL, '510524199709092002', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (83, '201604170', 'e10adc3949ba59abbe56e057f20f883e', '龚悦', NULL, '女', NULL, NULL, NULL, '51112619960926522X', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (84, '201604169', 'e10adc3949ba59abbe56e057f20f883e', '胡瀚月', NULL, '女', NULL, NULL, NULL, '513001199808160227', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (85, '201604168', 'e10adc3949ba59abbe56e057f20f883e', '孔令怡', NULL, '女', NULL, NULL, NULL, '659001199804211222', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (86, '201604167', 'e10adc3949ba59abbe56e057f20f883e', '李红', NULL, '女', NULL, NULL, NULL, '513701199803100928', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (87, '201604166', 'e10adc3949ba59abbe56e057f20f883e', '李秋虹', NULL, '女', NULL, NULL, NULL, '511623199808270388', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (88, '201604165', 'e10adc3949ba59abbe56e057f20f883e', '李响', NULL, '女', NULL, NULL, NULL, '21021319980204202X', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (89, '201604164', 'e10adc3949ba59abbe56e057f20f883e', '刘相君', NULL, '女', NULL, NULL, NULL, '511302199611080726', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (90, '201604163', 'e10adc3949ba59abbe56e057f20f883e', '罗静', NULL, '女', NULL, NULL, NULL, '510421199902205529', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (91, '201604162', 'e10adc3949ba59abbe56e057f20f883e', '屈超群', NULL, '女', NULL, NULL, NULL, '513721199702215705', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (92, '201604161', 'e10adc3949ba59abbe56e057f20f883e', '宋廷兰', NULL, '女', NULL, NULL, NULL, '513222199802110942', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (93, '201604160', 'e10adc3949ba59abbe56e057f20f883e', '唐虎娇', NULL, '女', NULL, NULL, NULL, '513222199511170021', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (94, '201604158', 'e10adc3949ba59abbe56e057f20f883e', '吴嘉欣', NULL, '女', NULL, NULL, NULL, '500107199803276545', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (95, '201604157', 'e10adc3949ba59abbe56e057f20f883e', '夏齐', NULL, '女', NULL, NULL, NULL, '513822199809260022', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (96, '201604156', 'e10adc3949ba59abbe56e057f20f883e', '陈凯', NULL, '男', NULL, NULL, NULL, '500101199501197894', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (97, '201604155', 'e10adc3949ba59abbe56e057f20f883e', '代成昂', NULL, '男', NULL, NULL, NULL, '511102199805022013', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (98, '201604152', 'e10adc3949ba59abbe56e057f20f883e', '李福亮', NULL, '男', NULL, NULL, NULL, '510121199706250617', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (99, '201604151', 'e10adc3949ba59abbe56e057f20f883e', '刘淮铭', NULL, '男', NULL, NULL, NULL, '511521199812133951', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (100, '201604150', 'e10adc3949ba59abbe56e057f20f883e', '罗辉', NULL, '男', NULL, NULL, NULL, '510921199701244617', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (101, '201604149', 'e10adc3949ba59abbe56e057f20f883e', '甯煜', NULL, '男', NULL, NULL, NULL, '513723199809120899', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (102, '201604146', 'e10adc3949ba59abbe56e057f20f883e', '唐春', NULL, '男', NULL, NULL, NULL, '511324199611290078', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (103, '201604145', 'e10adc3949ba59abbe56e057f20f883e', '王辉', NULL, '男', NULL, NULL, NULL, '510623199809259016', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (104, '201604141', 'e10adc3949ba59abbe56e057f20f883e', '赵杰', NULL, '男', NULL, NULL, NULL, '510524199707063574', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (105, '201604140', 'e10adc3949ba59abbe56e057f20f883e', '周铭莉', NULL, '女', NULL, NULL, NULL, '500240199903044102', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (106, '201604139', 'e10adc3949ba59abbe56e057f20f883e', '张琼', NULL, '女', NULL, NULL, NULL, '510824199710076268', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (107, '201604138', 'e10adc3949ba59abbe56e057f20f883e', '张爱婷', NULL, '女', NULL, NULL, NULL, '513225199812061522', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (108, '201604137', 'e10adc3949ba59abbe56e057f20f883e', '曾兰', NULL, '女', NULL, NULL, NULL, '511902199805011326', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (109, '201604136', 'e10adc3949ba59abbe56e057f20f883e', '杨雪', NULL, '女', NULL, NULL, NULL, '510525199711254265', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (110, '201604134', 'e10adc3949ba59abbe56e057f20f883e', '武志敏', NULL, '女', NULL, NULL, NULL, '654301199711123524', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (111, '201604132', 'e10adc3949ba59abbe56e057f20f883e', '王鑫', NULL, '女', NULL, NULL, NULL, '513425199806035521', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (112, '201604131', 'e10adc3949ba59abbe56e057f20f883e', '谭周渝', NULL, '女', NULL, NULL, NULL, '500235199908081980', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (113, '201604130', 'e10adc3949ba59abbe56e057f20f883e', '宋诗垚', NULL, '女', NULL, NULL, NULL, '510802199806153522', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (114, '201604129', 'e10adc3949ba59abbe56e057f20f883e', '欧阳怡琪', NULL, '女', NULL, NULL, NULL, '653127199711142284', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (115, '201604128', 'e10adc3949ba59abbe56e057f20f883e', '卢青', NULL, '女', NULL, NULL, NULL, '659001199712230629', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (116, '201604127', 'e10adc3949ba59abbe56e057f20f883e', '刘妙龄', NULL, '女', NULL, NULL, NULL, '511113199610241063', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (117, '201604125', 'e10adc3949ba59abbe56e057f20f883e', '李茜娅', NULL, '女', NULL, NULL, NULL, '513824199708080025', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (118, '201604124', 'e10adc3949ba59abbe56e057f20f883e', '雷鑫梅', NULL, '女', NULL, NULL, NULL, '511124199902060044', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (119, '201604123', 'e10adc3949ba59abbe56e057f20f883e', '惠子薇', NULL, '女', NULL, NULL, NULL, '510622199711053347', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (120, '201604122', 'e10adc3949ba59abbe56e057f20f883e', '何瑶', NULL, '女', NULL, NULL, NULL, '510623199601252181', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (121, '201604120', 'e10adc3949ba59abbe56e057f20f883e', '董越', NULL, '女', NULL, NULL, NULL, '211302199803180827', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (122, '201604119', 'e10adc3949ba59abbe56e057f20f883e', '陈丽萍', NULL, '女', NULL, NULL, NULL, '511023199803203562', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (123, '201604118', 'e10adc3949ba59abbe56e057f20f883e', '章永鉴', NULL, '男', NULL, NULL, NULL, '511025199808246978', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (124, '201604117', 'e10adc3949ba59abbe56e057f20f883e', '张晗', NULL, '男', NULL, NULL, NULL, '513401199803021617', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (125, '201604114', 'e10adc3949ba59abbe56e057f20f883e', '王灿', NULL, '男', NULL, NULL, NULL, '500239199711286996', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (126, '201604113', 'e10adc3949ba59abbe56e057f20f883e', '汤鲤源', NULL, '男', NULL, NULL, NULL, '513030199809040034', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (127, '201604112', 'e10adc3949ba59abbe56e057f20f883e', '戎昊', NULL, '男', NULL, NULL, NULL, '341225199711103830', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (128, '201604111', 'e10adc3949ba59abbe56e057f20f883e', '蒲琪', NULL, '男', NULL, NULL, NULL, '513002199804073552', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (129, '201604109', 'e10adc3949ba59abbe56e057f20f883e', '罗登晏', NULL, '男', NULL, NULL, NULL, '500233199804271031', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (130, '201604108', 'e10adc3949ba59abbe56e057f20f883e', '刘光臣', NULL, '男', NULL, NULL, NULL, '500105199804120910', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (131, '201604107', 'e10adc3949ba59abbe56e057f20f883e', '李春瑶', NULL, '男', NULL, NULL, NULL, '51082419980706487X', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (132, '201604106', 'e10adc3949ba59abbe56e057f20f883e', '侯虎林', NULL, '男', NULL, NULL, NULL, '511324199801152338', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (133, '201604104', 'e10adc3949ba59abbe56e057f20f883e', '程文川', NULL, '男', NULL, NULL, NULL, '513922199806064099', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (134, '201601576', 'e10adc3949ba59abbe56e057f20f883e', '李爰佳', NULL, '男', NULL, NULL, NULL, '510812199605154492', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (135, '201601375', 'e10adc3949ba59abbe56e057f20f883e', '杜衡', NULL, '男', NULL, NULL, NULL, '532525199709220010', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (136, '201601087', 'e10adc3949ba59abbe56e057f20f883e', '郑恺迪', NULL, '女', NULL, NULL, NULL, '51150219981128226X', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (137, '201600302', 'e10adc3949ba59abbe56e057f20f883e', '蒋睿', NULL, '男', NULL, NULL, NULL, '510623199810250510', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (138, '20159039', 'e10adc3949ba59abbe56e057f20f883e', '罗冠球', NULL, '男', NULL, NULL, NULL, '511502199610111958', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (139, '20158357', 'e10adc3949ba59abbe56e057f20f883e', '黄靖凯', NULL, '男', NULL, NULL, NULL, '513321199703070016', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (140, '20140522', 'e10adc3949ba59abbe56e057f20f883e', '何继星', NULL, '男', NULL, NULL, NULL, '51078119980630057X', '信息工程学院', NULL, '信息管理与信息系统', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (141, '201604102', 'e10adc3949ba59abbe56e057f20f883e', '李雅静', NULL, '女', NULL, NULL, NULL, '130929199811056625', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (142, '201604101', 'e10adc3949ba59abbe56e057f20f883e', '牟晓宇', NULL, '女', NULL, NULL, NULL, '510129199712021328', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (143, '201604100', 'e10adc3949ba59abbe56e057f20f883e', '沈国娜', NULL, '女', NULL, NULL, NULL, '43051119980722752X', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (144, '201604099', 'e10adc3949ba59abbe56e057f20f883e', '王媛', NULL, '女', NULL, NULL, NULL, '511502199803216625', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (145, '201604098', 'e10adc3949ba59abbe56e057f20f883e', '严芮', NULL, '女', NULL, NULL, NULL, '510726199708272427', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (146, '201604097', 'e10adc3949ba59abbe56e057f20f883e', '曾小静', NULL, '女', NULL, NULL, NULL, '500230199712050769', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (147, '201604096', 'e10adc3949ba59abbe56e057f20f883e', '张雨秋', NULL, '女', NULL, NULL, NULL, '51032219980617812X', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (148, '201604095', 'e10adc3949ba59abbe56e057f20f883e', '古丹妍', NULL, '女', NULL, NULL, NULL, '510322199808310323', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (149, '201604094', 'e10adc3949ba59abbe56e057f20f883e', '黄萱', NULL, '女', NULL, NULL, NULL, '510704199806080025', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (150, '201604093', 'e10adc3949ba59abbe56e057f20f883e', '丁湲珺', NULL, '女', NULL, NULL, NULL, '350823199809080025', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (151, '201604092', 'e10adc3949ba59abbe56e057f20f883e', '曹连东', NULL, '男', NULL, NULL, NULL, '510121199802031772', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (152, '201604091', 'e10adc3949ba59abbe56e057f20f883e', '陈宇', NULL, '男', NULL, NULL, NULL, '513723199805110036', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (153, '201604090', 'e10adc3949ba59abbe56e057f20f883e', '邓小桂', NULL, '男', NULL, NULL, NULL, '510823199706245499', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (154, '201604089', 'e10adc3949ba59abbe56e057f20f883e', '范宇豪', NULL, '男', NULL, NULL, NULL, '330522199710120211', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (155, '201604088', 'e10adc3949ba59abbe56e057f20f883e', '龚宇', NULL, '男', NULL, NULL, NULL, '510902199807098495', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (156, '201604087', 'e10adc3949ba59abbe56e057f20f883e', '何金成', NULL, '男', NULL, NULL, NULL, '511322199902134734', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (157, '201604086', 'e10adc3949ba59abbe56e057f20f883e', '黄超', NULL, '男', NULL, NULL, NULL, '500236199704181732', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (158, '201604085', 'e10adc3949ba59abbe56e057f20f883e', '黄睿', NULL, '男', NULL, NULL, NULL, '431122199807220019', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (159, '201604083', 'e10adc3949ba59abbe56e057f20f883e', '李德峰', NULL, '男', NULL, NULL, NULL, '510112199808101536', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (160, '201604082', 'e10adc3949ba59abbe56e057f20f883e', '李帅帅', NULL, '男', NULL, NULL, NULL, '412726199710017132', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (161, '201604081', 'e10adc3949ba59abbe56e057f20f883e', '林超', NULL, '男', NULL, NULL, NULL, '51032219960823205X', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (162, '201604080', 'e10adc3949ba59abbe56e057f20f883e', '吕海生', NULL, '男', NULL, NULL, NULL, '51010419971120167X', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (163, '201604079', 'e10adc3949ba59abbe56e057f20f883e', '毛骞', NULL, '男', NULL, NULL, NULL, '510132199804040639', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (164, '201604078', 'e10adc3949ba59abbe56e057f20f883e', '乔逸天', NULL, '男', NULL, NULL, NULL, '510124199903130410', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (165, '201604077', 'e10adc3949ba59abbe56e057f20f883e', '冉兴', NULL, '男', NULL, NULL, NULL, '500243199711215359', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (166, '201604076', 'e10adc3949ba59abbe56e057f20f883e', '斯毅', NULL, '男', NULL, NULL, NULL, '510521199803171875', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (167, '201604075', 'e10adc3949ba59abbe56e057f20f883e', '谭雪峰', NULL, '男', NULL, NULL, NULL, '511602199608225492', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (168, '201604074', 'e10adc3949ba59abbe56e057f20f883e', '田宇航', NULL, '男', NULL, NULL, NULL, '510181199805043310', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (169, '201604073', 'e10adc3949ba59abbe56e057f20f883e', '王栏淋', NULL, '男', NULL, NULL, NULL, '510522199801030055', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (170, '201604072', 'e10adc3949ba59abbe56e057f20f883e', '王作文', NULL, '男', NULL, NULL, NULL, '510125199712223813', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (171, '201604071', 'e10adc3949ba59abbe56e057f20f883e', '吴杰', NULL, '男', NULL, NULL, NULL, '513821199703188310', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (172, '201604070', 'e10adc3949ba59abbe56e057f20f883e', '徐嘉豪', NULL, '男', NULL, NULL, NULL, '510622199612276916', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (173, '201604069', 'e10adc3949ba59abbe56e057f20f883e', '杨韬', NULL, '男', NULL, NULL, NULL, '520202199611057919', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (174, '201604068', 'e10adc3949ba59abbe56e057f20f883e', '余尚义', NULL, '男', NULL, NULL, NULL, '510812199612162351', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (175, '201604067', 'e10adc3949ba59abbe56e057f20f883e', '曾诚浩', NULL, '男', NULL, NULL, NULL, '530112199806031638', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (176, '201604066', 'e10adc3949ba59abbe56e057f20f883e', '张文基', NULL, '男', NULL, NULL, NULL, '510124199807153217', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (177, '201604065', 'e10adc3949ba59abbe56e057f20f883e', '郑仕国', NULL, '男', NULL, NULL, NULL, '511621199708292077', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (178, '201604063', 'e10adc3949ba59abbe56e057f20f883e', '周宽', NULL, '男', NULL, NULL, NULL, '510322199709058433', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (179, '201604062', 'e10adc3949ba59abbe56e057f20f883e', '邹妮玲', NULL, '女', NULL, NULL, NULL, '513821199801127669', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (180, '201604061', 'e10adc3949ba59abbe56e057f20f883e', '张羽', NULL, '女', NULL, NULL, NULL, '522321199810191623', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (181, '201604060', 'e10adc3949ba59abbe56e057f20f883e', '喻娟', NULL, '女', NULL, NULL, NULL, '513701199810106121', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (182, '201604059', 'e10adc3949ba59abbe56e057f20f883e', '向紫薇', NULL, '女', NULL, NULL, NULL, '510922199804040023', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (183, '201604057', 'e10adc3949ba59abbe56e057f20f883e', '饶晓洁', NULL, '女', NULL, NULL, NULL, '654125199712140529', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (184, '201604056', 'e10adc3949ba59abbe56e057f20f883e', '罗梦婷', NULL, '女', NULL, NULL, NULL, '511502199703301283', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (185, '201604055', 'e10adc3949ba59abbe56e057f20f883e', '李思璇', NULL, '女', NULL, NULL, NULL, '330204199805116021', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (186, '201604054', 'e10adc3949ba59abbe56e057f20f883e', '黄瑞', NULL, '女', NULL, NULL, NULL, '510682199902135042', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (187, '201604053', 'e10adc3949ba59abbe56e057f20f883e', '傅小庭', NULL, '女', NULL, NULL, NULL, '510124199808130420', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (188, '201604052', 'e10adc3949ba59abbe56e057f20f883e', '崔晓旭', NULL, '女', NULL, NULL, NULL, '340403199801252823', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (189, '201604051', 'e10adc3949ba59abbe56e057f20f883e', '黄鑫', NULL, '男', NULL, NULL, NULL, '511028199709248213', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (190, '201604050', 'e10adc3949ba59abbe56e057f20f883e', '黄佩勋', NULL, '男', NULL, NULL, NULL, '500382199810014130', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (191, '201604049', 'e10adc3949ba59abbe56e057f20f883e', '华淙', NULL, '男', NULL, NULL, NULL, '421126199808273810', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (192, '201604048', 'e10adc3949ba59abbe56e057f20f883e', '郭亚涵', NULL, '男', NULL, NULL, NULL, '130434199605150390', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (193, '201604047', 'e10adc3949ba59abbe56e057f20f883e', '高慰君', NULL, '男', NULL, NULL, NULL, '51132419970811365X', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (194, '201604046', 'e10adc3949ba59abbe56e057f20f883e', '段京辰', NULL, '男', NULL, NULL, NULL, '511621199901098356', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (195, '201604045', 'e10adc3949ba59abbe56e057f20f883e', '陈志强', NULL, '男', NULL, NULL, NULL, '510521199708091439', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (196, '201604044', 'e10adc3949ba59abbe56e057f20f883e', '陈世航', NULL, '男', NULL, NULL, NULL, '511623199510182991', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (197, '201604043', 'e10adc3949ba59abbe56e057f20f883e', '曹栋文', NULL, '男', NULL, NULL, NULL, '513701199708107216', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (198, '201604042', 'e10adc3949ba59abbe56e057f20f883e', '于水', NULL, '男', NULL, NULL, NULL, '500235199801087514', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (199, '201604041', 'e10adc3949ba59abbe56e057f20f883e', '杨澍', NULL, '男', NULL, NULL, NULL, '511525199808075053', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (200, '201604040', 'e10adc3949ba59abbe56e057f20f883e', '武鹏', NULL, '男', NULL, NULL, NULL, '510704199612214611', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (201, '201604039', 'e10adc3949ba59abbe56e057f20f883e', '文威', NULL, '男', NULL, NULL, NULL, '430221199811163510', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (202, '201604038', 'e10adc3949ba59abbe56e057f20f883e', '王亿璠', NULL, '男', NULL, NULL, NULL, '410882199810158017', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (203, '201604037', 'e10adc3949ba59abbe56e057f20f883e', '王杰', NULL, '男', NULL, NULL, NULL, '511112199712020919', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (204, '201604036', 'e10adc3949ba59abbe56e057f20f883e', '陶望曦', NULL, '男', NULL, NULL, NULL, '513823199808120016', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (205, '201604035', 'e10adc3949ba59abbe56e057f20f883e', '谭磊', NULL, '男', NULL, NULL, NULL, '51370119971223615X', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (206, '201604034', 'e10adc3949ba59abbe56e057f20f883e', '申志伟', NULL, '男', NULL, NULL, NULL, '632824199712120110', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (207, '201604033', 'e10adc3949ba59abbe56e057f20f883e', '邱子睿', NULL, '男', NULL, NULL, NULL, '330302199802142817', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (208, '201604032', 'e10adc3949ba59abbe56e057f20f883e', '漆巧', NULL, '男', NULL, NULL, NULL, '510923199803292735', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (209, '201604031', 'e10adc3949ba59abbe56e057f20f883e', '毛海林', NULL, '男', NULL, NULL, NULL, '510311199802181015', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (210, '201604030', 'e10adc3949ba59abbe56e057f20f883e', '卢佳春晓', NULL, '男', NULL, NULL, NULL, '510125199801144113', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (211, '201604029', 'e10adc3949ba59abbe56e057f20f883e', '梁浚哲', NULL, '男', NULL, NULL, NULL, '460006199704010018', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (212, '201604028', 'e10adc3949ba59abbe56e057f20f883e', '李林', NULL, '男', NULL, NULL, NULL, '513022199703082316', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (213, '201604027', 'e10adc3949ba59abbe56e057f20f883e', '竭志昊', NULL, '男', NULL, NULL, NULL, '130324199712100016', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (214, '201604026', 'e10adc3949ba59abbe56e057f20f883e', '钟铭森', NULL, '男', NULL, NULL, NULL, '510724199710065213', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (215, '201604025', 'e10adc3949ba59abbe56e057f20f883e', '张云瑞', NULL, '男', NULL, NULL, NULL, '50024319980403475X', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (216, '201604024', 'e10adc3949ba59abbe56e057f20f883e', '张松', NULL, '男', NULL, NULL, NULL, '500227199709042815', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (217, '201604023', 'e10adc3949ba59abbe56e057f20f883e', '岳天宇', NULL, '男', NULL, NULL, NULL, '513701199803140815', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (218, '201604022', 'e10adc3949ba59abbe56e057f20f883e', '周浩', NULL, '男', NULL, NULL, NULL, '511902200008030036', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (219, '201604021', 'e10adc3949ba59abbe56e057f20f883e', '李林芸', NULL, '女', NULL, NULL, NULL, '513721199809252303', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (220, '201604020', 'e10adc3949ba59abbe56e057f20f883e', '鲁芸露', NULL, '女', NULL, NULL, NULL, '511023199810293260', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (221, '201604018', 'e10adc3949ba59abbe56e057f20f883e', '王淑楠', NULL, '女', NULL, NULL, NULL, '372929199711021544', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (222, '201604017', 'e10adc3949ba59abbe56e057f20f883e', '吴燕梅', NULL, '女', NULL, NULL, NULL, '510321199711186323', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (223, '201604016', 'e10adc3949ba59abbe56e057f20f883e', '杨丹瑞', NULL, '女', NULL, NULL, NULL, '510802199811065420', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (224, '201604015', 'e10adc3949ba59abbe56e057f20f883e', '张宇宁', NULL, '女', NULL, NULL, NULL, '510522199802220264', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (225, '201604014', 'e10adc3949ba59abbe56e057f20f883e', '钟文玥希', NULL, '女', NULL, NULL, NULL, '510681199805030322', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (226, '201604013', 'e10adc3949ba59abbe56e057f20f883e', '冯娅楠', NULL, '女', NULL, NULL, NULL, '632824199707070024', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (227, '201604012', 'e10adc3949ba59abbe56e057f20f883e', '黄蓉', NULL, '女', NULL, NULL, NULL, '500235199803035603', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (228, '201604011', 'e10adc3949ba59abbe56e057f20f883e', '蔡华庆', NULL, '男', NULL, NULL, NULL, '350581199709023012', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (229, '201604010', 'e10adc3949ba59abbe56e057f20f883e', '陈浩', NULL, '男', NULL, NULL, NULL, '513023199711120219', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (230, '201604009', 'e10adc3949ba59abbe56e057f20f883e', '陈云豪', NULL, '男', NULL, NULL, NULL, '412726199603164938', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (231, '201604008', 'e10adc3949ba59abbe56e057f20f883e', '丁仕涛', NULL, '男', NULL, NULL, NULL, '500236199802111551', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (232, '201604007', 'e10adc3949ba59abbe56e057f20f883e', '付金明', NULL, '男', NULL, NULL, NULL, '350821199606010411', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (233, '201604005', 'e10adc3949ba59abbe56e057f20f883e', '胡济成', NULL, '男', NULL, NULL, NULL, '510821199802261111', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (234, '201604004', 'e10adc3949ba59abbe56e057f20f883e', '黄俊淞', NULL, '男', NULL, NULL, NULL, '51150219980811031X', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (235, '201604003', 'e10adc3949ba59abbe56e057f20f883e', '黄潇', NULL, '男', NULL, NULL, NULL, '510626199805274058', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (236, '201604002', 'e10adc3949ba59abbe56e057f20f883e', '揭洋', NULL, '男', NULL, NULL, NULL, '340881199807131214', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (237, '201604001', 'e10adc3949ba59abbe56e057f20f883e', '李何平', NULL, '男', NULL, NULL, NULL, '513723199702128970', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (238, '201604000', 'e10adc3949ba59abbe56e057f20f883e', '李懿恒', NULL, '男', NULL, NULL, NULL, '510522199807230250', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (239, '201603999', 'e10adc3949ba59abbe56e057f20f883e', '刘洵', NULL, '男', NULL, NULL, NULL, '510402199904123018', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (240, '201603998', 'e10adc3949ba59abbe56e057f20f883e', '罗志垚', NULL, '男', NULL, NULL, NULL, '510802199712121714', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (241, '201603997', 'e10adc3949ba59abbe56e057f20f883e', '彭晓祥', NULL, '男', NULL, NULL, NULL, '511502199808256810', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (242, '201603996', 'e10adc3949ba59abbe56e057f20f883e', '邱依呷', NULL, '男', NULL, NULL, NULL, '513433199610290010', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (243, '201603995', 'e10adc3949ba59abbe56e057f20f883e', '尚志', NULL, '男', NULL, NULL, NULL, '340123199807213314', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (244, '201603994', 'e10adc3949ba59abbe56e057f20f883e', '覃铃杰', NULL, '男', NULL, NULL, NULL, '511304199612024614', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (245, '201603993', 'e10adc3949ba59abbe56e057f20f883e', '唐琦伟', NULL, '男', NULL, NULL, NULL, '510302199801102016', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (246, '201603992', 'e10adc3949ba59abbe56e057f20f883e', '汪维煊', NULL, '男', NULL, NULL, NULL, '500101199810120612', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (247, '201603991', 'e10adc3949ba59abbe56e057f20f883e', '王晓晴', NULL, '男', NULL, NULL, NULL, '513723199703290259', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (248, '201603990', 'e10adc3949ba59abbe56e057f20f883e', '文俊', NULL, '男', NULL, NULL, NULL, '510824199806170013', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (249, '201603989', 'e10adc3949ba59abbe56e057f20f883e', '吴威', NULL, '男', NULL, NULL, NULL, '51010719970724297X', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (250, '201603988', 'e10adc3949ba59abbe56e057f20f883e', '严海峰', NULL, '男', NULL, NULL, NULL, '510421199701010012', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (251, '201603987', 'e10adc3949ba59abbe56e057f20f883e', '叶鹏', NULL, '男', NULL, NULL, NULL, '511025199705294950', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (252, '201603986', 'e10adc3949ba59abbe56e057f20f883e', '袁福森', NULL, '男', NULL, NULL, NULL, '511324199807080291', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (253, '201603985', 'e10adc3949ba59abbe56e057f20f883e', '张进', NULL, '男', NULL, NULL, NULL, '513701199809037413', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (254, '201603984', 'e10adc3949ba59abbe56e057f20f883e', '张玉梁', NULL, '男', NULL, NULL, NULL, '513001199802221615', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (255, '201603983', 'e10adc3949ba59abbe56e057f20f883e', '钟刚锐', NULL, '男', NULL, NULL, NULL, '510682199710142790', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (256, '201603982', 'e10adc3949ba59abbe56e057f20f883e', '周成龙', NULL, '男', NULL, NULL, NULL, '510522199810287290', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (257, '201603981', 'e10adc3949ba59abbe56e057f20f883e', '周正华', NULL, '男', NULL, NULL, NULL, '500234199402103218', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (258, '201603980', 'e10adc3949ba59abbe56e057f20f883e', '钟世莲', NULL, '女', NULL, NULL, NULL, '469006199706169821', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (259, '201603979', 'e10adc3949ba59abbe56e057f20f883e', '张艳秋', NULL, '女', NULL, NULL, NULL, '500112199707231129', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (260, '201603978', 'e10adc3949ba59abbe56e057f20f883e', '杨昌艳', NULL, '女', NULL, NULL, NULL, '533222199812215821', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (261, '201603977', 'e10adc3949ba59abbe56e057f20f883e', '王甄', NULL, '女', NULL, NULL, NULL, '652201199805034525', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (262, '201603976', 'e10adc3949ba59abbe56e057f20f883e', '汪悦', NULL, '女', NULL, NULL, NULL, '510822199812040028', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (263, '201603974', 'e10adc3949ba59abbe56e057f20f883e', '龙春艳', NULL, '女', NULL, NULL, NULL, '513701199701051221', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (264, '201603973', 'e10adc3949ba59abbe56e057f20f883e', '李惠', NULL, '女', NULL, NULL, NULL, '511322199801106320', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (265, '201603971', 'e10adc3949ba59abbe56e057f20f883e', '冯雪璐', NULL, '女', NULL, NULL, NULL, '511002199810202523', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (266, '201603970', 'e10adc3949ba59abbe56e057f20f883e', '周天保', NULL, '男', NULL, NULL, NULL, '513723199709144930', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (267, '201603969', 'e10adc3949ba59abbe56e057f20f883e', '钟云飞', NULL, '男', NULL, NULL, NULL, '510322199810043471', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (268, '201603968', 'e10adc3949ba59abbe56e057f20f883e', '钟诚', NULL, '男', NULL, NULL, NULL, '510107199806140872', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (269, '201603966', 'e10adc3949ba59abbe56e057f20f883e', '张成武', NULL, '男', NULL, NULL, NULL, '341126199905171816', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (270, '201603965', 'e10adc3949ba59abbe56e057f20f883e', '余卓炫', NULL, '男', NULL, NULL, NULL, '510302199805092011', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (271, '201603964', 'e10adc3949ba59abbe56e057f20f883e', '叶航宇', NULL, '男', NULL, NULL, NULL, '510625199711052378', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (272, '201603963', 'e10adc3949ba59abbe56e057f20f883e', '闫泰宇', NULL, '男', NULL, NULL, NULL, '420503199805041818', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (273, '201603962', 'e10adc3949ba59abbe56e057f20f883e', '吴俊杉', NULL, '男', NULL, NULL, NULL, '510681199606295512', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (274, '201603961', 'e10adc3949ba59abbe56e057f20f883e', '魏宇帆', NULL, '男', NULL, NULL, NULL, '511524199812310611', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (275, '201603960', 'e10adc3949ba59abbe56e057f20f883e', '王明亮', NULL, '男', NULL, NULL, NULL, '410521199711152518', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (276, '201603959', 'e10adc3949ba59abbe56e057f20f883e', '田智', NULL, '男', NULL, NULL, NULL, '513701199811125818', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (277, '201603957', 'e10adc3949ba59abbe56e057f20f883e', '宋艺凯', NULL, '男', NULL, NULL, NULL, '142301199806164116', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (278, '201603956', 'e10adc3949ba59abbe56e057f20f883e', '任昱翔', NULL, '男', NULL, NULL, NULL, '530402199711202813', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (279, '201603955', 'e10adc3949ba59abbe56e057f20f883e', '邱海洋', NULL, '男', NULL, NULL, NULL, '510402199803313816', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (280, '201603954', 'e10adc3949ba59abbe56e057f20f883e', '潘海燕', NULL, '男', NULL, NULL, NULL, '500384199811256417', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (281, '201603953', 'e10adc3949ba59abbe56e057f20f883e', '罗承天', NULL, '男', NULL, NULL, NULL, '511923199903066816', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (282, '201603952', 'e10adc3949ba59abbe56e057f20f883e', '刘斌', NULL, '男', NULL, NULL, NULL, '511502199812148871', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (283, '201603951', 'e10adc3949ba59abbe56e057f20f883e', '李天峰', NULL, '男', NULL, NULL, NULL, '510822199712053219', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (284, '201603950', 'e10adc3949ba59abbe56e057f20f883e', '李国正', NULL, '男', NULL, NULL, NULL, '371329199709256033', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (285, '201603949', 'e10adc3949ba59abbe56e057f20f883e', '贾屹林', NULL, '男', NULL, NULL, NULL, '510725199710010032', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (286, '201603948', 'e10adc3949ba59abbe56e057f20f883e', '黄伟康', NULL, '男', NULL, NULL, NULL, '511002199904161216', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (287, '201603947', 'e10adc3949ba59abbe56e057f20f883e', '黄建雄', NULL, '男', NULL, NULL, NULL, '500230199608207519', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (288, '201603946', 'e10adc3949ba59abbe56e057f20f883e', '何霖超', NULL, '男', NULL, NULL, NULL, '510602199802077816', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (289, '201603945', 'e10adc3949ba59abbe56e057f20f883e', '苟桂铭', NULL, '男', NULL, NULL, NULL, '513101199810110312', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (290, '201603944', 'e10adc3949ba59abbe56e057f20f883e', '冯霖钊', NULL, '男', NULL, NULL, NULL, '330782199806106614', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (291, '201603943', 'e10adc3949ba59abbe56e057f20f883e', '丁佳恒', NULL, '男', NULL, NULL, NULL, '510108199805110918', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (292, '201603942', 'e10adc3949ba59abbe56e057f20f883e', '陈雨', NULL, '男', NULL, NULL, NULL, '511304199901303011', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (293, '201603941', 'e10adc3949ba59abbe56e057f20f883e', '常祖昊', NULL, '男', NULL, NULL, NULL, '630105199803042016', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (294, '201603239', 'e10adc3949ba59abbe56e057f20f883e', '包随静', NULL, '男', NULL, NULL, NULL, '511623199710186495', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (295, '20158796', 'e10adc3949ba59abbe56e057f20f883e', '丁禹铭', NULL, '男', NULL, NULL, NULL, '51112319960523147X', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (296, '20140375', 'e10adc3949ba59abbe56e057f20f883e', '王丁子瑞', NULL, '男', NULL, NULL, NULL, '511002199603250012', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (297, '20140313', 'e10adc3949ba59abbe56e057f20f883e', '程煜', NULL, '男', NULL, NULL, NULL, '630121199501127110', '信息工程学院', NULL, '物联网工程', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (298, '201603939', 'e10adc3949ba59abbe56e057f20f883e', '吴艳', NULL, '女', NULL, NULL, NULL, '511521200001104183', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (299, '201603938', 'e10adc3949ba59abbe56e057f20f883e', '熊小菲', NULL, '女', NULL, NULL, NULL, '51312419930610038X', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (300, '201603937', 'e10adc3949ba59abbe56e057f20f883e', '喻华平', NULL, '女', NULL, NULL, NULL, '510322199803246764', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (301, '201603936', 'e10adc3949ba59abbe56e057f20f883e', '张芳', NULL, '女', NULL, NULL, NULL, '510322199701091765', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (302, '201603935', 'e10adc3949ba59abbe56e057f20f883e', '张友艳', NULL, '女', NULL, NULL, NULL, '511526199704201920', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (303, '201603934', 'e10adc3949ba59abbe56e057f20f883e', '郑小静', NULL, '女', NULL, NULL, NULL, '513721199802151905', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (304, '201603933', 'e10adc3949ba59abbe56e057f20f883e', '朱旭兰', NULL, '女', NULL, NULL, NULL, '510322199711057704', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (305, '201603932', 'e10adc3949ba59abbe56e057f20f883e', '贺小英', NULL, '女', NULL, NULL, NULL, '510522199609015947', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (306, '201603931', 'e10adc3949ba59abbe56e057f20f883e', '蒋懿', NULL, '女', NULL, NULL, NULL, '511521199906095706', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (307, '201603930', 'e10adc3949ba59abbe56e057f20f883e', '刘慧娟', NULL, '女', NULL, NULL, NULL, '510623199901118427', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (308, '201603929', 'e10adc3949ba59abbe56e057f20f883e', '刘琼', NULL, '女', NULL, NULL, NULL, '511502199711024546', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (309, '201603928', 'e10adc3949ba59abbe56e057f20f883e', '罗小玲', NULL, '女', NULL, NULL, NULL, '511521199706166645', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (310, '201603927', 'e10adc3949ba59abbe56e057f20f883e', '任晓', NULL, '女', NULL, NULL, NULL, '510922199708141123', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (311, '201603926', 'e10adc3949ba59abbe56e057f20f883e', '唐玲俐', NULL, '女', NULL, NULL, NULL, '51032219971217382X', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (312, '201603925', 'e10adc3949ba59abbe56e057f20f883e', '王恩梅', NULL, '女', NULL, NULL, NULL, '510522199712194680', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (313, '201603924', 'e10adc3949ba59abbe56e057f20f883e', '封涵', NULL, '女', NULL, NULL, NULL, '513824199811010025', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (314, '201603923', 'e10adc3949ba59abbe56e057f20f883e', '郭磊', NULL, '女', NULL, NULL, NULL, '510525199712105608', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (315, '201603922', 'e10adc3949ba59abbe56e057f20f883e', '代娟', NULL, '女', NULL, NULL, NULL, '510322199809204725', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (316, '201603921', 'e10adc3949ba59abbe56e057f20f883e', '陈启翔', NULL, '男', NULL, NULL, NULL, '513101199608303612', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (317, '201603919', 'e10adc3949ba59abbe56e057f20f883e', '邓宗旭', NULL, '男', NULL, NULL, NULL, '510311199807281031', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (318, '201603918', 'e10adc3949ba59abbe56e057f20f883e', '郭宇', NULL, '男', NULL, NULL, NULL, '510322199705075316', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (319, '201603916', 'e10adc3949ba59abbe56e057f20f883e', '王林', NULL, '男', NULL, NULL, NULL, '51078119980829453X', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (320, '201603915', 'e10adc3949ba59abbe56e057f20f883e', '衡浩', NULL, '男', NULL, NULL, NULL, '510821199511086819', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (321, '201603914', 'e10adc3949ba59abbe56e057f20f883e', '黄鑫华', NULL, '男', NULL, NULL, NULL, '510902199804112634', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (322, '201603913', 'e10adc3949ba59abbe56e057f20f883e', '李俊', NULL, '男', NULL, NULL, NULL, '513922199807297054', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (323, '201603912', 'e10adc3949ba59abbe56e057f20f883e', '李运江', NULL, '男', NULL, NULL, NULL, '511526199707221919', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (324, '201603911', 'e10adc3949ba59abbe56e057f20f883e', '刘恒', NULL, '男', NULL, NULL, NULL, '51032219980213471X', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (325, '201603910', 'e10adc3949ba59abbe56e057f20f883e', '龙川', NULL, '男', NULL, NULL, NULL, '511526199609295615', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (326, '201603909', 'e10adc3949ba59abbe56e057f20f883e', '罗洲杰', NULL, '男', NULL, NULL, NULL, '511521199802263058', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (327, '201603908', 'e10adc3949ba59abbe56e057f20f883e', '石磊', NULL, '男', NULL, NULL, NULL, '510522199809286936', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (328, '201603907', 'e10adc3949ba59abbe56e057f20f883e', '吴柏辛', NULL, '男', NULL, NULL, NULL, '511621199802240054', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (329, '201603906', 'e10adc3949ba59abbe56e057f20f883e', '谢虹宇', NULL, '男', NULL, NULL, NULL, '513125199611303016', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (330, '201603905', 'e10adc3949ba59abbe56e057f20f883e', '许攀', NULL, '男', NULL, NULL, NULL, '510902199702095394', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (331, '201603904', 'e10adc3949ba59abbe56e057f20f883e', '印超', NULL, '男', NULL, NULL, NULL, '510322199508141273', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (332, '201603903', 'e10adc3949ba59abbe56e057f20f883e', '张家棋', NULL, '男', NULL, NULL, NULL, '510322199805288597', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (333, '201603902', 'e10adc3949ba59abbe56e057f20f883e', '周川江', NULL, '男', NULL, NULL, NULL, '330501199605245133', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (334, '201603901', 'e10adc3949ba59abbe56e057f20f883e', '朱若菲', NULL, '女', NULL, NULL, NULL, '510303199712250021', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (335, '201603900', 'e10adc3949ba59abbe56e057f20f883e', '赵琴', NULL, '女', NULL, NULL, NULL, '510902199609198321', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (336, '201603899', 'e10adc3949ba59abbe56e057f20f883e', '张祥梅', NULL, '女', NULL, NULL, NULL, '510322199504268744', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (337, '201603898', 'e10adc3949ba59abbe56e057f20f883e', '张安莉', NULL, '女', NULL, NULL, NULL, '511521199706153502', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (338, '201603896', 'e10adc3949ba59abbe56e057f20f883e', '谢婉芸', NULL, '女', NULL, NULL, NULL, '510106199802215527', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (339, '201603895', 'e10adc3949ba59abbe56e057f20f883e', '吴诗瑜', NULL, '女', NULL, NULL, NULL, '510125199803186325', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (340, '201603894', 'e10adc3949ba59abbe56e057f20f883e', '田育苗', NULL, '女', NULL, NULL, NULL, '510322199607107847', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (341, '201603892', 'e10adc3949ba59abbe56e057f20f883e', '彭雪薇', NULL, '女', NULL, NULL, NULL, '511502199705063960', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (342, '201603891', 'e10adc3949ba59abbe56e057f20f883e', '罗飞燕', NULL, '女', NULL, NULL, NULL, '510322199602196545', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (343, '201603890', 'e10adc3949ba59abbe56e057f20f883e', '刘巧玲', NULL, '女', NULL, NULL, NULL, '51090219980710850X', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (344, '201603889', 'e10adc3949ba59abbe56e057f20f883e', '廖康妹', NULL, '女', NULL, NULL, NULL, '511526199809031921', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (345, '201603888', 'e10adc3949ba59abbe56e057f20f883e', '黄纯洁', NULL, '女', NULL, NULL, NULL, '510322199805010421', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (346, '201603887', 'e10adc3949ba59abbe56e057f20f883e', '何金萍', NULL, '女', NULL, NULL, NULL, '511321199802101728', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (347, '201603886', 'e10adc3949ba59abbe56e057f20f883e', '龚芬芳', NULL, '女', NULL, NULL, NULL, '513722199812013588', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (348, '201603885', 'e10adc3949ba59abbe56e057f20f883e', '范贤敏', NULL, '女', NULL, NULL, NULL, '511521199601126663', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (349, '201603884', 'e10adc3949ba59abbe56e057f20f883e', '陈巧', NULL, '女', NULL, NULL, NULL, '510902199811182403', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (350, '201603883', 'e10adc3949ba59abbe56e057f20f883e', '蒲志权', NULL, '男', NULL, NULL, NULL, '511521199602289456', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (351, '201603882', 'e10adc3949ba59abbe56e057f20f883e', '罗炜', NULL, '男', NULL, NULL, NULL, '510322199712072017', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (352, '201603881', 'e10adc3949ba59abbe56e057f20f883e', '刘鑫', NULL, '男', NULL, NULL, NULL, '510125199703041815', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (353, '201603880', 'e10adc3949ba59abbe56e057f20f883e', '刘春浪', NULL, '男', NULL, NULL, NULL, '510525199602031134', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (354, '201603879', 'e10adc3949ba59abbe56e057f20f883e', '李世坤', NULL, '男', NULL, NULL, NULL, '51090319990419811X', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (355, '201603878', 'e10adc3949ba59abbe56e057f20f883e', '李鸿睿', NULL, '男', NULL, NULL, NULL, '510902199702249015', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (356, '201603877', 'e10adc3949ba59abbe56e057f20f883e', '黄涛', NULL, '男', NULL, NULL, NULL, '511523199712301738', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (357, '201603876', 'e10adc3949ba59abbe56e057f20f883e', '何治超', NULL, '男', NULL, NULL, NULL, '510823199703264715', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (358, '201603875', 'e10adc3949ba59abbe56e057f20f883e', '王金江', NULL, '男', NULL, NULL, NULL, '510902199811240458', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (359, '201603874', 'e10adc3949ba59abbe56e057f20f883e', '谭一鸣', NULL, '男', NULL, NULL, NULL, '510322199605200036', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (360, '201603873', 'e10adc3949ba59abbe56e057f20f883e', '郭腾', NULL, '男', NULL, NULL, NULL, '511526199601205611', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (361, '201603872', 'e10adc3949ba59abbe56e057f20f883e', '邓兴俗', NULL, '男', NULL, NULL, NULL, '511502199809095174', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (362, '201603871', 'e10adc3949ba59abbe56e057f20f883e', '曹洪武', NULL, '男', NULL, NULL, NULL, '51090219971127399X', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (363, '201603870', 'e10adc3949ba59abbe56e057f20f883e', '陈攀宇', NULL, '男', NULL, NULL, NULL, '511321199809170312', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (364, '201603869', 'e10adc3949ba59abbe56e057f20f883e', '王学波', NULL, '男', NULL, NULL, NULL, '510184199708276074', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (365, '201603868', 'e10adc3949ba59abbe56e057f20f883e', '曾祖根', NULL, '男', NULL, NULL, NULL, '511521199804302313', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (366, '201603867', 'e10adc3949ba59abbe56e057f20f883e', '叶永童', NULL, '男', NULL, NULL, NULL, '510125199802133811', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (367, '201603866', 'e10adc3949ba59abbe56e057f20f883e', '徐文', NULL, '男', NULL, NULL, NULL, '510923199807077813', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (368, '201603865', 'e10adc3949ba59abbe56e057f20f883e', '先开鑫', NULL, '男', NULL, NULL, NULL, '511528199707160039', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (369, '201603864', 'e10adc3949ba59abbe56e057f20f883e', '郑永建', NULL, '男', NULL, NULL, NULL, '510311199702183910', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (370, '201603863', 'e10adc3949ba59abbe56e057f20f883e', '吴茂莎', NULL, '女', NULL, NULL, NULL, '510525199811084363', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (371, '201603862', 'e10adc3949ba59abbe56e057f20f883e', '肖祥曦', NULL, '女', NULL, NULL, NULL, '510322199710180428', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (372, '201603861', 'e10adc3949ba59abbe56e057f20f883e', '姚凤英', NULL, '女', NULL, NULL, NULL, '511622199206122541', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (373, '201603860', 'e10adc3949ba59abbe56e057f20f883e', '曾艳', NULL, '女', NULL, NULL, NULL, '510322199705155500', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (374, '201603859', 'e10adc3949ba59abbe56e057f20f883e', '张婷', NULL, '女', NULL, NULL, NULL, '51162219971023282X', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (375, '201603858', 'e10adc3949ba59abbe56e057f20f883e', '赵会敏', NULL, '女', NULL, NULL, NULL, '510525199706014363', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (376, '201603857', 'e10adc3949ba59abbe56e057f20f883e', '周萍', NULL, '女', NULL, NULL, NULL, '510781199807213005', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (377, '201603856', 'e10adc3949ba59abbe56e057f20f883e', '何佳佳', NULL, '女', NULL, NULL, NULL, '510522199810068602', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (378, '201603855', 'e10adc3949ba59abbe56e057f20f883e', '胡晓霞', NULL, '女', NULL, NULL, NULL, '51032219980204874X', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (379, '201603854', 'e10adc3949ba59abbe56e057f20f883e', '李玲', NULL, '女', NULL, NULL, NULL, '510311199711193926', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (380, '201603853', 'e10adc3949ba59abbe56e057f20f883e', '刘美兰', NULL, '女', NULL, NULL, NULL, '510525199802048862', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (381, '201603852', 'e10adc3949ba59abbe56e057f20f883e', '刘雪婷', NULL, '女', NULL, NULL, NULL, '511323199802186584', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (382, '201603851', 'e10adc3949ba59abbe56e057f20f883e', '彭信祯', NULL, '女', NULL, NULL, NULL, '510322199710105241', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (383, '201603850', 'e10adc3949ba59abbe56e057f20f883e', '宋莉', NULL, '女', NULL, NULL, NULL, '510322199801027824', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (384, '201603849', 'e10adc3949ba59abbe56e057f20f883e', '陶杨', NULL, '女', NULL, NULL, NULL, '510525199610278305', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (385, '201603848', 'e10adc3949ba59abbe56e057f20f883e', '丁洁', NULL, '女', NULL, NULL, NULL, '510322199707145242', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (386, '201603847', 'e10adc3949ba59abbe56e057f20f883e', '高霞', NULL, '女', NULL, NULL, NULL, '511523199801041261', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (387, '201603846', 'e10adc3949ba59abbe56e057f20f883e', '陈良琼', NULL, '女', NULL, NULL, NULL, '513022199706126062', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (388, '201603845', 'e10adc3949ba59abbe56e057f20f883e', '陈俊', NULL, '男', NULL, NULL, NULL, '510106199709245115', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (389, '201603844', 'e10adc3949ba59abbe56e057f20f883e', '邓春', NULL, '男', NULL, NULL, NULL, '510522199702078598', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (390, '201603843', 'e10adc3949ba59abbe56e057f20f883e', '郭俊', NULL, '男', NULL, NULL, NULL, '510682199803214730', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (391, '201603842', 'e10adc3949ba59abbe56e057f20f883e', '王全宇', NULL, '男', NULL, NULL, NULL, '510824199802183159', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (392, '201603841', 'e10adc3949ba59abbe56e057f20f883e', '覃柏儒', NULL, '男', NULL, NULL, NULL, '511523199707062437', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (393, '201603840', 'e10adc3949ba59abbe56e057f20f883e', '王华祥', NULL, '男', NULL, NULL, NULL, '510902199704277378', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (394, '201603839', 'e10adc3949ba59abbe56e057f20f883e', '何鑫', NULL, '男', NULL, NULL, NULL, '510522199611256918', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (395, '201603838', 'e10adc3949ba59abbe56e057f20f883e', '胡鑫', NULL, '男', NULL, NULL, NULL, '510522199809110017', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (396, '201603837', 'e10adc3949ba59abbe56e057f20f883e', '李德权', NULL, '男', NULL, NULL, NULL, '511523199612251593', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (397, '201603836', 'e10adc3949ba59abbe56e057f20f883e', '李清萍', NULL, '男', NULL, NULL, NULL, '510322199703268595', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (398, '201603835', 'e10adc3949ba59abbe56e057f20f883e', '林鑫', NULL, '男', NULL, NULL, NULL, '510322199703058731', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (399, '201603834', 'e10adc3949ba59abbe56e057f20f883e', '刘磊', NULL, '男', NULL, NULL, NULL, '511922199803033914', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (400, '201603833', 'e10adc3949ba59abbe56e057f20f883e', '罗伟', NULL, '男', NULL, NULL, NULL, '510322199610242038', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (401, '201603831', 'e10adc3949ba59abbe56e057f20f883e', '武静', NULL, '男', NULL, NULL, NULL, '510521199710147999', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (402, '201603830', 'e10adc3949ba59abbe56e057f20f883e', '谢良键', NULL, '男', NULL, NULL, NULL, '510125199801040058', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (403, '201603829', 'e10adc3949ba59abbe56e057f20f883e', '杨鑫', NULL, '男', NULL, NULL, NULL, '510902199811032472', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (404, '201603828', 'e10adc3949ba59abbe56e057f20f883e', '曾浩纶', NULL, '男', NULL, NULL, NULL, '510322199606050316', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (405, '201603827', 'e10adc3949ba59abbe56e057f20f883e', '张扬', NULL, '男', NULL, NULL, NULL, '510322199706031518', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (406, '201603826', 'e10adc3949ba59abbe56e057f20f883e', '钟杰', NULL, '女', NULL, NULL, NULL, '510322199711041526', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (407, '201603825', 'e10adc3949ba59abbe56e057f20f883e', '赵红艳', NULL, '女', NULL, NULL, NULL, '511324199712252062', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (408, '201603824', 'e10adc3949ba59abbe56e057f20f883e', '张敏', NULL, '女', NULL, NULL, NULL, '510322199901098443', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (409, '201603823', 'e10adc3949ba59abbe56e057f20f883e', '袁玉琳', NULL, '女', NULL, NULL, NULL, '513902199610215582', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (410, '201603822', 'e10adc3949ba59abbe56e057f20f883e', '杨乐', NULL, '女', NULL, NULL, NULL, '510623199801103228', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (411, '201603821', 'e10adc3949ba59abbe56e057f20f883e', '肖霜', NULL, '女', NULL, NULL, NULL, '51032219961015584X', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (412, '201603820', 'e10adc3949ba59abbe56e057f20f883e', '王巧', NULL, '女', NULL, NULL, NULL, '513101199809062325', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (413, '201603819', 'e10adc3949ba59abbe56e057f20f883e', '唐香', NULL, '女', NULL, NULL, NULL, '51162219980713162X', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (414, '201603818', 'e10adc3949ba59abbe56e057f20f883e', '石川川', NULL, '女', NULL, NULL, NULL, '411324199805033308', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (415, '201603817', 'e10adc3949ba59abbe56e057f20f883e', '潘光润', NULL, '女', NULL, NULL, NULL, '510322199808167707', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (416, '201603816', 'e10adc3949ba59abbe56e057f20f883e', '刘诗益', NULL, '女', NULL, NULL, NULL, '511622199610209745', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (417, '201603815', 'e10adc3949ba59abbe56e057f20f883e', '刘家利', NULL, '女', NULL, NULL, NULL, '510182199607043842', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (418, '201603814', 'e10adc3949ba59abbe56e057f20f883e', '李丽', NULL, '女', NULL, NULL, NULL, '51031119980420134X', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (419, '201603813', 'e10adc3949ba59abbe56e057f20f883e', '侯小芳', NULL, '女', NULL, NULL, NULL, '513022199803134582', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (420, '201603812', 'e10adc3949ba59abbe56e057f20f883e', '何春枚', NULL, '女', NULL, NULL, NULL, '513722199905287801', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (421, '201603811', 'e10adc3949ba59abbe56e057f20f883e', '冯春梅', NULL, '女', NULL, NULL, NULL, '511322199808242907', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (422, '201603810', 'e10adc3949ba59abbe56e057f20f883e', '但雨佳', NULL, '女', NULL, NULL, NULL, '510322199804263849', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (423, '201603809', 'e10adc3949ba59abbe56e057f20f883e', '陈慧兰', NULL, '女', NULL, NULL, NULL, '513824199804087120', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (424, '201603808', 'e10adc3949ba59abbe56e057f20f883e', '闵仕岐', NULL, '男', NULL, NULL, NULL, '510902199907208495', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (425, '201603807', 'e10adc3949ba59abbe56e057f20f883e', '罗明才', NULL, '男', NULL, NULL, NULL, '511622199709176410', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (426, '201603806', 'e10adc3949ba59abbe56e057f20f883e', '刘嘉兴', NULL, '男', NULL, NULL, NULL, '510921199711134278', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (427, '201603805', 'e10adc3949ba59abbe56e057f20f883e', '廖云浩', NULL, '男', NULL, NULL, NULL, '510322199609164597', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (428, '201603804', 'e10adc3949ba59abbe56e057f20f883e', '李林奇', NULL, '男', NULL, NULL, NULL, '510902199707258316', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (429, '201603803', 'e10adc3949ba59abbe56e057f20f883e', '赖维朗', NULL, '男', NULL, NULL, NULL, '510125199711092313', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (430, '201603802', 'e10adc3949ba59abbe56e057f20f883e', '胡笳', NULL, '男', NULL, NULL, NULL, '510781199808165631', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (431, '201603801', 'e10adc3949ba59abbe56e057f20f883e', '何清海', NULL, '男', NULL, NULL, NULL, '513722199708233599', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (432, '201603800', 'e10adc3949ba59abbe56e057f20f883e', '王海韵', NULL, '男', NULL, NULL, NULL, '510322199804151273', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (433, '201603799', 'e10adc3949ba59abbe56e057f20f883e', '舒德胜', NULL, '男', NULL, NULL, NULL, '510322199712292618', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (434, '201603798', 'e10adc3949ba59abbe56e057f20f883e', '王萌', NULL, '男', NULL, NULL, NULL, '510922199712185196', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (435, '201603797', 'e10adc3949ba59abbe56e057f20f883e', '丁炳辉', NULL, '男', NULL, NULL, NULL, '511524199711223973', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (436, '201603796', 'e10adc3949ba59abbe56e057f20f883e', '谌立高', NULL, '男', NULL, NULL, NULL, '513425199504236010', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (437, '201603795', 'e10adc3949ba59abbe56e057f20f883e', '陈嘉禾', NULL, '男', NULL, NULL, NULL, '654201199809082112', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (438, '201603794', 'e10adc3949ba59abbe56e057f20f883e', '张鑫', NULL, '男', NULL, NULL, NULL, '510125199802152318', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (439, '201603793', 'e10adc3949ba59abbe56e057f20f883e', '游钊', NULL, '男', NULL, NULL, NULL, '511526199702053813', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (440, '201603792', 'e10adc3949ba59abbe56e057f20f883e', '严玉辛', NULL, '男', NULL, NULL, NULL, '513124199705244479', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (441, '201603791', 'e10adc3949ba59abbe56e057f20f883e', '谢家萍', NULL, '男', NULL, NULL, NULL, '510824199702158378', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (442, '201603790', 'e10adc3949ba59abbe56e057f20f883e', '吴俊', NULL, '男', NULL, NULL, NULL, '512021200112240771', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (443, '20158695', 'e10adc3949ba59abbe56e057f20f883e', '李明珠', NULL, '女', NULL, NULL, NULL, '510902199508148106', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (444, '20158674', 'e10adc3949ba59abbe56e057f20f883e', '周倩', NULL, '女', NULL, NULL, NULL, '513902199701204408', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (445, '20140107', 'e10adc3949ba59abbe56e057f20f883e', '杜娟', NULL, '女', NULL, NULL, NULL, '511321199412107489', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (446, '20140178', 'e10adc3949ba59abbe56e057f20f883e', '梁林', NULL, '男', NULL, NULL, NULL, '510322199706058753', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (447, '20140042', 'e10adc3949ba59abbe56e057f20f883e', '邓衣龙', NULL, '男', NULL, NULL, NULL, '513101199602070512', '信息工程学院', NULL, '计算机科学与技术(教育)', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (448, '201604409', 'e10adc3949ba59abbe56e057f20f883e', '付春雷', NULL, '男', NULL, NULL, NULL, '510122199704078119', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (449, '201604285', 'e10adc3949ba59abbe56e057f20f883e', '袁智杰', NULL, '男', NULL, NULL, NULL, '510105199805101270', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (450, '201604184', 'e10adc3949ba59abbe56e057f20f883e', '刘忠保', NULL, '男', NULL, NULL, NULL, '510521199509280018', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (451, '201604153', 'e10adc3949ba59abbe56e057f20f883e', '胡林', NULL, '男', NULL, NULL, NULL, '500382199809250830', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (452, '201604135', 'e10adc3949ba59abbe56e057f20f883e', '徐婷', NULL, '女', NULL, NULL, NULL, '500238199807252225', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (453, '201604116', 'e10adc3949ba59abbe56e057f20f883e', '薛先航', NULL, '男', NULL, NULL, NULL, '510108199809201518', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (454, '201604115', 'e10adc3949ba59abbe56e057f20f883e', '肖波', NULL, '男', NULL, NULL, NULL, '513901199804020410', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (455, '201604105', 'e10adc3949ba59abbe56e057f20f883e', '杜爽', NULL, '男', NULL, NULL, NULL, '500230199708016074', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (456, '201604103', 'e10adc3949ba59abbe56e057f20f883e', '曹伟', NULL, '男', NULL, NULL, NULL, '510603199801042917', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (457, '201604006', 'e10adc3949ba59abbe56e057f20f883e', '郭效坤', NULL, '男', NULL, NULL, NULL, '37120219980224121X', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (458, '201603789', 'e10adc3949ba59abbe56e057f20f883e', '苏婉秋', NULL, '女', NULL, NULL, NULL, '340104199710310020', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (459, '201603788', 'e10adc3949ba59abbe56e057f20f883e', '杨晨', NULL, '女', NULL, NULL, NULL, '210502199808230926', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (460, '201603787', 'e10adc3949ba59abbe56e057f20f883e', '叶琪琪', NULL, '女', NULL, NULL, NULL, '450521199808256628', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (461, '201603786', 'e10adc3949ba59abbe56e057f20f883e', '周婷', NULL, '女', NULL, NULL, NULL, '510622199804030320', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (462, '201603785', 'e10adc3949ba59abbe56e057f20f883e', '李林玲', NULL, '女', NULL, NULL, NULL, '50038419980819004X', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (463, '201603784', 'e10adc3949ba59abbe56e057f20f883e', '连忻羽', NULL, '女', NULL, NULL, NULL, '510108199810090624', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (464, '201603783', 'e10adc3949ba59abbe56e057f20f883e', '刘晓雨', NULL, '女', NULL, NULL, NULL, '510302199806221022', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (465, '201603781', 'e10adc3949ba59abbe56e057f20f883e', '程赟', NULL, '女', NULL, NULL, NULL, '510183199712067949', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (466, '201603780', 'e10adc3949ba59abbe56e057f20f883e', '贺宇曦', NULL, '女', NULL, NULL, NULL, '510123199805272320', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (467, '201603779', 'e10adc3949ba59abbe56e057f20f883e', '陈昌林', NULL, '男', NULL, NULL, NULL, '411522199807170339', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (468, '201603778', 'e10adc3949ba59abbe56e057f20f883e', '陈泉宇', NULL, '男', NULL, NULL, NULL, '510121199501044035', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (469, '201603777', 'e10adc3949ba59abbe56e057f20f883e', '邓凌江', NULL, '男', NULL, NULL, NULL, '513825199805254257', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (470, '201603776', 'e10adc3949ba59abbe56e057f20f883e', '高靖波', NULL, '男', NULL, NULL, NULL, '610327199801100011', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (471, '201603775', 'e10adc3949ba59abbe56e057f20f883e', '龚勋', NULL, '男', NULL, NULL, NULL, '511011199803089290', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (472, '201603774', 'e10adc3949ba59abbe56e057f20f883e', '何沈', NULL, '男', NULL, NULL, NULL, '511304199804278512', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (473, '201603773', 'e10adc3949ba59abbe56e057f20f883e', '黄治豪', NULL, '男', NULL, NULL, NULL, '513022199708200094', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (474, '201603772', 'e10adc3949ba59abbe56e057f20f883e', '郎松松', NULL, '男', NULL, NULL, NULL, '513022199704105479', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (475, '201603771', 'e10adc3949ba59abbe56e057f20f883e', '李成滨', NULL, '男', NULL, NULL, NULL, '51078119980704191X', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (476, '201603770', 'e10adc3949ba59abbe56e057f20f883e', '李明洋', NULL, '男', NULL, NULL, NULL, '510104199809300270', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (477, '201603769', 'e10adc3949ba59abbe56e057f20f883e', '李洋', NULL, '男', NULL, NULL, NULL, '510902199706276053', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (478, '201603768', 'e10adc3949ba59abbe56e057f20f883e', '林龙', NULL, '男', NULL, NULL, NULL, '362322199905040015', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (479, '201603767', 'e10adc3949ba59abbe56e057f20f883e', '刘强', NULL, '男', NULL, NULL, NULL, '510922199611033572', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (480, '201603766', 'e10adc3949ba59abbe56e057f20f883e', '陆俊材', NULL, '男', NULL, NULL, NULL, '511302199809220712', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (481, '201603765', 'e10adc3949ba59abbe56e057f20f883e', '骆家辉', NULL, '男', NULL, NULL, NULL, '232321199801102714', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (482, '201603764', 'e10adc3949ba59abbe56e057f20f883e', '彭金盛', NULL, '男', NULL, NULL, NULL, '513902199806068975', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (483, '201603763', 'e10adc3949ba59abbe56e057f20f883e', '沈仁杰', NULL, '男', NULL, NULL, NULL, '510812199610180038', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (484, '201603762', 'e10adc3949ba59abbe56e057f20f883e', '宋世杰', NULL, '男', NULL, NULL, NULL, '142702199712251815', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (485, '201603761', 'e10adc3949ba59abbe56e057f20f883e', '王国栋', NULL, '男', NULL, NULL, NULL, '510411199804098114', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (486, '201603760', 'e10adc3949ba59abbe56e057f20f883e', '王永鹏', NULL, '男', NULL, NULL, NULL, '511023199708068673', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (487, '201603759', 'e10adc3949ba59abbe56e057f20f883e', '吴世龙', NULL, '男', NULL, NULL, NULL, '500225199802286854', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (488, '201603758', 'e10adc3949ba59abbe56e057f20f883e', '谢鑫', NULL, '男', NULL, NULL, NULL, '500228199802203739', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (489, '201603757', 'e10adc3949ba59abbe56e057f20f883e', '杨忠学', NULL, '男', NULL, NULL, NULL, '513901199803213018', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (490, '201603756', 'e10adc3949ba59abbe56e057f20f883e', '袁洪', NULL, '男', NULL, NULL, NULL, '510524199701104734', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (491, '201603755', 'e10adc3949ba59abbe56e057f20f883e', '张超', NULL, '男', NULL, NULL, NULL, '510812199803163613', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (492, '201603754', 'e10adc3949ba59abbe56e057f20f883e', '张智毅', NULL, '男', NULL, NULL, NULL, '511111199808111018', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (493, '201603753', 'e10adc3949ba59abbe56e057f20f883e', '朱兴', NULL, '男', NULL, NULL, NULL, '511621199709255016', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (494, '201603752', 'e10adc3949ba59abbe56e057f20f883e', '张玉渺', NULL, '女', NULL, NULL, NULL, '210302199807080320', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
INSERT INTO `student` VALUES (495, '201603751', 'e10adc3949ba59abbe56e057f20f883e', '杨婷', NULL, '女', NULL, NULL, NULL, '510922199701175101', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010284');
INSERT INTO `student` VALUES (496, '201603750', 'e10adc3949ba59abbe56e057f20f883e', '许妍', NULL, '女', NULL, NULL, NULL, '211202199806271024', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010651');
INSERT INTO `student` VALUES (497, '201603749', 'e10adc3949ba59abbe56e057f20f883e', '苏沁沅', NULL, '女', NULL, NULL, NULL, '510108199810130921', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2011010013');
INSERT INTO `student` VALUES (498, '201603748', 'e10adc3949ba59abbe56e057f20f883e', '马娅', NULL, '女', NULL, NULL, NULL, '510722199712128764', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010032');
INSERT INTO `student` VALUES (499, '201603747', 'e10adc3949ba59abbe56e057f20f883e', '刘嘉嘉', NULL, '女', NULL, NULL, NULL, '410122199706082927', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010534');
INSERT INTO `student` VALUES (500, '201603746', 'e10adc3949ba59abbe56e057f20f883e', '李珍珍', NULL, '女', NULL, NULL, NULL, '652826199711282325', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010628');
INSERT INTO `student` VALUES (501, '201603745', 'e10adc3949ba59abbe56e057f20f883e', '黄依婷', NULL, '女', NULL, NULL, NULL, '450205199805080026', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2006010033');
INSERT INTO `student` VALUES (502, '201603743', 'e10adc3949ba59abbe56e057f20f883e', '陈珊', NULL, '女', NULL, NULL, NULL, '652701199703173724', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2007010012');
INSERT INTO `student` VALUES (503, '201603741', 'e10adc3949ba59abbe56e057f20f883e', '柯宜', NULL, '男', NULL, NULL, NULL, '46003319981204357X', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010655');
INSERT INTO `student` VALUES (504, '201603740', 'e10adc3949ba59abbe56e057f20f883e', '黄志清', NULL, '男', NULL, NULL, NULL, '362502199804044012', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010285');
INSERT INTO `student` VALUES (505, '201603739', 'e10adc3949ba59abbe56e057f20f883e', '韩俊威', NULL, '男', NULL, NULL, NULL, '510107199805151270', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2010010024');
INSERT INTO `student` VALUES (506, '201603738', 'e10adc3949ba59abbe56e057f20f883e', '龚凡煜', NULL, '男', NULL, NULL, NULL, '360124199812110010', '信息工程学院', NULL, '计算机科学与技术', NULL, '2020-03-06 20:03:54', '2020-03-06 20:03:54', 1, NULL, NULL, NULL, NULL, '2016010633');
COMMIT;

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `teachno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '教职工号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '姓名',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '男' COMMENT '性别',
  `idcard` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '身份证号码',
  `college` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学院',
  `collegecode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学院代码',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态1启用 0停用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_teach_no` (`teachno`),
  UNIQUE KEY `unique_idcard` (`idcard`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='校内导师信息';

-- ----------------------------
-- Records of teacher
-- ----------------------------
BEGIN;
INSERT INTO `teacher` VALUES (1, '2016010534', 'e10adc3949ba59abbe56e057f20f883e', '吴敏', NULL, '男', '652801198707103724', '信息工程学院', NULL, '2020-03-06 20:08:24', '2020-03-06 20:08:24', 1);
INSERT INTO `teacher` VALUES (2, '2016010628', 'e10adc3949ba59abbe56e057f20f883e', '张说', NULL, '男', '51072419881103004X', '水利水电学院', NULL, '2020-03-06 20:08:24', '2020-03-06 20:08:24', 1);
INSERT INTO `teacher` VALUES (3, '2006010033', 'e10adc3949ba59abbe56e057f20f883e', '郑媛元', NULL, '男', '513826198410080020', '理学院', NULL, '2020-03-06 20:08:24', '2020-03-06 20:08:24', 1);
INSERT INTO `teacher` VALUES (4, '2007010012', 'e10adc3949ba59abbe56e057f20f883e', '蒋旭', NULL, '男', '513022198105210029', '机电学院', NULL, '2020-03-06 20:08:24', '2020-03-06 20:08:24', 1);
INSERT INTO `teacher` VALUES (5, '2016010655', 'e10adc3949ba59abbe56e057f20f883e', '支芙蓉', NULL, '男', '450323198708160626', '水利水电学院', NULL, '2020-03-06 20:08:24', '2020-03-06 20:08:24', 1);
INSERT INTO `teacher` VALUES (6, '2016010285', 'e10adc3949ba59abbe56e057f20f883e', '向斌', NULL, '男', '513022197312186514', '机电学院', NULL, '2020-03-06 20:08:24', '2020-03-06 20:08:24', 1);
INSERT INTO `teacher` VALUES (7, '2010010024', 'e10adc3949ba59abbe56e057f20f883e', '阮坤', 765432, '765432', '123456789', '信息工程学院', '', '2020-03-06 20:08:24', '2020-03-08 19:19:52', 0);
INSERT INTO `teacher` VALUES (8, '2016010633', 'e10adc3949ba59abbe56e057f20f883e', '侯永柏', NULL, '男', '37078119880412257X', '机电学院', NULL, '2020-03-06 20:08:24', '2020-03-06 20:08:24', 1);
INSERT INTO `teacher` VALUES (9, '2016010284', 'e10adc3949ba59abbe56e057f20f883e', '杨家勇', NULL, '男', '510107198108280574', '理学院', NULL, '2020-03-06 20:08:24', '2020-03-06 20:08:24', 1);
INSERT INTO `teacher` VALUES (10, '2016010651', 'e10adc3949ba59abbe56e057f20f883e', '杨颖', NULL, '男', '510106199001261021', '机电学院', NULL, '2020-03-06 20:08:24', '2020-03-06 20:08:24', 1);
INSERT INTO `teacher` VALUES (11, '2011010013', 'e10adc3949ba59abbe56e057f20f883e', '邓幸', NULL, '男', '370202198309223522', '信息工程学院', NULL, '2020-03-06 20:08:24', '2020-03-06 20:08:24', 1);
INSERT INTO `teacher` VALUES (12, '2006010032', 'e10adc3949ba59abbe56e057f20f883e', '刘琥', NULL, '男', '510107198310131572', '机电学院', NULL, '2020-03-06 20:08:24', '2020-03-06 20:08:24', 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
