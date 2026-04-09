/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80026 (8.0.26)
 Source Host           : localhost:3306
 Source Schema         : vhr

 Target Server Type    : MySQL
 Target Server Version : 80026 (8.0.26)
 File Encoding         : 65001

 Date: 09/04/2026 16:49:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adjustsalary
-- ----------------------------
DROP TABLE IF EXISTS `adjustsalary`;
CREATE TABLE `adjustsalary`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `eid` int NULL DEFAULT NULL,
  `asDate` date NULL DEFAULT NULL COMMENT '调薪日期',
  `beforeSalary` int NULL DEFAULT NULL COMMENT '调前薪资',
  `afterSalary` int NULL DEFAULT NULL COMMENT '调后薪资',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调薪原因',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`eid` ASC) USING BTREE,
  CONSTRAINT `adjustsalary_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of adjustsalary
-- ----------------------------

-- ----------------------------
-- Table structure for appraise
-- ----------------------------
DROP TABLE IF EXISTS `appraise`;
CREATE TABLE `appraise`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `eid` int NULL DEFAULT NULL,
  `appDate` date NULL DEFAULT NULL COMMENT '考评日期',
  `appResult` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考评结果',
  `appContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考评内容',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`eid` ASC) USING BTREE,
  CONSTRAINT `appraise_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of appraise
-- ----------------------------
INSERT INTO `appraise` VALUES (43, 5271, '2023-03-15', '5', '转正考评', '转正通过');

-- ----------------------------
-- Table structure for cooperation_agency
-- ----------------------------
DROP TABLE IF EXISTS `cooperation_agency`;
CREATE TABLE `cooperation_agency`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `agency_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '机构全称',
  `agency_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '机构类型：职业院校/人力资源公司/劳务派遣公司/中介机构',
  `contact_person` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '对接人',
  `contact_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `supply_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '供应类型：实习生/兼职/寒暑假工/正式工',
  `intern_post` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '适配岗位，多选用逗号分隔：服务员,后厨,传菜,收银,保洁',
  `bank_account_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '开户名',
  `bank_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '开户银行',
  `bank_account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '银行账号',
  `service_fee_mode` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '计费方式：按人/月、按天、一次性',
  `service_fee_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理费金额',
  `settle_cycle` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '结算周期：月结/周结/半月结',
  `tax_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发票类型：专票/普票/无票',
  `agency_address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '机构地址',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '合作机构信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cooperation_agency
-- ----------------------------
INSERT INTO `cooperation_agency` VALUES (1, '淮北半亩田餐饮管理有限公司', '人力资源公司', '毛毛', '18639212885', '实习生', '服务员,迎宾,后厨,传菜', '淮北半亩田餐饮管理有限公司', '招商银行上海龙茗路支行', '121951939910001', '按人/月', 200.00, '月结', '专票', '上海市闵行开发区东川路3966号3号楼5楼', '', '2026-04-03 15:58:48', '2026-04-03 15:58:48');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `parentId` int NULL DEFAULT NULL,
  `depPath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enabled` tinyint(1) NULL DEFAULT 1,
  `isParent` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 170 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '总公司', -1, '.1', 1, 1);
INSERT INTO `department` VALUES (150, '上海区域', 1, '.1.150', 1, 1);
INSERT INTO `department` VALUES (153, '七宝店', 150, '.1.150.153', 1, 0);
INSERT INTO `department` VALUES (164, '五角场店', 150, '.1.150.164', 1, 0);
INSERT INTO `department` VALUES (165, '徐汇店', 150, '.1.150.165', 1, 0);
INSERT INTO `department` VALUES (166, '杭州区域', 1, '.1.166', 1, 1);
INSERT INTO `department` VALUES (167, '大悦城店', 166, '.1.166.167', 1, 0);
INSERT INTO `department` VALUES (168, '嘉兴区域', 1, '.1.168', 1, 1);
INSERT INTO `department` VALUES (169, '龙鼎万达店', 168, '.1.168.169', 1, 0);

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '员工编号',
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工姓名',
  `gender` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `birthday` date NULL DEFAULT NULL COMMENT '出生日期',
  `idCard` char(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `wedlock` enum('已婚','未婚','离异') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '婚姻状况',
  `nationId` int NULL DEFAULT NULL COMMENT '民族',
  `nativePlace` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '籍贯',
  `politicId` int NULL DEFAULT NULL COMMENT '政治面貌',
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址',
  `departmentId` int NULL DEFAULT NULL COMMENT '所属部门',
  `jobLevelId` int NULL DEFAULT NULL COMMENT '职称ID',
  `posId` int NULL DEFAULT NULL COMMENT '职位ID',
  `engageForm` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '聘用形式',
  `tiptopDegree` enum('博士','硕士','本科','大专','高中','初中','小学','其他') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最高学历',
  `specialty` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属专业',
  `school` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '毕业院校',
  `beginDate` date NULL DEFAULT NULL COMMENT '入职日期',
  `workState` enum('在职','离职') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '在职' COMMENT '在职状态',
  `workID` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `contractTerm` double NULL DEFAULT NULL COMMENT '合同期限',
  `conversionTime` date NULL DEFAULT NULL COMMENT '转正日期',
  `notWorkDate` date NULL DEFAULT NULL COMMENT '离职日期',
  `beginContract` date NULL DEFAULT NULL COMMENT '合同起始日期',
  `endContract` date NULL DEFAULT NULL COMMENT '合同终止日期',
  `workAge` int NULL DEFAULT NULL COMMENT '工龄',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name` ASC) USING BTREE,
  UNIQUE INDEX `uk_id_card`(`idCard` ASC) USING BTREE,
  INDEX `departmentId`(`departmentId` ASC) USING BTREE,
  INDEX `jobId`(`jobLevelId` ASC) USING BTREE,
  INDEX `dutyId`(`posId` ASC) USING BTREE,
  INDEX `nationId`(`nationId` ASC) USING BTREE,
  INDEX `politicId`(`politicId` ASC) USING BTREE,
  INDEX `workID_key`(`workID` ASC) USING BTREE,
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`jobLevelId`) REFERENCES `joblevel` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`posId`) REFERENCES `position` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_ibfk_4` FOREIGN KEY (`nationId`) REFERENCES `nation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_ibfk_5` FOREIGN KEY (`politicId`) REFERENCES `politicsstatus` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5310 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (5268, '何婷', '女', '1998-10-08', '150124199510081279', '未婚', 1, '中国', 3, '00000001@qq.com', '15692756582', '江苏盐城', 1, 38, 124, '劳动合同', '本科', '软件工程', '盐城师范学院', '2023-03-03', '在职', '00000001', 1, '2023-03-03', NULL, '2023-03-03', '2024-03-11', NULL);
INSERT INTO `employee` VALUES (5271, '张明', '男', '1999-06-15', '150124199510081276', '未婚', 1, '重庆', 3, '123123@qq.com', '15696756582', '无', 153, 37, 121, '劳动合同', '博士', '软件工程', '盐城师范', '2023-03-03', '在职', '00000002', 0, '2023-03-03', NULL, '2023-03-03', '2023-03-03', NULL);
INSERT INTO `employee` VALUES (5294, '张晓明', '男', '1990-03-15', '310101199003151234', '已婚', 1, '上海', 3, 'zhangming@test.com', '13800138001', '上海市浦东新区', 153, 37, 121, '劳动合同', '本科', '计算机科学与技术', '复旦大学', '2018-07-01', '在职', '00000004', 3, '2018-10-01', NULL, '2018-07-01', '2021-06-30', 6);
INSERT INTO `employee` VALUES (5295, '李娜', '女', '1992-08-22', '320101199208225678', '未婚', 2, '南京', 1, 'lina@test.com', '13900139002', '南京市鼓楼区', 153, 39, 121, '劳动合同', '硕士', '会计学', '南京大学', '2019-03-01', '在职', '00000005', 3, '2019-06-01', NULL, '2019-03-01', '2022-02-28', 5);
INSERT INTO `employee` VALUES (5296, '王强', '男', '1988-11-05', '330101198811059012', '已婚', 1, '杭州', 3, 'wangqiang@test.com', '13700137003', '杭州市西湖区', 153, 37, 121, '劳动合同', '本科', '市场营销', '浙江大学', '2016-05-01', '在职', '00000006', 5, '2016-08-01', NULL, '2016-05-01', '2021-04-30', 8);
INSERT INTO `employee` VALUES (5297, '刘芳', '女', '1995-02-14', '440101199502143456', '未婚', 3, '广州', 2, 'liufang@test.com', '13600136004', '广州市天河区', 153, 37, 121, '劳务合同', '大专', '人力资源管理', '广州大学', '2020-01-01', '在职', '00000007', 2, '2020-04-01', NULL, '2020-01-01', '2022-12-31', 4);
INSERT INTO `employee` VALUES (5298, '赵伟', '男', '1993-06-30', '510101199306307890', '已婚', 1, '成都', 3, 'zhaowei@test.com', '13500135005', '成都市锦江区', 153, 37, 121, '劳动合同', '本科', '软件工程', '电子科技大学', '2017-09-01', '在职', '00000008', 3, '2017-12-01', NULL, '2017-09-01', '2020-08-31', 7);
INSERT INTO `employee` VALUES (5299, '陈静', '女', '1991-10-17', '610101199110172345', '未婚', 3, '西安', 1, 'chenjing@test.com', '13400134006', '西安市雁塔区', 153, 37, 121, '劳动合同', '硕士', '金融学', '西安交通大学', '2018-02-01', '在职', '00000009', 3, '2018-05-01', NULL, '2018-02-01', '2021-01-31', 6);
INSERT INTO `employee` VALUES (5300, '孙磊', '男', '1989-04-09', '370101198904096789', '已婚', 1, '济南', 3, 'sunlei@test.com', '13300133007', '济南市历下区', 164, 37, 121, '劳动合同', '博士', '管理学', '山东大学', '2015-03-01', '在职', '00000010', 5, '2015-06-01', NULL, '2015-03-01', '2020-02-28', 9);
INSERT INTO `employee` VALUES (5301, '周敏', '女', '1994-12-25', '430101199412251234', '未婚', 5, '长沙', 2, 'zhoumin@test.com', '13200132008', '长沙市岳麓区', 153, 38, 120, '劳务合同', '本科', '新闻学', '湖南大学', '2019-07-01', '在职', '00000011', 2, '2019-10-01', NULL, '2019-07-01', '2021-06-30', 5);
INSERT INTO `employee` VALUES (5302, '吴刚', '男', '1996-01-18', '340101199601185678', '未婚', 1, '合肥', 1, 'wugang@test.com', '13100131009', '合肥市蜀山区', 167, 37, 121, '劳动合同', '大专', '电子商务', '合肥工业大学', '2021-01-01', '在职', '00000012', 3, '2021-04-01', NULL, '2021-01-01', '2024-12-31', 3);
INSERT INTO `employee` VALUES (5303, '郑雪', '女', '1990-07-03', '420101199007039012', '已婚', 2, '武汉', 1, 'zhengxue@test.com', '13000130010', '武汉市洪山区', 165, 38, 120, '劳动合同', '本科', '法学', '武汉大学', '2017-04-01', '在职', '00000013', 3, '2017-07-01', NULL, '2017-04-01', '2020-03-31', 7);
INSERT INTO `employee` VALUES (5308, '第三方', '男', '1998-10-08', '310110199810052369', '未婚', NULL, '', NULL, 's@qq.com', '11166668888', '防守打法', NULL, NULL, NULL, '劳动合同', '本科', '发达', '范德萨', '2023-03-03', '离职', NULL, 0, '2023-03-03', '2026-03-31', '2023-03-03', '2023-03-03', 3);
INSERT INTO `employee` VALUES (5309, '古法', '男', '1998-10-08', '420101199807039012', '未婚', 1, '', 3, '11@qq.com', '15699993256', '发达', 164, 38, 121, '劳动合同', '本科', '发达范德萨', '股份第三个', '2023-03-03', '离职', '00000014', 0, '2023-03-03', '2026-04-07', '2023-03-03', '2023-03-03', 3);

-- ----------------------------
-- Table structure for employee_promotion
-- ----------------------------
DROP TABLE IF EXISTS `employee_promotion`;
CREATE TABLE `employee_promotion`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_id` int NULL DEFAULT NULL COMMENT '员工ID',
  `old_pos_id` int NULL DEFAULT NULL COMMENT '原职位ID',
  `new_pos_id` int NULL DEFAULT NULL COMMENT '晋升职位ID',
  `old_job_level_id` int NULL DEFAULT NULL COMMENT '原职称ID',
  `new_job_level_id` int NULL DEFAULT NULL COMMENT '晋升职称ID',
  `reason` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '晋升理由',
  `apply_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请时间',
  `approver_id` int NULL DEFAULT NULL COMMENT '审批人ID',
  `approve_time` datetime NULL DEFAULT NULL COMMENT '审批时间',
  `approve_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批意见',
  `status` tinyint NULL DEFAULT 0 COMMENT '0待审批 1已通过 2已拒绝',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '员工晋升申请表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of employee_promotion
-- ----------------------------
INSERT INTO `employee_promotion` VALUES (2, 5295, 120, 121, 38, 39, '发大水', '2026-03-27 15:19:02', 5299, '2026-03-29 15:46:40', '割发代首', 1);
INSERT INTO `employee_promotion` VALUES (3, 5299, 120, 124, 38, 39, '工地发多少', '2026-03-27 20:51:21', 5301, '2026-03-30 15:41:16', '官方说的', 2);
INSERT INTO `employee_promotion` VALUES (4, 5301, 121, 120, 37, 38, '发哈爱', '2026-03-30 16:00:17', 5303, '2026-03-30 16:00:44', '同意', 1);

