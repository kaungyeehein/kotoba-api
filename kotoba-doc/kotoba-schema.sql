DROP SCHEMA IF EXISTS `kotoba` ;

CREATE SCHEMA `kotoba` ;
USE `kotoba` ;

CREATE TABLE `kotoba` (
  `kotoba_id` INT NOT NULL AUTO_INCREMENT,
  `kotoba_kana` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `kotoba_romaji` VARCHAR(100) NOT NULL,
  `kotoba_kanji` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `kotoba_level` VARCHAR(2) NOT NULL,
  `kotoba_chapter` TINYINT(3) NULL DEFAULT NULL,
  `kotoba_type` VARCHAR(10) NOT NULL,
  `kotoba_sample` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `kotoba_create_date` TIMESTAMP NOT NULL,
  `kotoba_update_date` TIMESTAMP NULL DEFAULT NULL,
  `kotoba_delete_flag` TINYINT(1) NOT NULL,
  PRIMARY KEY (`kotoba_id`),
  INDEX `KOTOBA_KANA` (`kotoba_kana` ASC),
  INDEX `KOTOBA_ROMAJI` (`kotoba_romaji` ASC),
  INDEX `KOTOBA_KANJI` (`kotoba_kanji` ASC));
  
CREATE TABLE `kotoba_mm` (
  `kotoba_id` INT NOT NULL,
  `kotoba_name` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `kotoba_sample` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `kotoba_delete_flag` TINYINT(1) NOT NULL,
  PRIMARY KEY (`kotoba_id`, `kotoba_name`),
  INDEX `KOTOBA_MM_NAME` (`kotoba_name` ASC),
  CONSTRAINT `KOTOBA_MM_ID`
    FOREIGN KEY (`kotoba_id`)
    REFERENCES `kotoba` (`kotoba_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);

CREATE TABLE `kotoba_en` (
  `kotoba_id` INT NOT NULL,
  `kotoba_name` VARCHAR(100) NOT NULL,
  `kotoba_sample` VARCHAR(255) NULL DEFAULT NULL,
  `kotoba_delete_flag` TINYINT	(1) NOT NULL,
  PRIMARY KEY (`kotoba_id`, `kotoba_name`),
  INDEX `KOTOBA_EN_NAME` (`kotoba_name` ASC),
  CONSTRAINT `KOTOBA_EN_ID`
    FOREIGN KEY (`kotoba_id`)
    REFERENCES `kotoba` (`kotoba_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);
    
INSERT INTO `kotoba` (`kotoba_kana`, `kotoba_romaji`, `kotoba_kanji`, `kotoba_level`, `kotoba_chapter`, `kotoba_type`, `kotoba_sample`, `kotoba_delete_flag`) VALUES ('くるま', 'kuruma', '車', 'N5', '1', 'n', 'これは車です。', '0');
INSERT INTO `kotoba` (`kotoba_kana`, `kotoba_romaji`, `kotoba_kanji`, `kotoba_level`, `kotoba_chapter`, `kotoba_type`, `kotoba_sample`, `kotoba_delete_flag`) VALUES ('たべる', 'taberu', '食べる', 'N5', '4', 'v2', 'ひるごはんを食べます。', '0');

INSERT INTO `kotoba_en` (`kotoba_id`, `kotoba_name`, `kotoba_sample`, `kotoba_delete_flag`) VALUES ('1', 'car', 'This is a car.', '0');
INSERT INTO `kotoba_en` (`kotoba_id`, `kotoba_name`, `kotoba_sample`, `kotoba_delete_flag`) VALUES ('1', 'vehicle', 'This is a vehicle.', '0');
INSERT INTO `kotoba_en` (`kotoba_id`, `kotoba_name`, `kotoba_sample`, `kotoba_delete_flag`) VALUES ('2', 'eat', 'I eat lunch.', '0');

INSERT INTO `kotoba_mm` (`kotoba_id`, `kotoba_name`, `kotoba_sample`, `kotoba_delete_flag`) VALUES ('1', 'ကား', 'သည်ဟာသည် ကား ဖြစ်သည်။', '0');
INSERT INTO `kotoba_mm` (`kotoba_id`, `kotoba_name`, `kotoba_sample`, `kotoba_delete_flag`) VALUES ('2', 'စားသည်', 'နေ့လည်စာ စားသည်။', '0');
