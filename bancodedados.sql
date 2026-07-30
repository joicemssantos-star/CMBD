-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.4.3 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para teste
CREATE DATABASE IF NOT EXISTS `teste` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `teste`;

-- Copiando estrutura para tabela teste.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cpf_cnpj` varchar(18) NOT NULL,
  `rua` varchar(255) DEFAULT NULL,
  `numero` varchar(50) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `referencia` varchar(255) DEFAULT NULL,
  `telefone` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela teste.compras
CREATE TABLE IF NOT EXISTS `compras` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_fornecedor` int DEFAULT NULL,
  `id_produto` int DEFAULT NULL,
  `quantidade` float NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `data_compra` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_fornecedor` (`id_fornecedor`),
  KEY `id_produto` (`id_produto`),
  CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id`),
  CONSTRAINT `compras_idfk_1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=401 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela teste.fornecedores
CREATE TABLE IF NOT EXISTS `fornecedores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `cpf_cnpj` varchar(18) NOT NULL,
  `rua` varchar(255) DEFAULT NULL,
  `numero` varchar(50) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `telefone` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela teste.pedidos
CREATE TABLE IF NOT EXISTS `pedidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `id_produto` int DEFAULT NULL,
  `num_ped` varchar(255) DEFAULT NULL,
  `quantidade` float NOT NULL,
  `data_ped` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_clientes` (`id_cliente`),
  KEY `id_produto` (`id_produto`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`),
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=601 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela teste.produtos
CREATE TABLE IF NOT EXISTS `produtos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cod_barras` varchar(100) DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` longtext,
  `estoque` float NOT NULL,
  `valor` float NOT NULL,
  `data_fablicacao` datetime DEFAULT NULL,
  `data_validade` datetime DEFAULT NULL,
  `data_fabricacao` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