-- ----------------------------
-- Table structure for employee_recycle
-- ----------------------------
DROP TABLE IF EXISTS `employee_recycle`;
CREATE TABLE `employee_recycle`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '员工编号',
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工姓名',
  `gender` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `birthday` date NULL DEFAULT NULL COMMENT '出生日期',
  `idCard` char(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `wedlock` enum('已婚','未婚','离异') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '婚姻状况',
  `nationId` int NULL DEFAULT NULL COMMENT '民族',
  `nativePlace` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '籍贯',
  `politicId` int NULL DEFAULT NULL COMMENT '政治面貌',
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址',
  `departmentId` int NULL DEFAULT NULL COMMENT '所属部门',
  `jobLevelId` int NULL DEFAULT NULL COMMENT '职称ID',
  `posId` int NULL DEFAULT NULL COMMENT '职位ID',
  `engageForm` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '聘用形式',
  `tiptopDegree` enum('博士','硕士','本科','大专','高中','初中','小学','其他') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最高学历',
  `specialty` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属专业',
  `school` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '毕业院校',
  `beginDate` date NULL DEFAULT NULL COMMENT '入职日期',
  `workState` enum('在职','离职') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '在职' COMMENT '在职状态',
  `workID` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `contractTerm` double NULL DEFAULT NULL COMMENT '合同期限',
  `conversionTime` date NULL DEFAULT NULL COMMENT '转正日期',
  `notWorkDate` date NULL DEFAULT NULL COMMENT '离职日期',
  `beginContract` date NULL DEFAULT NULL COMMENT '合同起始日期',
  `endContract` date NULL DEFAULT NULL COMMENT '合同终止日期',
  `workAge` int NULL DEFAULT NULL COMMENT '工龄',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `departmentId`(`departmentId` ASC) USING BTREE,
  INDEX `jobId`(`jobLevelId` ASC) USING BTREE,
  INDEX `dutyId`(`posId` ASC) USING BTREE,
  INDEX `nationId`(`nationId` ASC) USING BTREE,
  INDEX `politicId`(`politicId` ASC) USING BTREE,
  INDEX `workID_key`(`workID` ASC) USING BTREE,
  CONSTRAINT `employee_recycle_ibfk_1` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_recycle_ibfk_2` FOREIGN KEY (`jobLevelId`) REFERENCES `joblevel` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_recycle_ibfk_3` FOREIGN KEY (`posId`) REFERENCES `position` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_recycle_ibfk_4` FOREIGN KEY (`nationId`) REFERENCES `nation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_recycle_ibfk_5` FOREIGN KEY (`politicId`) REFERENCES `politicsstatus` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of employee_recycle
-- ----------------------------
INSERT INTO `employee_recycle` VALUES (1, '的', '男', '1998-10-08', '111222199809098888', '未婚', 1, '', 3, '11@qq.com', '11155556666', '法式', 153, 37, 120, '劳动合同', '本科', '范德萨', '发生的', '2023-03-03', '离职', '00000004', 0, '2023-03-03', '2026-03-16', '2023-03-03', '2023-03-03', 3);
INSERT INTO `employee_recycle` VALUES (2, '11', '男', '1998-10-08', '111222199809098888', '未婚', 1, '', 3, '111@qq.com', '15692756582', '1', 153, 38, 120, '劳动合同', '本科', '法式', '阿帆', '2023-03-03', '离职', '00000003', 0, '2023-03-03', '2026-03-27', '2023-03-03', '2023-03-03', 3);
INSERT INTO `employee_recycle` VALUES (3, '范德萨', '男', '1998-10-08', '310110199804132689', '未婚', 1, '', 3, 'fd@qq.com', '11155556666', 'fafda', 165, 38, 121, '劳动合同', '大专', '发大水', '发撒范德萨', '2023-03-03', '离职', '00000014', 0, '2023-03-03', '2026-03-27', '2023-03-03', '2023-03-03', 3);
INSERT INTO `employee_recycle` VALUES (4, '发多少', '男', '1998-10-08', '310130199810081256', '未婚', 1, '', 3, '11@qq.com', '11166668888', '发', 153, 37, 120, '劳动合同', '本科', '范德萨', '法式', '2023-03-03', '离职', '00000014', 0, '2023-03-03', '2026-03-31', '2023-03-03', '2023-03-03', 3);
INSERT INTO `employee_recycle` VALUES (5, '乳鸽', '男', '1998-10-08', '310311199810083658', '未婚', 1, '', 3, '11@qq.com', '11166669999', '发达', 164, 37, 121, '劳动合同', '本科', '防守打法', '发生范德萨', '2023-03-03', '离职', '00000014', 0, '2023-03-03', '2026-03-31', '2023-03-03', '2023-03-03', 3);
INSERT INTO `employee_recycle` VALUES (6, '回访', '男', '1998-10-08', '310110199810082569', '未婚', 1, '', 3, '11@qq.com', '11166665555', '佛山市', 167, 37, 120, '劳动合同', '本科', '发达', '防守打法', '2023-03-03', '离职', '00000014', 0, '2023-03-03', '2026-03-31', '2023-03-03', '2023-03-03', 3);
INSERT INTO `employee_recycle` VALUES (7, '第三方', '男', '1998-10-08', '310110199810052369', '未婚', 1, '', 3, 's@qq.com', '11166668888', '防守打法', 164, 37, 120, '劳动合同', '本科', '发达', '范德萨', '2023-03-03', '离职', '00000014', 0, '2023-03-03', '2026-03-31', '2023-03-03', '2023-03-03', 3);
INSERT INTO `employee_recycle` VALUES (8, '古法', '男', '1998-10-08', '420101199807039012', '未婚', 1, '', 3, '11@qq.com', '15699993256', '发达', 164, 38, 121, '劳动合同', '本科', '发达范德萨', '股份第三个', '2023-03-03', '离职', '00000014', 0, '2023-03-03', '2026-04-07', '2023-03-03', '2023-03-03', 3);

-- ----------------------------
-- Table structure for employee_resignation
-- ----------------------------
DROP TABLE IF EXISTS `employee_resignation`;
CREATE TABLE `employee_resignation`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `emp_id` int NULL DEFAULT NULL COMMENT '员工ID（关联employee表）',
  `resign_type` tinyint NULL DEFAULT NULL COMMENT '离职类型 1:主动离职 2:被动离职',
  `resign_reason` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '离职原因',
  `expect_resign_date` date NULL DEFAULT NULL COMMENT '期望离职日期',
  `approver_id` int NULL DEFAULT NULL COMMENT '审批人ID',
  `approve_time` datetime NULL DEFAULT NULL COMMENT '审批时间',
  `approve_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审批意见',
  `status` tinyint NULL DEFAULT 0 COMMENT '状态 0:待审核 1:已通过 2:已驳回',
  `actual_resign_date` date NULL DEFAULT NULL COMMENT '实际离职日期',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '员工离职申请表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee_resignation
-- ----------------------------
INSERT INTO `employee_resignation` VALUES (1, 5296, 1, '辐射带动', '2026-03-09', 5303, '2026-04-01 14:43:04', '不同意', 2, NULL, '2026-03-31 11:25:45', '2026-04-01 14:43:04');
INSERT INTO `employee_resignation` VALUES (12, 5308, 1, '范德萨', '2026-03-31', 5299, '2026-03-31 17:42:56', '同意', 1, '2026-03-31', '2026-03-31 17:42:05', '2026-03-31 17:42:55');
INSERT INTO `employee_resignation` VALUES (13, 5299, 1, '范德萨怪怪的', '2026-04-07', 5302, '2026-04-07 15:54:22', '个体户', 2, NULL, '2026-04-07 15:44:56', '2026-04-07 15:54:21');
INSERT INTO `employee_resignation` VALUES (14, 5309, 1, '发的苟富贵', '2026-04-07', 5303, '2026-04-07 15:57:17', '通过', 1, '2026-04-07', '2026-04-07 15:55:50', '2026-04-07 15:57:16');

-- ----------------------------
-- Table structure for employeeec
-- ----------------------------
DROP TABLE IF EXISTS `employeeec`;
CREATE TABLE `employeeec`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `eid` int NULL DEFAULT NULL COMMENT '员工编号',
  `ecDate` date NULL DEFAULT NULL COMMENT '奖罚日期',
  `ecReason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '奖罚原因',
  `ecPoint` int NULL DEFAULT NULL COMMENT '奖罚分',
  `ecType` int NULL DEFAULT NULL COMMENT '奖罚类别，0：奖，1：罚',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`eid` ASC) USING BTREE,
  CONSTRAINT `employeeec_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 133 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of employeeec
-- ----------------------------
INSERT INTO `employeeec` VALUES (131, 5271, '2023-03-15', '测试', NULL, 19, '测试');
INSERT INTO `employeeec` VALUES (132, 5268, '2026-03-09', '范德萨', NULL, 5, '四方达');

-- ----------------------------
-- Table structure for employeeremove
-- ----------------------------
DROP TABLE IF EXISTS `employeeremove`;
CREATE TABLE `employeeremove`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `eid` int NULL DEFAULT NULL,
  `afterDepId` int NULL DEFAULT NULL COMMENT '调动后部门',
  `afterJobId` int NULL DEFAULT NULL COMMENT '调动后职位',
  `removeDate` date NULL DEFAULT NULL COMMENT '调动日期',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调动原因',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`eid` ASC) USING BTREE,
  CONSTRAINT `employeeremove_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of employeeremove
-- ----------------------------
INSERT INTO `employeeremove` VALUES (11, 5268, 1, 15, '2023-03-10', NULL, NULL);
INSERT INTO `employeeremove` VALUES (12, 5268, 1, 14, '2023-03-10', NULL, NULL);
INSERT INTO `employeeremove` VALUES (13, 5268, 1, 14, '2023-03-10', NULL, NULL);
INSERT INTO `employeeremove` VALUES (14, 5268, 1, 14, '2023-03-10', NULL, NULL);
INSERT INTO `employeeremove` VALUES (15, 5268, 1, 14, '2023-03-10', NULL, NULL);
INSERT INTO `employeeremove` VALUES (16, 5271, 148, 16, '2023-03-15', NULL, NULL);

-- ----------------------------
-- Table structure for employeetrain
-- ----------------------------
DROP TABLE IF EXISTS `employeetrain`;
CREATE TABLE `employeetrain`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `eid` int NULL DEFAULT NULL COMMENT '员工编号',
  `trainstartDate` date NULL DEFAULT NULL COMMENT '培训开始日期',
  `trainfinishDate` datetime NULL DEFAULT NULL COMMENT '培训结束日期',
  `trainContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '培训内容',
  `trainstatus` tinyint NULL DEFAULT NULL COMMENT '培训状态',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`eid` ASC) USING BTREE,
  CONSTRAINT `employeetrain_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 232 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of employeetrain
-- ----------------------------
INSERT INTO `employeetrain` VALUES (231, 5271, '2026-03-02', '2026-03-09 00:00:00', '转正考核', 1, '考核');

-- ----------------------------
-- Table structure for empsalary
-- ----------------------------
DROP TABLE IF EXISTS `empsalary`;
CREATE TABLE `empsalary`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `eid` int NULL DEFAULT NULL,
  `sid` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `eid`(`eid` ASC) USING BTREE,
  INDEX `empsalary_ibfk_2`(`sid` ASC) USING BTREE,
  CONSTRAINT `empsalary_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `empsalary_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `salary` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 116 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of empsalary
-- ----------------------------
INSERT INTO `empsalary` VALUES (109, 5268, 10);
INSERT INTO `empsalary` VALUES (110, 5268, 26);
INSERT INTO `empsalary` VALUES (111, 5271, 10);
INSERT INTO `empsalary` VALUES (112, 5271, 10);
INSERT INTO `empsalary` VALUES (113, 5271, 10);
INSERT INTO `empsalary` VALUES (114, 5268, 26);
INSERT INTO `empsalary` VALUES (115, 5271, 10);

-- ----------------------------
-- Table structure for fileup
-- ----------------------------
DROP TABLE IF EXISTS `fileup`;
CREATE TABLE `fileup`  (
  `fileld` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `filePath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fileName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fileSize` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fileType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fileDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`fileld`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fileup
-- ----------------------------

-- ----------------------------
-- Table structure for handover
-- ----------------------------
DROP TABLE IF EXISTS `handover`;
CREATE TABLE `handover`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `handover_by` int NULL DEFAULT NULL COMMENT '交接人',
  `receive_by` int NULL DEFAULT NULL COMMENT '接收人',
  `handover_time` datetime NULL DEFAULT NULL COMMENT '交接时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `item_names` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '交接物品，逗号分隔',
  `create_by` int NULL DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人姓名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of handover
-- ----------------------------
INSERT INTO `handover` VALUES (1, 5302, 5303, '2026-04-02 16:44:19', '', '工服,发票本', NULL, '系统管理员', '2026-04-02 16:44:22');
INSERT INTO `handover` VALUES (4, 5309, 5300, '2026-04-07 15:56:37', '发达', '对讲机,工服,宿舍钥匙,宿舍用品三件套', NULL, '系统管理员', '2026-04-07 15:56:45');

-- ----------------------------
-- Table structure for hr
-- ----------------------------
DROP TABLE IF EXISTS `hr`;
CREATE TABLE `hr`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'hrID',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `telephone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '住宅电话',
  `address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址',
  `enabled` tinyint(1) NULL DEFAULT 1,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `userface` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `employee_id` int NULL DEFAULT NULL COMMENT '员工Id',
  `work_date` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hr
-- ----------------------------
INSERT INTO `hr` VALUES (3, '系统管理员', '18568887789', '029-82881234', '深圳南山', 1, 'admin', '$2a$10$ey5EvT8bEjRGvlAV2Bs6Su8ct9V/h69UxTs7TSn8t8..nNpLs3igu', 'https://imgsa.baidu.com/forum/pic/item/a832bc315c6034a8df786e5ac31349540823766e.jpg', NULL, NULL, '2023-02-28,2023-03-07,2023-03-14,2023-03-15,2023-03-20,2023-03-08,2023-03-02,2023-03-10,2023-03-16,2023-03-24,2023-03-06,2026-02-23,2026-03-05,2026-03-05,@2026-04-05_早,2026-04-09,@2026-04-09_中');
INSERT INTO `hr` VALUES (5, '李白', '18568123489', '029-82123434', '海口美兰', 1, 'libai', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://imgsa.baidu.com/forum/pic/item/a832bc315c6034a8df786e5ac31349540823766e.jpg', NULL, NULL, NULL);
INSERT INTO `hr` VALUES (10, '韩愈', '18568123666', '029-82111555', '广州番禺', 1, 'hanyu', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://imgsa.baidu.com/forum/pic/item/f9ebc3cec3fdfc0323f23563dc3f8794a5c2267e.jpg', NULL, NULL, NULL);
INSERT INTO `hr` VALUES (11, '柳宗元', '18568123377', '029-82111333', '广州天河', 1, 'liuzongyuan', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://imgsa.baidu.com/forum/pic/item/3ea40f2442a7d933062c32a8a54bd11372f00178.jpg', NULL, NULL, NULL);
INSERT INTO `hr` VALUES (12, '曾巩', '18568128888', '029-82111222', '广州越秀', 1, 'zenggong', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://imgsa.baidu.com/forum/pic/item/83a0d0a20cf431ad9c5595e24336acaf2fdd9879.jpg', NULL, NULL, NULL);
INSERT INTO `hr` VALUES (13, '徐凤年', '18568887789', '029-82881234', '深圳南山', 1, 'xufengnian', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://imgsa.baidu.com/forum/pic/item/a832bc315c6034a8df786e5ac31349540823766e.jpg', NULL, NULL, NULL);
INSERT INTO `hr` VALUES (15, '徐晓', '18568123489', '029-82123434', '海口美兰', 1, 'xuxiao', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://imgsa.baidu.com/forum/pic/item/a832bc315c6034a8df786e5ac31349540823766e.jpg', NULL, NULL, NULL);
INSERT INTO `hr` VALUES (16, '轩辕青峰', '18568123666', '029-82111555', '广州番禺', 1, 'xuanyuanqingfeng', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://imgsa.baidu.com/forum/pic/item/f9ebc3cec3fdfc0323f23563dc3f8794a5c2267e.jpg', NULL, NULL, NULL);
INSERT INTO `hr` VALUES (17, '青鸟', '18568123377', '029-82111333', '广州天河', 1, 'qingniao', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://imgsa.baidu.com/forum/pic/item/3ea40f2442a7d933062c32a8a54bd11372f00178.jpg', NULL, NULL, NULL);
INSERT INTO `hr` VALUES (18, '超级用户', '18568128888', '029-82111222', '广州越秀', 1, 'root', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://imgsa.baidu.com/forum/pic/item/83a0d0a20cf431ad9c5595e24336acaf2fdd9879.jpg', NULL, NULL, NULL);
INSERT INTO `hr` VALUES (19, '徐脂虎', '18568887789', '029-82881234', '深圳南山', 1, 'xuzhihu', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://imgsa.baidu.com/forum/pic/item/3ea40f2442a7d933062c32a8a54bd11372f00178.jpg', NULL, NULL, NULL);
INSERT INTO `hr` VALUES (20, '徐渭熊', '18568123489', '029-82123434', '海口美兰', 1, 'xuweixiong', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://imgsa.baidu.com/forum/pic/item/a832bc315c6034a8df786e5ac31349540823766e.jpg', NULL, NULL, NULL);
INSERT INTO `hr` VALUES (21, '徐念凉', '18568123666', '029-82111555', '广州番禺', 1, 'xunianliang', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://imgsa.baidu.com/forum/pic/item/f9ebc3cec3fdfc0323f23563dc3f8794a5c2267e.jpg', NULL, NULL, NULL);
INSERT INTO `hr` VALUES (22, '太阿剑九黄', '18568123377', '029-82111333', '广州天河', 1, 'laohuang', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://imgsa.baidu.com/forum/pic/item/3ea40f2442a7d933062c32a8a54bd11372f00178.jpg', NULL, NULL, NULL);
INSERT INTO `hr` VALUES (23, '白衣僧人李当心', '18568128888', '029-82111222', '广州越秀', 1, 'lidangxin', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://imgsa.baidu.com/forum/pic/item/a832bc315c6034a8df786e5ac31349540823766e.jpg', NULL, NULL, NULL);
INSERT INTO `hr` VALUES (24, '武帝城于新郎', '18568887789', '029-82881234', '深圳南山', 1, 'yuxinlang', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://imgsa.baidu.com/forum/pic/item/f9ebc3cec3fdfc0323f23563dc3f8794a5c2267e.jpg', NULL, NULL, NULL);
INSERT INTO `hr` VALUES (25, '南诏韦淼', '18568123489', '029-82123434', '海口美兰', 1, 'weita', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://imgsa.baidu.com/forum/pic/item/3ea40f2442a7d933062c32a8a54bd11372f00178.jpg', NULL, NULL, NULL);
INSERT INTO `hr` VALUES (26, '东越剑池柴青山', '18568123666', '029-82111555', '广州番禺', 1, '东越剑池柴青山', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://imgsa.baidu.com/forum/pic/item/83a0d0a20cf431ad9c5595e24336acaf2fdd9879.jpg', NULL, NULL, NULL);
INSERT INTO `hr` VALUES (28, '温华', '18568128888', '029-82111222', '广州越秀', 1, 'zenggong', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517070040185&di=be0375e0c3db6c311b837b28c208f318&imgtype=0&src=http%3A%2F%2Fimg2.soyoung.com%2Fpost%2F20150213%2F6%2F20150213141918532.jpg', NULL, NULL, NULL);
INSERT INTO `hr` VALUES (29, '李义山', '18568887789', '029-82881234', '深圳南山', 1, 'liyishan', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'http://bpic.588ku.com/element_pic/01/40/00/64573ce2edc0728.jpg', NULL, NULL, NULL);
INSERT INTO `hr` VALUES (30, '王初冬', '18568123489', '029-82123434', '海口美兰', 1, 'wangchudong', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1514093920321&di=913e88c23f382933ef430024afd9128a&imgtype=0&src=http%3A%2F%2Fp.3761.com%2Fpic%2F9771429316733.jpg', NULL, NULL, NULL);
INSERT INTO `hr` VALUES (31, '陆丞燕', '18568123666', '029-82111555', '广州番禺', 1, '陆丞燕', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1406745149,1563524794&fm=27&gp=0.jpg', NULL, NULL, NULL);
INSERT INTO `hr` VALUES (32, '鱼玄机', '18568123377', '029-82111333', '广州天河', 1, 'yuxuanji', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1515233756&di=0856d923a0a37a87fd26604a2c871370&imgtype=jpg&er=1&src=http%3A%2F%2Fwww.qqzhi.com%2Fuploadpic%2F2014-09-27%2F041716704.jpg', NULL, NULL, NULL);
INSERT INTO `hr` VALUES (33, '南宫仆射', '18568128888', '029-82111222', '广州越秀', 1, '南宫仆射', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517070040185&di=be0375e0c3db6c311b837b28c208f318&imgtype=0&src=http%3A%2F%2Fimg2.soyoung.com%2Fpost%2F20150213%2F6%2F20150213141918532.jpg', NULL, NULL, NULL);
INSERT INTO `hr` VALUES (34, '姜泥', '18568887789', '029-82881234', '深圳南山', 1, '姜泥', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'http://bpic.588ku.com/element_pic/01/40/00/64573ce2edc0728.jpg', NULL, NULL, NULL);
INSERT INTO `hr` VALUES (35, '西楚曹长卿', '18568123489', '029-82123434', '海口美兰', 1, '曹长卿', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1514093920321&di=913e88c23f382933ef430024afd9128a&imgtype=0&src=http%3A%2F%2Fp.3761.com%2Fpic%2F9771429316733.jpg', NULL, NULL, NULL);
INSERT INTO `hr` VALUES (36, '孙希济　', '18568123666', '029-82111555', '广州番禺', 1, '孙希济', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1406745149,1563524794&fm=27&gp=0.jpg', NULL, NULL, NULL);
INSERT INTO `hr` VALUES (38, '耶律洪才', '18568128888', '029-82111222', '广州越秀', 1, '耶律洪才', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517070040185&di=be0375e0c3db6c311b837b28c208f318&imgtype=0&src=http%3A%2F%2Fimg2.soyoung.com%2Fpost%2F20150213%2F6%2F20150213141918532.jpg', NULL, NULL, NULL);
INSERT INTO `hr` VALUES (39, '赫连武威', '18568887789', '029-82881234', '深圳南山', 1, '赫连武威', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'http://bpic.588ku.com/element_pic/01/40/00/64573ce2edc0728.jpg', NULL, NULL, NULL);
INSERT INTO `hr` VALUES (40, '呼延大观', '18568123489', '029-82123434', '海口美兰', 1, '呼延大观', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1514093920321&di=913e88c23f382933ef430024afd9128a&imgtype=0&src=http%3A%2F%2Fp.3761.com%2Fpic%2F9771429316733.jpg', NULL, NULL, NULL);
INSERT INTO `hr` VALUES (41, '轩辕敬城', '18568123666', '029-82111555', '广州番禺', 1, '轩辕敬城', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1406745149,1563524794&fm=27&gp=0.jpg', NULL, NULL, NULL);
INSERT INTO `hr` VALUES (43, '耶律洪才', '18568128888', '029-82111222', '广州越秀', 1, '耶律洪才', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517070040185&di=be0375e0c3db6c311b837b28c208f318&imgtype=0&src=http%3A%2F%2Fimg2.soyoung.com%2Fpost%2F20150213%2F6%2F20150213141918532.jpg', NULL, NULL, NULL);
INSERT INTO `hr` VALUES (44, '员工角色', '2342342', '32423423', '员工角色', 1, '员工角色', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://imgsa.baidu.com/forum/pic/item/a832bc315c6034a8df786e5ac31349540823766e.jpg', '员工角色', NULL, NULL);
INSERT INTO `hr` VALUES (45, '何婷', '2342342', '32423423', '测试', 1, '小红', '$2a$10$JTTFom4NKb5SCv8L0F.bKeF58S7oSPT8s7vlmu8G0fz7Po.vjW1Hy', 'https://imgsa.baidu.com/forum/pic/item/a832bc315c6034a8df786e5ac31349540823766e.jpg', '测试小红', 5268, '2026-03-09,2026-03-08,2026-03-03,2026-03-02,2026-03-01,2026-03-04');
INSERT INTO `hr` VALUES (46, '张明', '15696756582', '32423423', '无', 1, '小白', '$2a$10$KGgUwzjGXyIwLovDLccnkOfTYMVMSIFs4CMVpH/.f1DxRN.DPvnuO', 'https://imgsa.baidu.com/forum/pic/item/a832bc315c6034a8df786e5ac31349540823766e.jpg', NULL, 5271, '2023-03-09,2023-03-14,2023-03-19,2023-03-27,2023-04-04,2023-04-03,2023-03-29');
INSERT INTO `hr` VALUES (49, '的', '11155556666', '11155556666', '法式', 1, '的', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://imgsa.baidu.com/forum/pic/item/a832bc315c6034a8df786e5ac31349540823766e.jpg', NULL, 5273, NULL);
INSERT INTO `hr` VALUES (51, '张晓明', '13800138001', '13800138001', '上海市浦东新区', 1, '张晓明', '$2a$10$JTTFom4NKb5SCv8L0F.bKeF58S7oSPT8s7vlmu8G0fz7Po.vjW1Hy', 'https://imgsa.baidu.com/forum/pic/item/a832bc315c6034a8df786e5ac31349540823766e.jpg', NULL, 5294, NULL);
INSERT INTO `hr` VALUES (52, '李娜', '13900139002', '13900139002', '南京市鼓楼区', 1, '李娜', '$2a$10$JTTFom4NKb5SCv8L0F.bKeF58S7oSPT8s7vlmu8G0fz7Po.vjW1Hy', 'https://imgsa.baidu.com/forum/pic/item/a832bc315c6034a8df786e5ac31349540823766e.jpg', NULL, 5295, NULL);
INSERT INTO `hr` VALUES (53, '王强', '13700137003', '13700137003', '杭州市西湖区', 1, '王强', '$2a$10$JTTFom4NKb5SCv8L0F.bKeF58S7oSPT8s7vlmu8G0fz7Po.vjW1Hy', 'https://imgsa.baidu.com/forum/pic/item/a832bc315c6034a8df786e5ac31349540823766e.jpg', NULL, 5296, NULL);
INSERT INTO `hr` VALUES (54, '刘芳', '13600136004', '13600136004', '广州市天河区', 1, '刘芳', '$2a$10$JTTFom4NKb5SCv8L0F.bKeF58S7oSPT8s7vlmu8G0fz7Po.vjW1Hy', 'https://imgsa.baidu.com/forum/pic/item/a832bc315c6034a8df786e5ac31349540823766e.jpg', NULL, 5297, NULL);
INSERT INTO `hr` VALUES (55, '赵伟', '13500135005', '13500135005', '成都市锦江区', 1, '赵伟', '$2a$10$JTTFom4NKb5SCv8L0F.bKeF58S7oSPT8s7vlmu8G0fz7Po.vjW1Hy', 'https://imgsa.baidu.com/forum/pic/item/a832bc315c6034a8df786e5ac31349540823766e.jpg', NULL, 5298, '@2026-04-07_中');
INSERT INTO `hr` VALUES (56, '陈静', '13400134006', '13400134006', '西安市雁塔区', 1, '陈静', '$2a$10$JTTFom4NKb5SCv8L0F.bKeF58S7oSPT8s7vlmu8G0fz7Po.vjW1Hy', 'https://imgsa.baidu.com/forum/pic/item/a832bc315c6034a8df786e5ac31349540823766e.jpg', NULL, 5299, NULL);
INSERT INTO `hr` VALUES (57, '孙磊', '13300133007', '13300133007', '济南市历下区', 1, '孙磊', '$2a$10$JTTFom4NKb5SCv8L0F.bKeF58S7oSPT8s7vlmu8G0fz7Po.vjW1Hy', 'https://imgsa.baidu.com/forum/pic/item/a832bc315c6034a8df786e5ac31349540823766e.jpg', NULL, 5300, NULL);
INSERT INTO `hr` VALUES (58, '周敏', '13200132008', '13200132008', '长沙市岳麓区', 1, '周敏', '$2a$10$JTTFom4NKb5SCv8L0F.bKeF58S7oSPT8s7vlmu8G0fz7Po.vjW1Hy', 'https://imgsa.baidu.com/forum/pic/item/a832bc315c6034a8df786e5ac31349540823766e.jpg', NULL, 5301, NULL);
INSERT INTO `hr` VALUES (59, '吴刚', '13100131009', '13100131009', '合肥市蜀山区', 1, '吴刚', '$2a$10$JTTFom4NKb5SCv8L0F.bKeF58S7oSPT8s7vlmu8G0fz7Po.vjW1Hy', 'https://imgsa.baidu.com/forum/pic/item/a832bc315c6034a8df786e5ac31349540823766e.jpg', NULL, 5302, NULL);
INSERT INTO `hr` VALUES (60, '郑雪', '13000130010', '13000130010', '武汉市洪山区', 1, '郑雪', '$2a$10$JTTFom4NKb5SCv8L0F.bKeF58S7oSPT8s7vlmu8G0fz7Po.vjW1Hy', 'https://imgsa.baidu.com/forum/pic/item/a832bc315c6034a8df786e5ac31349540823766e.jpg', NULL, 5303, '@2026-03-29_早,2026-03-29,@2026-04-04_早,2026-04-04,@2026-04-06_晚,2026-04-06,@2026-04-07_中,@2026-04-09_晚,@2026-04-10_早');
INSERT INTO `hr` VALUES (62, '发多少', '11166668888', '11166668888', '发', 1, '发多少', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://imgsa.baidu.com/forum/pic/item/a832bc315c6034a8df786e5ac31349540823766e.jpg', NULL, 5305, NULL);
INSERT INTO `hr` VALUES (63, '乳鸽', '11166669999', '11166669999', '发达', 1, '乳鸽', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://imgsa.baidu.com/forum/pic/item/a832bc315c6034a8df786e5ac31349540823766e.jpg', NULL, 5306, NULL);
INSERT INTO `hr` VALUES (65, '第三方', '11166668888', '11166668888', '防守打法', 0, '第三方', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://imgsa.baidu.com/forum/pic/item/a832bc315c6034a8df786e5ac31349540823766e.jpg', NULL, 5308, NULL);
INSERT INTO `hr` VALUES (66, '古法', '15699993256', '15699993256', '发达', 0, '古法', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://imgsa.baidu.com/forum/pic/item/a832bc315c6034a8df786e5ac31349540823766e.jpg', NULL, 5309, NULL);

-- ----------------------------
-- Table structure for hr_role
-- ----------------------------
DROP TABLE IF EXISTS `hr_role`;
CREATE TABLE `hr_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `hrid` int NULL DEFAULT NULL,
  `rid` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `rid`(`rid` ASC) USING BTREE,
  INDEX `hr_role_ibfk_1`(`hrid` ASC) USING BTREE,
  CONSTRAINT `hr_role_ibfk_1` FOREIGN KEY (`hrid`) REFERENCES `hr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `hr_role_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 559 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hr_role
