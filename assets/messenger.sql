-- SQLINES DEMO *** rated by MySQL Workbench
-- SQLINES DEMO *** 52 2020
-- SQLINES DEMO ***    Version: 1.0
-- SQLINES DEMO *** orward Engineering

/* SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0; */
/* SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0; */
/* SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_tS,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION'; */

-- SQLINES DEMO *** ------------------------------------
-- Schema messenger
-- SQLINES DEMO *** ------------------------------------
DROP SCHEMA IF EXISTS messenger ;

-- SQLINES DEMO *** ------------------------------------
-- Schema messenger
-- SQLINES DEMO *** ------------------------------------
CREATE SCHEMA IF NOT EXISTS messenger DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE messenger ;

-- SQLINES DEMO *** ------------------------------------
-- Table `users`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS users ;

SHOW WARNINGS;
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE users_seq;

CREATE TABLE IF NOT EXISTS users (
  id INT NOT NULL DEFAULT NEXTVAL ('users_seq'),
  phone VARCHAR(16) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(40) NOT NULL,
  first_name VARCHAR(20) NOT NULL DEFAULT '',
  last_name VARCHAR(20) NOT NULL DEFAULT '',
  middle_name VARCHAR(20) NOT NULL DEFAULT '',
  is_active SMALLINT NOT NULL DEFAULT 0,
  is_reported SMALLINT NOT NULL DEFAULT 0,
  is_blocked SMALLINT NOT NULL DEFAULT 0,
  preferences TEXT NOT NULL DEFAULT '',
  created_at TIMESTAMP(0) NOT NULL,
  updated_at TIMESTAMP(0) NOT NULL,
  PRIMARY KEY (id))
;

SHOW WARNINGS;
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE UNIQUE INDEX phone_UNIQUE ON users (phone ASC) VISIBLE;

SHOW WARNINGS;
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE UNIQUE INDEX email_UNIQUE ON users (email ASC) VISIBLE;

SHOW WARNINGS;

-- SQLINES DEMO *** ------------------------------------
-- Table `contacts`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS contacts ;

SHOW WARNINGS;
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS contacts (
  id INT NOT NULL ,
  first_name VARCHAR(20) NOT NULL DEFAULT '',
  middle_name VARCHAR(20) NOT NULL DEFAULT '',
  last_name VARCHAR(20) NOT NULL DEFAULT '',
  phone VARCHAR(14) NOT NULL,
  email VARCHAR(255) NOT NULL,
  created_at VARCHAR(45) NOT NULL,
  PRIMARY KEY (id))
;

SHOW WARNINGS;

-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** on`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS conversation ;

SHOW WARNINGS;
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE conversation_seq;

CREATE TABLE IF NOT EXISTS conversation (
  id INT NOT NULL DEFAULT NEXTVAL ('conversation_seq'),
  title VARCHAR(40) NOT NULL,
  creator_id INT NOT NULL,
  channel_id VARCHAR(45) NOT NULL,
  created_at TIMESTAMP(0) NOT NULL,
  updated_at TIMESTAMP(0) NOT NULL,
  deleted_at TIMESTAMP(0) NOT NULL,
  PRIMARY KEY (id))
;

SHOW WARNINGS;

-- SQLINES DEMO *** ------------------------------------
-- Table `messages`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS messages ;

SHOW WARNINGS;
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS messages (
  id INT NOT NULL,
  guid VARCHAR(100) NOT NULL,
  conversation_id INT NOT NULL,
  sender_id INT NOT NULL,
  message_type ENUM('text', 'image', 'vedio', 'audio') NOT NULL,
  message VARCHAR(255) NOT NULL DEFAULT '',
  created_at TIMESTAMP(0) NOT NULL,
  deleted_at TIMESTAMP(0) NOT NULL,
  PRIMARY KEY (id))
;

SHOW WARNINGS;

-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** ts`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS participants ;

SHOW WARNINGS;
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE participants_seq;

CREATE TABLE IF NOT EXISTS participants (
  id INT NOT NULL DEFAULT NEXTVAL ('participants_seq'),
  conversation_id INT NOT NULL,
  users_id INT NOT NULL,
  type ENUM('single', 'group') NOT NULL,
  created_at TIMESTAMP(0) NOT NULL,
  updated_at TIMESTAMP(0) NOT NULL,
  PRIMARY KEY (id))
;

SHOW WARNINGS;
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE UNIQUE INDEX participants_UNIQUE ON participants (
   conversation_id, users_id) VISIBLE;

SHOW WARNINGS;

-- SQLINES DEMO *** ------------------------------------
-- Table `reports`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS reports ;

SHOW WARNINGS;
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE reports_seq;

