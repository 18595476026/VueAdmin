/*
Navicat MySQL Data Transfer

Source Server         : LOCALHOST_本地
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : yunadmin

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-09-02 08:38:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `yun_admin_operate_log`
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
) ENGINE=MyISAM AUTO_INCREMENT=203 DEFAULT CHARSET=utf8 COMMENT='管理员操作日志表';

-- ----------------------------
-- Records of yun_admin_operate_log
-- ----------------------------

-- ----------------------------
-- Table structure for `yun_admin_user`
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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of yun_admin_user
-- ----------------------------
INSERT INTO `yun_admin_user` VALUES ('1', '1', 'admin', '1', 'a:3:{s:8:\"head_pic\";s:90:\"http://yunadmin.wzh.com/uploads/head_picture/20190826\\331fca4134f9e04c110ce76e254fde0c.jpg\";s:18:\"head_pic_140_thumb\";s:100:\"http://yunadmin.wzh.com/uploads/head_picture/thumb/20190826/140_331fca4134f9e04c110ce76e254fde0c.jpg\";s:17:\"head_pic_30_thumb\";s:99:\"http://yunadmin.wzh.com/uploads/head_picture/thumb/20190826/30_331fca4134f9e04c110ce76e254fde0c.jpg\";}', '1', '2019-01-01', '18003829681', '214564382', 'zhihua_wei@foxmail.com', '883d301c63abedfd6266a0c32a803d7e', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'a96f523d4ec273ce675e8001e69bd23d', '613de07fb9479390957c5698e4be695f', 'bh7g8ZGcda', '0');
INSERT INTO `yun_admin_user` VALUES ('2', '2', 'test1', '1', 'a:3:{s:8:\"head_pic\";s:90:\"http://yunadmin.wzh.com/uploads/head_picture/20190826\\977bc3d0f8c9e5f36a4c7a712c24d499.jpg\";s:18:\"head_pic_140_thumb\";s:100:\"http://yunadmin.wzh.com/uploads/head_picture/thumb/20190826/140_977bc3d0f8c9e5f36a4c7a712c24d499.jpg\";s:17:\"head_pic_30_thumb\";s:99:\"http://yunadmin.wzh.com/uploads/head_picture/thumb/20190826/30_977bc3d0f8c9e5f36a4c7a712c24d499.jpg\";}', '2', '2012-05-08', '15000000002', '222222222', 'zhihua_wei@sina.com', '883d301c63abedfd6266a0c32a803d7e', '0000-00-00 00:00:00', '2019-08-26 15:18:26', 'b88c3498ea3ec755d2d2fd64d9706df9', '14844bb136e6604c91d28f49acc1c2b4', 'PPVNKYJFnr', '0');
INSERT INTO `yun_admin_user` VALUES ('3', '0', 'test2', '1', '', '1', '2013-05-07', '15000000001', '55555555', 'zhihua_wei@qq.com', '883d301c63abedfd6266a0c32a803d7e', '0000-00-00 00:00:00', '2019-08-26 15:44:03', '', '', '', '0');
INSERT INTO `yun_admin_user` VALUES ('4', '3', 'webadmin', '0', 'a:3:{s:8:\"head_pic\";s:90:\"http://yunadmin.wzh.com/uploads/head_picture/20190826\\8ae1e1000692fa6af7fa012da8bfa451.jpg\";s:18:\"head_pic_140_thumb\";s:100:\"http://yunadmin.wzh.com/uploads/head_picture/thumb/20190826/140_8ae1e1000692fa6af7fa012da8bfa451.jpg\";s:17:\"head_pic_30_thumb\";s:99:\"http://yunadmin.wzh.com/uploads/head_picture/thumb/20190826/30_8ae1e1000692fa6af7fa012da8bfa451.jpg\";}', '0', '2016-08-01', '18003829681', '3333333', '867428225@qq.com', '', '0000-00-00 00:00:00', '2019-08-26 11:21:44', '', '', '', '0');
INSERT INTO `yun_admin_user` VALUES ('11', '2', 'test5', '1', 'a:3:{s:8:\"head_pic\";s:90:\"http://yunadmin.wzh.com/uploads/head_picture/20190826\\9863422f1fe412d73d993c6081b0c976.jpg\";s:18:\"head_pic_140_thumb\";s:100:\"http://yunadmin.wzh.com/uploads/head_picture/thumb/20190826/140_9863422f1fe412d73d993c6081b0c976.jpg\";s:17:\"head_pic_30_thumb\";s:99:\"http://yunadmin.wzh.com/uploads/head_picture/thumb/20190826/30_9863422f1fe412d73d993c6081b0c976.jpg\";}', '0', '2019-08-26', '18003829681', '3333333', '867428225@qq.com', '883d301c63abedfd6266a0c32a803d7e', '2019-08-26 10:40:06', '2019-08-26 10:40:06', '', '', '', '0');

-- ----------------------------
-- Table structure for `yun_article`
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of yun_article
-- ----------------------------
INSERT INTO `yun_article` VALUES ('1', '1', '关于我们', '关于我们', '关于我们', 'Data/upload/article_pic/201612/pkadmin_20161203152452D5MBdG.png', null, '关于我们', '1480749892', '1480749892', '0', '1', '0');
INSERT INTO `yun_article` VALUES ('2', '3', '测试文章', '测试文章', '测试文章', '', null, '<b>测试文章内容</b>', '1480753335', '1480756075', '0', '1', '0');
INSERT INTO `yun_article` VALUES ('4', '1', 'dafdf', 'dfadfa', 'fadsfadsfadsf', '', null, 'fadsfasdfasdf', '2019', '2019', '0', '1', '0');

-- ----------------------------
-- Table structure for `yun_auth_group`
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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='用户组表';

-- ----------------------------
-- Records of yun_auth_group
-- ----------------------------
INSERT INTO `yun_auth_group` VALUES ('1', '超级管理员', '1,2,58,65,59,60,61,62,3,56,4,6,5,7,8,9,10,51,52,53,57,11,54,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,29,30,31,32,33,34,36,37,38,39,40,41,42,43,44,45,46,47,63,48,49,50,55', '1', '拥有系统所有权限！', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_group` VALUES ('2', '管理员', '1,13,14,16,17,18,15,19,20,21,22,23,24,25,26,27,29,30,31,32,33,34,36,48,49,50,51,55', '1', '拥有系统后台部分权限', '0000-00-00 00:00:00', '2019-08-26 15:18:14', '0');
INSERT INTO `yun_auth_group` VALUES ('3', '普通用户', '1', '1', '普通用户权限', '0000-00-00 00:00:00', '2019-08-26 15:37:05', '0');
INSERT INTO `yun_auth_group` VALUES ('4', '测试用户', '1,2', '1', '测试用户', '0000-00-00 00:00:00', '2019-08-26 16:26:26', '0');
INSERT INTO `yun_auth_group` VALUES ('9', '测试管理员', '1,2,6,8,9,37,38', '0', '仅仅用于测试', '0000-00-00 00:00:00', '2019-08-26 16:35:31', '0');
INSERT INTO `yun_auth_group` VALUES ('11', 'eee', '1,2,3,7,8,5,11,12,63,37,40,48,50', '0', 'eafasdfasd', '2019-08-26 14:52:26', '2019-08-26 15:46:55', '0');

-- ----------------------------
-- Table structure for `yun_auth_group_access`
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
-- Table structure for `yun_auth_rule`
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
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COMMENT='操作规则表';

-- ----------------------------
-- Records of yun_auth_rule
-- ----------------------------
INSERT INTO `yun_auth_rule` VALUES ('1', '0', 'Index/index', '控制台', 'fa fa-tachometer', '1', '1', '', '0', '1', '友情提示：经常查看操作日志，发现异常以便及时追查原因。', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('2', '0', '', '常规管理', 'fa fa-cogs', '1', '1', '', '1', '2', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_auth_rule` VALUES ('3', '2', 'System/config', '系统设置', 'fa fa-caret-right', '1', '1', '', '1', '3', '友情提示：待开发。', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
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

-- ----------------------------
-- Table structure for `yun_category`
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='文章分类表';

-- ----------------------------
-- Records of yun_category
-- ----------------------------
INSERT INTO `yun_category` VALUES ('1', '0', '0', '关于我们', '关于我们', '1', '关于我们主要是我们的一些信息', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `yun_category` VALUES ('3', '0', '0', '测试分类', '测试分类dfsfs', '2', '测试分类发达省份的', '1', '0000-00-00 00:00:00', '2019-08-26 18:32:00', '0');
INSERT INTO `yun_category` VALUES ('5', '0', '0', 'fadffadfdfsg', 'fff', '6', 'fdfasdfasdfasfadsd', '1', '2019-08-26 18:12:05', '2019-08-27 08:31:33', '0');

-- ----------------------------
-- Table structure for `yun_systen_config`
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
-- Table structure for `yun_version_log`
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
