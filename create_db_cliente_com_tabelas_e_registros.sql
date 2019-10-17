-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.26 - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para db_aula
CREATE DATABASE IF NOT EXISTS `db_aula` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `db_aula`;

-- Copiando estrutura para tabela db_aula.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `cpf` varchar(12) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `idade` int(11) NOT NULL DEFAULT '0',
  `celular` varchar(15) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `email` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `rua` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `bairro` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `cidade` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `uf` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `sexo` varchar(3) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela db_aula.cliente: 3 rows
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`id`, `nome`, `cpf`, `idade`, `celular`, `email`, `rua`, `bairro`, `cidade`, `uf`, `sexo`) VALUES
	(1, 'Jackson Meires', '06232803150', 20, '0', '0', '0', '0', '0', '0', 'M'),
	(2, 'Maria', '00055566688', 21, '0', '0', '0', '0', '0', '0', 'F'),
	(3, 'João Pedro', '55566644499', 16, '0', '0', '0', '0', '0', '0', 'M');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Copiando estrutura para tabela db_aula.itens_pedido
CREATE TABLE IF NOT EXISTS `itens_pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produto_id` int(11) NOT NULL DEFAULT '0',
  `pedido_id` int(11) NOT NULL DEFAULT '0',
  `quantidade` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_itens_pedido_produto` (`produto_id`),
  KEY `FK_itens_pedido_pedido` (`pedido_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela db_aula.itens_pedido: 6 rows
/*!40000 ALTER TABLE `itens_pedido` DISABLE KEYS */;
INSERT INTO `itens_pedido` (`id`, `produto_id`, `pedido_id`, `quantidade`) VALUES
	(1, 1, 1, 3),
	(2, 2, 1, 5),
	(3, 3, 1, 8),
	(4, 2, 2, 2),
	(5, 4, 2, 11),
	(6, 5, 3, 40);
/*!40000 ALTER TABLE `itens_pedido` ENABLE KEYS */;

-- Copiando estrutura para tabela db_aula.pedido
CREATE TABLE IF NOT EXISTS `pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) NOT NULL DEFAULT '0',
  `itens_pedido_id` int(11) NOT NULL DEFAULT '0',
  `data_pedido` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `FK_pedido_itens_pedido` (`itens_pedido_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela db_aula.pedido: 4 rows
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` (`id`, `cliente_id`, `itens_pedido_id`, `data_pedido`) VALUES
	(1, 1, 1, '2019-08-17'),
	(2, 2, 2, '2019-09-17'),
	(3, 3, 3, '2019-10-12'),
	(4, 2, 4, '2019-10-18');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;

-- Copiando estrutura para tabela db_aula.produto
CREATE TABLE IF NOT EXISTS `produto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_produto` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `descricao_produto` varchar(500) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `unid_medida` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `preco` decimal(9,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela db_aula.produto: 5 rows
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` (`id`, `nome_produto`, `descricao_produto`, `unid_medida`, `preco`) VALUES
	(1, 'Banana', 'Fruta', 'Kg', 0.50),
	(2, 'Macarrão', 'Cereais', 'KG', 3.50),
	(3, 'Mamão', 'Fruta', 'Unid', 3.00),
	(4, 'Queijo', 'Laticinios', 'KG', 33.00),
	(5, 'Presunto', 'Suino', 'KG', 0.00);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