-- ----------------------------
INSERT INTO `hr_role` VALUES (511, 45, 34);
INSERT INTO `hr_role` VALUES (512, 44, 34);
INSERT INTO `hr_role` VALUES (524, 16, 6);
INSERT INTO `hr_role` VALUES (525, 16, 2);
INSERT INTO `hr_role` VALUES (531, 5, 2);
INSERT INTO `hr_role` VALUES (532, 3, 6);
INSERT INTO `hr_role` VALUES (536, 46, 34);
INSERT INTO `hr_role` VALUES (538, 10, 6);
INSERT INTO `hr_role` VALUES (541, 49, 34);
INSERT INTO `hr_role` VALUES (542, 51, 34);
INSERT INTO `hr_role` VALUES (543, 52, 34);
INSERT INTO `hr_role` VALUES (544, 53, 34);
INSERT INTO `hr_role` VALUES (545, 54, 34);
INSERT INTO `hr_role` VALUES (546, 55, 34);
INSERT INTO `hr_role` VALUES (548, 56, 34);
INSERT INTO `hr_role` VALUES (549, 57, 34);
INSERT INTO `hr_role` VALUES (550, 58, 34);
INSERT INTO `hr_role` VALUES (551, 59, 34);
INSERT INTO `hr_role` VALUES (552, 60, 34);
INSERT INTO `hr_role` VALUES (554, 62, 34);
INSERT INTO `hr_role` VALUES (555, 63, 34);
INSERT INTO `hr_role` VALUES (557, 65, 34);
INSERT INTO `hr_role` VALUES (558, 66, 34);

