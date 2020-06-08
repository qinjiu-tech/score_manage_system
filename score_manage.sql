/*
 Navicat MySQL Data Transfer

 Source Server         : tencent_cd_mysql
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : cdb-91yhh59o.cd.tencentcdb.com:10096
 Source Schema         : score_manage

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 26/03/2020 22:54:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for all_people
-- ----------------------------
DROP TABLE IF EXISTS `all_people`;
CREATE TABLE `all_people`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号/工号',
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `gender` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别',
  `classes` int(11) NOT NULL COMMENT '年级',
  `faculty` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学院',
  `special` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '专业',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份',
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of all_people
-- ----------------------------
INSERT INTO `all_people` VALUES ('060001', '钱老师', '女', 2019, '美术学院', '教师', '15644449967', 'teacher');
INSERT INTO `all_people` VALUES ('070001', '赵老师', '女', 2019, '音乐学院', '教师', '16588994777', 'teacher');
INSERT INTO `all_people` VALUES ('110001', '朱老师', '男', 2016, '物理与电子信息学院', '教师', '18566669988', 'teacher');
INSERT INTO `all_people` VALUES ('110002', '刘老师', '男', 2018, '物理与电子信息学院', '教师', '15569998877', 'teacher');
INSERT INTO `all_people` VALUES ('11111111', '22', 'ç·', 3233, '22', '2222', '222', 'teacher');
INSERT INTO `all_people` VALUES ('111111111', '11', 'ç·', 11, '11', '1', '11111111111', 'teacher');
INSERT INTO `all_people` VALUES ('200001', '孙老师', '男', 2017, '医药与护理学院', '教师', '19988547777', 'teacher');
INSERT INTO `all_people` VALUES ('201600001', 'æµè¯', 'ç·', 2017, 'æ ', 'æ ', '11111111111', 'teacher');
INSERT INTO `all_people` VALUES ('201600800001', '东方不败', '男', 2016, '物理与电子信息学院', '移动互联', '13288995586', 'student');
INSERT INTO `all_people` VALUES ('201600800002', '任盈盈', '女', 2016, '物理与电子信息学院', '移动互联', '13288491111', 'student');
INSERT INTO `all_people` VALUES ('201600800003', '令狐冲', '男', 2016, '物理与电子信息学院', '移动互联', '13288994555', 'student');
INSERT INTO `all_people` VALUES ('201600800004', '岳不群', '男', 2016, '物理与电子信息学院', '移动互联', '13288991457', 'student');
INSERT INTO `all_people` VALUES ('201600800005', '左冷禅', '男', 2016, '物理与电子信息学院', '移动互联', '13285751111', 'student');
INSERT INTO `all_people` VALUES ('201600800006', '风清扬', '男', 2016, '物理与电子信息学院', '移动互联', '13288957511', 'student');
INSERT INTO `all_people` VALUES ('201600800007', '独孤求败', '男', 2016, '物理与电子信息学院', '移动互联', '13288957511', 'student');
INSERT INTO `all_people` VALUES ('201600800008', '乔峰', '男', 2016, '物理与电子信息学院', '移动互联', '13288991575', 'student');
INSERT INTO `all_people` VALUES ('201600800009', '段誉', '男', 2016, '物理与电子信息学院', '移动互联', '15568824578', 'student');
INSERT INTO `all_people` VALUES ('201600800010', '虚竹', '男', 2016, '物理与电子信息学院', '移动互联', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800011', '逍遥子', '男', 2016, '物理与电子信息学院', '移动互联', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800012', '丁春秋', '男', 2016, '物理与电子信息学院', '移动互联', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800013', '李秋水', '女', 2016, '物理与电子信息学院', '移动互联', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800014', '慕容复', '男', 2016, '物理与电子信息学院', '移动互联', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800015', '慕容博', '男', 2016, '物理与电子信息学院', '移动互联', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800016', '扫地僧', '男', 2016, '物理与电子信息学院', '移动互联', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800017', '段正淳', '男', 2016, '物理与电子信息学院', '移动互联', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800018', '郭靖', '男', 2016, '物理与电子信息学院', '移动互联', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800019', '黄蓉', '女', 2016, '物理与电子信息学院', '移动互联', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800020', '郭芙', '女', 2016, '物理与电子信息学院', '移动互联', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800021', '郭襄', '女', 2016, '物理与电子信息学院', '移动互联', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800022', '郭破虏', '男', 2016, '物理与电子信息学院', '移动互联', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800023', '杨过', '男', 2016, '物理与电子信息学院', '移动互联', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800024', '小龙女', '女', 2016, '物理与电子信息学院', '移动互联', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800025', '金轮法王', '男', 2016, '物理与电子信息学院', '移动互联', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800026', '黄药师', '男', 2016, '物理与电子信息学院', '移动互联', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800027', '欧阳锋', '男', 2016, '物理与电子信息学院', '移动互联', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800028', '一灯', '男', 2016, '物理与电子信息学院', '移动互联', '13285787511', 'student');
INSERT INTO `all_people` VALUES ('201600800029', '洪七公', '男', 2016, '物理与电子信息学院', '移动互联', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800030', '王重阳', '男', 2016, '物理与电子信息学院', '移动互联', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800031', '周伯通', '男', 2016, '物理与电子信息学院', '移动互联', '13286868811', 'student');
INSERT INTO `all_people` VALUES ('201600800032', '瑛姑', '女', 2016, '物理与电子信息学院', '移动互联', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800033', '张无忌', '男', 2016, '物理与电子信息学院', '移动互联', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800034', '赵敏', '女', 2016, '物理与电子信息学院', '移动互联', '13288585611', 'student');
INSERT INTO `all_people` VALUES ('201600800035', '周芷若', '女', 2016, '物理与电子信息学院', '移动互联', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800036', '殷天正', '男', 2016, '物理与电子信息学院', '移动互联', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800037', '杨逍', '男', 2016, '物理与电子信息学院', '移动互联', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800038', '韦一笑', '男', 2016, '物理与电子信息学院', '移动互联', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800039', '谢逊', '男', 2016, '物理与电子信息学院', '移动互联', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800040', '张三丰', '男', 2016, '物理与电子信息学院', '移动互联', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800267', '秦玖', '男', 2016, '物理与电子信息学院', '移动互联', '13287196612', 'student');
INSERT INTO `all_people` VALUES ('201600800300', '学生一', '男', 2016, '物理与电子信息学院', '智能信息', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800301', '学生二', '女', 2016, '物理与电子信息学院', '智能信息', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800302', '学生三', '女', 2016, '物理与电子信息学院', '智能信息', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800303', '学生四', '女', 2016, '物理与电子信息学院', '智能信息', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800304', '学生五', '男', 2016, '物理与电子信息学院', '智能信息', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800305', '学生六', '女', 2016, '物理与电子信息学院', '智能信息', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800306', '学生七', '男', 2016, '物理与电子信息学院', '智能信息', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800307', '学生八', '男', 2016, '物理与电子信息学院', '智能信息', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800308', '学生九', '女', 2016, '物理与电子信息学院', '智能信息', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800309', '学生十', '女', 2016, '物理与电子信息学院', '智能信息', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800310', '孙悟空', '男', 2016, '物理与电子信息学院', '智能信息', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800311', '猪悟能', '男', 2016, '物理与电子信息学院', '智能信息', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800312', '沙悟净', '女', 2016, '物理与电子信息学院', '智能信息', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800313', '金蝉子', '男', 2016, '物理与电子信息学院', '智能信息', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800314', '玉帝', '女', 2016, '物理与电子信息学院', '智能信息', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800315', '二郎神', '男', 2016, '物理与电子信息学院', '智能信息', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800316', '三圣母', '女', 2016, '物理与电子信息学院', '智能信息', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800317', '沉香', '男', 2016, '物理与电子信息学院', '智能信息', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800318', '嫦娥', '男', 2016, '物理与电子信息学院', '智能信息', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800319', '太上老君', '女', 2016, '物理与电子信息学院', '智能信息', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800320', '观音', '男', 2016, '物理与电子信息学院', '智能信息', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800321', '弥勒佛', '女', 2016, '物理与电子信息学院', '智能信息', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800322', '哪吒', '男', 2016, '物理与电子信息学院', '智能信息', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201600800323', '太白金星', '女', 2016, '物理与电子信息学院', '智能信息', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('20161111', 'æµè¯', 'ç·', 2017, 'æ ', 'æ ', '11111111111', 'teacher');
INSERT INTO `all_people` VALUES ('20161112', '测试', '男', 2017, '无', '无', '11111111111', 'teacher');
INSERT INTO `all_people` VALUES ('20161113', '测试', '男', 2017, '无', '无', '11111111111', 'teacher');
INSERT INTO `all_people` VALUES ('201700800300', '学生一', '男', 2017, '物理与电子信息学院', '智能信息', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201800800301', '学生二', '女', 2018, '物理与电子信息学院', '智能信息', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('201900800302', '学生三', '女', 2019, '物理与电子信息学院', '智能信息', '13288991111', 'student');
INSERT INTO `all_people` VALUES ('root', '系统管理员', '男', 0, '无', '无', '无', 'root');

-- ----------------------------
-- Table structure for faculty
-- ----------------------------
DROP TABLE IF EXISTS `faculty`;
CREATE TABLE `faculty`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '院系编号',
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '院系名称',
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of faculty
-- ----------------------------
INSERT INTO `faculty` VALUES ('01', '政法学院');
INSERT INTO `faculty` VALUES ('02', '教育科学学院');
INSERT INTO `faculty` VALUES ('03', '文学与新闻传播学院');
INSERT INTO `faculty` VALUES ('04', '历史与社会管理学院');
INSERT INTO `faculty` VALUES ('05', '外国语学院');
INSERT INTO `faculty` VALUES ('06', '美术学院');
INSERT INTO `faculty` VALUES ('07', '音乐学院');
INSERT INTO `faculty` VALUES ('08', '体育学院');
INSERT INTO `faculty` VALUES ('09', '经济管理学院');
INSERT INTO `faculty` VALUES ('10', '数学科学学院');
INSERT INTO `faculty` VALUES ('11', '物理与电子信息学院');
INSERT INTO `faculty` VALUES ('12', '化学化工学院');
INSERT INTO `faculty` VALUES ('13', '资源环境与规划学院');
INSERT INTO `faculty` VALUES ('14', '生命科学学院');
INSERT INTO `faculty` VALUES ('15', '信息管理学院');
INSERT INTO `faculty` VALUES ('16', '机电工程学院');
INSERT INTO `faculty` VALUES ('17', '汽车工程学院');
INSERT INTO `faculty` VALUES ('18', '纺织服装学院');
INSERT INTO `faculty` VALUES ('19', '生态与园林建筑学院');
INSERT INTO `faculty` VALUES ('20', '医药与护理学院');
INSERT INTO `faculty` VALUES ('21', '马克思主义学院');

-- ----------------------------
-- Table structure for register
-- ----------------------------
DROP TABLE IF EXISTS `register`;
CREATE TABLE `register`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号/工号',
  `pwd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份',
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of register
-- ----------------------------
INSERT INTO `register` VALUES ('110001', 'a111111111', 'teacher');
INSERT INTO `register` VALUES ('201600800001', 'a111111111', 'student');
INSERT INTO `register` VALUES ('201600800005', 'a111111111', 'student');
INSERT INTO `register` VALUES ('201600800011', 'a111111111', 'student');
INSERT INTO `register` VALUES ('root', 'root', 'root');

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号',
  `subject` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '科目',
  `score` int(11) NULL DEFAULT 0 COMMENT '成绩'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES ('201600800001', '语文', 96);
INSERT INTO `score` VALUES ('201600800001', '高数', 85);
INSERT INTO `score` VALUES ('201600800001', '英语', 56);
INSERT INTO `score` VALUES ('201600800001', 'Java', 77);
INSERT INTO `score` VALUES ('201600800001', 'Android', 62);
INSERT INTO `score` VALUES ('201600800001', 'Linux', 59);
INSERT INTO `score` VALUES ('201600800267', '语文', 99);
INSERT INTO `score` VALUES ('201600800267', '高数', 99);
INSERT INTO `score` VALUES ('201600800267', '英语', 99);
INSERT INTO `score` VALUES ('201600800267', 'Java', 99);
INSERT INTO `score` VALUES ('201600800267', 'Android', 100);
INSERT INTO `score` VALUES ('201600800267', 'Linux', 100);
INSERT INTO `score` VALUES ('201600800003', '语文', 99);
INSERT INTO `score` VALUES ('201600800003', '高数', 99);
INSERT INTO `score` VALUES ('201600800003', '英语', 99);
INSERT INTO `score` VALUES ('201600800003', 'Java', 99);
INSERT INTO `score` VALUES ('201600800003', 'Android', 99);
INSERT INTO `score` VALUES ('201600800003', 'Linux', 99);
INSERT INTO `score` VALUES ('201600800002', '语文', 56);
INSERT INTO `score` VALUES ('201600800002', '高数', 65);
INSERT INTO `score` VALUES ('201600800002', '英语', 88);
INSERT INTO `score` VALUES ('201600800002', 'Java', 25);
INSERT INTO `score` VALUES ('201600800002', 'Android', 33);
INSERT INTO `score` VALUES ('201600800002', 'Linux', 89);
INSERT INTO `score` VALUES ('201600800004', '语文', 89);
INSERT INTO `score` VALUES ('201600800004', '高数', 46);
INSERT INTO `score` VALUES ('201600800004', '英语', 75);
INSERT INTO `score` VALUES ('201600800004', 'Java', 69);
INSERT INTO `score` VALUES ('201600800004', 'Android', 88);
INSERT INTO `score` VALUES ('201600800004', 'Linux', 42);
INSERT INTO `score` VALUES ('201600800005', '语文', 50);
INSERT INTO `score` VALUES ('201600800005', '高数', 89);
INSERT INTO `score` VALUES ('201600800005', '英语', 86);
INSERT INTO `score` VALUES ('201600800005', 'Java', 47);
INSERT INTO `score` VALUES ('201600800005', 'Android', 77);
INSERT INTO `score` VALUES ('201600800005', 'Linux', 65);
INSERT INTO `score` VALUES ('201600800006', '语文', 50);
INSERT INTO `score` VALUES ('201600800006', '高数', 68);
INSERT INTO `score` VALUES ('201600800006', '英语', 75);
INSERT INTO `score` VALUES ('201600800006', 'Java', 85);
INSERT INTO `score` VALUES ('201600800006', 'Android', 96);
INSERT INTO `score` VALUES ('201600800006', 'Linux', 78);
INSERT INTO `score` VALUES ('201600800007', '语文', 100);
INSERT INTO `score` VALUES ('201600800007', '高数', 89);
INSERT INTO `score` VALUES ('201600800007', '英语', 56);
INSERT INTO `score` VALUES ('201600800007', 'Java', 75);
INSERT INTO `score` VALUES ('201600800007', 'Android', 85);
INSERT INTO `score` VALUES ('201600800007', 'Linux', 66);
INSERT INTO `score` VALUES ('201600800008', '语文', 25);
INSERT INTO `score` VALUES ('201600800008', '高数', 66);
INSERT INTO `score` VALUES ('201600800008', '英语', 46);
INSERT INTO `score` VALUES ('201600800008', 'Java', 77);
INSERT INTO `score` VALUES ('201600800008', 'Android', 98);
INSERT INTO `score` VALUES ('201600800008', 'Linux', 57);
INSERT INTO `score` VALUES ('201600800009', '语文', 99);
INSERT INTO `score` VALUES ('201600800009', '高数', 56);
INSERT INTO `score` VALUES ('201600800009', '英语', 75);
INSERT INTO `score` VALUES ('201600800009', 'Java', 65);
INSERT INTO `score` VALUES ('201600800009', 'Android', 98);
INSERT INTO `score` VALUES ('201600800009', 'Linux', 71);
INSERT INTO `score` VALUES ('201600800010', '语文', 65);
INSERT INTO `score` VALUES ('201600800010', '高数', 75);
INSERT INTO `score` VALUES ('201600800010', '英语', 25);
INSERT INTO `score` VALUES ('201600800010', 'Java', 98);
INSERT INTO `score` VALUES ('201600800010', 'Android', 65);
INSERT INTO `score` VALUES ('201600800010', 'Linux', 77);
INSERT INTO `score` VALUES ('201600800011', '语文', 85);
INSERT INTO `score` VALUES ('201600800011', '高数', 99);
INSERT INTO `score` VALUES ('201600800011', '英语', 45);
INSERT INTO `score` VALUES ('201600800011', 'Java', 36);
INSERT INTO `score` VALUES ('201600800011', 'Android', 75);
INSERT INTO `score` VALUES ('201600800011', 'Linux', 65);
INSERT INTO `score` VALUES ('201600800012', '语文', 85);
INSERT INTO `score` VALUES ('201600800012', '高数', 68);
INSERT INTO `score` VALUES ('201600800012', '英语', 77);
INSERT INTO `score` VALUES ('201600800012', 'Java', 82);
INSERT INTO `score` VALUES ('201600800012', 'Android', 68);
INSERT INTO `score` VALUES ('201600800012', 'Linux', 55);
INSERT INTO `score` VALUES ('201600800013', '语文', 86);
INSERT INTO `score` VALUES ('201600800013', '高数', 77);
INSERT INTO `score` VALUES ('201600800013', '英语', 65);
INSERT INTO `score` VALUES ('201600800013', 'Java', 95);
INSERT INTO `score` VALUES ('201600800013', 'Android', 52);
INSERT INTO `score` VALUES ('201600800013', 'Linux', 35);
INSERT INTO `score` VALUES ('201600800015', '语文', 25);
INSERT INTO `score` VALUES ('201600800015', '高数', 88);
INSERT INTO `score` VALUES ('201600800015', '英语', 85);
INSERT INTO `score` VALUES ('201600800015', 'Java', 45);
INSERT INTO `score` VALUES ('201600800015', 'Android', 69);
INSERT INTO `score` VALUES ('201600800015', 'Linux', 80);
INSERT INTO `score` VALUES ('201600800014', '语文', 25);
INSERT INTO `score` VALUES ('201600800014', '高数', 88);
INSERT INTO `score` VALUES ('201600800014', '英语', 58);
INSERT INTO `score` VALUES ('201600800014', 'Java', 58);
INSERT INTO `score` VALUES ('201600800014', 'Android', 25);
INSERT INTO `score` VALUES ('201600800014', 'Linux', 85);
INSERT INTO `score` VALUES ('201600800016', '语文', 58);
INSERT INTO `score` VALUES ('201600800016', '高数', 65);
INSERT INTO `score` VALUES ('201600800016', '英语', 0);
INSERT INTO `score` VALUES ('201600800016', 'Java', 58);
INSERT INTO `score` VALUES ('201600800016', 'Android', 0);
INSERT INTO `score` VALUES ('201600800016', 'Linux', 0);
INSERT INTO `score` VALUES ('201600800020', '语文', 85);
INSERT INTO `score` VALUES ('201600800020', '高数', 45);
INSERT INTO `score` VALUES ('201600800020', '英语', 0);
INSERT INTO `score` VALUES ('201600800020', 'Java', 0);
INSERT INTO `score` VALUES ('201600800020', 'Android', 0);
INSERT INTO `score` VALUES ('201600800020', 'Linux', 0);
INSERT INTO `score` VALUES ('201600800022', '语文', 85);
INSERT INTO `score` VALUES ('201600800022', '高数', 0);
INSERT INTO `score` VALUES ('201600800022', '英语', 0);
INSERT INTO `score` VALUES ('201600800022', 'Java', 0);
INSERT INTO `score` VALUES ('201600800022', 'Android', 0);
INSERT INTO `score` VALUES ('201600800022', 'Linux', 0);
INSERT INTO `score` VALUES ('201600800024', '语文', 0);
INSERT INTO `score` VALUES ('201600800024', '高数', 0);
INSERT INTO `score` VALUES ('201600800024', '英语', 0);
INSERT INTO `score` VALUES ('201600800024', 'Java', 0);
INSERT INTO `score` VALUES ('201600800024', 'Android', 0);
INSERT INTO `score` VALUES ('201600800024', 'Linux', 0);
INSERT INTO `score` VALUES ('201600800019', '语文', 0);
INSERT INTO `score` VALUES ('201600800019', '高数', 0);
INSERT INTO `score` VALUES ('201600800019', '英语', 0);
INSERT INTO `score` VALUES ('201600800019', 'Java', 0);
INSERT INTO `score` VALUES ('201600800019', 'Android', 0);
INSERT INTO `score` VALUES ('201600800019', 'Linux', 0);
INSERT INTO `score` VALUES ('201600800021', '语文', 0);
INSERT INTO `score` VALUES ('201600800021', '高数', 0);
INSERT INTO `score` VALUES ('201600800021', '英语', 0);
INSERT INTO `score` VALUES ('201600800021', 'Java', 0);
INSERT INTO `score` VALUES ('201600800021', 'Android', 0);
INSERT INTO `score` VALUES ('201600800021', 'Linux', 0);
INSERT INTO `score` VALUES ('201600800017', '语文', 0);
INSERT INTO `score` VALUES ('201600800017', '高数', 0);
INSERT INTO `score` VALUES ('201600800017', '英语', 0);
INSERT INTO `score` VALUES ('201600800017', 'Java', 0);
INSERT INTO `score` VALUES ('201600800017', 'Android', 0);
INSERT INTO `score` VALUES ('201600800017', 'Linux', 0);

-- ----------------------------
-- Table structure for special
-- ----------------------------
DROP TABLE IF EXISTS `special`;
CREATE TABLE `special`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '专业编号',
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '院系名称',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '专业名称',
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of special
-- ----------------------------
INSERT INTO `special` VALUES ('0101', '政法学院', '法学');
INSERT INTO `special` VALUES ('0102', '政法学院', '行政管理');
INSERT INTO `special` VALUES ('0103', '政法学院', '法律事务');
INSERT INTO `special` VALUES ('0201', '政法学院', '学前教育');
INSERT INTO `special` VALUES ('0202', '政法学院', '小学教育');
INSERT INTO `special` VALUES ('0203', '政法学院', '应用心理学');
INSERT INTO `special` VALUES ('0301', '文学与新闻传播学院', '汉语言文学');
INSERT INTO `special` VALUES ('0302', '文学与新闻传播学院', '新闻学');
INSERT INTO `special` VALUES ('0303', '文学与新闻传播学院', '汉语国际教育');
INSERT INTO `special` VALUES ('0304', '文学与新闻传播学院', '语文教育');
INSERT INTO `special` VALUES ('0305', '文学与新闻传播学院', '新闻采编与制作');
INSERT INTO `special` VALUES ('1101', '物理与电子信息学院', '移动互联');
INSERT INTO `special` VALUES ('1102', '物理与电子信息学院', '智能信息');
INSERT INTO `special` VALUES ('1103', '物理与电子信息学院', '电子信息工程');
INSERT INTO `special` VALUES ('1104', '物理与电子信息学院', '物联网工程');
INSERT INTO `special` VALUES ('1105', '物理与电子信息学院', '应用物理学');
INSERT INTO `special` VALUES ('1106', '物理与电子信息学院', '物理学(师范类)');

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject`  (
  `classes` int(11) NOT NULL COMMENT '年级',
  `special` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '专业',
  `subject` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '科目'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES (2016, '移动互联', '语文');
INSERT INTO `subject` VALUES (2016, '移动互联', '高数');
INSERT INTO `subject` VALUES (2016, '移动互联', '英语');
INSERT INTO `subject` VALUES (2016, '移动互联', 'Java');
INSERT INTO `subject` VALUES (2016, '移动互联', 'Android');
INSERT INTO `subject` VALUES (2016, '移动互联', 'Linux');
INSERT INTO `subject` VALUES (2016, '智能信息', '语文');
INSERT INTO `subject` VALUES (2016, '智能信息', '高数');
INSERT INTO `subject` VALUES (2016, '智能信息', '英语');
INSERT INTO `subject` VALUES (2016, '智能信息', 'Java');
INSERT INTO `subject` VALUES (2016, '智能信息', 'Android');
INSERT INTO `subject` VALUES (2016, '智能信息', '体育');
INSERT INTO `subject` VALUES (2017, '移动互联', '高数');
INSERT INTO `subject` VALUES (2017, '移动互联', '英语');
INSERT INTO `subject` VALUES (2017, '移动互联', '物理');
INSERT INTO `subject` VALUES (2017, '移动互联', 'C++');
INSERT INTO `subject` VALUES (2017, '移动互联', '通信原理');
INSERT INTO `subject` VALUES (2017, '移动互联', 'MySQL');
INSERT INTO `subject` VALUES (2018, '移动互联', '数电');
INSERT INTO `subject` VALUES (2018, '移动互联', '模电');

SET FOREIGN_KEY_CHECKS = 1;
