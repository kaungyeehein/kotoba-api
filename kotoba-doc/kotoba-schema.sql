DROP SCHEMA IF EXISTS `kotoba` ;

CREATE SCHEMA `kotoba` ;
USE `kotoba` ;

CREATE TABLE `person` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `gender` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));
  
CREATE TABLE `pet` (
  `pet_id` INT NOT NULL,
  `owner_id` INT NULL,
  `pet_name` VARCHAR(45) NULL,
  PRIMARY KEY (`pet_id`));

INSERT INTO `person` (`id`, `name`, `gender`, `email`) VALUES (1, 'Kaung', 'Male', 'kaung@gmail.com');
INSERT INTO `person` (`id`, `name`, `gender`, `email`) VALUES (2, 'Zaw', 'Male', 'zaw@gmail.com');
INSERT INTO `person` (`id`, `name`, `gender`, `email`) VALUES (3, 'Aye', 'Female', 'aye@gmail.com');

INSERT INTO `pet` (`pet_id`, `owner_id`, `pet_name`) VALUES (1, 1, 'dog');
INSERT INTO `pet` (`pet_id`, `owner_id`, `pet_name`) VALUES (2, 1, 'bird');
INSERT INTO `pet` (`pet_id`, `owner_id`, `pet_name`) VALUES (3, 3, 'cat');