-- ----------------------------
-- Table structure for joblevel
-- ----------------------------
DROP TABLE IF EXISTS `joblevel`;
CREATE TABLE `joblevel`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职称名称',
  `titleLevel` enum('高级','中级','初级') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `enabled` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of joblevel
-- ----------------------------
INSERT INTO `joblevel` VALUES (37, '初级', '初级', '2026-03-10 14:30:38', 1);
INSERT INTO `joblevel` VALUES (38, '中级', '中级', '2026-03-10 14:30:47', 1);
INSERT INTO `joblevel` VALUES (39, '高级', '高级', '2026-03-10 15:05:01', 1);

-- ----------------------------
-- Table structure for logtype
-- ----------------------------
DROP TABLE IF EXISTS `logtype`;
CREATE TABLE `logtype`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `logtypemsg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `adddate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of logtype
-- ----------------------------
INSERT INTO `logtype` VALUES (1, '系统设置修改', '2020-01-06 10:36:46');
INSERT INTO `logtype` VALUES (2, '员工入职', '2020-01-06 10:37:08');
INSERT INTO `logtype` VALUES (3, '员工奖惩', '2020-01-06 10:37:12');
INSERT INTO `logtype` VALUES (4, '员工培训', '2020-01-06 10:37:15');
INSERT INTO `logtype` VALUES (5, '员工调薪', '2020-01-06 10:37:19');
INSERT INTO `logtype` VALUES (6, '员工调动', NULL);
INSERT INTO `logtype` VALUES (7, '员工账套变更', NULL);
INSERT INTO `logtype` VALUES (8, '操作员更新', NULL);
INSERT INTO `logtype` VALUES (9, '员工离职', NULL);
INSERT INTO `logtype` VALUES (10, '员工考评', NULL);
INSERT INTO `logtype` VALUES (11, '员工资料', NULL);
INSERT INTO `logtype` VALUES (12, '员工晋升', NULL);
INSERT INTO `logtype` VALUES (13, '物品交接记录', NULL);
INSERT INTO `logtype` VALUES (14, '机构信息', NULL);
INSERT INTO `logtype` VALUES (15, '员工黑名单', NULL);

-- ----------------------------
-- Table structure for main_notice
-- ----------------------------
DROP TABLE IF EXISTS `main_notice`;
CREATE TABLE `main_notice`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mainbody` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `authon` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of main_notice
-- ----------------------------

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `path` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `component` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `iconCls` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keepAlive` tinyint(1) NULL DEFAULT NULL,
  `requireAuth` tinyint(1) NULL DEFAULT NULL,
  `parentId` int NULL DEFAULT NULL,
  `enabled` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parentId`(`parentId` ASC) USING BTREE,
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parentId`) REFERENCES `menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '/', NULL, NULL, '主菜单', NULL, NULL, NULL, NULL, 1);
INSERT INTO `menu` VALUES (2, '/', '/home', 'Home', '员工信息管理', 'fa fa-user-circle-o', NULL, 1, 1, 1);
INSERT INTO `menu` VALUES (3, '/', '/home', 'Home', '组织架构管理', 'fa fa-sitemap', NULL, 1, 1, 1);
INSERT INTO `menu` VALUES (4, '/', '/home', 'Home', '考勤与排班管理', 'fa fa-calendar-check-o', NULL, 1, 1, 1);
INSERT INTO `menu` VALUES (5, '/', '/home', 'Home', '薪酬福利管理', 'fa fa-money', NULL, 1, 1, 1);
INSERT INTO `menu` VALUES (6, '/', '/home', 'Home', '个人信息', 'fa fa-user-circle-o', NULL, 1, 1, 1);
INSERT INTO `menu` VALUES (13, '/', '/home', 'Home', '职级晋升与异动管理', 'fa fa-address-card-o', NULL, 1, 1, 1);
INSERT INTO `menu` VALUES (34, '/', '/home', 'Home', '培训与考核管理', 'fa fa-graduation-cap', NULL, 1, 1, 1);
INSERT INTO `menu` VALUES (35, '/', '/home', 'Home', '离职与交接管理', 'fa fa-sign-out', NULL, 1, 1, 1);
INSERT INTO `menu` VALUES (36, '/', '/home', 'Home', '合作机构管理', 'fa fa-handshake-o', NULL, 1, 1, 1);
INSERT INTO `menu` VALUES (38, '/', '/home', 'Home', '系统管理', 'fa fa-windows', NULL, 1, 1, 1);
INSERT INTO `menu` VALUES (47, '/employee/basic/**', '/emp/basic', 'EmpBasic', '员工档案', 'fa fa-id-card-o', NULL, 1, 2, 1);
INSERT INTO `menu` VALUES (48, '/employee/advanced/**', '/emp/adv', 'EmpAdv', '高级资料', 'fa fa-id-card', NULL, 1, 6, 1);
INSERT INTO `menu` VALUES (49, '/employee/basic/**', '/emp/basic2', 'EmpBasic2', '基本资料', 'fa fa-id-card-o', NULL, 1, 6, 1);
INSERT INTO `menu` VALUES (50, '/personnel/ec/**', '/per/ec', 'PerEc', '员工奖惩', 'fa fa-thumbs-up', NULL, 1, 5, 1);
INSERT INTO `menu` VALUES (51, '/personnel/train/**', '/per/train', 'PerTrain', '员工培训', 'fa fa-book', NULL, 1, 34, 1);
INSERT INTO `menu` VALUES (52, '/personnel/salary/**', '/per/salary', 'PerSalary', '员工调薪', 'fa fa-calculator', NULL, 1, 5, NULL);
INSERT INTO `menu` VALUES (53, '/personnel/remove/**', '/per/mv', 'PerMv', '调动职务', 'fa fa-arrows-h', NULL, 1, 13, 1);
INSERT INTO `menu` VALUES (54, '/salary/sob/**', '/sal/sob', 'SalSob', '工资账套管理', 'fa fa-credit-card-alt ', NULL, 1, 5, 1);
INSERT INTO `menu` VALUES (55, '/salary/sobcfg/**', '/sal/sobcfg', 'SalSobCfg', '员工账套设置', 'fa fa-cc-amex', NULL, 1, 5, 1);
INSERT INTO `menu` VALUES (56, '/salary/table/**', '/sal/table', 'SalTable', '工资表管理', 'fa fa-indent', NULL, 1, 5, 1);
INSERT INTO `menu` VALUES (63, '/system/basic/**', '/sys/basic', 'SysBasic', '基础信息设置', 'fa fa-cogs', NULL, 1, 3, 1);
INSERT INTO `menu` VALUES (64, '/system/cfg/**', '/sys/cfg', 'SysCfg', '公告管理', 'fa fa-steam-square', NULL, 1, 38, NULL);
INSERT INTO `menu` VALUES (65, '/system/log/**', '/sys/log', 'SysLog', '操作日志管理', 'fa fa-list', NULL, 1, 38, 1);
INSERT INTO `menu` VALUES (66, '/system/hr/**', '/sys/hr', 'SysHr', '操作员管理', 'fa fa-users', NULL, 1, 38, 1);
INSERT INTO `menu` VALUES (67, '/system/hr/**', '/sys/hrbase', 'SysHrBase', '个人中心', 'fa fa-users', NULL, 1, 38, 1);
INSERT INTO `menu` VALUES (68, '/employee/basic/**', '/emp/calenderBox', 'EmpCalenderBox', '员工打卡', 'fa fa-braille', NULL, 1, 6, 1);
INSERT INTO `menu` VALUES (69, '/personnel/train/**', '/per/train2', 'PerTrain2', '个人培训', 'fa fa-user-plus', NULL, 1, 6, 1);
INSERT INTO `menu` VALUES (70, '/personnel/ec/**', '/per/ec2', 'PerEc2', '个人奖惩', 'fa fa-american-sign-language-interpreting', NULL, 1, 6, 1);
INSERT INTO `menu` VALUES (71, '/personnel/remove/**', '/per/mv2', 'PerMv2', '个人调动', 'fa fa-blind', NULL, 1, 6, 1);
INSERT INTO `menu` VALUES (72, '/personnel/salary/**', '/per/salary2', 'PerSalary2', '个人调薪', 'fa fa-braille', NULL, 1, 6, 1);
INSERT INTO `menu` VALUES (73, '/personnel/ec/**', '/per/work', 'PerWork', '考勤管理', 'fa fa-check-square-o', NULL, 1, 4, 1);
INSERT INTO `menu` VALUES (74, '/employee/basic/**', '/emp/resignation', 'EmpResignation', '离职管理', 'fa fa-user-times', NULL, 1, 35, 1);
INSERT INTO `menu` VALUES (75, '/employee/basic/**', '/emp/handover', 'EmpHandover', '交接物品管理', 'fa fa-exchange', NULL, 1, 35, 1);
INSERT INTO `menu` VALUES (76, '/organization/agency/**', '/org/agency', 'OrgAgency', '机构信息', 'fa fa-list', NULL, 1, 36, 1);
INSERT INTO `menu` VALUES (77, '/personnel/ec/**', '/per/schedule', 'PerSchedule', '排班管理', 'fa fa-calendar', NULL, 1, 4, 1);
INSERT INTO `menu` VALUES (78, '/employee/black/**', '/emp/black', 'EmpBlack', '黑名单', 'fa fa-ban', NULL, 1, 2, 1);
INSERT INTO `menu` VALUES (79, '/personnel/remove/**', '/per/apply', 'PerApply', '晋升申请与审批', 'fa fa-arrow-up', NULL, 1, 13, 1);

-- ----------------------------
-- Table structure for menu_role
-- ----------------------------
DROP TABLE IF EXISTS `menu_role`;
CREATE TABLE `menu_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `mid` int NULL DEFAULT NULL,
  `rid` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mid`(`mid` ASC) USING BTREE,
  INDEX `rid`(`rid` ASC) USING BTREE,
  CONSTRAINT `menu_role_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `menu_role_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1350 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu_role
-- ----------------------------
INSERT INTO `menu_role` VALUES (1259, 47, 6);
INSERT INTO `menu_role` VALUES (1260, 78, 6);
INSERT INTO `menu_role` VALUES (1261, 63, 6);
INSERT INTO `menu_role` VALUES (1262, 73, 6);
INSERT INTO `menu_role` VALUES (1263, 77, 6);
INSERT INTO `menu_role` VALUES (1264, 50, 6);
INSERT INTO `menu_role` VALUES (1265, 54, 6);
INSERT INTO `menu_role` VALUES (1266, 55, 6);
INSERT INTO `menu_role` VALUES (1267, 56, 6);
INSERT INTO `menu_role` VALUES (1268, 53, 6);
INSERT INTO `menu_role` VALUES (1269, 79, 6);
INSERT INTO `menu_role` VALUES (1271, 51, 6);
INSERT INTO `menu_role` VALUES (1272, 74, 6);
INSERT INTO `menu_role` VALUES (1273, 75, 6);
INSERT INTO `menu_role` VALUES (1274, 76, 6);
INSERT INTO `menu_role` VALUES (1275, 65, 6);
INSERT INTO `menu_role` VALUES (1276, 66, 6);
INSERT INTO `menu_role` VALUES (1277, 67, 6);
INSERT INTO `menu_role` VALUES (1332, 47, 2);
INSERT INTO `menu_role` VALUES (1333, 78, 2);
INSERT INTO `menu_role` VALUES (1334, 50, 2);
INSERT INTO `menu_role` VALUES (1335, 53, 2);
INSERT INTO `menu_role` VALUES (1336, 51, 2);
INSERT INTO `menu_role` VALUES (1337, 76, 2);
INSERT INTO `menu_role` VALUES (1338, 73, 34);
INSERT INTO `menu_role` VALUES (1339, 48, 34);
INSERT INTO `menu_role` VALUES (1340, 49, 34);
INSERT INTO `menu_role` VALUES (1341, 68, 34);
INSERT INTO `menu_role` VALUES (1342, 69, 34);
INSERT INTO `menu_role` VALUES (1343, 70, 34);
INSERT INTO `menu_role` VALUES (1344, 71, 34);
INSERT INTO `menu_role` VALUES (1345, 72, 34);
INSERT INTO `menu_role` VALUES (1346, 79, 34);
INSERT INTO `menu_role` VALUES (1347, 74, 34);
INSERT INTO `menu_role` VALUES (1348, 75, 34);
INSERT INTO `menu_role` VALUES (1349, 67, 34);

-- ----------------------------
-- Table structure for msgcontent
-- ----------------------------
DROP TABLE IF EXISTS `msgcontent`;
CREATE TABLE `msgcontent`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of msgcontent
-- ----------------------------

-- ----------------------------
-- Table structure for nation
-- ----------------------------
DROP TABLE IF EXISTS `nation`;
CREATE TABLE `nation`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of nation
-- ----------------------------
INSERT INTO `nation` VALUES (1, '汉族');
INSERT INTO `nation` VALUES (2, '蒙古族');
INSERT INTO `nation` VALUES (3, '回族');
INSERT INTO `nation` VALUES (4, '藏族');
INSERT INTO `nation` VALUES (5, '维吾尔族');
INSERT INTO `nation` VALUES (6, '苗族');
INSERT INTO `nation` VALUES (7, '彝族');
INSERT INTO `nation` VALUES (8, '壮族');
INSERT INTO `nation` VALUES (9, '布依族');
INSERT INTO `nation` VALUES (10, '朝鲜族');
INSERT INTO `nation` VALUES (11, '满族');
INSERT INTO `nation` VALUES (12, '侗族');
INSERT INTO `nation` VALUES (13, '瑶族');
INSERT INTO `nation` VALUES (14, '白族');
INSERT INTO `nation` VALUES (15, '土家族');
INSERT INTO `nation` VALUES (16, '哈尼族');
INSERT INTO `nation` VALUES (17, '哈萨克族');
INSERT INTO `nation` VALUES (18, '傣族');
INSERT INTO `nation` VALUES (19, '黎族');
INSERT INTO `nation` VALUES (20, '傈僳族');
INSERT INTO `nation` VALUES (21, '佤族');
INSERT INTO `nation` VALUES (22, '畲族');
INSERT INTO `nation` VALUES (23, '高山族');
INSERT INTO `nation` VALUES (24, '拉祜族');
INSERT INTO `nation` VALUES (25, '水族');
INSERT INTO `nation` VALUES (26, '东乡族');
INSERT INTO `nation` VALUES (27, '纳西族');
INSERT INTO `nation` VALUES (28, '景颇族');
INSERT INTO `nation` VALUES (29, '柯尔克孜族');
INSERT INTO `nation` VALUES (30, '土族');
INSERT INTO `nation` VALUES (31, '达斡尔族');
INSERT INTO `nation` VALUES (32, '仫佬族');
INSERT INTO `nation` VALUES (33, '羌族');
INSERT INTO `nation` VALUES (34, '布朗族');
INSERT INTO `nation` VALUES (35, '撒拉族');
INSERT INTO `nation` VALUES (36, '毛难族');
INSERT INTO `nation` VALUES (37, '仡佬族');
INSERT INTO `nation` VALUES (38, '锡伯族');
INSERT INTO `nation` VALUES (39, '阿昌族');
INSERT INTO `nation` VALUES (40, '普米族');
INSERT INTO `nation` VALUES (41, '塔吉克族');
INSERT INTO `nation` VALUES (42, '怒族');
INSERT INTO `nation` VALUES (43, '乌孜别克族');
INSERT INTO `nation` VALUES (44, '俄罗斯族');
INSERT INTO `nation` VALUES (45, '鄂温克族');
INSERT INTO `nation` VALUES (46, '崩龙族');
INSERT INTO `nation` VALUES (47, '保安族');
INSERT INTO `nation` VALUES (48, '裕固族');
INSERT INTO `nation` VALUES (49, '京族');
INSERT INTO `nation` VALUES (50, '塔塔尔族');
INSERT INTO `nation` VALUES (51, '独龙族');
INSERT INTO `nation` VALUES (52, '鄂伦春族');
INSERT INTO `nation` VALUES (53, '赫哲族');
INSERT INTO `nation` VALUES (54, '门巴族');
INSERT INTO `nation` VALUES (55, '珞巴族');
INSERT INTO `nation` VALUES (56, '基诺族');

-- ----------------------------
-- Table structure for oplog
-- ----------------------------
DROP TABLE IF EXISTS `oplog`;
CREATE TABLE `oplog`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `logtype` tinyint NULL DEFAULT NULL COMMENT '日志类型，',
  `addDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加日期',
  `operate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作内容',
  `hrname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2949 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oplog
