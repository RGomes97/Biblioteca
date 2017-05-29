-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2017 at 04:24 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

-- habilitando eventos
SET GLOBAL event_scheduler = ON;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `biblioteca`
--

-- --------------------------------------------------------

--
-- Table structure for table `item_pedido`
--

CREATE TABLE `item_pedido` (
  `id_livro` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `data_reserva` datetime NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `data_retirada` datetime DEFAULT NULL,
  `data_devolucao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_pedido`
--

INSERT INTO `item_pedido` (`id_livro`, `id_usuario`, `data_reserva`, `id_pedido`, `data_retirada`, `data_devolucao`) VALUES
(1, 1, '2017-05-10 00:00:00', 1, '2017-05-22 17:16:54', '0000-00-00 00:00:00'),
(2, 7, '2017-05-21 14:27:22', 2, '2017-05-22 17:34:29', NULL),
(2, 7, '2017-05-21 14:34:57', 3, '2017-05-22 18:29:02', NULL),
(1, 7, '2017-05-21 14:35:16', 4, '2017-05-22 17:19:56', NULL),
(1, 7, '2017-05-21 14:35:49', 5, '2017-05-22 17:38:24', NULL),
(4, 7, '2017-05-21 16:42:33', 7, '2017-05-22 18:17:22', NULL),
(4, 7, '2017-05-21 16:44:51', 11, '2017-05-22 18:17:52', NULL),
(3, 7, '2017-05-21 16:46:41', 14, '2017-05-22 18:21:44', NULL),
(3, 7, '2017-05-21 16:47:08', 15, '2017-05-22 18:12:30', NULL),
(3, 7, '2017-05-21 16:47:13', 16, '2017-05-22 18:20:37', NULL),
(1, 24, '2017-05-28 21:05:56', 20, '2017-05-28 21:06:33', NULL),
(3, 24, '2017-05-28 21:06:00', 21, '2017-05-28 21:06:35', NULL),
(4, 24, '2017-05-28 21:06:03', 22, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item_retirado`
--

CREATE TABLE `item_retirado` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_livro` int(11) NOT NULL,
  `data_retirada` datetime NOT NULL,
  `multa` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_retirado`
--

INSERT INTO `item_retirado` (`id`, `id_usuario`, `id_livro`, `data_retirada`, `multa`) VALUES
(1, 7, 3, '2017-05-22 18:21:44', NULL),
(2, 7, 2, '2017-05-22 18:29:02', NULL),
(3, 3, 2, '2017-05-19 00:00:00', 6),
(4, 1, 2, '2017-05-18 00:00:00', 8),
(5, 3, 3, '2017-05-16 00:00:00', 12),
(6, 24, 1, '2017-05-28 21:06:33', NULL),
(7, 24, 3, '2017-05-28 21:06:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `livros`
--

CREATE TABLE `livros` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `estoque` int(11) NOT NULL,
  `autor` varchar(200) NOT NULL,
  `isbn` int(11) NOT NULL,
  `genero` varchar(200) NOT NULL,
  `descricao` varchar(600) NOT NULL,
  `data_de_cadastro` datetime NOT NULL,
  `quantidade_disponivel` int(11) DEFAULT NULL,
  `quantidade_reservada` int(11) DEFAULT NULL,
  `url` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `livros`
--

INSERT INTO `livros` (`id`, `nome`, `estoque`, `autor`, `isbn`, `genero`, `descricao`, `data_de_cadastro`, `quantidade_disponivel`, `quantidade_reservada`, `url`) VALUES
(1, 'Livro 1', 123318, 'sdasda', 132132, 'sdasdaasd', '', '2017-05-05 00:00:00', 123311, 3, 'https://meusdemonioscantam.files.wordpress.com/2011/01/leitura-e-animac3a7c3a3o-cultural.jpg'),
(2, 'Livro 2', 321318, 'sdasda', 321321, 'sdasdasda', '', '2017-05-05 09:44:07', 0, 2, 'http://www.consoloecardinali.com.br/blog/img/lightbox/cc_edi_capa_como_se_faz_1301183768.jpg'),
(3, 'Livro 3', 1312223, 'Rubens', 1523, 'acao', 'Bacon ipsum dolor amet pork tenderloin burgdoggen brisket, turkey bresaola pork belly pork chop salami hamburger kevin. Sirloin bacon cupim, short loin turducken fatback ball tip pork swine capicola spare ribs alcatra. Bacon biltong pork belly ham hock jowl. Jowl chuck cupim ham hock corned beef, andouille', '2017-05-21 15:31:15', NULL, NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1_g_Mp531J1Bw6go_EXGgRkMrqjUBTAB-nyMg1F20jvtJnMvQQw'),
(4, 'asddas', 23, 'asddasdas', 123, 'asdads', 'asddas', '2017-05-21 15:36:23', 30, 7, 'https://meusdemonioscantam.files.wordpress.com/2011/01/leitura-e-animac3a7c3a3o-cultural.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `ra` varchar(20) NOT NULL,
  `telefone` int(11) NOT NULL,
  `tipo` varchar(80) NOT NULL DEFAULT 'Usuario normal',
  `senha` varchar(50) NOT NULL,
  `curso` varchar(80) NOT NULL,
  `foto` varchar(500) NOT NULL DEFAULT 'http://placehold.it/380x500',
  `data_de_cadastro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `ra`, `telefone`, `tipo`, `senha`, `curso`, `foto`, `data_de_cadastro`) VALUES
(1, 'sdasda', 'sdasda', 1231321, 'sdasad', 'sdasda', 'sdasda', 'http://placehold.it/380x500', '0000-00-00 00:00:00'),
(3, 'Rubens', '1231232', 123231231, 'admin', '321321', 'Analise e desenvolvimento de sistemas', 'https://scontent.fcgh10-1.fna.fbcdn.net/v/t1.0-9/13241104_1057075051026937_8474121456389715572_n.jpg?oh=1038d5aace982081eded7fe32af517fb&oe=59B69A24', '0000-00-00 00:00:00'),
(7, 'admin', 'admin', 12123, 'admin', 'abc001', 'ads', 'http://placehold.it/380x500', '0000-00-00 00:00:00'),
(10, 'Cleber', 'cleber', 1231321, 'admin', 'abc001', 'Analise e desenvolvimento de sistemas', 'https://scontent.fcgh10-1.fna.fbcdn.net/v/t1.0-9/13232913_10201614705684694_1097301393921498885_n.jpg?oh=7c093553fe4ceb69537fdd50073ff4a2&oe=5974AEF0', '2017-05-21 00:00:00'),
(11, 'Fabio', 'fabio', 1123132, 'admin', 'abc001', 'Analise e desenvolvimento de sistemas', 'http://i.imgur.com/71wr31h.png', '2017-05-21 00:00:00'),
(12, 'Alecrim', 'alecrim', 132132, 'admin', 'abc001', 'Analise e desenvolvimento de sistemas', 'https://scontent.fcgh10-1.fna.fbcdn.net/v/t1.0-9/18403118_1325531384199230_3888089990152423561_n.jpg?oh=edde743df80c97b2f39054d8a6677d5c&oe=59A402AA', '2017-05-21 00:00:00'),
(14, 'Amanda', 'amanda', 13213321, 'admin', 'abc001', 'Analise e desenvolvimento de sistemas', 'https://scontent.fcgh10-1.fna.fbcdn.net/v/t1.0-9/14233152_301156926916917_8670383483226103608_n.jpg?oh=e375a2537434723dc5cc5984472a35b2&oe=59BAA040', '2017-05-21 00:00:00'),
(20, 'Rubito', '160041156', 321312, '', '321312', '321321', 'http://placehold.it/380x500', '2017-05-28 17:05:30'),
(21, 'testandooo', '111', 1511, '', 'abc001', '1231', 'http://placehold.it/380x500', '2017-05-28 17:09:02'),
(22, 'asdasd', '111222', 111, 'Usuario normal', '111', '111', 'http://placehold.it/380x500', '2017-05-28 17:20:33'),
(23, 'asddas', '132132132', 312312312, '132312312', '312312312', '312123', 'http://placehold.it/380x500', '2017-05-28 17:23:52'),
(24, 'Rubens', '1600857', 1231321, 'Usuario normal', 'abc001', 'ads', 'http://placehold.it/380x500', '2017-05-28 20:36:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `item_pedido`
--
ALTER TABLE `item_pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `FK_usuario` (`id_usuario`),
  ADD KEY `FK_livro` (`id_livro`);

--
-- Indexes for table `item_retirado`
--
ALTER TABLE `item_retirado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ITEM_USUARIO` (`id_usuario`),
  ADD KEY `FK_ITEM_LIVRO` (`id_livro`);

--
-- Indexes for table `livros`
--
ALTER TABLE `livros`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ra` (`ra`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `item_pedido`
--
ALTER TABLE `item_pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `item_retirado`
--
ALTER TABLE `item_retirado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `livros`
--
ALTER TABLE `livros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `item_pedido`
--
ALTER TABLE `item_pedido`
  ADD CONSTRAINT `FK_livro` FOREIGN KEY (`id_livro`) REFERENCES `livros` (`id`),
  ADD CONSTRAINT `FK_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Constraints for table `item_retirado`
--
ALTER TABLE `item_retirado`
  ADD CONSTRAINT `FK_ITEM_LIVRO` FOREIGN KEY (`id_livro`) REFERENCES `livros` (`id`),
  ADD CONSTRAINT `FK_ITEM_USUARIO` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `DeletarItemPedido` ON SCHEDULE EVERY 1 MINUTE STARTS '2017-05-26 00:38:44' ON COMPLETION NOT PRESERVE ENABLE DO delete from item_pedido where DATE_ADD(data_reserva, INTERVAL 3 DAY) <= CURDATE() && data_retirada is null$$

CREATE DEFINER=`root`@`localhost` EVENT `CalcularMulta` ON SCHEDULE EVERY 1 SECOND STARTS '2017-05-26 15:06:19' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE item_retirado set multa =((DATEDIFF(item_retirado.data_retirada,CURDATE()) + 7) * 2) * -1 where (DATEDIFF(item_retirado.data_retirada,CURDATE()) + 7) <= -1$$

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
