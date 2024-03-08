-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.1.33-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para blog
CREATE DATABASE IF NOT EXISTS `blog` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `blog`;

-- Copiando estrutura para tabela blog.imagens
CREATE TABLE IF NOT EXISTS `imagens` (
  `codigo_imagem` int(11) NOT NULL,
  `imagem` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`codigo_imagem`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela blog.imagens: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `imagens` DISABLE KEYS */;
INSERT INTO `imagens` (`codigo_imagem`, `imagem`) VALUES
	(1, 'meliante.png');
/*!40000 ALTER TABLE `imagens` ENABLE KEYS */;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela blog.noticia: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `noticia` DISABLE KEYS */;
INSERT INTO `noticia` (`cod_noticia`, `codigo_imagens`, `codigo_texto`) VALUES
	(1, 1, 1);
/*!40000 ALTER TABLE `noticia` ENABLE KEYS */;

-- Copiando estrutura para tabela blog.textos
CREATE TABLE IF NOT EXISTS `textos` (
  `codigo_texto` int(11) NOT NULL AUTO_INCREMENT,
  `dat` date DEFAULT NULL,
  `texto` longtext,
  `titulo` longtext,
  `subtitulo` longtext,
  PRIMARY KEY (`codigo_texto`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela blog.textos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `textos` DISABLE KEYS */;
INSERT INTO `textos` (`codigo_texto`, `dat`, `texto`, `titulo`, `subtitulo`) VALUES
	(1, '2026-03-02', 'No tranquilo bairro residencial de São Mateus, uma série de furtos misteriosos deixou os moradores perplexos nas últimas semanas. O mistério envolvendo a ração desaparecendo dos potes dos pets finalmente foi resolvido quando uma vigilância noturna inesperada pegou o verdadeiro culpado em flagrante: um cachorro local, apelidado de Peludo.', 'Cachorro Ladino: Peludo é Pego Roubando Ração de Casa Vizinha', 'Caso inusitado ocorreu no bairro quando moradores descobriram o verdadeiro "ladrão de ração" que vinha esvaziando seus potes.');
/*!40000 ALTER TABLE `textos` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
