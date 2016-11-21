CREATE SCHEMA `test` DEFAULT CHARACTER SET utf8;

CREATE TABLE `test`.`user` (
  `id` INT(8) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  `age` INT NOT NULL,
  `isAdmin` BIT(1) NOT NULL,
  `createdDate` TIMESTAMP(6) NOT NULL,
  PRIMARY KEY (`id`));

INSERT INTO `test`.`user` (`name`, `age`, `isAdmin`) VALUES ('John', '21', b'1');
INSERT INTO `test`.`user` (`name`, `age`, `isAdmin`) VALUES ('Sam', '23', b'0');
INSERT INTO `test`.`user` (`name`, `age`, `isAdmin`) VALUES ('Zosia', '14', b'0');
INSERT INTO `test`.`user` (`name`, `age`, `isAdmin`) VALUES ('Jane', '16', b'0');
INSERT INTO `test`.`user` (`name`, `age`, `isAdmin`) VALUES ('Liudmila', '34', b'0');
INSERT INTO `test`.`user` (`name`, `age`, `isAdmin`) VALUES ('Fox', '1', b'0');
