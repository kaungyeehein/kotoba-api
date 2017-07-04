DROP SCHEMA IF EXISTS `kotoba` ;

CREATE SCHEMA `kotoba` ;
USE `kotoba` ;

CREATE TABLE `ktb_kotoba_jp` (
  `ktb_jp_id` INT NOT NULL AUTO_INCREMENT,
  `ktb_jp_kana` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `ktb_jp_romaji` VARCHAR(100) NOT NULL,
  `ktb_jp_kanji` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `ktb_jp_level` VARCHAR(2) NOT NULL,
  `ktb_jp_chapter` TINYINT(3) NULL DEFAULT NULL,
  `ktb_jp_type` VARCHAR(10) NOT NULL,
  `ktb_jp_sample` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `ktb_jp_create_date` TIMESTAMP NOT NULL,
  `ktb_jp_update_date` TIMESTAMP NULL DEFAULT NULL,
  `ktb_jp_delete_flag` TINYINT(1) NOT NULL,
  PRIMARY KEY (`ktb_jp_id`),
  INDEX `KOTOBA_KANA` (`ktb_jp_kana` ASC),
  INDEX `KOTOBA_ROMAJI` (`ktb_jp_romaji` ASC),
  INDEX `KOTOBA_KANJI` (`ktb_jp_kanji` ASC));
  
CREATE TABLE `ktb_kotoba_mm` (
  `ktb_mm_id` INT NOT NULL,
  `ktb_mm_name` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `ktb_mm_sample` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `ktb_mm_delete_flag` TINYINT(1) NOT NULL,
  PRIMARY KEY (`ktb_mm_id`, `ktb_mm_name`),
  INDEX `KOTOBA_MM_NAME` (`ktb_mm_name` ASC),
  CONSTRAINT `KOTOBA_MM_ID`
    FOREIGN KEY (`ktb_mm_id`)
    REFERENCES `ktb_kotoba_jp` (`ktb_jp_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);

CREATE TABLE `ktb_kotoba_en` (
  `ktb_en_id` INT NOT NULL,
  `ktb_en_name` VARCHAR(100) NOT NULL,
  `ktb_en_sample` VARCHAR(255) NULL DEFAULT NULL,
  `ktb_en_delete_flag` TINYINT	(1) NOT NULL,
  PRIMARY KEY (`ktb_en_id`, `ktb_en_name`),
  INDEX `KOTOBA_EN_NAME` (`ktb_en_name` ASC),
  CONSTRAINT `KOTOBA_EN_ID`
    FOREIGN KEY (`ktb_en_id`)
    REFERENCES `ktb_kotoba_jp` (`ktb_jp_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);
    
INSERT INTO `ktb_kotoba_jp` (`ktb_jp_kana`, `ktb_jp_romaji`, `ktb_jp_kanji`, `ktb_jp_level`, `ktb_jp_chapter`, `ktb_jp_type`, `ktb_jp_sample`, `ktb_jp_delete_flag`) VALUES ('くるま', 'kuruma', '車', 'N5', '1', 'n', 'これは車です。', '0');
INSERT INTO `ktb_kotoba_jp` (`ktb_jp_kana`, `ktb_jp_romaji`, `ktb_jp_kanji`, `ktb_jp_level`, `ktb_jp_chapter`, `ktb_jp_type`, `ktb_jp_sample`, `ktb_jp_delete_flag`) VALUES ('たべる', 'taberu', '食べる', 'N5', '4', 'v2', 'ひるごはんを食べます。', '0');

INSERT INTO `ktb_kotoba_en` (`ktb_en_id`, `ktb_en_name`, `ktb_en_sample`, `ktb_en_delete_flag`) VALUES ('1', 'car', 'This is a car.', '0');
INSERT INTO `ktb_kotoba_en` (`ktb_en_id`, `ktb_en_name`, `ktb_en_sample`, `ktb_en_delete_flag`) VALUES ('1', 'vehicle', 'This is a vehicle.', '0');
INSERT INTO `ktb_kotoba_en` (`ktb_en_id`, `ktb_en_name`, `ktb_en_sample`, `ktb_en_delete_flag`) VALUES ('2', 'eat', 'I eat lunch.', '0');

INSERT INTO `ktb_kotoba_mm` (`ktb_mm_id`, `ktb_mm_name`, `ktb_mm_sample`, `ktb_mm_delete_flag`) VALUES ('1', 'ကား', 'သည်ဟာသည် ကား ဖြစ်သည်။', '0');
INSERT INTO `ktb_kotoba_mm` (`ktb_mm_id`, `ktb_mm_name`, `ktb_mm_sample`, `ktb_mm_delete_flag`) VALUES ('2', 'စားသည်', 'နေ့လည်စာ စားသည်။', '0');