-- ----------------------------
INSERT INTO `oplog` VALUES (2649, 1, '2023-03-19 16:38:35', '角色权限变更', '系统管理员');
INSERT INTO `oplog` VALUES (2650, 1, '2023-03-19 16:54:31', '角色权限变更', '系统管理员');
INSERT INTO `oplog` VALUES (2651, 1, '2023-03-19 17:30:50', '角色权限变更', '系统管理员');
INSERT INTO `oplog` VALUES (2652, 1, '2023-03-19 17:31:55', '角色权限变更', '系统管理员');
INSERT INTO `oplog` VALUES (2653, 1, '2023-03-19 17:36:49', '角色权限变更', '系统管理员');
INSERT INTO `oplog` VALUES (2654, 1, '2023-03-19 17:36:57', '角色权限变更', '系统管理员');
INSERT INTO `oplog` VALUES (2655, 8, '2023-03-27 21:28:49', '操作员角色更新', '小白');
INSERT INTO `oplog` VALUES (2656, 8, '2023-03-27 21:28:55', '操作员角色更新', '小白');
INSERT INTO `oplog` VALUES (2657, 8, '2023-03-27 21:29:27', '操作员角色更新', '小白');
INSERT INTO `oplog` VALUES (2658, 1, '2023-04-06 21:01:26', '角色权限变更', '系统管理员');
INSERT INTO `oplog` VALUES (2659, 8, '2025-12-24 11:28:46', '操作员信息更新:系统管理员', '系统管理员');
INSERT INTO `oplog` VALUES (2660, 8, '2025-12-24 11:28:50', '操作员信息更新:系统管理员', '系统管理员');
INSERT INTO `oplog` VALUES (2661, 1, '2025-12-24 11:29:37', '删除部门:id=148', '系统管理员');
INSERT INTO `oplog` VALUES (2662, 1, '2025-12-24 11:29:51', '添加部门:上海区域', '系统管理员');
INSERT INTO `oplog` VALUES (2663, 1, '2025-12-24 11:30:02', '添加部门:杭州区域', '系统管理员');
INSERT INTO `oplog` VALUES (2664, 1, '2025-12-24 11:30:09', '添加部门:温州区域', '系统管理员');
INSERT INTO `oplog` VALUES (2665, 1, '2025-12-24 11:30:22', '添加部门:七宝', '系统管理员');
INSERT INTO `oplog` VALUES (2666, 1, '2025-12-24 11:30:27', '添加部门:五角场', '系统管理员');
INSERT INTO `oplog` VALUES (2667, 1, '2025-12-24 11:30:32', '添加部门:前厅', '系统管理员');
INSERT INTO `oplog` VALUES (2668, 1, '2025-12-24 11:30:38', '添加部门:后厨', '系统管理员');
INSERT INTO `oplog` VALUES (2669, 1, '2025-12-24 11:30:43', '添加部门:水吧', '系统管理员');
INSERT INTO `oplog` VALUES (2670, 1, '2025-12-24 11:33:44', '添加部门:后勤', '系统管理员');
INSERT INTO `oplog` VALUES (2671, 1, '2025-12-24 11:34:41', '删除部门:id=155', '系统管理员');
INSERT INTO `oplog` VALUES (2672, 1, '2025-12-24 11:34:42', '删除部门:id=156', '系统管理员');
INSERT INTO `oplog` VALUES (2673, 1, '2025-12-24 11:34:45', '删除部门:id=157', '系统管理员');
INSERT INTO `oplog` VALUES (2674, 1, '2025-12-24 11:34:50', '删除部门:id=158', '系统管理员');
INSERT INTO `oplog` VALUES (2675, 7, '2025-12-24 11:41:44', '员工套账变动:workId:5271套账编号:10', '系统管理员');
INSERT INTO `oplog` VALUES (2676, 1, '2025-12-24 12:02:28', '添加部门:七宝前厅', '系统管理员');
INSERT INTO `oplog` VALUES (2677, 1, '2025-12-24 12:02:37', '添加部门:七宝后厨', '系统管理员');
INSERT INTO `oplog` VALUES (2678, 1, '2025-12-24 12:02:45', '添加部门:七宝水吧', '系统管理员');
INSERT INTO `oplog` VALUES (2679, 1, '2025-12-24 12:02:53', '添加部门:七宝后勤', '系统管理员');
INSERT INTO `oplog` VALUES (2680, 1, '2025-12-24 12:03:36', '添加职位: 区域负责人', '系统管理员');
INSERT INTO `oplog` VALUES (2681, 1, '2025-12-24 12:17:53', '添加职位: 店长', '系统管理员');
INSERT INTO `oplog` VALUES (2682, 1, '2025-12-24 12:18:05', '添加职位: 初级领班', '系统管理员');
INSERT INTO `oplog` VALUES (2683, 1, '2025-12-24 12:18:12', '添加职位: 中级领班', '系统管理员');
INSERT INTO `oplog` VALUES (2684, 1, '2025-12-24 12:18:17', '添加职位: 高级领班', '系统管理员');
INSERT INTO `oplog` VALUES (2685, 1, '2025-12-24 12:18:27', '添加职位: 客情经理', '系统管理员');
INSERT INTO `oplog` VALUES (2686, 1, '2025-12-24 12:18:38', '添加职位: 初级服务员', '系统管理员');
INSERT INTO `oplog` VALUES (2687, 1, '2025-12-24 12:18:46', '添加职位: 中级服务员', '系统管理员');
INSERT INTO `oplog` VALUES (2688, 1, '2025-12-24 12:18:55', '添加职位: 高级服务员', '系统管理员');
INSERT INTO `oplog` VALUES (2689, 1, '2025-12-24 12:19:01', '添加职位: 初级收银', '系统管理员');
INSERT INTO `oplog` VALUES (2690, 1, '2025-12-24 12:19:07', '添加职位: 中级收银', '系统管理员');
INSERT INTO `oplog` VALUES (2691, 1, '2025-12-24 12:19:13', '添加职位: 高级收银', '系统管理员');
INSERT INTO `oplog` VALUES (2692, 1, '2025-12-24 12:19:23', '添加职位: 初级传菜员', '系统管理员');
INSERT INTO `oplog` VALUES (2693, 1, '2025-12-24 12:19:29', '添加职位: 中级传菜员', '系统管理员');
INSERT INTO `oplog` VALUES (2694, 1, '2025-12-24 12:19:37', '添加职位: 高级传菜员', '系统管理员');
INSERT INTO `oplog` VALUES (2695, 1, '2025-12-24 12:19:54', '添加职位: 初级迎宾', '系统管理员');
INSERT INTO `oplog` VALUES (2696, 1, '2025-12-24 12:19:59', '添加职位: 中级迎宾', '系统管理员');
INSERT INTO `oplog` VALUES (2697, 1, '2025-12-24 12:20:02', '添加职位: 高级迎宾', '系统管理员');
INSERT INTO `oplog` VALUES (2698, 1, '2025-12-24 12:20:20', '添加职位: 水吧长', '系统管理员');
INSERT INTO `oplog` VALUES (2700, 1, '2025-12-24 14:12:08', '添加职位: 初级吧员', '系统管理员');
INSERT INTO `oplog` VALUES (2701, 1, '2025-12-24 14:12:11', '添加职位: 中级吧员', '系统管理员');
INSERT INTO `oplog` VALUES (2702, 1, '2025-12-24 14:12:13', '添加职位: 高级吧员', '系统管理员');
INSERT INTO `oplog` VALUES (2703, 1, '2025-12-24 14:12:18', '添加职位: 厨师长', '系统管理员');
INSERT INTO `oplog` VALUES (2704, 1, '2025-12-24 14:12:22', '添加职位: 厨房主管', '系统管理员');
INSERT INTO `oplog` VALUES (2705, 1, '2025-12-24 14:12:32', '添加职位: 炉台主管', '系统管理员');
INSERT INTO `oplog` VALUES (2706, 1, '2025-12-24 14:12:39', '添加职位: 打荷', '系统管理员');
INSERT INTO `oplog` VALUES (2707, 1, '2025-12-24 14:12:44', '添加职位: 改刀', '系统管理员');
INSERT INTO `oplog` VALUES (2708, 1, '2025-12-24 14:12:47', '添加职位: 切配', '系统管理员');
INSERT INTO `oplog` VALUES (2709, 1, '2025-12-24 14:12:50', '添加职位: 炉台', '系统管理员');
INSERT INTO `oplog` VALUES (2710, 1, '2025-12-24 14:12:53', '添加职位: 蒸笼', '系统管理员');
INSERT INTO `oplog` VALUES (2711, 1, '2025-12-24 14:12:57', '添加职位: 保洁', '系统管理员');
INSERT INTO `oplog` VALUES (2712, 1, '2025-12-24 14:13:02', '添加职位: 洗碗', '系统管理员');
INSERT INTO `oplog` VALUES (2713, 1, '2025-12-24 14:13:07', '添加职位: 收台', '系统管理员');
INSERT INTO `oplog` VALUES (2714, 1, '2025-12-24 14:13:12', '添加职位: 补餐', '系统管理员');
INSERT INTO `oplog` VALUES (2715, 1, '2025-12-24 14:13:40', '添加职位: 烤箱', '系统管理员');
INSERT INTO `oplog` VALUES (2716, 1, '2025-12-24 14:16:01', '添加职称初级领班', '系统管理员');
INSERT INTO `oplog` VALUES (2717, 1, '2025-12-24 14:16:13', '添加职称中级领班', '系统管理员');
INSERT INTO `oplog` VALUES (2718, 1, '2025-12-24 14:17:19', '删除职称 : id=18', '系统管理员');
INSERT INTO `oplog` VALUES (2719, 1, '2025-12-24 14:17:20', '删除职称 : id=17', '系统管理员');
INSERT INTO `oplog` VALUES (2720, 1, '2025-12-24 17:22:46', '添加部门:1', '系统管理员');
INSERT INTO `oplog` VALUES (2721, 4, '2026-03-09 13:57:04', '批量添加培训:', '系统管理员');
INSERT INTO `oplog` VALUES (2722, 4, '2026-03-09 13:57:15', '取消员工培训eid:5268', '系统管理员');
INSERT INTO `oplog` VALUES (2723, 10, '2026-03-09 13:57:35', '添加员工考评eid:5268', '系统管理员');
INSERT INTO `oplog` VALUES (2724, 11, '2026-03-09 13:58:22', '更新员工资料::name:小白---workId:00000002', '系统管理员');
INSERT INTO `oplog` VALUES (2725, 11, '2026-03-09 13:58:27', '更新员工资料::name:小白---workId:00000002', '系统管理员');
INSERT INTO `oplog` VALUES (2726, 1, '2026-03-09 14:00:40', '添加公告范德萨', '系统管理员');
INSERT INTO `oplog` VALUES (2727, 3, '2026-03-09 14:09:53', '员工奖惩添加:eid=5268--ids:[5]', '系统管理员');
INSERT INTO `oplog` VALUES (2728, 4, '2026-03-09 14:10:22', '批量添加培训:', '系统管理员');
INSERT INTO `oplog` VALUES (2729, 8, '2026-03-09 14:25:19', '操作员角色更新', '系统管理员');
INSERT INTO `oplog` VALUES (2730, 1, '2026-03-09 16:39:40', '批量删除公告:ids = [Ljava.lang.Integer;@17e53132', '系统管理员');
INSERT INTO `oplog` VALUES (2731, 1, '2026-03-10 13:40:29', '角色权限变更', '系统管理员');
INSERT INTO `oplog` VALUES (2732, 1, '2026-03-10 13:40:37', '角色权限变更', '系统管理员');
INSERT INTO `oplog` VALUES (2733, 1, '2026-03-10 13:41:02', '角色权限变更', '系统管理员');
INSERT INTO `oplog` VALUES (2734, 1, '2026-03-10 14:07:58', '角色权限变更', '系统管理员');
INSERT INTO `oplog` VALUES (2735, 1, '2026-03-10 14:15:02', '删除部门:id=148', '系统管理员');
INSERT INTO `oplog` VALUES (2736, 1, '2026-03-10 14:15:23', '删除职位: id = 119', '系统管理员');
INSERT INTO `oplog` VALUES (2737, 1, '2026-03-10 14:15:25', '删除职位: id = 29', '系统管理员');
INSERT INTO `oplog` VALUES (2738, 1, '2026-03-10 14:15:27', '删除职位: id = 30', '系统管理员');
INSERT INTO `oplog` VALUES (2742, 1, '2026-03-10 14:15:35', '删除职位: id = 34', '系统管理员');
INSERT INTO `oplog` VALUES (2743, 1, '2026-03-10 14:15:37', '删除职位: id = 115', '系统管理员');
INSERT INTO `oplog` VALUES (2744, 1, '2026-03-10 14:15:39', '删除职位: id = 117', '系统管理员');
INSERT INTO `oplog` VALUES (2745, 1, '2026-03-10 14:15:42', '删除职位: id = 118', '系统管理员');
INSERT INTO `oplog` VALUES (2747, 11, '2026-03-10 14:16:08', '更新员工资料::name:小白---workId:00000002', '系统管理员');
INSERT INTO `oplog` VALUES (2748, 11, '2026-03-10 14:16:16', '更新员工资料::name:小红---workId:00000001', '系统管理员');
INSERT INTO `oplog` VALUES (2749, 1, '2026-03-10 14:16:22', '删除部门:id=148', '系统管理员');
INSERT INTO `oplog` VALUES (2750, 1, '2026-03-10 14:16:25', '删除部门:id=163', '系统管理员');
INSERT INTO `oplog` VALUES (2751, 1, '2026-03-10 14:16:27', '删除部门:id=149', '系统管理员');
INSERT INTO `oplog` VALUES (2752, 1, '2026-03-10 14:16:29', '删除部门:id=148', '系统管理员');
INSERT INTO `oplog` VALUES (2753, 1, '2026-03-10 14:16:34', '删除职位: id = 33', '系统管理员');
INSERT INTO `oplog` VALUES (2754, 1, '2026-03-10 14:16:52', '删除职称 : id=9', '系统管理员');
INSERT INTO `oplog` VALUES (2756, 1, '2026-03-10 14:19:40', '更新职称初级领班', '系统管理员');
INSERT INTO `oplog` VALUES (2757, 1, '2026-03-10 14:19:44', '更新职称中级领班', '系统管理员');
INSERT INTO `oplog` VALUES (2758, 1, '2026-03-10 14:19:48', '更新职称高级领班', '系统管理员');
INSERT INTO `oplog` VALUES (2759, 1, '2026-03-10 14:20:19', '添加职称初级店长', '系统管理员');
INSERT INTO `oplog` VALUES (2760, 11, '2026-03-10 14:20:33', '更新员工资料::name:小白---workId:00000002', '系统管理员');
INSERT INTO `oplog` VALUES (2761, 1, '2026-03-10 14:20:47', '更新职位:领班', '系统管理员');
INSERT INTO `oplog` VALUES (2762, 1, '2026-03-10 14:20:50', '删除职位: id = 122', '系统管理员');
INSERT INTO `oplog` VALUES (2763, 1, '2026-03-10 14:20:54', '删除职位: id = 123', '系统管理员');
INSERT INTO `oplog` VALUES (2764, 1, '2026-03-10 14:21:01', '更新职位:服务员', '系统管理员');
INSERT INTO `oplog` VALUES (2766, 1, '2026-03-10 14:22:48', '删除职称 : id=16', '系统管理员');
INSERT INTO `oplog` VALUES (2769, 1, '2026-03-10 14:24:37', '添加职称高级领班', '系统管理员');
INSERT INTO `oplog` VALUES (2771, 11, '2026-03-10 14:25:19', '更新员工资料::name:小白---workId:00000002', '系统管理员');
INSERT INTO `oplog` VALUES (2772, 11, '2026-03-10 14:25:28', '更新员工资料::name:小红---workId:00000001', '系统管理员');
INSERT INTO `oplog` VALUES (2773, 1, '2026-03-10 14:25:35', '删除职称 : id=19', '系统管理员');
INSERT INTO `oplog` VALUES (2774, 1, '2026-03-10 14:26:01', '添加职称副店长', '系统管理员');
INSERT INTO `oplog` VALUES (2775, 1, '2026-03-10 14:26:17', '添加职称初级服务员', '系统管理员');
INSERT INTO `oplog` VALUES (2776, 1, '2026-03-10 14:26:28', '添加职称中级服务员', '系统管理员');
INSERT INTO `oplog` VALUES (2777, 1, '2026-03-10 14:26:33', '添加职称高级服务员', '系统管理员');
INSERT INTO `oplog` VALUES (2778, 1, '2026-03-10 14:26:38', '删除职位: id = 126', '系统管理员');
INSERT INTO `oplog` VALUES (2779, 1, '2026-03-10 14:26:41', '删除职位: id = 127', '系统管理员');
INSERT INTO `oplog` VALUES (2780, 1, '2026-03-10 14:27:06', '添加职称初级收银', '系统管理员');
INSERT INTO `oplog` VALUES (2781, 1, '2026-03-10 14:27:13', '添加职称中级收银', '系统管理员');
INSERT INTO `oplog` VALUES (2782, 1, '2026-03-10 14:27:18', '添加职称高级收银', '系统管理员');
INSERT INTO `oplog` VALUES (2783, 1, '2026-03-10 14:27:24', '删除职位: id = 129', '系统管理员');
INSERT INTO `oplog` VALUES (2784, 1, '2026-03-10 14:27:27', '删除职位: id = 130', '系统管理员');
INSERT INTO `oplog` VALUES (2785, 1, '2026-03-10 14:27:35', '更新职位:收银员', '系统管理员');
INSERT INTO `oplog` VALUES (2786, 1, '2026-03-10 14:27:42', '更新职称初级收银员', '系统管理员');
INSERT INTO `oplog` VALUES (2787, 1, '2026-03-10 14:27:45', '更新职称中级收银员', '系统管理员');
INSERT INTO `oplog` VALUES (2788, 1, '2026-03-10 14:27:50', '更新职称高级收银员', '系统管理员');
INSERT INTO `oplog` VALUES (2789, 1, '2026-03-10 14:28:03', '添加职称初级传菜员', '系统管理员');
INSERT INTO `oplog` VALUES (2790, 1, '2026-03-10 14:28:07', '添加职称中级传菜员', '系统管理员');
INSERT INTO `oplog` VALUES (2791, 1, '2026-03-10 14:28:12', '添加职称高级传菜员', '系统管理员');
INSERT INTO `oplog` VALUES (2792, 1, '2026-03-10 14:28:18', '更新职位:传菜员', '系统管理员');
INSERT INTO `oplog` VALUES (2793, 1, '2026-03-10 14:28:21', '删除职位: id = 132', '系统管理员');
INSERT INTO `oplog` VALUES (2794, 1, '2026-03-10 14:28:23', '删除职位: id = 133', '系统管理员');
INSERT INTO `oplog` VALUES (2795, 1, '2026-03-10 14:28:43', '添加职称初级迎宾员', '系统管理员');
INSERT INTO `oplog` VALUES (2796, 1, '2026-03-10 14:28:49', '添加职称中级迎宾员', '系统管理员');
INSERT INTO `oplog` VALUES (2797, 1, '2026-03-10 14:28:53', '添加职称高级迎宾员', '系统管理员');
INSERT INTO `oplog` VALUES (2798, 1, '2026-03-10 14:29:00', '更新职位:迎宾员', '系统管理员');
INSERT INTO `oplog` VALUES (2799, 1, '2026-03-10 14:29:02', '删除职位: id = 135', '系统管理员');
INSERT INTO `oplog` VALUES (2800, 1, '2026-03-10 14:29:04', '删除职位: id = 136', '系统管理员');
INSERT INTO `oplog` VALUES (2801, 1, '2026-03-10 14:29:27', '添加职称初级水吧员', '系统管理员');
INSERT INTO `oplog` VALUES (2802, 1, '2026-03-10 14:29:32', '添加职称中级水吧员', '系统管理员');
INSERT INTO `oplog` VALUES (2803, 1, '2026-03-10 14:29:36', '添加职称高级水吧员', '系统管理员');
INSERT INTO `oplog` VALUES (2804, 1, '2026-03-10 14:29:45', '更新职位:水吧员', '系统管理员');
INSERT INTO `oplog` VALUES (2805, 1, '2026-03-10 14:29:47', '删除职位: id = 140', '系统管理员');
INSERT INTO `oplog` VALUES (2806, 1, '2026-03-10 14:29:50', '删除职位: id = 141', '系统管理员');
INSERT INTO `oplog` VALUES (2807, 1, '2026-03-10 14:30:38', '添加职称初级', '系统管理员');
INSERT INTO `oplog` VALUES (2808, 1, '2026-03-10 14:30:47', '添加职称中级', '系统管理员');
INSERT INTO `oplog` VALUES (2809, 1, '2026-03-10 15:05:01', '添加职称高级', '系统管理员');
INSERT INTO `oplog` VALUES (2811, 11, '2026-03-10 15:08:02', '更新员工资料::name:小白---workId:00000002', '系统管理员');
INSERT INTO `oplog` VALUES (2812, 11, '2026-03-10 15:08:11', '更新员工资料::name:小红---workId:00000001', '系统管理员');
INSERT INTO `oplog` VALUES (2813, 1, '2026-03-10 15:08:23', '批量删除职称: ids=[Ljava.lang.Integer;@2f82e76b', '系统管理员');
INSERT INTO `oplog` VALUES (2814, 1, '2026-03-10 15:08:44', '删除部门:id=154', '系统管理员');
INSERT INTO `oplog` VALUES (2815, 1, '2026-03-10 15:08:47', '删除部门:id=152', '系统管理员');
INSERT INTO `oplog` VALUES (2816, 1, '2026-03-10 15:08:52', '删除部门:id=151', '系统管理员');
INSERT INTO `oplog` VALUES (2817, 1, '2026-03-10 15:18:33', '角色权限变更', '系统管理员');
INSERT INTO `oplog` VALUES (2818, 7, '2026-03-10 17:13:19', '员工套账变动:workId:5271套账编号:10', '系统管理员');
INSERT INTO `oplog` VALUES (2819, 7, '2026-03-10 17:13:25', '员工套账变动:workId:5268套账编号:26', '系统管理员');
INSERT INTO `oplog` VALUES (2820, 1, '2026-03-12 14:35:59', '角色权限变更', '系统管理员');
INSERT INTO `oplog` VALUES (2821, 11, '2026-03-13 10:29:47', '更新员工资料::name:张明---workId:00000002', '系统管理员');
INSERT INTO `oplog` VALUES (2822, 11, '2026-03-13 10:30:09', '更新员工资料::name:何婷---workId:00000001', '系统管理员');
INSERT INTO `oplog` VALUES (2823, 1, '2026-03-13 11:54:06', '角色权限变更', '系统管理员');
INSERT INTO `oplog` VALUES (2824, 1, '2026-03-13 14:17:05', '删除部门:id=159', '系统管理员');
INSERT INTO `oplog` VALUES (2825, 1, '2026-03-13 14:17:07', '删除部门:id=160', '系统管理员');
INSERT INTO `oplog` VALUES (2826, 1, '2026-03-13 14:17:09', '删除部门:id=161', '系统管理员');
INSERT INTO `oplog` VALUES (2827, 1, '2026-03-13 14:17:12', '删除部门:id=162', '系统管理员');
INSERT INTO `oplog` VALUES (2828, 1, '2026-03-13 14:17:25', '添加部门:五角场', '系统管理员');
INSERT INTO `oplog` VALUES (2829, 1, '2026-03-13 14:17:30', '添加部门:徐汇', '系统管理员');
INSERT INTO `oplog` VALUES (2830, 1, '2026-03-13 14:17:38', '添加部门:杭州区域', '系统管理员');
INSERT INTO `oplog` VALUES (2831, 1, '2026-03-13 14:18:04', '添加部门:大悦城', '系统管理员');
INSERT INTO `oplog` VALUES (2832, 1, '2026-03-13 14:18:19', '添加部门:嘉兴区域', '系统管理员');
INSERT INTO `oplog` VALUES (2833, 1, '2026-03-13 14:18:27', '添加部门:龙鼎万达', '系统管理员');
INSERT INTO `oplog` VALUES (2834, 11, '2026-03-13 14:18:40', '更新员工资料::name:张明---workId:00000002', '系统管理员');
INSERT INTO `oplog` VALUES (2835, 1, '2026-03-13 14:18:46', '删除部门:id=161', '系统管理员');
INSERT INTO `oplog` VALUES (2836, 7, '2026-03-13 14:26:11', '员工套账变动:workId:5271套账编号:10', '系统管理员');
INSERT INTO `oplog` VALUES (2837, 4, '2026-03-13 14:30:42', '员工培训eid:5271', '系统管理员');
INSERT INTO `oplog` VALUES (2838, 10, '2026-03-13 14:30:55', '删除员工考评eid:5268', '系统管理员');
INSERT INTO `oplog` VALUES (2839, 4, '2026-03-13 14:31:13', '取消员工培训eid:5271', '系统管理员');
INSERT INTO `oplog` VALUES (2840, 4, '2026-03-13 14:31:16', '取消员工培训eid:5268', '系统管理员');
INSERT INTO `oplog` VALUES (2841, 4, '2026-03-13 14:31:50', '添加培训:eid=5271', '系统管理员');
INSERT INTO `oplog` VALUES (2842, 8, '2026-03-13 15:29:32', '操作员角色更新', '系统管理员');
INSERT INTO `oplog` VALUES (2843, 8, '2026-03-13 15:29:40', '操作员角色更新', '系统管理员');
INSERT INTO `oplog` VALUES (2844, 8, '2026-03-13 15:34:37', '操作员信息更新:系统管理员', '系统管理员');
INSERT INTO `oplog` VALUES (2845, 8, '2026-03-13 15:34:40', '操作员信息更新:系统管理员', '系统管理员');
INSERT INTO `oplog` VALUES (2846, 8, '2026-03-13 15:35:02', '操作员信息更新:系统管理员', '系统管理员');
INSERT INTO `oplog` VALUES (2847, 8, '2026-03-13 15:36:30', '操作员信息更新:11', '系统管理员');
INSERT INTO `oplog` VALUES (2848, 8, '2026-03-13 15:36:40', '操作员角色更新', '系统管理员');
INSERT INTO `oplog` VALUES (2849, 2, '2026-03-13 15:38:26', '员工入职::name:11workId:00000003', '系统管理员');
INSERT INTO `oplog` VALUES (2854, 1, '2026-03-13 15:43:03', '角色权限变更', '系统管理员');
INSERT INTO `oplog` VALUES (2855, 2, '2026-03-16 17:16:41', '员工入职::name:的workId:00000004', '系统管理员');
INSERT INTO `oplog` VALUES (2856, 9, '2026-03-16 17:16:47', '员工批量离职:name:', '系统管理员');
INSERT INTO `oplog` VALUES (2857, 9, '2026-03-16 17:16:47', '员工离职:name:的---workId:00000004', '系统管理员');
INSERT INTO `oplog` VALUES (2858, 11, '2026-03-26 14:33:03', '更新员工资料::name:11---workId:00000003', '系统管理员');
INSERT INTO `oplog` VALUES (2859, 6, '2026-03-26 14:33:03', '员工调动:eid=5272', '系统管理员');
INSERT INTO `oplog` VALUES (2860, 1, '2026-03-26 15:56:37', '角色权限变更', '系统管理员');
INSERT INTO `oplog` VALUES (2861, 11, '2026-03-27 10:42:30', '更新员工资料::name:郑雪---workId:00000013', '系统管理员');
INSERT INTO `oplog` VALUES (2862, 11, '2026-03-27 10:43:40', '更新员工资料::name:吴刚---workId:00000012', '系统管理员');
INSERT INTO `oplog` VALUES (2863, 11, '2026-03-27 10:44:33', '更新员工资料::name:孙磊---workId:00000010', '系统管理员');
INSERT INTO `oplog` VALUES (2864, 9, '2026-03-27 10:45:11', '员工离职:name:11---workId:00000003', '系统管理员');
INSERT INTO `oplog` VALUES (2865, 11, '2026-03-27 10:57:30', '更新员工资料::name:郑雪---workId:00000013', '系统管理员');
INSERT INTO `oplog` VALUES (2866, 11, '2026-03-27 11:11:45', '更新员工资料::name:郑雪---workId:00000013', '系统管理员');
INSERT INTO `oplog` VALUES (2867, 11, '2026-03-27 11:22:56', '更新员工资料::name:郑雪---workId:00000013', '系统管理员');
INSERT INTO `oplog` VALUES (2868, 11, '2026-03-27 11:33:14', '更新员工资料::name:吴刚---workId:00000012', '系统管理员');
INSERT INTO `oplog` VALUES (2869, 11, '2026-03-27 11:33:17', '更新员工资料::name:吴刚---workId:00000012', '系统管理员');
INSERT INTO `oplog` VALUES (2870, 11, '2026-03-27 11:34:28', '更新员工资料::name:陈静---workId:00000009', '系统管理员');
INSERT INTO `oplog` VALUES (2871, 1, '2026-03-27 14:06:52', '角色权限变更', '系统管理员');
INSERT INTO `oplog` VALUES (2872, 1, '2026-03-27 14:07:09', '角色权限变更', '系统管理员');
INSERT INTO `oplog` VALUES (2874, 2, '2026-03-27 14:30:11', '员工入职::name:范德萨workId:00000014', '系统管理员');
INSERT INTO `oplog` VALUES (2875, 9, '2026-03-27 14:32:15', '员工离职:name:范德萨---workId:00000014', '系统管理员');
INSERT INTO `oplog` VALUES (2876, 11, '2026-03-27 22:07:35', '更新员工资料::name:李娜---workId:00000005', '陈静');
INSERT INTO `oplog` VALUES (2877, 11, '2026-03-30 16:00:44', '更新员工资料::name:周敏---workId:00000011', '郑雪');
INSERT INTO `oplog` VALUES (2878, 1, '2026-03-31 10:29:43', '角色权限变更', '系统管理员');
INSERT INTO `oplog` VALUES (2879, 9, '2026-03-31 11:25:45', '员工申请离职::name:王强workId:00000006', '王强');
INSERT INTO `oplog` VALUES (2880, 2, '2026-03-31 16:51:40', '员工入职::name:发多少workId:00000014', '系统管理员');
INSERT INTO `oplog` VALUES (2881, 9, '2026-03-31 16:52:05', '员工申请离职::name:发多少workId:00000014', '发多少');
INSERT INTO `oplog` VALUES (2882, 9, '2026-03-31 16:54:31', '员工撤销离职申请::name:发多少workId:00000014', '发多少');
INSERT INTO `oplog` VALUES (2883, 9, '2026-03-31 16:54:55', '员工申请离职::name:发多少workId:00000014', '发多少');
INSERT INTO `oplog` VALUES (2884, 9, '2026-03-31 16:57:19', '员工撤销离职申请::name:发多少workId:00000014', '发多少');
INSERT INTO `oplog` VALUES (2885, 9, '2026-03-31 16:57:57', '员工申请离职::name:发多少workId:00000014', '发多少');
INSERT INTO `oplog` VALUES (2886, 9, '2026-03-31 16:58:02', '员工申请离职::name:发多少workId:00000014', '发多少');
INSERT INTO `oplog` VALUES (2887, 9, '2026-03-31 16:58:13', '员工申请离职::name:发多少workId:00000014', '发多少');
INSERT INTO `oplog` VALUES (2888, 9, '2026-03-31 16:59:19', '员工撤销离职申请::name:发多少workId:00000014', '发多少');
INSERT INTO `oplog` VALUES (2889, 9, '2026-03-31 17:00:54', '员工撤销离职申请::name:发多少workId:00000014', '发多少');
INSERT INTO `oplog` VALUES (2890, 9, '2026-03-31 17:01:05', '员工撤销离职申请::name:发多少workId:00000014', '发多少');
INSERT INTO `oplog` VALUES (2891, 9, '2026-03-31 17:03:10', '员工申请离职::name:发多少workId:00000014', '发多少');
INSERT INTO `oplog` VALUES (2892, 9, '2026-03-31 17:03:22', '员工撤销离职申请::name:发多少workId:00000014', '发多少');
INSERT INTO `oplog` VALUES (2893, 9, '2026-03-31 17:06:06', '员工申请离职::name:发多少workId:00000014', '发多少');
INSERT INTO `oplog` VALUES (2894, 9, '2026-03-31 17:11:52', '员工离职申请审核通过::name:发多少workId:00000014', '周敏');
INSERT INTO `oplog` VALUES (2895, 11, '2026-03-31 17:11:52', '更新员工资料::name:发多少---workId:00000014', '周敏');
INSERT INTO `oplog` VALUES (2896, 9, '2026-03-31 17:20:04', '员工离职:name:发多少---workId:00000014', '系统管理员');
INSERT INTO `oplog` VALUES (2897, 2, '2026-03-31 17:21:55', '员工入职::name:乳鸽workId:00000014', '系统管理员');
INSERT INTO `oplog` VALUES (2898, 9, '2026-03-31 17:22:22', '员工申请离职::name:乳鸽workId:00000014', '乳鸽');
INSERT INTO `oplog` VALUES (2899, 9, '2026-03-31 17:23:19', '员工撤销离职申请::name:乳鸽workId:00000014', '乳鸽');
INSERT INTO `oplog` VALUES (2900, 9, '2026-03-31 17:23:31', '员工申请离职::name:乳鸽workId:00000014', '乳鸽');
INSERT INTO `oplog` VALUES (2901, 9, '2026-03-31 17:24:12', '员工离职:name:乳鸽---workId:00000014', '陈静');
INSERT INTO `oplog` VALUES (2902, 9, '2026-03-31 17:24:12', '员工离职申请审核通过::name:乳鸽workId:null', '陈静');
INSERT INTO `oplog` VALUES (2903, 2, '2026-03-31 17:32:02', '员工入职::name:回访workId:00000014', '系统管理员');
INSERT INTO `oplog` VALUES (2904, 9, '2026-03-31 17:32:22', '员工申请离职::name:回访workId:00000014', '回访');
INSERT INTO `oplog` VALUES (2905, 9, '2026-03-31 17:32:44', '员工离职:name:回访---workId:00000014', '郑雪');
INSERT INTO `oplog` VALUES (2906, 9, '2026-03-31 17:32:44', '员工离职申请审核通过::name:回访workId:null', '郑雪');
INSERT INTO `oplog` VALUES (2907, 2, '2026-03-31 17:41:34', '员工入职::name:第三方workId:00000014', '系统管理员');
INSERT INTO `oplog` VALUES (2908, 9, '2026-03-31 17:42:05', '员工申请离职::name:第三方workId:00000014', '第三方');
INSERT INTO `oplog` VALUES (2909, 9, '2026-03-31 17:42:56', '员工离职:name:第三方---workId:00000014', '陈静');
INSERT INTO `oplog` VALUES (2910, 9, '2026-03-31 17:42:56', '员工离职申请审核通过::name:第三方workId:null', '陈静');
INSERT INTO `oplog` VALUES (2911, 9, '2026-04-01 14:43:04', '员工离职申请审核驳回::name:王强workId:00000006', '郑雪');
INSERT INTO `oplog` VALUES (2912, 1, '2026-04-02 16:46:41', '角色权限变更', '系统管理员');
INSERT INTO `oplog` VALUES (2913, 13, '2026-04-02 17:09:16', '员工进行物品交接，交接人:周敏workId:00000011', '系统管理员');
INSERT INTO `oplog` VALUES (2914, 13, '2026-04-02 17:10:28', '删除员工交接记录，交接人：周敏', '系统管理员');
INSERT INTO `oplog` VALUES (2915, 14, '2026-04-03 15:58:48', '新增机构信息:淮北半亩田餐饮管理有限公司', '系统管理员');
INSERT INTO `oplog` VALUES (2916, 14, '2026-04-03 16:15:18', '新增机构信息:丰富的割发代首', '系统管理员');
INSERT INTO `oplog` VALUES (2917, 14, '2026-04-03 16:16:07', '修改机构信息：丰富的割发代首', '系统管理员');
INSERT INTO `oplog` VALUES (2918, 14, '2026-04-03 16:24:55', '修改机构信息：丰富的割发代首', '系统管理员');
INSERT INTO `oplog` VALUES (2919, 14, '2026-04-03 16:25:01', '删除机构信息：丰富的割发代首', '系统管理员');
INSERT INTO `oplog` VALUES (2920, 15, '2026-04-07 13:49:07', '新增黑名单人员，姓名:粉干，身份证号码:null', '系统管理员');
INSERT INTO `oplog` VALUES (2921, 15, '2026-04-07 13:50:39', '新增黑名单人员，姓名:范德萨，身份证号码:null', '系统管理员');
INSERT INTO `oplog` VALUES (2922, 15, '2026-04-07 13:56:54', '新增黑名单人员，姓名:割发代首，身份证号码:null', '系统管理员');
INSERT INTO `oplog` VALUES (2923, 15, '2026-04-07 14:08:24', '新增黑名单人员，姓名:鬼斧神工，身份证号码:320101199905057890', '系统管理员');
INSERT INTO `oplog` VALUES (2924, 15, '2026-04-07 14:09:34', '移除黑名单人员，姓名:null，身份证号码:null', '系统管理员');
INSERT INTO `oplog` VALUES (2925, 15, '2026-04-07 14:29:54', '修改黑名单人员信息，姓名:鬼斧神工，身份证号码:320101199905057890', '系统管理员');
INSERT INTO `oplog` VALUES (2926, 15, '2026-04-07 14:30:08', '修改黑名单人员信息，姓名:鬼斧神工，身份证号码:320101199905057890', '系统管理员');
INSERT INTO `oplog` VALUES (2927, 15, '2026-04-07 14:30:26', '修改黑名单人员信息，姓名:鬼斧神工，身份证号码:320101199905057890', '系统管理员');
INSERT INTO `oplog` VALUES (2928, 15, '2026-04-07 14:30:51', '修改黑名单人员信息，姓名:鬼斧神工，身份证号码:320101199905057890', '系统管理员');
INSERT INTO `oplog` VALUES (2929, 15, '2026-04-07 14:57:53', '移除黑名单人员，姓名:null，身份证号码:null', '系统管理员');
INSERT INTO `oplog` VALUES (2930, 15, '2026-04-07 14:57:53', '移除黑名单人员，姓名:null，身份证号码:null', '系统管理员');
INSERT INTO `oplog` VALUES (2931, 15, '2026-04-07 15:02:47', '移除黑名单人员，姓名:null，身份证号码:null', '系统管理员');
INSERT INTO `oplog` VALUES (2932, 15, '2026-04-07 15:05:35', '移除黑名单人员，姓名:null，身份证号码:null', '系统管理员');
INSERT INTO `oplog` VALUES (2933, 15, '2026-04-07 15:05:45', '移除黑名单人员，姓名:null，身份证号码:null', '系统管理员');
INSERT INTO `oplog` VALUES (2934, 15, '2026-04-07 15:05:45', '移除黑名单人员，姓名:null，身份证号码:null', '系统管理员');
INSERT INTO `oplog` VALUES (2935, 15, '2026-04-07 15:05:45', '移除黑名单人员，姓名:null，身份证号码:null', '系统管理员');
INSERT INTO `oplog` VALUES (2936, 1, '2026-04-07 15:08:56', '角色权限变更', '系统管理员');
INSERT INTO `oplog` VALUES (2937, 15, '2026-04-07 15:17:50', '新增黑名单人员，姓名:发多少，身份证号码:320101199705057890', '李白');
INSERT INTO `oplog` VALUES (2938, 15, '2026-04-07 15:24:25', '新增黑名单人员，姓名:交换机，身份证号码:320101199509057890', '李白');
INSERT INTO `oplog` VALUES (2939, 15, '2026-04-07 15:25:44', '新增黑名单人员，姓名:发达会更好，身份证号码:510101199904043456', '李白');
INSERT INTO `oplog` VALUES (2940, 15, '2026-04-07 15:26:04', '修改黑名单人员信息，姓名:发达会更好，身份证号码:510101199904043456', '李白');
INSERT INTO `oplog` VALUES (2941, 9, '2026-04-07 15:44:57', '员工申请离职::name:陈静workId:00000009', '陈静');
INSERT INTO `oplog` VALUES (2942, 9, '2026-04-07 15:54:22', '员工离职申请审核驳回::name:陈静workId:00000009', '吴刚');
INSERT INTO `oplog` VALUES (2943, 2, '2026-04-07 15:55:24', '员工入职::name:古法workId:00000014', '系统管理员');
INSERT INTO `oplog` VALUES (2944, 9, '2026-04-07 15:55:50', '员工申请离职::name:古法workId:00000014', '古法');
INSERT INTO `oplog` VALUES (2945, 13, '2026-04-07 15:56:45', '员工进行物品交接，交接人:古法，workId:00000014', '系统管理员');
INSERT INTO `oplog` VALUES (2946, 9, '2026-04-07 15:57:17', '员工离职:name:古法---workId:00000014', '郑雪');
INSERT INTO `oplog` VALUES (2947, 9, '2026-04-07 15:57:17', '员工离职申请审核通过::name:古法workId:00000014', '郑雪');
INSERT INTO `oplog` VALUES (2948, 1, '2026-04-08 15:46:53', '角色权限变更', '系统管理员');

