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

 Date: 05/03/2020 19:45:02
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='实习鉴定表';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='鉴定表的时间项';

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
  `ischecked` tinyint(1) DEFAULT '0' COMMENT ' 表示该公司信息后台管理员是否已经核实,默认未核实',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT ' 数据库记录创建日期',
  `modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ' 数据库记录修改日期',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniquestuno` (`stuno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='实习企业信息表';

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件后缀pdf jpg png exe',
  `url` text COLLATE utf8mb4_general_ci COMMENT 'url',
  `size` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件大小',
  `update` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='文件存储';

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='实习单位发布通知\n';

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='学生信息';

-- ----------------------------
-- Records of student
-- ----------------------------
BEGIN;
INSERT INTO `student` VALUES (4, '123', 'e10adc3949ba59abbe56e057f20f883e', '123', 12, '男', '12345', '1234', '23', '1234', '123', '234', '123', '234', '2020-03-05 10:40:21', '2020-03-05 15:41:18', 1, NULL, NULL, NULL, NULL, NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='校内导师信息';

SET FOREIGN_KEY_CHECKS = 1;
