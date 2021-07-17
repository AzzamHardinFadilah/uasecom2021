/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 10.4.8-MariaDB : Database - tokopekita
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tokopekita` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `tokopekita`;

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `idcart` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(100) NOT NULL,
  `userid` int(11) NOT NULL,
  `tglorder` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(10) NOT NULL DEFAULT 'Cart',
  PRIMARY KEY (`idcart`),
  UNIQUE KEY `orderid` (`orderid`),
  KEY `orderid_2` (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

/*Data for the table `cart` */

insert  into `cart`(`idcart`,`orderid`,`userid`,`tglorder`,`status`) values 
(10,'15wKVT0nej25Y',2,'2020-03-16 19:10:42','Selesai'),
(11,'15Swf8Ye0Fm.M',2,'2020-03-16 19:17:34','Cart'),
(12,'15PzF03ejd8W2',1,'2020-05-13 09:40:48','Confirmed'),
(13,'16BA6aaB8gNZE',1,'2021-07-17 11:48:48','Payment'),
(14,'16ZJ8duzK/Zfk',1,'2021-07-17 11:53:22','Cart');

/*Table structure for table `detailorder` */

DROP TABLE IF EXISTS `detailorder`;

CREATE TABLE `detailorder` (
  `detailid` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(100) NOT NULL,
  `idproduk` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY (`detailid`),
  KEY `orderid` (`orderid`),
  KEY `idproduk` (`idproduk`),
  CONSTRAINT `idproduk` FOREIGN KEY (`idproduk`) REFERENCES `produk` (`idproduk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderid` FOREIGN KEY (`orderid`) REFERENCES `cart` (`orderid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

/*Data for the table `detailorder` */

insert  into `detailorder`(`detailid`,`orderid`,`idproduk`,`qty`) values 
(15,'16BA6aaB8gNZE',4,3),
(16,'16ZJ8duzK/Zfk',4,1);

/*Table structure for table `kategori` */

DROP TABLE IF EXISTS `kategori`;

CREATE TABLE `kategori` (
  `idkategori` int(11) NOT NULL AUTO_INCREMENT,
  `namakategori` varchar(20) NOT NULL,
  `tgldibuat` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idkategori`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `kategori` */

insert  into `kategori`(`idkategori`,`namakategori`,`tgldibuat`) values 
(4,'buah ','2021-07-17 11:41:26');

/*Table structure for table `konfirmasi` */

DROP TABLE IF EXISTS `konfirmasi`;

CREATE TABLE `konfirmasi` (
  `idkonfirmasi` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(100) NOT NULL,
  `userid` int(11) NOT NULL,
  `payment` varchar(10) NOT NULL,
  `namarekening` varchar(25) NOT NULL,
  `tglbayar` date NOT NULL,
  `tglsubmit` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idkonfirmasi`),
  KEY `userid` (`userid`),
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `login` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `konfirmasi` */

insert  into `konfirmasi`(`idkonfirmasi`,`orderid`,`userid`,`payment`,`namarekening`,`tglbayar`,`tglsubmit`) values 
(1,'15PzF03ejd8W2',1,'Bank BCA','Admin','2020-05-16','2020-05-13 09:41:51');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `namalengkap` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(150) NOT NULL,
  `notelp` varchar(15) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `tgljoin` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` varchar(7) NOT NULL DEFAULT 'Member',
  `lastlogin` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `login` */

insert  into `login`(`userid`,`namalengkap`,`email`,`password`,`notelp`,`alamat`,`tgljoin`,`role`,`lastlogin`) values 
(1,'Admin','admin','$2y$10$GJVGd4ji3QE8ikTBzNyA0uLQhiGd6MirZeSJV1O6nUpjSVp1eaKzS','01234567890','Indonesia','2020-03-16 18:31:17','Admin',NULL),
(2,'Guest','guest','$2y$10$xXEMgj5pMT9EE0QAx3QW8uEn155Je.FHH5SuIATxVheOt0Z4rhK6K','01234567890','Indonesia','2020-03-16 18:30:40','Member',NULL);

/*Table structure for table `pembayaran` */

DROP TABLE IF EXISTS `pembayaran`;

CREATE TABLE `pembayaran` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `metode` varchar(25) NOT NULL,
  `norek` varchar(25) NOT NULL,
  `logo` text DEFAULT NULL,
  `an` varchar(20) NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `pembayaran` */

insert  into `pembayaran`(`no`,`metode`,`norek`,`logo`,`an`) values 
(1,'Bank BCA','13131231231','images/bca.jpg','Tokopekita'),
(2,'Bank Mandiri','943248844843','images/mandiri.jpg','Tokopekita'),
(3,'DANA','0882313132123','images/dana.png','Tokopekita');

/*Table structure for table `produk` */

DROP TABLE IF EXISTS `produk`;

CREATE TABLE `produk` (
  `idproduk` int(40) NOT NULL AUTO_INCREMENT,
  `idkategori` int(40) NOT NULL,
  `namaproduk` varchar(30) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `deskripsi` varchar(200) NOT NULL,
  `rate` int(40) NOT NULL,
  `hargabefore` int(40) NOT NULL,
  `hargaafter` int(40) NOT NULL,
  `tgldibuat` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idproduk`),
  KEY `idkategori` (`idkategori`),
  CONSTRAINT `idkategori` FOREIGN KEY (`idkategori`) REFERENCES `kategori` (`idkategori`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `produk` */

insert  into `produk`(`idproduk`,`idkategori`,`namaproduk`,`gambar`,`deskripsi`,`rate`,`hargabefore`,`hargaafter`,`tgldibuat`) values 
(4,4,'anggur','produk/16HMm.U6JK3jU.jpg','buah anggur austrai',4,15,14,'2021-07-17 11:42:36'),
(5,4,'pepaya','produk/1657k6ZSUa8Bs.jpeg','pepaya sumatra',4,16,13,'2021-07-17 11:46:33'),
(6,4,'manggis','produk/16hB2tUSLkbK2.jpg','manggis kalimantan',3,13,11,'2021-07-17 11:48:09');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