-- ----------------------------
-- Table structure for politicsstatus
-- ----------------------------
DROP TABLE IF EXISTS `politicsstatus`;
CREATE TABLE `politicsstatus`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of politicsstatus
-- ----------------------------
INSERT INTO `politicsstatus` VALUES (1, '中共党员');
INSERT INTO `politicsstatus` VALUES (2, '中共预备党员');
INSERT INTO `politicsstatus` VALUES (3, '群众');

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `createDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `enabled` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 155 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES (120, '店长', '2025-12-24 12:17:53', 1);
INSERT INTO `position` VALUES (121, '领班', '2026-03-10 14:20:47', 1);
INSERT INTO `position` VALUES (124, '客情经理', '2025-12-24 12:18:27', 1);
INSERT INTO `position` VALUES (125, '服务员', '2026-03-10 14:21:01', 1);
INSERT INTO `position` VALUES (128, '收银员', '2026-03-10 14:27:35', 1);
INSERT INTO `position` VALUES (131, '传菜员', '2026-03-10 14:28:18', 1);
INSERT INTO `position` VALUES (134, '迎宾员', '2026-03-10 14:29:00', 1);
INSERT INTO `position` VALUES (137, '水吧长', '2025-12-24 12:20:20', 1);
INSERT INTO `position` VALUES (139, '水吧员', '2026-03-10 14:29:45', 1);
INSERT INTO `position` VALUES (142, '厨师长', '2025-12-24 14:12:18', 1);
INSERT INTO `position` VALUES (143, '厨房主管', '2025-12-24 14:12:22', 1);
INSERT INTO `position` VALUES (144, '炉台主管', '2025-12-24 14:12:32', 1);
INSERT INTO `position` VALUES (145, '打荷', '2025-12-24 14:12:39', 1);
INSERT INTO `position` VALUES (146, '改刀', '2025-12-24 14:12:44', 1);
INSERT INTO `position` VALUES (147, '切配', '2025-12-24 14:12:47', 1);
INSERT INTO `position` VALUES (148, '炉台', '2025-12-24 14:12:50', 1);
INSERT INTO `position` VALUES (149, '蒸笼', '2025-12-24 14:12:53', 1);
INSERT INTO `position` VALUES (150, '保洁', '2025-12-24 14:12:57', 1);
INSERT INTO `position` VALUES (151, '洗碗', '2025-12-24 14:13:02', 1);
INSERT INTO `position` VALUES (152, '收台', '2025-12-24 14:13:07', 1);
INSERT INTO `position` VALUES (153, '补餐', '2025-12-24 14:13:12', 1);
INSERT INTO `position` VALUES (154, '烤箱', '2025-12-24 14:13:40', 1);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nameZh` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE,
  UNIQUE INDEX `nameZh`(`nameZh` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (2, 'ROLE_personnel', '人事专员');
INSERT INTO `role` VALUES (6, 'ROLE_admin', '系统管理员');
INSERT INTO `role` VALUES (34, 'ROLE_员工角色', '员工角色');

-- ----------------------------
-- Table structure for rwards_punishments
-- ----------------------------
DROP TABLE IF EXISTS `rwards_punishments`;
CREATE TABLE `rwards_punishments`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `rpsystem_id` int NULL DEFAULT NULL,
  `rpmsg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rpiont` int NULL DEFAULT NULL,
  `createrp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `rpmsg`(`rpmsg` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rwards_punishments
-- ----------------------------
INSERT INTO `rwards_punishments` VALUES (2, 1, '记小功', 3, '2019-12-28 10:32:50');
INSERT INTO `rwards_punishments` VALUES (3, 1, '记大功', 5, '2019-12-28 10:33:33');
INSERT INTO `rwards_punishments` VALUES (4, 1, '通报批评', -1, '2019-12-28 10:33:58');
INSERT INTO `rwards_punishments` VALUES (5, 1, '记小过', -5, '2019-12-28 10:34:19');
INSERT INTO `rwards_punishments` VALUES (9, 3, '罚款500元', -5, '2019-12-28 10:35:02');
INSERT INTO `rwards_punishments` VALUES (10, 3, '奖金50元', -2, '2019-12-28 10:35:03');
INSERT INTO `rwards_punishments` VALUES (19, 1, '嘉奖', 4, '2020-01-01 16:25:25');
INSERT INTO `rwards_punishments` VALUES (20, 5, '带薪调休', 1, '2020-01-01 16:53:07');
INSERT INTO `rwards_punishments` VALUES (21, 1, '晋职晋级', -2, '2020-01-06 10:40:26');
INSERT INTO `rwards_punishments` VALUES (22, 5, '年假+1', 3, '2020-01-11 19:05:55');
INSERT INTO `rwards_punishments` VALUES (23, 5, '团建+1', 2, '2020-01-11 19:07:07');

-- ----------------------------
-- Table structure for rwardsandpunishments
-- ----------------------------
DROP TABLE IF EXISTS `rwardsandpunishments`;
CREATE TABLE `rwardsandpunishments`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `rpsystem` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rwardsandpunishments
-- ----------------------------
INSERT INTO `rwardsandpunishments` VALUES (1, '行政奖惩类');
INSERT INTO `rwardsandpunishments` VALUES (3, '经济奖惩类');
INSERT INTO `rwardsandpunishments` VALUES (5, '专项奖励类');

-- ----------------------------
-- Table structure for salary
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `basicSalary` int NULL DEFAULT NULL COMMENT '基本工资',
  `bonus` int NULL DEFAULT NULL COMMENT '奖金',
  `lunchSalary` int NULL DEFAULT NULL COMMENT '午餐补助',
  `trafficSalary` int NULL DEFAULT NULL COMMENT '交通补助',
  `allSalary` int NULL DEFAULT NULL COMMENT '应发工资',
  `pensionBase` int NULL DEFAULT NULL COMMENT '养老金基数',
  `pensionPer` float NULL DEFAULT NULL COMMENT '养老金比率',
  `createDate` timestamp NULL DEFAULT NULL COMMENT '启用时间',
  `medicalBase` int NULL DEFAULT NULL COMMENT '医疗基数',
  `medicalPer` float NULL DEFAULT NULL COMMENT '医疗保险比率',
  `accumulationFundBase` int NULL DEFAULT NULL COMMENT '公积金基数',
  `accumulationFundPer` float NULL DEFAULT NULL COMMENT '公积金比率',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of salary
-- ----------------------------
INSERT INTO `salary` VALUES (10, 2000, 2000, 400, 1000, 7400, 2000, 0.07, '2020-01-11 19:54:24', 2000, 0.07, 2000, 0.07, '人事部工资账套');
INSERT INTO `salary` VALUES (13, 10000, 3000, 500, 500, 18000, 4000, 0.07, '2020-01-11 19:54:24', 4000, 0.07, 4000, 0.07, '运维部工资账套');
INSERT INTO `salary` VALUES (26, 10000, 50, 200, 100, 7850, 10000, 0.08, '2023-03-10 21:07:53', 10000, 0.05, 10000, 0.12, '测试讨帐');

-- ----------------------------
-- Table structure for sys_black_list
-- ----------------------------
DROP TABLE IF EXISTS `sys_black_list`;
CREATE TABLE `sys_black_list`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '黑名单人员姓名',
  `idCard` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '身份证号（唯一标识）',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `reason` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '加入黑名单原因（如：旷工、违规操作、盗窃等）',
  `sourceDepartment` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '原所属部门/门店',
  `addTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '加入黑名单时间',
  `operator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作人（人事账号/姓名）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注信息',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态：1-有效 0-失效',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_id_card`(`idCard` ASC) USING BTREE COMMENT '身份证号唯一索引，防止重复录入',
  INDEX `idx_name`(`name` ASC) USING BTREE COMMENT '姓名索引，方便快速查询',
  INDEX `idx_add_time`(`addTime` ASC) USING BTREE COMMENT '加入时间索引，便于按时间筛选'
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '人事管理黑名单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_black_list
-- ----------------------------
INSERT INTO `sys_black_list` VALUES (1, '张三', '110101199001011234', '13800138000', '多次旷工且屡教不改，严重影响门店运营', '153', '2026-03-01 10:23:45', 'admin_hr', '经店长多次警告无效，永久拉黑', 1);
INSERT INTO `sys_black_list` VALUES (2, '李四', '310101199202025678', '13912345678', '违规操作收银系统，造成门店资金损失', '165', '2026-03-02 14:15:30', 'hr_li', '赔偿后观察期1年，到期可申请解除', 1);
INSERT INTO `sys_black_list` VALUES (3, '王五', '440101199303039012', '15098765432', '盗窃门店贵重物资，已移交公安机关处理', '167', '2026-03-03 09:08:12', 'security_hr', '涉及刑事犯罪，永久禁止入职', 1);
INSERT INTO `sys_black_list` VALUES (4, '赵六', '510101199404043456', '18666668888', '恶意散播谣言，破坏团队氛围', '169', '2026-03-04 16:40:22', 'hr_wang', '情节较轻，3个月后可重新评估', 1);
INSERT INTO `sys_black_list` VALUES (5, '孙七', '320101199505057890', '17700009999', '试用期内多次迟到早退，考核不合格', '164', '2026-01-05 11:30:00', 'hr_zhang', '试用期结束后解除黑名单', 1);

-- ----------------------------
-- Table structure for sysmsg
-- ----------------------------
DROP TABLE IF EXISTS `sysmsg`;
CREATE TABLE `sysmsg`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `mid` int NULL DEFAULT NULL COMMENT '消息id',
  `type` int NULL DEFAULT 0 COMMENT '0表示群发消息',
  `hrid` int NULL DEFAULT NULL COMMENT '这条消息是给谁的',
  `state` int NULL DEFAULT 0 COMMENT '0 未读 1 已读',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `hrid`(`hrid` ASC) USING BTREE,
  INDEX `sysmsg_ibfk_1`(`mid` ASC) USING BTREE,
  CONSTRAINT `sysmsg_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `msgcontent` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sysmsg_ibfk_2` FOREIGN KEY (`hrid`) REFERENCES `hr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sysmsg
-- ----------------------------

-- ----------------------------
-- Table structure for third_party_org
-- ----------------------------
DROP TABLE IF EXISTS `third_party_org`;
CREATE TABLE `third_party_org`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `org_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '机构名称',
  `org_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '机构类型：校企合作/劳务派遣',
  `contact` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系人',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `intern_num` int NULL DEFAULT 0 COMMENT '当前派遣实习生人数',
  `dispatch_date` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '派遣日期',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '正常' COMMENT '合作状态：正常/暂停/终止',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '实习生派遣合作机构信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of third_party_org
-- ----------------------------

-- ----------------------------
-- Table structure for work_schedule
-- ----------------------------
DROP TABLE IF EXISTS `work_schedule`;
CREATE TABLE `work_schedule`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '排班主键ID',
  `employee_id` int NOT NULL COMMENT '员工ID',
  `employee_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '员工姓名',
  `schedule_date` date NOT NULL COMMENT '排班日期',
  `shift_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '班次类型：早班/中班/晚班/休息',
  `start_time` time NULL DEFAULT NULL COMMENT '上班时间',
  `end_time` time NULL DEFAULT NULL COMMENT '下班时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_schedule_employee`(`employee_id` ASC) USING BTREE,
  CONSTRAINT `fk_schedule_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '员工排班表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of work_schedule
-- ----------------------------
INSERT INTO `work_schedule` VALUES (1, 5268, '何婷', '2026-03-13', '早班', '08:00:00', '16:00:00', '2026-03-13 11:06:26');
INSERT INTO `work_schedule` VALUES (2, 5271, '张明', '2026-03-13', '晚班', '16:00:00', '24:00:00', '2026-03-13 11:06:26');

-- ----------------------------
-- Procedure structure for addDep
-- ----------------------------
DROP PROCEDURE IF EXISTS `addDep`;
delimiter ;;
CREATE PROCEDURE `addDep`(in depName varchar(32),in parentId int,in enabled boolean,out result int,out result2 int)
begin
  declare did int;
  declare pDepPath varchar(64);
  insert into department set name=depName,parentId=parentId,enabled=enabled;
  select row_count() into result;
  select last_insert_id() into did;
  set result2=did;
  select depPath into pDepPath from department where id=parentId;
  update department set depPath=concat(pDepPath,'.',did) where id=did;
  update department set isParent=true where id=parentId;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for deleteDep
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteDep`;
delimiter ;;
CREATE PROCEDURE `deleteDep`(in did int,out result int)
begin
  declare ecount int;
  declare pid int;
  declare pcount int;
  select count(*) into ecount from employee where departmentId=did;
  if ecount>0 then set result=-1;
  else 
  select parentId into pid from department where id=did;
  delete from department where id=did and isParent=false;
  select row_count() into result;
  select count(*) into pcount from department where parentId=pid;
  if pcount=0 then update department set isParent=false where id=pid;
  end if;
  end if;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
