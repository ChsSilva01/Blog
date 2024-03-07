-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.28-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para blog
CREATE DATABASE IF NOT EXISTS `blog` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `blog`;

-- Copiando estrutura para tabela blog.imagens
CREATE TABLE IF NOT EXISTS `imagens` (
  `codigo_imagem` int(11) NOT NULL,
  `imagem` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`codigo_imagem`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Copiando dados para a tabela blog.imagens: ~1 rows (aproximadamente)
INSERT INTO `imagens` (`codigo_imagem`, `imagem`) VALUES
	(1, 'aaa');

-- Copiando estrutura para tabela blog.noticia
CREATE TABLE IF NOT EXISTS `noticia` (
  `cod_noticia` int(11) NOT NULL,
  `codigo_imagens` int(11) DEFAULT NULL,
  `codigo_texto` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_noticia`),
  KEY `FK_noticia_imagens` (`codigo_imagens`),
  KEY `FK_noticia_texto` (`codigo_texto`),
  CONSTRAINT `FK_noticia_imagens` FOREIGN KEY (`codigo_imagens`) REFERENCES `imagens` (`codigo_imagem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_noticia_texto` FOREIGN KEY (`codigo_texto`) REFERENCES `textos` (`codigo_texto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Copiando dados para a tabela blog.noticia: ~1 rows (aproximadamente)
INSERT INTO `noticia` (`cod_noticia`, `codigo_imagens`, `codigo_texto`) VALUES
	(1, 1, 1);

-- Copiando estrutura para tabela blog.textos
CREATE TABLE IF NOT EXISTS `textos` (
  `codigo_texto` int(11) NOT NULL AUTO_INCREMENT,
  `dat` date DEFAULT NULL,
  `texto` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`codigo_texto`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Copiando dados para a tabela blog.textos: ~1 rows (aproximadamente)
INSERT INTO `textos` (`codigo_texto`, `dat`, `texto`) VALUES
	(1, '2026-03-02', 'aaa');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
