DELIMITER ;
SET NAMES utf8;

#创建数据库
DROP DATABASE IF EXISTS vms;
CREATE DATABASE vms
  CHARACTER SET utf8;

#创建表
USE vms;

#操作员表
DROP TABLE IF EXISTS `operator`;
CREATE TABLE `operator`
(
  #操作员id
  id        VARCHAR(128) NOT NULL,
  #操作员名称
  name      VARCHAR(36)  NOT NULL,
  #密码
  password  VARCHAR(128) NOT NULL,
  #登录时间
  login_utc BIGINT DEFAULT 0,
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;
INSERT INTO `operator` VALUES ('root', '超级管理员', 'sunniwell', 0);

#扫描任务表
DROP TABLE IF EXISTS `scan_task`;
CREATE TABLE `scan_task` (
  #主键id
  id           VARCHAR(256) NOT NULL,
  #媒资id
  media_id     VARCHAR(36)  NOT NULL,
  #媒资名称
  media_name   VARCHAR(36)  NOT NULL DEFAULT '',
  #媒资信息
  media_data   TEXT         NOT NULL,
  #状态（0-扫描出错，1-扫描完成，转码中，2-转码出错，3-扫描完成，转码完成，4-已上报）
  status       TINYINT               DEFAULT 0,
  #出错详情
  error_detail VARCHAR(512)          DEFAULT '',
  #创建时间
  create_utc   BIGINT       NOT NULL DEFAULT 1,
  #上报时间
  report_utc   BIGINT       NOT NULL,
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

#视频文件表
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  #主键ID
  id           VARCHAR(128) NOT NULL,
  #媒资id
  media_id     VARCHAR(36)  NOT NULL,
  #媒资名称
  media_name   VARCHAR(36)  NOT NULL DEFAULT '',
  #集数
  serial       INT          NOT NULL DEFAULT 1,
  #码率
  bitrate      INT                   DEFAULT 0,
  #文件路径
  file_path    VARCHAR(512) NOT NULL,
  #访问地址
  url          VARCHAR(512) NOT NULL DEFAULT '',
  #状态（0-转码中，1-转码出错，2-转码完成）
  status       TINYINT      NOT NULL DEFAULT 0,
  #出错详情
  error_detail VARCHAR(512)          DEFAULT '',
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

#字幕表
DROP TABLE IF EXISTS `subtitle`;
CREATE TABLE `subtitle` (
  #主键id
  id         VARCHAR(128) NOT NULL,
  #媒资id
  media_id   VARCHAR(36)  NOT NULL,
  #媒资名称
  media_name VARCHAR(36)  NOT NULL DEFAULT '',
  #集数
  serial     INT          NOT NULL DEFAULT 1,
  #语言
  language   VARCHAR(8)   NOT NULL DEFAULT 'chi',
  #文件路径
  file_path  VARCHAR(512) NOT NULL,
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;
