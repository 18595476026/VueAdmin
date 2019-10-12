/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : vueadmin

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-10-12 09:54:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for yun_admin_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `yun_admin_operate_log`;
CREATE TABLE `yun_admin_operate_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志id,表id',
  `admin_uid` int(11) NOT NULL COMMENT '操作管理员id',
  `username` varchar(100) NOT NULL COMMENT '管理员用户名',
  `create_time` int(10) NOT NULL COMMENT '操作时间',
  `ip` varchar(16) NOT NULL COMMENT '操作ip',
  `log_note` varchar(255) NOT NULL COMMENT '日志描述',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=523 DEFAULT CHARSET=utf8 COMMENT='管理员操作日志表';

-- ----------------------------
-- Records of yun_admin_operate_log
-- ----------------------------
INSERT INTO `yun_admin_operate_log` VALUES ('203', '1', 'admin', '1567387974', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('204', '1', 'admin', '1567413168', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('205', '1', 'admin', '1567416052', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('206', '1', 'admin', '1567420016', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('207', '1', 'admin', '1567420188', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('208', '1', 'admin', '1567495206', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('209', '1', 'admin', '1567495512', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('210', '1', 'admin', '1567495520', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('211', '1', 'admin', '1567495549', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('212', '1', 'admin', '1567495562', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('213', '1', 'admin', '1567500553', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('214', '1', 'admin', '1567500557', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('215', '1', 'admin', '1567565355', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('216', '1', 'admin', '1567582081', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('217', '1', 'admin', '1567590845', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('218', '1', 'admin', '1567590883', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('219', '1', 'admin', '1567590944', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('220', '1', 'admin', '1567591001', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('221', '1', 'admin', '1567591061', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('222', '1', 'admin', '1567591196', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('223', '1', 'admin', '1567591286', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('224', '1', 'admin', '1567591432', '', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('225', '1', 'admin', '1567591549', '', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('226', '1', 'admin', '1567591618', '', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('227', '1', 'admin', '1567592043', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('228', '1', 'admin', '1567592723', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('229', '1', 'admin', '1567592780', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('230', '1', 'admin', '1567647495', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('231', '1', 'admin', '1567648215', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('232', '1', 'admin', '1567649248', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('233', '1', 'admin', '1567649954', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('234', '1', 'admin', '1567650163', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('235', '1', 'admin', '1567650231', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('236', '1', 'admin', '1567650306', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('237', '1', 'admin', '1567650384', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('238', '1', 'admin', '1567650684', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('239', '1', 'admin', '1567650712', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('240', '1', 'admin', '1567651628', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('241', '1', 'admin', '1567651685', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('242', '1', 'admin', '1567651959', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('243', '1', 'admin', '1567652007', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('244', '1', 'admin', '1567652608', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('245', '1', 'admin', '1567653264', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('246', '1', 'admin', '1567654540', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('247', '1', 'admin', '1567654854', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('248', '1', 'admin', '1567673318', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('249', '1', 'admin', '1567674380', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('250', '1', 'admin', '1567676223', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('251', '1', 'admin', '1567681094', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('252', '1', 'admin', '1567730885', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('253', '1', 'admin', '1567732033', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('254', '1', 'admin', '1567733449', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('255', '1', 'admin', '1567733762', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('256', '1', 'admin', '1567733961', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('257', '1', 'admin', '1567764973', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('258', '1', 'admin', '1567997416', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('259', '1', 'admin', '1568020714', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('260', '1', 'admin', '1568100452', '127.0.0.1', '新增菜单信息成功(菜单操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('261', '1', 'admin', '1568100531', '127.0.0.1', '新增菜单信息成功(菜单操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('262', '1', 'admin', '1568100569', '127.0.0.1', '删除菜单信息成功(菜单操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('263', '1', 'admin', '1568100577', '127.0.0.1', '删除菜单信息成功(菜单操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('264', '1', 'admin', '1568100653', '127.0.0.1', '新增菜单信息成功(菜单操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('265', '1', 'admin', '1568100669', '127.0.0.1', '删除菜单信息成功(菜单操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('266', '1', 'admin', '1568100735', '127.0.0.1', '新增菜单信息成功(菜单操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('267', '1', 'admin', '1568100837', '127.0.0.1', '删除菜单信息成功(菜单操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('268', '1', 'admin', '1568101461', '127.0.0.1', '修改菜单信息成功(菜单操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('269', '1', 'admin', '1568101471', '127.0.0.1', '修改菜单信息成功(菜单操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('270', '1', 'admin', '1568101973', '127.0.0.1', '修改菜单信息成功(菜单操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('271', '1', 'admin', '1568102007', '127.0.0.1', '修改菜单信息成功(菜单操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('272', '1', 'admin', '1568103341', '127.0.0.1', '修改菜单信息成功(菜单操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('273', '1', 'admin', '1568104022', '127.0.0.1', '修改菜单信息成功(菜单操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('274', '1', 'admin', '1568104035', '127.0.0.1', '修改菜单信息成功(菜单操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('275', '1', 'admin', '1568104044', '127.0.0.1', '修改菜单信息成功(菜单操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('276', '1', 'admin', '1568104116', '127.0.0.1', '修改菜单信息成功(菜单操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('277', '1', 'admin', '1568104181', '127.0.0.1', '修改菜单信息成功(菜单操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('278', '1', 'admin', '1568104205', '127.0.0.1', '修改菜单信息成功(菜单操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('279', '1', 'admin', '1568104337', '127.0.0.1', '修改菜单信息成功(菜单操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('280', '1', 'admin', '1568104381', '127.0.0.1', '修改菜单信息成功(菜单操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('281', '1', 'admin', '1568106882', '127.0.0.1', '新增菜单信息成功(菜单操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('282', '1', 'admin', '1568106998', '127.0.0.1', '修改菜单信息成功(菜单操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('283', '1', 'admin', '1568164055', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('284', '1', 'admin', '1568186084', '127.0.0.1', '删除管理员用户信息成功(管理员操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('285', '1', 'admin', '1568198778', '127.0.0.1', '新增管理员用户信息成功(管理员操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('286', '1', 'admin', '1568199302', '127.0.0.1', '修改管理员用户信息成功(管理员操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('287', '1', 'admin', '1568199328', '127.0.0.1', '修改管理员用户信息成功(管理员操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('288', '1', 'admin', '1568199341', '127.0.0.1', '修改管理员用户信息成功(管理员操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('289', '1', 'admin', '1568199665', '127.0.0.1', '修改管理员用户信息成功(管理员操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('290', '1', 'admin', '1568199720', '127.0.0.1', '删除管理员用户信息成功(管理员操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('291', '1', 'admin', '1568200756', '127.0.0.1', '锁定禁用管理员用户信息成功(管理员操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('292', '1', 'admin', '1568200867', '127.0.0.1', '解除锁定管理员用户信息成功(管理员操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('293', '1', 'admin', '1568200945', '127.0.0.1', '锁定禁用管理员用户信息成功(管理员操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('294', '1', 'admin', '1568200956', '127.0.0.1', '解除锁定管理员用户信息成功(管理员操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('295', '1', 'admin', '1568253220', '127.0.0.1', '新增管理员用户信息成功(管理员操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('296', '1', 'admin', '1568259783', '127.0.0.1', '解除锁定角色权限组成功(角色操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('297', '1', 'admin', '1568259796', '127.0.0.1', '锁定禁用角色权限组成功(角色操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('298', '1', 'admin', '1568259837', '127.0.0.1', '解除锁定角色权限组成功(角色操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('299', '1', 'admin', '1568259846', '127.0.0.1', '锁定禁用角色权限组成功(角色操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('300', '1', 'admin', '1568259859', '127.0.0.1', '删除角色权限组成功(角色操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('301', '1', 'admin', '1568281958', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('302', '1', 'admin', '1568282161', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('303', '1', 'admin', '1568598818', '127.0.0.1', '修改角色权限组成功(角色操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('304', '1', 'admin', '1568598824', '127.0.0.1', '修改角色权限组成功(角色操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('305', '1', 'admin', '1568598832', '127.0.0.1', '修改角色权限组成功(角色操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('306', '1', 'admin', '1568598841', '127.0.0.1', '修改角色权限组成功(角色操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('307', '1', 'admin', '1568598849', '127.0.0.1', '修改角色权限组成功(角色操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('308', '1', 'admin', '1568598868', '127.0.0.1', '解除锁定角色权限组成功(角色操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('309', '1', 'admin', '1568601500', '127.0.0.1', '新增角色权限组成功(角色操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('310', '1', 'admin', '1568601582', '127.0.0.1', '新增角色权限组成功(角色操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('311', '1', 'admin', '1568601614', '127.0.0.1', '删除角色权限组成功(角色操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('312', '1', 'admin', '1568601620', '127.0.0.1', '删除角色权限组成功(角色操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('313', '1', 'admin', '1568625035', '127.0.0.1', '修改个人信息成功(修改信息)');
INSERT INTO `yun_admin_operate_log` VALUES ('314', '1', 'admin', '1568625184', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('315', '1', 'admin', '1568625235', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('316', '1', 'admin', '1568629565', '127.0.0.1', '修改登陆密码成功(修改密码)');
INSERT INTO `yun_admin_operate_log` VALUES ('317', '1', 'admin', '1568629573', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('318', '0', 'admin', '1568630167', '127.0.0.1', '用户或密码错误(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('319', '0', 'admin', '1568630169', '127.0.0.1', '用户或密码错误(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('320', '0', 'admin', '1568630170', '127.0.0.1', '用户或密码错误(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('321', '0', 'admin', '1568630170', '127.0.0.1', '用户或密码错误(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('322', '0', 'admin', '1568630170', '127.0.0.1', '用户或密码错误(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('323', '0', 'admin', '1568630183', '127.0.0.1', '用户或密码错误(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('324', '0', 'admin', '1568630184', '127.0.0.1', '用户或密码错误(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('325', '1', 'admin', '1568630189', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('326', '1', 'admin', '1568630302', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('327', '1', 'admin', '1568630377', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('328', '1', 'admin', '1568630391', '127.0.0.1', '修改登陆密码成功(修改密码)');
INSERT INTO `yun_admin_operate_log` VALUES ('329', '1', 'admin', '1568630396', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('330', '1', 'admin', '1568683308', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('331', '1', 'admin', '1568683416', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('332', '1', 'admin', '1568683420', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('333', '1', 'admin', '1568683545', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('334', '1', 'admin', '1568683551', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('335', '1', 'admin', '1568683574', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('336', '1', 'admin', '1568683577', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('337', '1', 'admin', '1568683657', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('338', '1', 'admin', '1568683660', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('339', '1', 'admin', '1568683748', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('340', '1', 'admin', '1568683752', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('341', '1', 'admin', '1568683836', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('342', '1', 'admin', '1568686312', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('343', '1', 'admin', '1568701354', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('344', '1', 'admin', '1568709938', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('345', '1', 'admin', '1568775229', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('346', '1', 'admin', '1568775721', '127.0.0.1', '修改菜单信息成功(菜单操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('347', '1', 'admin', '1568775752', '127.0.0.1', '修改菜单信息成功(菜单操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('348', '1', 'admin', '1568775797', '127.0.0.1', '修改菜单信息成功(菜单操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('349', '1', 'admin', '1568775858', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('350', '1', 'admin', '1568790721', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('351', '1', 'admin', '1568792101', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('352', '1', 'admin', '1568793552', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('353', '1', 'admin', '1568793861', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('354', '1', 'admin', '1568795270', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('355', '1', 'admin', '1568795405', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('356', '1', 'admin', '1568795619', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('357', '1', 'admin', '1568795752', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('358', '1', 'admin', '1568878319', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('359', '1', 'admin', '1568878369', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('360', '1', 'admin', '1568878523', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('361', '1', 'admin', '1568879549', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('362', '1', 'admin', '1568885955', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('363', '1', 'admin', '1568886814', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('364', '1', 'admin', '1568888672', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('365', '1', 'admin', '1568946716', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('366', '1', 'admin', '1568947335', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('367', '1', 'admin', '1568947474', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('368', '1', 'admin', '1568947529', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('369', '1', 'admin', '1568947754', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('370', '1', 'admin', '1568948034', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('371', '1', 'admin', '1568948178', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('372', '1', 'admin', '1568948382', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('373', '1', 'admin', '1568948587', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('374', '1', 'admin', '1568948710', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('375', '1', 'admin', '1568948995', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('376', '1', 'admin', '1568965472', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('377', '1', 'admin', '1568971527', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('378', '1', 'admin', '1568971624', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('379', '1', 'admin', '1568971665', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('380', '1', 'admin', '1568971809', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('381', '1', 'admin', '1568973949', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('382', '1', 'admin', '1568974926', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('383', '1', 'admin', '1568975291', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('384', '1', 'admin', '1569026973', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('385', '1', 'admin', '1569028886', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('386', '1', 'admin', '1569031072', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('387', '1', 'admin', '1569031175', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('388', '1', 'admin', '1569033369', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('389', '1', 'admin', '1569033449', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('390', '1', 'admin', '1569033474', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('391', '1', 'admin', '1569033606', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('392', '1', 'admin', '1569033612', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('393', '1', 'admin', '1569033625', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('394', '1', 'admin', '1569033628', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('395', '1', 'admin', '1569035799', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('396', '1', 'admin', '1569035879', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('397', '1', 'admin', '1569035890', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('398', '1', 'admin', '1569036126', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('399', '1', 'admin', '1569036136', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('400', '1', 'admin', '1569038812', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('401', '1', 'admin', '1569039445', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('402', '1', 'admin', '1569039502', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('403', '1', 'admin', '1569039582', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('404', '1', 'admin', '1569039620', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('405', '1', 'admin', '1569039647', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('406', '1', 'admin', '1569039650', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('407', '1', 'admin', '1569039664', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('408', '1', 'admin', '1569039665', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('409', '1', 'admin', '1569039665', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('410', '1', 'admin', '1569039666', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('411', '1', 'admin', '1569039679', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('412', '1', 'admin', '1569039700', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('413', '1', 'admin', '1569039712', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('414', '1', 'admin', '1569039799', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('415', '1', 'admin', '1569046896', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('416', '1', 'admin', '1569046976', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('417', '1', 'admin', '1569047070', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('418', '1', 'admin', '1569047111', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('419', '1', 'admin', '1569047182', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('420', '1', 'admin', '1569047320', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('421', '1', 'admin', '1569051045', '127.0.0.1', '修改管理员用户信息成功(管理员操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('422', '1', 'admin', '1569052376', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('423', '1', 'admin', '1569052542', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('424', '1', 'admin', '1569052577', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('425', '1', 'admin', '1569052656', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('426', '1', 'admin', '1569052704', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('427', '1', 'admin', '1569052731', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('428', '1', 'admin', '1569053560', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('429', '1', 'admin', '1569055898', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('430', '1', 'admin', '1569056129', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('431', '1', 'admin', '1569056604', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('432', '1', 'admin', '1569056831', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('433', '1', 'admin', '1569056856', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('434', '1', 'admin', '1569056929', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('435', '1', 'admin', '1569057542', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('436', '1', 'admin', '1569057546', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('437', '1', 'admin', '1569057755', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('438', '1', 'admin', '1569057764', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('439', '1', 'admin', '1569057785', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('440', '1', 'admin', '1569057810', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('441', '1', 'admin', '1569057958', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('442', '1', 'admin', '1569057965', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('443', '1', 'admin', '1569058001', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('444', '1', 'admin', '1569058307', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('445', '1', 'admin', '1569058523', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('446', '1', 'admin', '1569058525', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('447', '1', 'admin', '1569058543', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('448', '1', 'admin', '1569058566', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('449', '1', 'admin', '1569058638', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('450', '1', 'admin', '1569058671', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('451', '1', 'admin', '1569059115', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('452', '1', 'admin', '1569059117', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('453', '1', 'admin', '1569059936', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('454', '1', 'admin', '1569059956', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('455', '1', 'admin', '1569059979', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('456', '1', 'admin', '1569200679', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('457', '1', 'admin', '1569200730', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('458', '1', 'admin', '1569200775', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('459', '1', 'admin', '1569200828', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('460', '1', 'admin', '1569200895', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('461', '1', 'admin', '1569200990', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('462', '1', 'admin', '1569201021', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('463', '1', 'admin', '1569201034', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('464', '1', 'admin', '1569201036', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('465', '1', 'admin', '1569201098', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('466', '1', 'admin', '1569201102', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('467', '1', 'admin', '1569201121', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('468', '1', 'admin', '1569201128', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('469', '1', 'admin', '1569201129', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('470', '1', 'admin', '1569202704', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('471', '1', 'admin', '1569202707', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('472', '1', 'admin', '1569202769', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('473', '1', 'admin', '1569203103', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('474', '1', 'admin', '1569579159', '127.0.0.1', '修改文章信息成功(文章操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('475', '1', 'admin', '1569580373', '127.0.0.1', '新增文章信息成功(文章操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('476', '1', 'admin', '1569719149', '127.0.0.1', '删除文章成功(内容管理操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('477', '1', 'admin', '1569719212', '127.0.0.1', '删除文章成功(内容管理操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('478', '1', 'admin', '1569728960', '127.0.0.1', '修改文章类别信息成功(文章类别操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('479', '1', 'admin', '1569730989', '127.0.0.1', '修改文章类别信息成功(文章类别操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('480', '1', 'admin', '1569731060', '127.0.0.1', '修改文章类别信息成功(文章类别操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('481', '1', 'admin', '1569731110', '127.0.0.1', '新增文章类别信息成功(文章类别操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('482', '1', 'admin', '1569731180', '127.0.0.1', '新增文章类别信息成功(文章类别操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('483', '1', 'admin', '1569731237', '127.0.0.1', '新增文章类别信息成功(文章类别操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('484', '1', 'admin', '1569737788', '127.0.0.1', '删除文章分类信息成功(文章类别操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('485', '1', 'admin', '1569806759', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('486', '1', 'admin', '1569807997', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('487', '1', 'admin', '1569808065', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('488', '1', 'admin', '1569808086', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('489', '1', 'admin', '1569808855', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('490', '1', 'admin', '1569809542', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('491', '1', 'admin', '1569810013', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('492', '1', 'admin', '1569810037', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('493', '1', 'admin', '1569810330', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('494', '0', 'admin1', '1569810388', '127.0.0.1', '用户或密码错误(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('495', '0', 'admin2', '1569810401', '127.0.0.1', '用户或密码错误(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('496', '1', 'admin', '1569810551', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('497', '1', 'admin', '1569810554', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('498', '14', 'admin1', '1569810562', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('499', '14', 'admin1', '1569810635', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('500', '1', 'admin', '1569810641', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('501', '1', 'admin', '1569810726', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('502', '15', 'admin2', '1569810733', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('503', '15', 'admin2', '1569811034', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('504', '14', 'admin1', '1569811041', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('505', '14', 'admin1', '1569811051', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('506', '15', 'admin2', '1569811057', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('507', '15', 'admin2', '1569811060', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('508', '16', 'admin3', '1569811066', '127.0.0.1', '登陆中心服务器失败(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('509', '16', 'admin3', '1569811074', '127.0.0.1', '登陆中心服务器失败(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('510', '14', 'admin1', '1569812215', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('511', '1', 'admin', '1569812348', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('512', '1', 'admin', '1569812354', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('513', '1', 'admin', '1569812570', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('514', '1', 'admin', '1569812650', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('515', '1', 'admin', '1569812654', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('516', '1', 'admin', '1569812838', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('517', '14', 'admin1', '1569812845', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('518', '1', 'admin', '1569812848', '127.0.0.1', '注销登陆(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('519', '15', 'admin2', '1569812853', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('520', '1', 'admin', '1570496976', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('521', '1', 'admin', '1570842025', '127.0.0.1', '登陆成功(登陆操作)');
INSERT INTO `yun_admin_operate_log` VALUES ('522', '1', 'admin', '1570842057', '127.0.0.1', '注销登陆(登陆操作)');

-- ----------------------------
-- Table structure for yun_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `yun_admin_user`;
CREATE TABLE `yun_admin_user` (
  `admin_uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id，表id',
  `group_id` int(11) DEFAULT '0' COMMENT '用户组id',
  `username` varchar(225) NOT NULL COMMENT '用户名',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：1正常，0禁用',
  `head_pic` varchar(1024) NOT NULL COMMENT '头像',
  `sex` tinyint(1) NOT NULL COMMENT '0保密，1男，2女',
  `birthday` date NOT NULL COMMENT '生日',
  `phone` varchar(20) NOT NULL COMMENT '电话',
  `qq` varchar(20) NOT NULL COMMENT 'QQ',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `password` varchar(32) NOT NULL COMMENT '登录密码',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改删除时间',
  `identifier` varchar(32) NOT NULL COMMENT '用户标识',
  `token` varchar(32) NOT NULL COMMENT '用户令牌',
  `salt` varchar(10) NOT NULL COMMENT '备用',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已被删除：0未删除，1已删除',
  PRIMARY KEY (`admin_uid`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of yun_admin_user
-- ----------------------------
INSERT INTO `yun_admin_user` VALUES ('1', '1', 'admin', '1', 'https://zos.alipayobjects.com/rmsportal/jkjgkEfvpUPVyRjUImniVslZfWPnJuuZ.png', '1', '2018-12-31', '18003829681', '214564382', 'zhihua_wei@foxmail.com', '883d301c63abedfd6266a0c32a803d7e', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'e9c465f0c6cb541fdb47193baa7a45fa', '6dea13fbf73480f024106a433e2f0a73', 'NMbaNzuRfz', '0');
INSERT INTO `yun_admin_user` VALUES ('2', '2', 'test1', '1', 'https://zos.alipayobjects.com/rmsportal/jkjgkEfvpUPVyRjUImniVslZfWPnJuuZ.png', '2', '2012-05-08', '15000000002', '222222222', 'zhihua_wei@sina.com', '883d301c63abedfd6266a0c32a803d7e', '0000-00-00 00:00:00', '2019-09-21 15:30:45', 'b88c3498ea3ec755d2d2fd64d9706df9', '14844bb136e6604c91d28f49acc1c2b4', 'PPVNKYJFnr', '0');
INSERT INTO `yun_admin_user` VALUES ('3', '0', 'test2', '1', '', '1', '2013-05-07', '15000000001', '55555555', 'zhihua_wei@qq.com', '883d301c63abedfd6266a0c32a803d7e', '0000-00-00 00:00:00', '2019-08-26 15:44:03', '', '', '', '0');
INSERT INTO `yun_admin_user` VALUES ('4', '3', 'webadmin', '0', 'a:3:{s:8:\"head_pic\";s:90:\"http://yunadmin.wzh.com/uploads/head_picture/20190826\\8ae1e1000692fa6af7fa012da8bfa451.jpg\";s:18:\"head_pic_140_thumb\";s:100:\"http://yunadmin.wzh.com/uploads/head_picture/thumb/20190826/140_8ae1e1000692fa6af7fa012da8bfa451.jpg\";s:17:\"head_pic_30_thumb\";s:99:\"http://yunadmin.wzh.com/uploads/head_picture/thumb/20190826/30_8ae1e1000692fa6af7fa012da8bfa451.jpg\";}', '0', '2016-08-01', '18003829681', '3333333', '867428225@qq.com', '', '0000-00-00 00:00:00', '2019-09-11 15:14:44', '', '', '', '1');
INSERT INTO `yun_admin_user` VALUES ('11', '2', 'test5', '1', 'a:3:{s:8:\"head_pic\";s:90:\"http://yunadmin.wzh.com/uploads/head_picture/20190826\\9863422f1fe412d73d993c6081b0c976.jpg\";s:18:\"head_pic_140_thumb\";s:100:\"http://yunadmin.wzh.com/uploads/head_picture/thumb/20190826/140_9863422f1fe412d73d993c6081b0c976.jpg\";s:17:\"head_pic_30_thumb\";s:99:\"http://yunadmin.wzh.com/uploads/head_picture/thumb/20190826/30_9863422f1fe412d73d993c6081b0c976.jpg\";}', '0', '2019-08-26', '18003829681', '3333333', '867428225@qq.com', '883d301c63abedfd6266a0c32a803d7e', '2019-08-26 10:40:06', '2019-08-26 10:40:06', '', '', '', '0');
INSERT INTO `yun_admin_user` VALUES ('12', '2', 'test4', '0', '', '1', '2019-09-11', '18003829681', '123456789', '867428225@qq.com', '', '2019-09-11 18:46:18', '2019-09-11 19:02:00', '', '', '', '1');
INSERT INTO `yun_admin_user` VALUES ('13', '2', '测试1', '1', 'https://zos.alipayobjects.com/rmsportal/jkjgkEfvpUPVyRjUImniVslZfWPnJuuZ.png', '1', '2019-09-12', '18003829681', '123456789', '867428225@qq.com', '883d301c63abedfd6266a0c32a803d7e', '2019-09-12 09:53:40', '2019-09-12 09:53:40', '', '', '', '0');
INSERT INTO `yun_admin_user` VALUES ('14', '1', 'admin1', '1', 'https://zos.alipayobjects.com/rmsportal/jkjgkEfvpUPVyRjUImniVslZfWPnJuuZ.png', '1', '2018-12-31', '18003829681', '214564382', 'zhihua_wei@foxmail.com', '883d301c63abedfd6266a0c32a803d7e', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0d809f8e5f52116a5cceb426a00aae86', 'c094d98a5d45c365ca21a8cfa0dd95b6', 'RETNKpWu62', '0');
INSERT INTO `yun_admin_user` VALUES ('15', '1', 'admin2', '1', 'https://zos.alipayobjects.com/rmsportal/jkjgkEfvpUPVyRjUImniVslZfWPnJuuZ.png', '1', '2018-12-31', '18003829681', '214564382', 'zhihua_wei@foxmail.com', '883d301c63abedfd6266a0c32a803d7e', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '651a224819749d61f159d309a695051e', '467762a8c7ca1257d683473b8bc61791', 'RgCejxUu25', '0');

-- ----------------------------
-- Table structure for yun_article
-- ----------------------------
DROP TABLE IF EXISTS `yun_article`;
CREATE TABLE `yun_article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章id，表id',
  `category_id` int(11) NOT NULL COMMENT '分类id',
  `article_title` varchar(255) NOT NULL COMMENT '文章标题',
  `keywords` varchar(255) NOT NULL COMMENT '关键词',
  `article_desc` varchar(255) NOT NULL COMMENT '文章摘要',
  `article_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '文章插图',
  `thumb_pic` varchar(255) DEFAULT NULL COMMENT '图片缩略图140*140',
  `content` text NOT NULL COMMENT '文章内容',
  `create_time` int(10) unsigned NOT NULL COMMENT '发布时间',
  `modify_time` int(10) NOT NULL COMMENT '最后更新修改时间',
  `click_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示：0不显示，1显示',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除：0 未删除，1已删除',
  PRIMARY KEY (`article_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of yun_article
-- ----------------------------
INSERT INTO `yun_article` VALUES ('1', '3', '关于我们测试', '测试', '测试专用', 'https://zos.alipayobjects.com/rmsportal/jkjgkEfvpUPVyRjUImniVslZfWPnJuuZ.png', null, '<p>这是测试文章</p>', '1480749892', '2019', '0', '1', '0');
INSERT INTO `yun_article` VALUES ('2', '3', '测试文章', '测试文章', '测试文章', '', null, '<b>测试文章内容</b>', '1480753335', '1480756075', '0', '1', '0');
INSERT INTO `yun_article` VALUES ('4', '1', 'dafdf', 'dfadfa', 'fadsfadsfadsf', '', null, 'fadsfasdfasdf', '2019', '2019', '0', '0', '1');
INSERT INTO `yun_article` VALUES ('5', '3', '测试添加', '测试', '王爽添加', 'https://zos.alipayobjects.com/rmsportal/jkjgkEfvpUPVyRjUImniVslZfWPnJuuZ.png', null, '<p>喜迎70周年国庆</p>', '2019', '2019', '0', '0', '1');

-- ----------------------------
-- Table structure for yun_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `yun_auth_group`;
CREATE TABLE `yun_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '组(表)id',
  `title` char(100) NOT NULL DEFAULT '' COMMENT '角色(用户组)中文名称',
  `rules` varchar(512) NOT NULL DEFAULT '' COMMENT '角色(用户组)拥有的规则id，多个规则","隔开',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '角色(用户组)状态：1正常，0禁用',
  `note` text NOT NULL COMMENT '角色(用户组)描述',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改删除时间',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否被删除：0未删除，1已删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='用户组表';

-- ----------------------------
-- Records of yun_auth_group
-- ----------------------------
INSERT INTO `yun_auth_group` VALUES ('1', '超级管理员', '1,2,58,65,59,60,61,62,3,56,4,6,5,7,8,9,10,51,52,53,57,11,54,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,29,30,31,32,33,34,36,37,38,39,40,41,42,43,44,45,46,47,63,48,49,50,55', '1', '拥有系统所有权限！', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_group` VALUES ('2', '管理员', '24,25,26,27,29,30,31,32,33,34,36,48,49,50,51,55,13,14,16,17,18,15,19,20,21,22,23,1', '1', '拥有系统后台部分权限', '0000-00-00 00:00:00', '2019-09-16 09:54:28', '0');
INSERT INTO `yun_auth_group` VALUES ('3', '普通用户', '1', '1', '普通用户权限', '0000-00-00 00:00:00', '2019-08-26 15:37:05', '0');
INSERT INTO `yun_auth_group` VALUES ('4', '测试用户', '1,2', '1', '测试用户', '0000-00-00 00:00:00', '2019-08-26 16:26:26', '0');
INSERT INTO `yun_auth_group` VALUES ('9', '测试管理员', '1,2,6,8,9,37,38', '0', '仅仅用于测试', '0000-00-00 00:00:00', '2019-09-12 11:44:06', '0');
INSERT INTO `yun_auth_group` VALUES ('11', 'eee', '1,2,3,7,8,5,11,12,63,37,40,48,50', '0', 'eafasdfasd', '2019-08-26 14:52:26', '2019-09-12 11:44:19', '1');
INSERT INTO `yun_auth_group` VALUES ('12', '测试_1', '2,3,89,4,6,7,8,5,9,10,11,12,63', '0', '测试', '2019-09-16 10:38:20', '2019-09-16 10:40:20', '1');
INSERT INTO `yun_auth_group` VALUES ('13', '测试_2', '2,3,89,4,6,7,8,5,9,10,11,12,63,13,14,16,17,18,15,19,20,21,22,23', '0', '测试', '2019-09-16 10:39:42', '2019-09-16 10:40:14', '1');

-- ----------------------------
-- Table structure for yun_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `yun_auth_group_access`;
CREATE TABLE `yun_auth_group_access` (
  `admin_uid` mediumint(8) unsigned NOT NULL COMMENT '管理员用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  PRIMARY KEY (`admin_uid`),
  UNIQUE KEY `admin_id_group_id` (`admin_uid`,`group_id`),
  KEY `admin_id` (`admin_uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户权限组关联表(此表废弃暂无用)';

-- ----------------------------
-- Records of yun_auth_group_access
-- ----------------------------
INSERT INTO `yun_auth_group_access` VALUES ('1', '1');
INSERT INTO `yun_auth_group_access` VALUES ('2', '2');
INSERT INTO `yun_auth_group_access` VALUES ('3', '2');
INSERT INTO `yun_auth_group_access` VALUES ('4', '3');

-- ----------------------------
-- Table structure for yun_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `yun_auth_rule`;
CREATE TABLE `yun_auth_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `pid` int(11) NOT NULL COMMENT '父id',
  `rule_url` char(80) NOT NULL DEFAULT '' COMMENT '操作规则唯一标识（控制器/方法）',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '操作规则中文名称',
  `icon` varchar(255) NOT NULL COMMENT '操作规则图标（仅是父类有效）',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：1正常，0禁用',
  `condition` char(100) NOT NULL DEFAULT '' COMMENT '操作规则表达式',
  `is_link` tinyint(1) NOT NULL DEFAULT '1' COMMENT '显示状态：1 显示，0 不显示',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `tips` text NOT NULL COMMENT '提示描述',
  `create_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `modify_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改删除时间',
  `is_delete` tinyint(1) DEFAULT '0' COMMENT '是否被删除：0未删除，1已删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COMMENT='操作规则表';

-- ----------------------------
-- Records of yun_auth_rule
-- ----------------------------
INSERT INTO `yun_auth_rule` VALUES ('1', '0', 'Index/index', '控制台', 'fa fa-tachometer', '1', '1', '', '0', '1', '友情提示：经常查看操作日志，发现异常以便及时追查原因。', '0000-00-00 00:00:00', '2019-09-18 11:03:17', '0');
INSERT INTO `yun_auth_rule` VALUES ('2', '0', '', '常规管理', 'fa fa-cogs', '1', '1', '', '1', '2', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('3', '2', 'System/config', '系统设置', 'fa fa-caret-right', '1', '1', '', '1', '3', '友情提示：待开发。', '0000-00-00 00:00:00', '2019-09-10 16:33:01', '0');
INSERT INTO `yun_auth_rule` VALUES ('4', '2', 'Menu/index', '后台菜单', 'fa fa-caret-right', '1', '1', '', '1', '4', '关于后台菜单，新增时输入控制器方法名时一定要细心！', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('5', '2', 'Menu/add', '新增菜单', 'fa fa-caret-right', '1', '1', '', '1', '5', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('6', '4', 'Menu/edit', '编辑菜单', 'fa fa-caret-right', '1', '1', '', '0', '6', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('7', '4', 'Menu/save', '保存菜单', 'fa fa-caret-right', '1', '1', '', '0', '7', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('8', '4', 'Menu/del', '删除菜单', 'fa fa-caret-right', '1', '1', '', '0', '8', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('9', '2', 'Database/index', '数据库表', 'fa fa-caret-right', '1', '1', '', '1', '9', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('10', '9', 'Database/backup', '数据库备份', 'fa fa-caret-right', '1', '1', '', '0', '10', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('11', '9', 'Database/optimize', '数据库优化', 'fa fa-caret-right', '1', '1', '', '1', '11', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('12', '9', 'Database/repair', '数据库修复', 'fa fa-caret-right', '1', '1', '', '1', '12', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('13', '0', '', '权限管理', 'fa fa-users', '1', '1', '', '1', '13', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('14', '13', 'Administrator/index', '管理员管理', 'fa fa-caret-right', '1', '1', '', '1', '14', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('15', '13', 'Administrator/add', '新增管理员', 'fa fa-caret-right', '1', '1', '', '1', '15', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('16', '14', 'Administrator/edit', '编辑管理员', 'fa fa-caret-right', '1', '1', '', '0', '16', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('17', '14', 'Administrator/save', '保存管理员', 'fa fa-caret-right', '1', '1', '', '0', '17', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('18', '14', 'Administrator/del', '删除管理员', 'fa fa-caret-right', '1', '1', '', '0', '18', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('19', '13', 'Group/index', '角色管理', 'fa fa-caret-right', '1', '1', '', '1', '19', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('20', '13', 'Group/add', '新增角色', 'fa fa-caret-right', '1', '1', '', '1', '20', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('21', '13', 'Group/edit', '编辑角色', 'fa fa-caret-right', '1', '1', '', '0', '21', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('22', '13', 'Group/save', '保存角色', 'fa fa-caret-right', '1', '1', '', '0', '22', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('23', '13', 'Group/del', '删除角色', 'fa fa-caret-right', '1', '1', '', '0', '23', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('24', '0', '', '内容管理', 'fa fa-desktop', '1', '1', '', '1', '24', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('25', '24', 'Article/index', '文章管理', 'fa fa-caret-right', '1', '1', '', '1', '25', '网站虽然重要，身体更重要，出去走走吧。', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('26', '24', 'Article/add', '新增文章', 'fa fa-caret-right', '1', '1', '', '1', '26', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('27', '24', 'Article/edit', '编辑文章', 'fa fa-caret-right', '1', '1', '', '0', '27', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('29', '24', 'Article/update', '保存文章', 'fa fa-caret-right', '1', '1', '', '0', '29', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('30', '24', 'Article/del', '删除文章', 'fa fa-caret-right', '1', '1', '', '0', '30', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('31', '24', 'Category/index', '分类管理', 'fa fa-caret-right', '1', '1', '', '1', '31', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('32', '24', 'Category/add', '新增分类', 'fa fa-caret-right', '1', '1', '', '1', '32', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('33', '24', 'Category/edit', '编辑分类', 'fa fa-caret-right', '1', '1', '', '0', '33', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('34', '24', 'Category/update', '保存分类', 'fa fa-caret-right', '1', '1', '', '0', '34', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('36', '24', 'Category/del', '删除分类', 'fa fa-caret-right', '1', '1', '', '0', '36', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('37', '0', '', '其它功能', 'fa fa-legal', '1', '1', '', '1', '37', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('38', '37', 'Admin/index', '自行开发', 'fa fa-caret-right', '1', '1', '', '1', '38', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('39', '37', 'Admin/index', '自行设计', 'fa fa-caret-right', '1', '1', '', '1', '39', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('40', '37', 'Link/edit', '编辑链接', 'fa fa-caret-right', '1', '1', '', '0', '40', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('41', '37', 'Link/update', '保存链接', 'fa fa-caret-right', '1', '1', '', '0', '41', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('42', '37', 'Link/del', '删除链接', 'fa fa-caret-right', '1', '1', '', '0', '42', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('48', '0', '', '个人中心', 'fa fa-user', '1', '1', '', '1', '48', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('49', '48', 'Personal/index', '个人资料', 'fa fa-caret-right', '1', '1', '', '1', '49', '友情提示：请注意牢记自己所填的信息！', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('51', '48', 'Login/logout', '退出', 'fa fa-caret-right', '1', '1', '', '1', '51', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('63', '2', 'System/version', '开发日志', 'fa fa-caret-right', '1', '1', '', '1', '77', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('55', '48', 'Personal/update', '资料保存', 'fa fa-caret-right', '1', '1', '', '0', '55', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('50', '48', 'Personal/changepwd', '修改密码', 'fa fa-caret-right', '1', '1', '', '1', '50', '友情提示：请保护好自己的登录密码！', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('83', '63', 'Menu/text', '总领取桃币', 'fa fa-caret-right', '1', '0', '', '0', '99', '', '2019-08-25 19:45:47', '2019-08-25 20:16:46', '1');
INSERT INTO `yun_auth_rule` VALUES ('84', '0', 'Menu/text', '桃币提现手续', '', '1', '0', '', '0', '99', '', '2019-08-25 19:46:37', '2019-08-27 09:00:10', '1');
INSERT INTO `yun_auth_rule` VALUES ('85', '0', '', '', 'fa fa-caret-right', '1', '0', '', '0', '0', '', '2019-09-10 15:27:32', '2019-09-10 15:29:37', '1');
INSERT INTO `yun_auth_rule` VALUES ('86', '0', '', '', 'fa fa-caret-right', '1', '0', '', '0', '0', '', '2019-09-10 15:28:51', '2019-09-10 15:29:29', '1');
INSERT INTO `yun_auth_rule` VALUES ('87', '0', '', '', 'fa fa-caret-right', '1', '0', '', '0', '0', '', '2019-09-10 15:30:53', '2019-09-10 15:31:09', '1');
INSERT INTO `yun_auth_rule` VALUES ('88', '0', '', '', 'fa fa-caret-right', '1', '0', '', '0', '0', '', '2019-09-10 15:32:15', '2019-09-10 15:33:57', '1');
INSERT INTO `yun_auth_rule` VALUES ('89', '3', '/Menu/ceShi', '测试此单', 'fa fa-caret-right', '1', '1', '', '1', '100', '这是测试菜单', '2019-09-10 17:14:42', '2019-09-10 17:16:38', '0');

-- ----------------------------
-- Table structure for yun_category
-- ----------------------------
DROP TABLE IF EXISTS `yun_category`;
CREATE TABLE `yun_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类id，表id',
  `category_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '分类类型，备用',
  `category_pid` int(11) NOT NULL DEFAULT '0' COMMENT '父ID，备用',
  `category_name` varchar(100) NOT NULL COMMENT '分类名称',
  `keywords` varchar(255) NOT NULL COMMENT '分类关键字',
  `sort` int(3) NOT NULL COMMENT '排序,越小越靠前',
  `category_desc` varchar(512) NOT NULL COMMENT '文章分类简单描述',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示：0显示，1不显示',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改删除时间',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除：0未删除，1已删除',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='文章分类表';

-- ----------------------------
-- Records of yun_category
-- ----------------------------
INSERT INTO `yun_category` VALUES ('1', '0', '0', '关于我们', '关于我们', '1', '测试123', '1', '0000-00-00 00:00:00', '2019-09-29 12:23:09', '0');
INSERT INTO `yun_category` VALUES ('3', '0', '0', '测试分类', '测试分类dfsfs', '2', '测试分类发达省份的', '1', '0000-00-00 00:00:00', '2019-08-26 18:32:00', '0');
INSERT INTO `yun_category` VALUES ('5', '0', '0', 'fadffadfdfsg', 'fff', '3', 'fdfasdfasdfasfadsd', '1', '2019-08-26 18:12:05', '2019-09-29 14:16:28', '1');
INSERT INTO `yun_category` VALUES ('6', '0', '0', '添加分类', '测试', '4', '这是测试', '1', '2019-09-29 12:25:10', '2019-09-29 12:25:10', '0');
INSERT INTO `yun_category` VALUES ('7', '0', '6', '添加二级分类', '测试', '5', '测试添加二级分类', '1', '2019-09-29 12:26:20', '2019-09-29 12:26:20', '0');
INSERT INTO `yun_category` VALUES ('8', '0', '7', '添加三级分类', '测试', '6', '测试三级分类', '1', '2019-09-29 12:27:17', '2019-09-29 12:27:17', '0');

-- ----------------------------
-- Table structure for yun_systen_config
-- ----------------------------
DROP TABLE IF EXISTS `yun_systen_config`;
CREATE TABLE `yun_systen_config` (
  `key` varchar(100) NOT NULL COMMENT '变量',
  `val` varchar(255) NOT NULL COMMENT '值',
  `type` tinyint(1) NOT NULL COMMENT '0系统 不可删除，1 自定义 可修该、可删除',
  `note` varchar(255) NOT NULL COMMENT '说明',
  PRIMARY KEY (`key`),
  KEY `key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统设置表';

-- ----------------------------
-- Records of yun_systen_config
-- ----------------------------

-- ----------------------------
-- Table structure for yun_version_log
-- ----------------------------
DROP TABLE IF EXISTS `yun_version_log`;
CREATE TABLE `yun_version_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `version` varchar(225) NOT NULL COMMENT '版本号',
  `year` varchar(32) NOT NULL COMMENT '年份',
  `time` int(10) NOT NULL COMMENT '发布日期',
  `log` text NOT NULL COMMENT '更新日志描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='开发版本日志表';

-- ----------------------------
-- Records of yun_version_log
-- ----------------------------
INSERT INTO `yun_version_log` VALUES ('1', '0.0.1', '2019/08/20', '0', 'YunAdmin项目立项(2016/11/18基于CI框架的PkAdmin1.0发布)。');
INSERT INTO `yun_version_log` VALUES ('2', '0.1.0', '2019/08/25', '0', 'YunAdmin测试版本发布。');
INSERT INTO `yun_version_log` VALUES ('3', '1.0.0', '2019/08/xx', '0', 'YunAdmin功能完善。');
