/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 10.4.20-MariaDB : Database - testing
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`testing` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `testing`;

/*Table structure for table `mstr_father` */

DROP TABLE IF EXISTS `mstr_father`;

CREATE TABLE `mstr_father` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `age` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `mstr_father` */

insert  into `mstr_father`(`id`,`user_id`,`name`,`age`,`dob`) values 
(1,1,'Prasad','23 years','1985-02-01'),
(3,4,'nagesh','23 years','1985-02-01'),
(4,2,'sangram','50 years','1912-02-01'),
(5,5,'Nitesh','50 years','1912-02-01');

/*Table structure for table `mstr_mother` */

DROP TABLE IF EXISTS `mstr_mother`;

CREATE TABLE `mstr_mother` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `age` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `mstr_mother` */

insert  into `mstr_mother`(`id`,`user_id`,`name`,`age`,`dob`) values 
(1,5,'sangita','50 years','1912-02-01'),
(2,1,'pratiksha','40 years','1945-02-05'),
(3,2,'namrata','30 years','1999-03-15'),
(4,3,'harshada','30 years','1999-03-15');

/*Table structure for table `mstr_user` */

DROP TABLE IF EXISTS `mstr_user`;

CREATE TABLE `mstr_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `mstr_user` */

insert  into `mstr_user`(`id`,`name`,`address`,`dob`) values 
(1,'aa','aaa','2020-02-01'),
(2,'Siya','Mumbai','1998-10-02'),
(3,'Siya','Mumbai','1998-10-02'),
(4,'Prabhas','Mumbai','1998-10-02'),
(5,'Pratik','Mumbai','1998-10-02');

/* Procedure structure for procedure `pro_add_father` */

/*!50003 DROP PROCEDURE IF EXISTS  `pro_add_father` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_add_father`(in `_user_id` int,in `_name` varchar(50),in `_age` varchar(50),in `_dob` date)
    NO SQL
BEGIN
		set @usercont:=(select count(user_id) from mstr_father where user_id=_user_id);
		if @usercont=0 then
		insert into mstr_father(user_id,name,age,dob) values(_user_id,_name,_age,_dob);
		select 1 as result;
		else
		UPDATE mstr_father SET NAME=_name,age=_age,dob=_dob WHERE user_id=_user_id;
		select 2 as result;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `pro_add_mother` */

/*!50003 DROP PROCEDURE IF EXISTS  `pro_add_mother` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_add_mother`(in `_user_id` int,in `_name`varchar(50),in `_age` varchar(50),in `_dob` date)
    NO SQL
BEGIN
		set @usercont:=(select count(user_id)from mstr_mother where user_id=_user_id);
		if @usercont=0 then
		INSERT INTO mstr_mother(user_id,NAME,age,dob) VALUES(_user_id,_name,_age,_dob);
		SELECT 1 AS result;
		else
		UPDATE mstr_mother SET NAME=_name,age=_age,dob=_dob WHERE user_id=_user_id;
		SELECT 2 AS result;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `pro_family_list` */

/*!50003 DROP PROCEDURE IF EXISTS  `pro_family_list` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_family_list`()
    NO SQL
BEGIN
		SELECT users.name,users.address,users.dob,father.name AS father_name,father.age AS father_age,father.dob AS father_dob,mother.name AS mother_name,mother.age AS mother_age,mother.dob AS mother_dob
		FROM mstr_user users
		INNER JOIN mstr_father father ON users.id=father.user_id
		INNER JOIN mstr_mother mother ON users.id=mother.user_id;
		
		select * from mstr_user;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `pro_list_show` */

/*!50003 DROP PROCEDURE IF EXISTS  `pro_list_show` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_list_show`()
BEGIN 
select * from mstr_user;
end */$$
DELIMITER ;

/* Procedure structure for procedure `pro_update_user` */

/*!50003 DROP PROCEDURE IF EXISTS  `pro_update_user` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_update_user`(in `_user_id` int,in `_name` varchar(50),in `_age` varchar(20),in `_dob` date)
    NO SQL
BEGIN
		update mstr_father set name=_name,age=_age,dob=_dob where user_id=_user_id;
		select 1 as result;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `pro_user_list` */

/*!50003 DROP PROCEDURE IF EXISTS  `pro_user_list` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_user_list`(in `_dob` date)
    NO SQL
BEGIN
		if _dob="2020-02-01" then
		select * from mstr_user where dob=_dob;
		
		else
		
		SELECT * FROM testingnew.mstr_user WHERE dob=_dob;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sproc_adduser` */

/*!50003 DROP PROCEDURE IF EXISTS  `sproc_adduser` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sproc_adduser`(in `_name` varchar(50),in `_address` varchar(100),in `_dob` date)
    NO SQL
BEGIN
	insert into mstr_user(name,address,dob) values(_name,_address,_dob);
	select 1 as result;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
