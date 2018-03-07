/*
Navicat MySQL Data Transfer

Source Server         : eye
Source Server Version : 50554
Source Host           : 192.168.4.83:3306
Source Database       : yankeyixue

Target Server Type    : MYSQL
Target Server Version : 50554
File Encoding         : 65001

Date: 2018-01-16 19:05:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for eye_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `eye_admin_user`;
CREATE TABLE `eye_admin_user` (
  `eye_admin_uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `eye_admin_username` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '用户名',
  `eye_admin_password` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '密码',
  `eye_admin_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  PRIMARY KEY (`eye_admin_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of eye_admin_user
-- ----------------------------
INSERT INTO `eye_admin_user` VALUES ('1', 'admin', '7fef6171469e80d32c0559f88b377245', '0');

-- ----------------------------
-- Table structure for eye_category
-- ----------------------------
DROP TABLE IF EXISTS `eye_category`;
CREATE TABLE `eye_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '医学分类表id',
  `category_name` varchar(255) NOT NULL DEFAULT '' COMMENT '医学分类表名称',
  `category_num` int(11) NOT NULL DEFAULT '0' COMMENT '包含文章数目',
  `category_sid` tinyint(4) NOT NULL DEFAULT '0' COMMENT '所属类型id(医学 新闻 历史)',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eye_category
-- ----------------------------
INSERT INTO `eye_category` VALUES ('1', '社会新闻', '0', '1');
INSERT INTO `eye_category` VALUES ('3', '公益', '0', '0');
INSERT INTO `eye_category` VALUES ('4', '眼科历史1', '0', '2');
INSERT INTO `eye_category` VALUES ('5', '分类1', '0', '2');
INSERT INTO `eye_category` VALUES ('6', '新闻分类', '0', '1');
INSERT INTO `eye_category` VALUES ('7', '新闻分类2', '0', '1');
INSERT INTO `eye_category` VALUES ('8', '这是新闻', '0', '1');

-- ----------------------------
-- Table structure for eye_company
-- ----------------------------
DROP TABLE IF EXISTS `eye_company`;
CREATE TABLE `eye_company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '企业用户id',
  `company_name` varchar(255) NOT NULL DEFAULT '' COMMENT '企业名称',
  `company_password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `company_phone` varchar(255) NOT NULL DEFAULT '' COMMENT '企业电话',
  `company_address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `company_email` varchar(255) NOT NULL DEFAULT '' COMMENT '企业邮箱',
  `company_offer` int(11) NOT NULL DEFAULT '0' COMMENT '企业捐助人数',
  `company_industry` varchar(255) NOT NULL DEFAULT '' COMMENT '行业',
  `company_found_time` varchar(255) NOT NULL DEFAULT '' COMMENT '公司成立时间',
  `company_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `company_city` varchar(255) NOT NULL DEFAULT '' COMMENT '所在城市',
  `company_intro` varchar(255) NOT NULL DEFAULT '' COMMENT '项目简介',
  `company_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `company_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '公司图片',
  `company_leader` varchar(255) NOT NULL DEFAULT '' COMMENT '公司负责人',
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eye_company
-- ----------------------------
INSERT INTO `eye_company` VALUES ('2', '九州传承', '21232f297a57a5a743894a0e4a801fc3', '13331077062', '河南郑州', '123456', '24', '制造业', '2013-2-12', '324342', '郑州', '产品：在线学习，游读学院，线下合作基地\r\n\r\n\r\n核心功能：在线学习到线下实战\r\n\r\n\r\n提供给：制造业，企业', '不知道该描述什么', '/Uploads/Content/18/012018-01-16/5a5da60aed190.jpg', '习近平');
INSERT INTO `eye_company` VALUES ('3', '倚盛科技', '21232f297a57a5a743894a0e4a801fc3', '18613389241', '河北沧州', '522120280@qq.com', '12', '服务业', '2015-3-28', '201345', '沧州', '阿斯顿撒反对', '大撒旦范德萨', '/Uploads/Content/18/012018-01-16/5a5da60aed190.jpg', '李克强');

-- ----------------------------
-- Table structure for eye_expert_user
-- ----------------------------
DROP TABLE IF EXISTS `eye_expert_user`;
CREATE TABLE `eye_expert_user` (
  `expert_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '专家表id',
  `expert_username` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  `expert_phone` varchar(255) NOT NULL DEFAULT '' COMMENT '专家手机号',
  `expert_password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `expert_realname` varchar(255) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `expert_num` int(11) NOT NULL DEFAULT '0' COMMENT '发表文章数',
  `expert_job` varchar(255) NOT NULL DEFAULT '' COMMENT '职位',
  `expert_brief` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `expert_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '照片',
  `expert_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `expert_email` varchar(255) NOT NULL DEFAULT '' COMMENT '专家邮箱',
  `expert_prac` varchar(255) NOT NULL DEFAULT '' COMMENT '执业编号',
  `expert_service` varchar(255) NOT NULL DEFAULT '' COMMENT '服务范围',
  `expert_hospital` varchar(255) NOT NULL DEFAULT '' COMMENT '所属医院',
  PRIMARY KEY (`expert_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eye_expert_user
-- ----------------------------
INSERT INTO `eye_expert_user` VALUES ('1', '大川哥', '18613389241', '21232f297a57a5a743894a0e4a801fc3', '左卫川', '0', '副主任医师', '本科毕业于扬州大学医学院， 就职于江苏省高邮市妇幼保健院， 从事妇产科29年', '/Uploads/Content/18/012018-01-13/5a59cb42aaf69.jpg', '1515208687', '522120280@qq.com', '132142142142', '妊娠期高血压,子宫肌瘤,糖尿病,高血压,流产', '人民医院');
INSERT INTO `eye_expert_user` VALUES ('2', '小川', '13331077062', '21232f297a57a5a743894a0e4a801fc3', '左小川', '0', '副主任医师', '水水十分大师傅似的个', '/Uploads/Content/18/012018-01-13/5a59cb42aaf69.jpg', '232434532', '', '42142142', '糖尿病,高血压,流糖尿病,高血压,流', '协和医院');

-- ----------------------------
-- Table structure for eye_hisart
-- ----------------------------
DROP TABLE IF EXISTS `eye_hisart`;
CREATE TABLE `eye_hisart` (
  `his_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '历史文章主键id',
  `his_title` varchar(255) NOT NULL DEFAULT '' COMMENT '历史文章标题',
  `his_author` varchar(255) NOT NULL DEFAULT '' COMMENT '作者',
  `his_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '文章配图',
  `his_reading` int(255) NOT NULL DEFAULT '0' COMMENT '阅读量',
  `his_time` int(11) NOT NULL DEFAULT '0' COMMENT '发布时间',
  `his_content` text NOT NULL,
  `his_cate_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类关联id',
  `his_tag_id` int(11) NOT NULL DEFAULT '0' COMMENT '标签关联id',
  PRIMARY KEY (`his_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eye_hisart
-- ----------------------------
INSERT INTO `eye_hisart` VALUES ('1', '历史文章1', '李科琼', '/Uploads/Content/18/012018-01-16/5a5da60aed190.jpg', '25', '213243255', '岁的法国呱呱呱呱呱呱呱呱呱呱呱呱呱呱呱', '1', '1');
INSERT INTO `eye_hisart` VALUES ('3', '历史文章2', '马云', '/Uploads/Content/18/012018-01-16/5a5da60aed190.jpg', '5', '1515465360', '', '4', '4');
INSERT INTO `eye_hisart` VALUES ('4', '啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '啊啊啊', '/Uploads/Content/18/012018-01-16/5a5dc49163685.png', '1', '1516094616', '', '5', '4');
INSERT INTO `eye_hisart` VALUES ('5', '威威威威威威威威威威威威威威', '我问问', '/Uploads/Content/18/012018-01-16/5a5dc5154d612.png', '1', '1516094750', '&lt;p style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;不懂拒绝，其实是得了一种叫“不好意思”的病。过度友善的人，不忍或害怕拒绝别人，他们总是怀抱善意，宁可牺牲自己的&lt;a href=&quot;http://www.duwenzhang.com/huati/shijian/index1.html&quot; style=&quot;color: rgb(51, 51, 51); text-decoration: none;&quot;&gt;时间&lt;/a&gt;、精力，也不想让别人&lt;a href=&quot;http://www.duwenzhang.com/huati/shiwang/index1.html&quot; style=&quot;color: rgb(51, 51, 51); text-decoration: none;&quot;&gt;失望&lt;/a&gt;。然而，害怕拒绝，害怕让别人失望，也是一种&lt;a href=&quot;http://www.duwenzhang.com/huati/zibei/index1.html&quot; style=&quot;color: rgb(51, 51, 51); text-decoration: none;&quot;&gt;自卑&lt;/a&gt;。&lt;/p&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;&lt;a href=&quot;http://www.duwenzhang.com/wenzhang/shenghuosuibi/20160729/356701.html&quot; style=&quot;color: rgb(51, 51, 51); text-decoration: none;&quot;&gt;&lt;img alt=&quot;懂得拒绝，恰是最好的尊重&quot; src=&quot;http://192.168.4.83/Public/Admin/ccc/Org/Ueditor/php/upload/9591516094750.jpg&quot; style=&quot;border: 0px;&quot; width=&quot;220&quot; height=&quot;165&quot; border=&quot;0&quot; align=&quot;right&quot;/&gt;&lt;/a&gt;　　&lt;a href=&quot;http://www.duwenzhang.com/wenzhang/shenghuosuibi/&quot; style=&quot;color: rgb(51, 51, 51); text-decoration: none;&quot;&gt;生活&lt;/a&gt;总有点欺软怕硬。一个完全不懂拒绝的人，也不可能赢得真正的尊重。&lt;/p&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;　　不懂拒绝的人，迟早要学会狠下心肠。&lt;/p&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;　　1 不懂拒绝，是一种病&lt;/p&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;　　很多人都&lt;a href=&quot;http://www.duwenzhang.com/huati/xihuan/index1.html&quot; style=&quot;color: rgb(51, 51, 51); text-decoration: none;&quot;&gt;喜欢&lt;/a&gt;《欢乐颂》里的关雎尔，因为她人长得甜美，心地也好。但她也常常为人诟病：正因为心地太好，她不懂得拒绝别人。&lt;/p&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;　　关雎尔很多时候加班加得晚，都是因为帮别人做事。终于有一次，同事又病了请她完成剩下的工作，最后也是她签名确认。&lt;/p&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;　　同事做的那一部分错漏百出，经理知道后却只骂了关雎尔。因为最后签名的是她，所有&lt;a href=&quot;http://www.duwenzhang.com/huati/zeren/index1.html&quot; style=&quot;color: rgb(51, 51, 51); text-decoration: none;&quot;&gt;责任&lt;/a&gt;都要她来承担。而那个同事，出事之后一句话也没替她说，也没有一句安慰。&lt;/p&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;　　关雎尔的傻白甜行径，其实也是今天许多人的写照：&lt;/p&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;　　因为想塑造自己的良好形象，所以对&lt;a href=&quot;http://www.duwenzhang.com/huati/pengyou/index1.html&quot; style=&quot;color: rgb(51, 51, 51); text-decoration: none;&quot;&gt;朋友&lt;/a&gt;的请求来者不拒。终于，我们&lt;a href=&quot;http://www.duwenzhang.com/huati/wennuan/index1.html&quot; style=&quot;color: rgb(51, 51, 51); text-decoration: none;&quot;&gt;温暖&lt;/a&gt;了别人，却累死了自己。&lt;/p&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;　　2 你有多重要？&lt;/p&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;　　“TA一定是走投无路了，才来找我……”、“要是我把TA拒绝了，我就是坏人……”这是我们在接受求助时的心理。&lt;/p&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;　　不懂拒绝的背后，是我们往往将自己放在太重要的位置。&lt;/p&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;　　斗米恩升米仇的&lt;a href=&quot;http://www.duwenzhang.com/&quot; style=&quot;color: rgb(51, 51, 51); text-decoration: none;&quot;&gt;故事&lt;/a&gt;，却告诉了我们一个无法违背的&lt;a href=&quot;http://www.duwenzhang.com/huati/renxing/index1.html&quot; style=&quot;color: rgb(51, 51, 51); text-decoration: none;&quot;&gt;人性&lt;/a&gt;：&lt;/p&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;　　帮得了一次，就有第二次；帮得了第二次，就有后面无穷多次。而无休止帮助的剧情发展，往往是始于&lt;a href=&quot;http://www.duwenzhang.com/huati/ganen/index1.html&quot; style=&quot;color: rgb(51, 51, 51); text-decoration: none;&quot;&gt;感恩&lt;/a&gt;，终于嫌隙。当哪一次帮不上忙，你就会变成罪人。&lt;/p&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;　　3 你的位置，决定了你的作为&lt;/p&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;　　《蝙蝠侠大战超人：正义黎明》这部电影里面，从不拒绝救助任何人的超人，面临着一个巨大挑战：民众在恐慌，这么一个能力巨大的人，他为什么只是帮助人？未来会不会有一天，他用这种强大力量反过来杀人？&lt;/p&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;　　因此在法庭上，众人拷问的是超人的这个问题：你到底是谁？&lt;/p&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;　　不懂拒绝别人的人，有意无意地其实是把自己当成了超人。而他们之所以不懂得拒绝，其实正是因为他们跟超人一样，根本没有弄清楚自己到底是谁。&lt;/p&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;　　关雎尔没有弄清楚自己的身份，她只是公司的其中一个职能，在一个讲究分工协作的五百强企业，她根本不可能完成所有职能的执行。所以她累死累活，最终只能得到跟超人同样的质问。&lt;/p&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;　　4 拒绝！时而温柔、时而狠狠地拒绝！&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '4', '4');

-- ----------------------------
-- Table structure for eye_medart
-- ----------------------------
DROP TABLE IF EXISTS `eye_medart`;
CREATE TABLE `eye_medart` (
  `medart_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '医学文章表id',
  `medart_title` varchar(255) NOT NULL DEFAULT '' COMMENT '医学文章表标题',
  `medart_time` int(11) NOT NULL DEFAULT '0' COMMENT '发表时间',
  `medart_reading` int(255) NOT NULL DEFAULT '0' COMMENT '阅读量',
  `medart_content` text NOT NULL COMMENT '文章内容',
  `medart_expert_id` int(11) NOT NULL DEFAULT '0' COMMENT '专家表关联id',
  `medart_cate_id` int(11) NOT NULL DEFAULT '0' COMMENT '医学分类表关联id',
  `medart_tag_id` int(11) NOT NULL DEFAULT '0' COMMENT '医学标签表关联id',
  `medart_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  PRIMARY KEY (`medart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eye_medart
-- ----------------------------
INSERT INTO `eye_medart` VALUES ('4', '医学文章1', '1516086803', '2', '&lt;p&gt;的时光灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌&lt;br/&gt;&lt;/p&gt;', '1', '3', '5', '/Uploads/Content/18/012018-01-16/5a5da60aed190.jpg');
INSERT INTO `eye_medart` VALUES ('5', '这个是医学文章2', '1516086929', '2', '&lt;p&gt;哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈&lt;br/&gt;&lt;/p&gt;', '1', '3', '5', '/Uploads/Content/18/012018-01-16/5a5da6881ca25.jpg');
INSERT INTO `eye_medart` VALUES ('6', '是顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '1516086994', '4', '&lt;p&gt;&lt;img src=&quot;http://192.168.4.83/Public/Admin/ccc/Org/Ueditor/php/upload/69891516086992.jpg&quot; style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: ��; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;&lt;br style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;/&gt;　　并不是所有的人都在爱情之中，或许，这个情人节，注定要一个人走，哪怕你从未停止过追爱的脚步。&lt;br style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;/&gt;　　&lt;br style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;/&gt;　　毋庸置疑，爱情是一个正常人的美好向往。但我们往往还在等爱的路上，或者在追爱的路上、刚刚失去爱的路上，没有爱情的日子，终究是存在。就说，这个情人节，你会是一个人过吗？&lt;br style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;/&gt;　　&lt;br style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;/&gt;　　如果，注定要一个人度过情人节，你的心情怎么样呢。你大概会独自伤悲，看着路边牵手走过的情侣，背过脸，偷偷抹一把眼泪。我要奉劝你：即便如此，你一定不要随便找一个人牵手，你甚至要勇敢地说，“我单身，我骄傲”。相比那些找到爱情的人，你有更多选择爱谁的权利，不是吗？&lt;br style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;/&gt;　　&lt;br style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;/&gt;　　伤心之后，你还是要面对现实，如果有那么一个人值得你喜欢，恰好对方也不怎么讨厌你，那就试着聊几句吧。在情人节这个特殊的日子，问候一声，哪怕得到的结果是——那个人已经有了爱情，至少，也能给自己一个交代。毕竟，曾经有那么一点心动，曾经遇见了。&lt;br style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;/&gt;　　&lt;br style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;/&gt;　　一个人的情人节，你要好好吃一顿，你要照顾好自己，不要因为没有爱情的滋润，虐待身体。你不要和父母在一起，因为你不能听到父母催促你早点成家的声音，那样会影响你的情绪，也会影响父母的情绪。负面的情绪，会让人颓废。&lt;br style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;/&gt;　　&lt;br style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;/&gt;　　如果身边有和你一样单身的朋友，可以一起聚一聚，找一个热闹一点的地方，海阔天空地聊天，大声地唱歌，释放心情，放飞爱情的梦想。一个人，不能压抑太久，会憋出毛病来的。与其形影相随，不如走进热闹的世界，把自己变成人海中的一朵浪花，一滴水，听听海浪的声音。&lt;br style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;/&gt;　　&lt;br style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;/&gt;　　如果有人在情人节打探你拥有爱情的情况，你不要觉得难为情。一个人单着，当然会底气不足，然而，你不要打肿脸充胖子，不要谎称自己有爱情。说不定，有人想要为你牵红线。如果你不实话实说，那将是一场错过爱情的悲剧。你也会落下不够诚实的坏印象。&lt;br style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;/&gt;　　&lt;br style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;/&gt;　　你一定不要想不开，不就是兜兜转转找不到爱情么？然不成，还要自杀？你不够伟大，你的自杀不会引起社会轰动，也不会有人同情你，顶多，来几个消防战士，履行工作职责，挽救你的生命。最后，你还得到派出所待一会，接受批评教育，尴尬的气氛，一定让你想再次自杀。&lt;br style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;/&gt;　　&lt;br style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;/&gt;　　有没有爱情，你都要好好活下去，生命只有一次，谁都不是九条命的狐狸。留得青山在，不愁没柴烧。生命好端端的，健健康康的，你再努力一点，把生活过好一点点，指不定，爱情就光顾你了，下一个情人节，就有人愿意和你牵手同行，还卿卿我我地拥抱。&lt;br style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;/&gt;　　&lt;br style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;/&gt;　　当然，最好的结果，就在这个情人节，你便遇见了有一点点喜欢的人，虽然，只是爱情的破土，就已经足够幸运了。要知道，有多少人在情人节的夜晚，手捧着玫瑰花，却没有等到爱的人出现。天亮了，花都凋谢了，只有泪水还没有干透。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1', '3', '2', '/Uploads/Content/18/012018-01-16/5a5da6cad4688.png');
INSERT INTO `eye_medart` VALUES ('7', 'fffffffffffffffffffffffffffffffffgd方法', '1516091691', '0', '&lt;p&gt;分顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶&lt;br/&gt;&lt;/p&gt;', '1', '3', '3', '/Uploads/Content/18/012018-01-16/5a5db916f2f4d.png');

-- ----------------------------
-- Table structure for eye_message
-- ----------------------------
DROP TABLE IF EXISTS `eye_message`;
CREATE TABLE `eye_message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言表主键id',
  `message_content` varchar(255) NOT NULL DEFAULT '' COMMENT '留言内容',
  `message_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户表关联id',
  `message_time` int(11) NOT NULL DEFAULT '0' COMMENT '评论时间',
  `message_rescue_id` int(11) NOT NULL DEFAULT '0' COMMENT '救助表关联id',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eye_message
-- ----------------------------

-- ----------------------------
-- Table structure for eye_newsart
-- ----------------------------
DROP TABLE IF EXISTS `eye_newsart`;
CREATE TABLE `eye_newsart` (
  `newsart_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '新闻文章表id',
  `newsart_title` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文章表标题',
  `newsart_time` int(11) NOT NULL DEFAULT '0' COMMENT '文章表发布时间',
  `newsart_author` char(15) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '作者',
  `newsart_reading` int(11) NOT NULL DEFAULT '0' COMMENT '阅读量',
  `newsart_content` mediumtext CHARACTER SET utf8 NOT NULL COMMENT '文章内容',
  `newsart_cate_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类表关联id',
  `newsart_tag_id` int(11) NOT NULL DEFAULT '0' COMMENT '标签表关联id',
  `newsart_pic` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '图',
  PRIMARY KEY (`newsart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of eye_newsart
-- ----------------------------
INSERT INTO `eye_newsart` VALUES ('30', '111111111111嗡嗡嗡', '1515834184', '111111111111大幅答', '4', '&lt;p&gt;1111的身份的公司1111111111111&lt;br/&gt;&lt;/p&gt;', '1', '2', '/Uploads/Content/18/012018-01-13/5a59cb42aaf69.jpg');
INSERT INTO `eye_newsart` VALUES ('31', '新闻文章', '1515983935', '鲁迅', '3', '&lt;p style=&quot;font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-weight: 400; line-height: inherit; border: 0px; outline: 0px; -webkit-font-smoothing: antialiased; word-wrap: break-word; margin: 0px 0px 1.4286em; text-indent: 2em; color: rgb(85, 85, 85); font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;又一波虐童信息冲上各大媒体头条， 《少年法学苑》本来想用“停更一天”来抗议那些无耻，因为你不管是如何传播美、善， 当罪恶和肮脏迎头砸来，你都是如此无助、无奈。但是，回避与谩骂、攻击，同样属于软弱。 压住怒火，还是坐下来思考一下如何推进问题的解决。 不禁会问，当虐童成为大概率事件，我们只能坐等下一次刷屏？ 无论政府或社会怎样保护和帮助，总是会有不称职的父母和虐待儿童的监管人。&lt;/p&gt;&lt;p&gt;&lt;br style=&quot;color: rgb(85, 85, 85); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-weight: 400; line-height: inherit; border: 0px; outline: 0px; -webkit-font-smoothing: antialiased; word-wrap: break-word; margin: 0px 0px 1.4286em; text-indent: 2em; color: rgb(85, 85, 85); font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;虐童问题必须通过严密的法律体系和强有力的执行来解决。 美国未必样样好，但是在保护儿童方面，确实值得我们学习。 在问题解决还“在路上”的时候，父母尽量教孩子保护自己。 以下内容整理自网络。&lt;/p&gt;&lt;p&gt;&lt;br style=&quot;color: rgb(85, 85, 85); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-weight: 400; line-height: inherit; border: 0px; outline: 0px; -webkit-font-smoothing: antialiased; word-wrap: break-word; margin: 0px 0px 1.4286em; text-indent: 2em; color: rgb(85, 85, 85); font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;虐童如果发生在美国，如何处理？&lt;/p&gt;&lt;p&gt;&lt;br style=&quot;color: rgb(85, 85, 85); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-weight: 400; line-height: inherit; border: 0px; outline: 0px; -webkit-font-smoothing: antialiased; word-wrap: break-word; margin: 0px 0px 1.4286em; text-indent: 2em; color: rgb(85, 85, 85); font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;美国在防止虐童方面做出了许多努力。在儿童权益保护方面，也有很多做法值得借鉴。&lt;/p&gt;&lt;p&gt;&lt;br style=&quot;color: rgb(85, 85, 85); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-weight: 400; line-height: inherit; border: 0px; outline: 0px; -webkit-font-smoothing: antialiased; word-wrap: break-word; margin: 0px 0px 1.4286em; text-indent: 2em; color: rgb(85, 85, 85); font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;美国于1974年通过的《儿童虐待预防与处理法案》中有着明确的定义：&lt;/p&gt;&lt;p&gt;&lt;br style=&quot;color: rgb(85, 85, 85); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-weight: 400; line-height: inherit; border: 0px; outline: 0px; -webkit-font-smoothing: antialiased; word-wrap: break-word; margin: 0px 0px 1.4286em; text-indent: 2em; color: rgb(85, 85, 85); font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;父母或看护人近期的作为或不作为，导致儿童死亡、受到严重的身体或情感伤害、遭到性虐待或性剥削，及其它可能造成严重伤害的作为或不作为。 对于适度体罚与虐待的区别，《儿童虐待预防与处理法案》也作出了解读。适度体罚只是为了帮助儿童成长所实施的轻微惩戒。&lt;/p&gt;&lt;p&gt;&lt;br style=&quot;color: rgb(85, 85, 85); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-weight: 400; line-height: inherit; border: 0px; outline: 0px; -webkit-font-smoothing: antialiased; word-wrap: break-word; margin: 0px 0px 1.4286em; text-indent: 2em; color: rgb(85, 85, 85); font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;美国儿童虐待的法律保护体系&lt;/p&gt;&lt;p&gt;&lt;br style=&quot;color: rgb(85, 85, 85); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-weight: 400; line-height: inherit; border: 0px; outline: 0px; -webkit-font-smoothing: antialiased; word-wrap: break-word; margin: 0px 0px 1.4286em; text-indent: 2em; color: rgb(85, 85, 85); font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;1874年，全美第一个防止虐待儿童协会于纽约成立。美国国会分别于1974年、1984年通过了《儿童虐待预防和处理法案》和《儿童保护法案》。要求各州制定法律，对虐待、忽视或遗弃儿童情况必须举报，以便于儿童保护部门能够及时对处境危险的儿童提供救济，并于1980年通过了《收养援助及儿童福利法》，确立了美国儿童保护的实施做法及取向。&lt;br/&gt;&lt;br/&gt;有关儿童照顾方面的联邦政策与法令，有《家庭保护法案》、《儿童营养修正案》、《儿童安全保护法案》、《儿童健康法案》等；为防止虐待未成年人，颁布了《家庭暴力保护法案》、儿童虐待受害者权利法案》等；还有防止未成年人遭受性侵犯的《儿童性暴力及色情法案》、《儿童保护及猥亵执行法案》等 在美国，儿童网络保护政策已经构成基本的体系。&lt;/p&gt;&lt;p&gt;&lt;br style=&quot;color: rgb(85, 85, 85); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; font-style: normal; font-weight: 400; line-height: inherit; border: 0px; outline: 0px; -webkit-font-smoothing: antialiased; word-wrap: break-word; margin: 0px 0px 1.4286em; text-indent: 2em; color: rgb(85, 85, 85); font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;这个体系是以《儿童在线保护法案》、《儿童在线隐私保护法案》、《儿童互联网保护法案》三个联邦法律为基础，规范了商业组织、家庭、学校等在儿童网络保护方面的行为。其保护的重点措施是：研制屏蔽性软件，要求学校、图书馆、网吧安装屏蔽性工具；设立与成年人分开的专门的未成年人的上网场所；对不良信息网站的严格管理，成人网站设定身份认证制度；对未成年人隐私权的保护等。 虐童在美国大部分州被视为一项重罪。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1', '2', '/Uploads/Content/18/012018-01-15/5a5c140ee2e34.jpg');
INSERT INTO `eye_newsart` VALUES ('32', '这是什么鬼', '1516001031', '松江', '7', '&lt;p&gt;&lt;img src=&quot;http://192.168.4.83/Public/Admin/ccc/Org/Ueditor/php/upload/26861516001028.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;　　时光清浅，新的一天总会如约而至。白云轻轻的飘着，清清的河水静静地流淌着，大地在一片萧瑟中整装待发，孕育着新的生机。人间有爱，岁月沉香。爱，是流淌在心底的清溪，无声的滋润着我们单薄的心。爱是一句温暖的话语，是一份思念，是缤纷绚烂时的热烈。&lt;br/&gt;　　&lt;br/&gt;　　爱在心里，生命的长河潺潺不息，默默的相伴，无声的挂牵。爱是人生中美好的际遇，生命中不老的花朵，生机与活力并存，美丽与芬芳常在。&lt;br/&gt;　　&lt;br/&gt;　　光阴，在季节的风声里一寸一寸的消匿。院落里，那几朵黄菊在风霜里不再娇丽。岁月未老，心亦未老，只是时光的年轮在脸上留下了痕迹。突然间，心中有了千帆过尽的云淡风清，繁华过后的淡泊宁静。懂得了光阴如流，更应从容度日。&lt;br/&gt;　　&lt;br/&gt;　　你说，人生需要留白。我说，爱也需要留白。那么，且将未走完的路留给冷寂的冬季，留给春暖花开！有爱，有期许，生活便会是一种别样的美丽！&lt;br/&gt;　　&lt;br/&gt;　　这世上，有美好也有痛苦，其实我们都很孤单，面对生活，忙碌奔波，忘了善待自己，总是感觉这也不行，那也不好，在不断历练自己、追求美好生活的途中，忽而小半生也过去了。也曾遗憾，也曾迷茫，也曾执着。可是当看到历经风雨后的彩虹，心便在一瞬间湿润了，也开怀了。&lt;br/&gt;　　&lt;br/&gt;　　蜿蜒曲折的人生旅途中，唯有爱，才是盛开在心灵上的花朵，无论四季如何变化，在爱的阳光雨露滋润下，我们从不放弃，永不言败，历久弥香，典雅而美丽。&lt;br/&gt;　　&lt;br/&gt;　　世间的感情莫过于两种，一种是相濡以沫，另一种是相忘于江湖。人在旅途，有些人注定只能陪你一程，却陪不了你一生。感情中最难得的，是能一直陪你到最后的那个人，无论历经怎样的苦难与折磨，始终默默的陪着你，关爱着你，这才是最长情的告白。&lt;br/&gt;　　&lt;br/&gt;　　不要忽视身边看似平凡的拥有，更不要等到失去了，才知道什么是珍惜。爱，一定是两颗灵魂由激情到平淡的一种宁静陪伴。&lt;br/&gt;　　&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '6', '2', '/Uploads/Content/18/012018-01-15/5a5c56ac66f5b.png');
INSERT INTO `eye_newsart` VALUES ('33', '哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇', '1516011478', '威威威威', '1', '&lt;p&gt;哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇&lt;br/&gt;&lt;/p&gt;', '8', '2', '/Uploads/Content/18/012018-01-15/5a5c7fcf705d0.png');

-- ----------------------------
-- Table structure for eye_offer
-- ----------------------------
DROP TABLE IF EXISTS `eye_offer`;
CREATE TABLE `eye_offer` (
  `offer_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '捐款表主键id',
  `offer_money` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '捐款金额',
  `offer_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户表关联id',
  `offer_rescue_id` int(11) NOT NULL DEFAULT '0' COMMENT '救助表关联id',
  PRIMARY KEY (`offer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eye_offer
-- ----------------------------
INSERT INTO `eye_offer` VALUES ('1', '12', '1', '1');
INSERT INTO `eye_offer` VALUES ('2', '23', '1', '1');

-- ----------------------------
-- Table structure for eye_rescue
-- ----------------------------
DROP TABLE IF EXISTS `eye_rescue`;
CREATE TABLE `eye_rescue` (
  `rescue_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '救助信息表主键id',
  `rescue_name` varchar(255) NOT NULL DEFAULT '' COMMENT '姓名',
  `rescue_title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `rescue_source` varchar(255) NOT NULL DEFAULT '' COMMENT '发起者',
  `rescue_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '单张小图',
  `rescue_pic_deta` varchar(255) NOT NULL DEFAULT '' COMMENT '详情页多张大图',
  `rescue_appeal` decimal(10,0) NOT NULL DEFAULT '1' COMMENT '求助金额',
  `rescue_offer` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '捐助金额',
  `rescue_rate` float(255,0) NOT NULL DEFAULT '0' COMMENT '项目进度',
  `rescue_intro` varchar(255) NOT NULL DEFAULT '' COMMENT '项目介绍',
  `rescue_time` int(11) NOT NULL DEFAULT '0' COMMENT '发布时间',
  PRIMARY KEY (`rescue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eye_rescue
-- ----------------------------
INSERT INTO `eye_rescue` VALUES ('1', '救助1', '需要救助的人', '发起者1', '', '', '222', '112', '0', '对方的高帅富', '0');

-- ----------------------------
-- Table structure for eye_tag
-- ----------------------------
DROP TABLE IF EXISTS `eye_tag`;
CREATE TABLE `eye_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '医学标签表id',
  `tag_name` varchar(255) NOT NULL DEFAULT '' COMMENT '标签表名称',
  `tag_num` int(11) NOT NULL DEFAULT '0' COMMENT '标签包含医学文章',
  `tag_sid` tinyint(4) NOT NULL DEFAULT '0' COMMENT '所属类型关联id',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eye_tag
-- ----------------------------
INSERT INTO `eye_tag` VALUES ('1', '标签1', '0', '0');
INSERT INTO `eye_tag` VALUES ('2', '标签2', '0', '1');
INSERT INTO `eye_tag` VALUES ('3', '标签3', '0', '0');
INSERT INTO `eye_tag` VALUES ('4', '标签4', '0', '2');
INSERT INTO `eye_tag` VALUES ('5', '标签8', '0', '1');

-- ----------------------------
-- Table structure for eye_user
-- ----------------------------
DROP TABLE IF EXISTS `eye_user`;
CREATE TABLE `eye_user` (
  `eye_uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表主键id',
  `eye_username` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '用户名',
  `eye_password` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '密码',
  `eye_phone` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '电话',
  `eye_realname` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '真实姓名',
  `eye_pic` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '照片',
  `eye_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `eye_address` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '用户所在地址',
  `eye_email` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '用户邮箱',
  PRIMARY KEY (`eye_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of eye_user
-- ----------------------------
INSERT INTO `eye_user` VALUES ('1', '大川哥', '1ba9e88e456cc70728b28bf742afef94', '18613389241', '左大川', '', '1515136584', '', '522120280@qq.com');
INSERT INTO `eye_user` VALUES ('2', 'admin', '21232f297a57a5a743894a0e4a801fc3', '18613389242', '', '', '1515726650', '', '123456');