CREATE TABLE IF NOT EXISTS reports (
  id INT NOT NULL DEFAULT NEXTVAL ('reports_seq'),
  users_id INT NOT NULL,
  participants_id INT NOT NULL,
  report_type VARCHAR(45) NOT NULL,
  notes TEXT NOT NULL,
  status ENUM('pending', 'resolved') NOT NULL DEFAULT 'pending',
  created_at TIMESTAMP(0) NOT NULL,
  PRIMARY KEY (id))
;

SHOW WARNINGS;

-- SQLINES DEMO *** ------------------------------------
-- Table `block_list`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS block_list ;

SHOW WARNINGS;
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE block_list_seq;

CREATE TABLE IF NOT EXISTS block_list (
  id INT NOT NULL DEFAULT NEXTVAL ('block_list_seq'),
  users_id INT NOT NULL,
  participants_id INT NOT NULL,
  created_at TIMESTAMP(0) NOT NULL,
  PRIMARY KEY (id))
;

SHOW WARNINGS;

-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** nversations`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS deleted_conversations ;

SHOW WARNINGS;
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS deleted_conversations (
  id INT NOT NULL,
  conversation_id INT NOT NULL,
  users_id INT NOT NULL,
  created_at TIMESTAMP(0) NOT NULL,
  PRIMARY KEY (id))
;

SHOW WARNINGS;

-- SQLINES DEMO *** ------------------------------------
-- Table `devices`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS devices ;

SHOW WARNINGS;
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE devices_seq;

CREATE TABLE IF NOT EXISTS devices (
  id INT NOT NULL DEFAULT NEXTVAL ('devices_seq'),
  users_id INT NOT NULL,
  device_id VARCHAR(120) NOT NULL,
  type ENUM('APPLE') NOT NULL,
  device_token VARCHAR(120) NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;

SHOW WARNINGS;

-- SQLINES DEMO *** ------------------------------------
-- Table `access`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS access ;

SHOW WARNINGS;
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS access (
  id INT NOT NULL,
  users_id INT NOT NULL,
  devices_id INT NOT NULL,
  token VARCHAR(60) NOT NULL,
  created_at TIMESTAMP(0) NOT NULL,
  deleted_at TIMESTAMP(0) NOT NULL,
  PRIMARY KEY (id))
;

SHOW WARNINGS;

-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** ssages`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS deleted_messages ;

SHOW WARNINGS;
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE deleted_messages_seq;

CREATE TABLE IF NOT EXISTS deleted_messages (
  id INT NOT NULL DEFAULT NEXTVAL ('deleted_messages_seq'),
  messages_id INT NOT NULL,
  users_id INT NOT NULL,
  created_at TIMESTAMP(0) NOT NULL,
  updated_at TIMESTAMP(0) NOT NULL,
  PRIMARY KEY (id))
;

SHOW WARNINGS;

-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** ct`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS user_contact ;

SHOW WARNINGS;
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS user_contact (
  user_id INT NOT NULL,
  contact_id INT NOT NULL,
  first_name VARCHAR(45) NOT NULL DEFAULT '',
  last_name VARCHAR(45) NOT NULL DEFAULT '',
  created_at TIMESTAMP(0) NOT NULL,
  updated_at TIMESTAMP(0) NOT NULL,
  PRIMARY KEY (user_id, contact_id))
;

SHOW WARNINGS;

-- SQLINES DEMO *** ------------------------------------
-- Table `activities`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS activities ;

SHOW WARNINGS;
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS activities (
  id INT NOT NULL,
  activity_type VARCHAR(45) NOT NULL,
  activity_id INT NOT NULL,
  title VARCHAR(45) NOT NULL,
  detail TEXT NOT NULL,
  created_at TIMESTAMP(0) NOT NULL,
  updated_at TIMESTAMP(0) NOT NULL,
  PRIMARY KEY (id))
;

SHOW WARNINGS;

-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** ication`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS user_verification ;

SHOW WARNINGS;
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS user_verification (
  users_id INT NOT NULL,
  verification_code VARCHAR(45) NOT NULL,
  created_at VARCHAR(45) NOT NULL)
;

SHOW WARNINGS;

-- SQLINES DEMO *** ------------------------------------
-- Table `attachments`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS attachments ;

SHOW WARNINGS;
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS attachments (
  id INT NOT NULL,
  messages_id INT NOT NULL,
  thumb_url VARCHAR(45) NOT NULL,
  file_url VARCHAR(45) NOT NULL,
  created_at TIMESTAMP(0) NOT NULL,
  updated_at TIMESTAMP(0) NULL,
  PRIMARY KEY (id))
;

SHOW WARNINGS;

/* SET SQL_MODE=@OLD_SQL_MODE; */
/* SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS; */
/* SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS; */