-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 22-Maio-2017 às 23:31
-- Versão do servidor: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_pedido`
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
-- Extraindo dados da tabela `item_pedido`
--

INSERT INTO `item_pedido` (`id_livro`, `id_usuario`, `data_reserva`, `id_pedido`, `data_retirada`, `data_devolucao`) VALUES
(1, 1, '2017-05-10 00:00:00', 1, '2017-05-22 17:16:54', '0000-00-00 00:00:00'),
(2, 7, '2017-05-21 14:27:22', 2, '2017-05-22 17:34:29', NULL),
(2, 7, '2017-05-21 14:34:57', 3, '2017-05-22 18:29:02', NULL),
(1, 7, '2017-05-21 14:35:16', 4, '2017-05-22 17:19:56', NULL),
(1, 7, '2017-05-21 14:35:49', 5, '2017-05-22 17:38:24', NULL),
(3, 7, '2017-05-21 15:31:55', 6, NULL, NULL),
(4, 7, '2017-05-21 16:42:33', 7, '2017-05-22 18:17:22', NULL),
(4, 7, '2017-05-21 16:44:46', 8, NULL, NULL),
(4, 7, '2017-05-21 16:44:48', 9, NULL, NULL),
(4, 7, '2017-05-21 16:44:50', 10, NULL, NULL),
(4, 7, '2017-05-21 16:44:51', 11, '2017-05-22 18:17:52', NULL),
(4, 7, '2017-05-21 16:44:58', 12, NULL, NULL),
(3, 7, '2017-05-21 16:46:40', 13, NULL, NULL),
(3, 7, '2017-05-21 16:46:41', 14, '2017-05-22 18:21:44', NULL),
(3, 7, '2017-05-21 16:47:08', 15, '2017-05-22 18:12:30', NULL),
(3, 7, '2017-05-21 16:47:13', 16, '2017-05-22 18:20:37', NULL),
(3, 7, '2017-05-22 18:28:26', 18, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_retirado`
--

CREATE TABLE `item_retirado` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_livro` int(11) NOT NULL,
  `data_retirada` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `item_retirado`
--

INSERT INTO `item_retirado` (`id`, `id_usuario`, `id_livro`, `data_retirada`) VALUES
(1, 7, 3, '2017-05-22 18:21:44'),
(2, 7, 2, '2017-05-22 18:29:02');

-- --------------------------------------------------------

--
-- Estrutura da tabela `livros`
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
-- Extraindo dados da tabela `livros`
--

INSERT INTO `livros` (`id`, `nome`, `estoque`, `autor`, `isbn`, `genero`, `descricao`, `data_de_cadastro`, `quantidade_disponivel`, `quantidade_reservada`, `url`) VALUES
(1, 'Livro 1', 123319, 'sdasda', 132132, 'sdasdaasd', '', '2017-05-05 00:00:00', 123311, 2, 'https://meusdemonioscantam.files.wordpress.com/2011/01/leitura-e-animac3a7c3a3o-cultural.jpg'),
(2, 'Livro 2', 321318, 'sdasda', 321321, 'sdasdasda', '', '2017-05-05 09:44:07', 0, 2, 'http://www.consoloecardinali.com.br/blog/img/lightbox/cc_edi_capa_como_se_faz_1301183768.jpg'),
(3, 'Livro 3', 1312224, 'Rubens', 1523, 'acao', 'Bacon ipsum dolor amet pork tenderloin burgdoggen brisket, turkey bresaola pork belly pork chop salami hamburger kevin. Sirloin bacon cupim, short loin turducken fatback ball tip pork swine capicola spare ribs alcatra. Bacon biltong pork belly ham hock jowl. Jowl chuck cupim ham hock corned beef, andouille', '2017-05-21 15:31:15', NULL, NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1_g_Mp531J1Bw6go_EXGgRkMrqjUBTAB-nyMg1F20jvtJnMvQQw'),
(4, 'asddas', 24, 'asddasdas', 123, 'asdads', 'asddas', '2017-05-21 15:36:23', 30, 6, 'https://meusdemonioscantam.files.wordpress.com/2011/01/leitura-e-animac3a7c3a3o-cultural.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `ra` varchar(20) NOT NULL,
  `telefone` int(11) NOT NULL,
  `tipo` varchar(80) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `curso` varchar(80) NOT NULL,
  `foto` varchar(500) NOT NULL,
  `data_de_cadastro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `ra`, `telefone`, `tipo`, `senha`, `curso`, `foto`, `data_de_cadastro`) VALUES
(1, 'sdasda', 'sdasda', 1231321, 'sdasad', 'sdasda', 'sdasda', 'http://placehold.it/380x500', '0000-00-00 00:00:00'),
(3, 'Rubens', '1231232', 123231231, 'admin', '321321', 'Analise e desenvolvimento de sistemas', 'https://scontent.fcgh10-1.fna.fbcdn.net/v/t1.0-9/13241104_1057075051026937_8474121456389715572_n.jpg?oh=1038d5aace982081eded7fe32af517fb&oe=59B69A24', '0000-00-00 00:00:00'),
(7, 'admin', 'admin', 12123, 'admin', 'abc001', 'ads', 'http://placehold.it/380x500', '0000-00-00 00:00:00'),
(10, 'Cleber', 'cleber', 1231321, 'admin', 'abc001', 'Analise e desenvolvimento de sistemas', 'https://scontent.fcgh10-1.fna.fbcdn.net/v/t1.0-9/13232913_10201614705684694_1097301393921498885_n.jpg?oh=7c093553fe4ceb69537fdd50073ff4a2&oe=5974AEF0', '2017-05-21 00:00:00'),
(11, 'Fabio', 'fabio', 1123132, 'admin', 'abc001', 'Analise e desenvolvimento de sistemas', 'http://i.imgur.com/71wr31h.png', '2017-05-21 00:00:00'),
(12, 'Alecrim', 'alecrim', 132132, 'admin', 'abc001', 'Analise e desenvolvimento de sistemas', 'https://scontent.fcgh10-1.fna.fbcdn.net/v/t1.0-9/18403118_1325531384199230_3888089990152423561_n.jpg?oh=edde743df80c97b2f39054d8a6677d5c&oe=59A402AA', '2017-05-21 00:00:00'),
(14, 'Amanda', 'amanda', 13213321, 'admin', 'abc001', 'Analise e desenvolvimento de sistemas', 'https://scontent.fcgh10-1.fna.fbcdn.net/v/t1.0-9/14233152_301156926916917_8670383483226103608_n.jpg?oh=e375a2537434723dc5cc5984472a35b2&oe=59BAA040', '2017-05-21 00:00:00');

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `livros`
--
ALTER TABLE `livros`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `item_pedido`
--
ALTER TABLE `item_pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `item_retirado`
--
ALTER TABLE `item_retirado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `livros`
--
ALTER TABLE `livros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `item_pedido`
--
ALTER TABLE `item_pedido`
  ADD CONSTRAINT `FK_livro` FOREIGN KEY (`id_livro`) REFERENCES `livros` (`id`),
  ADD CONSTRAINT `FK_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
