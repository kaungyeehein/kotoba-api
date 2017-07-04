DROP SCHEMA IF EXISTS `kotoba` ;

CREATE SCHEMA `kotoba` ;
USE `kotoba` ;

CREATE TABLE `kotoba` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `kana` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `romaji` VARCHAR(100) NOT NULL,
  `kanji` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `level` VARCHAR(2) NOT NULL,
  `chapter` TINYINT(3) NULL DEFAULT NULL,
  `type` VARCHAR(10) NOT NULL,
  `sample` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `create` TIMESTAMP NOT NULL,
  `update` TIMESTAMP NOT NULL,
  `delete` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `KOTOBA_KANA` (`kana` ASC),
  INDEX `KOTOBA_ROMAJI` (`romaji` ASC),
  INDEX `KOTOBA_KANJI` (`kanji` ASC));
  
CREATE TABLE `kotoba_mm` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `sample` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `delete` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`, `name`),
  INDEX `KOTOBA_MM_NAME` (`name` ASC),
  CONSTRAINT `KOTOBA_MM_ID`
    FOREIGN KEY (`id`)
    REFERENCES `kotoba` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);

CREATE TABLE `kotoba_en` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `sample` VARCHAR(255) NULL DEFAULT NULL,
  `delete` TINYINT	(1) NOT NULL,
  PRIMARY KEY (`id`, `name`),
  INDEX `KOTOBA_EN_NAME` (`name` ASC),
  CONSTRAINT `KOTOBA_EN_ID`
    FOREIGN KEY (`id`)
    REFERENCES `kotoba` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);
    
INSERT INTO `kotoba` (`kana`, `romaji`, `kanji`, `level`, `chapter`, `type`, `sample`, `delete`) VALUES ('くるま', 'kuruma', '車', 'N5', '1', 'n', 'これは車です。', '0');
INSERT INTO `kotoba` (`kana`, `romaji`, `kanji`, `level`, `chapter`, `type`, `sample`, `delete`) VALUES ('たべる', 'taberu', '食べる', 'N5', '4', 'v2', 'ひるごはんを食べます。', '0');

INSERT INTO `kotoba_en` (`id`, `name`, `sample`, `delete`) VALUES ('1', 'car', 'This is a car.', '0');
INSERT INTO `kotoba_en` (`id`, `name`, `sample`, `delete`) VALUES ('1', 'vehicle', 'This is a vehicle.', '0');
INSERT INTO `kotoba_en` (`id`, `name`, `sample`, `delete`) VALUES ('2', 'eat', 'I eat lunch.', '0');

INSERT INTO `kotoba_mm` (`id`, `name`, `sample`, `delete`) VALUES ('1', 'ကား', 'သည်ဟာသည် ကား ဖြစ်သည်။', '0');
INSERT INTO `kotoba_mm` (`id`, `name`, `sample`, `delete`) VALUES ('2', 'စားသည်', 'နေ့လည်စာ စားသည်။', '0');
