-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 11-Maio-2017 às 03:03
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
(1, 1, '2017-05-10 00:00:00', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

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
  `data_de_cadastro` datetime NOT NULL,
  `quantidade_disponivel` int(11) NOT NULL,
  `quantidade_reservada` int(11) NOT NULL,
  `url` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `livros`
--

INSERT INTO `livros` (`id`, `nome`, `estoque`, `autor`, `isbn`, `genero`, `data_de_cadastro`, `quantidade_disponivel`, `quantidade_reservada`, `url`) VALUES
(1, 'Livro 1', 123321, 'sdasda', 132132, 'sdasdaasd', '2017-05-05 00:00:00', 123311, 0, 'https://meusdemonioscantam.files.wordpress.com/2011/01/leitura-e-animac3a7c3a3o-cultural.jpg'),
(2, 'Livro 2', 321320, 'sdasda', 321321, 'sdasdasda', '2017-05-05 09:44:07', 0, 0, 'http://www.consoloecardinali.com.br/blog/img/lightbox/cc_edi_capa_como_se_faz_1301183768.jpg');

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
  `data_de_cadastro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `ra`, `telefone`, `tipo`, `senha`, `curso`, `data_de_cadastro`) VALUES
(1, 'sdasda', 'sdasda', 1231321, 'sdasad', 'sdasda', 'sdasda', '0000-00-00 00:00:00'),
(2, 'sdasda', 'dsaads', 123, 'sdasda', 'sdasda', 'sdasda', '0000-00-00 00:00:00'),
(3, 'Rubens', '1231232', 123231231, 'usuario comum', '321321', 'ADS', '0000-00-00 00:00:00'),
(7, 'admin', 'admin', 12123, 'admin', 'abc001', 'ads', '0000-00-00 00:00:00');

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
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `livros`
--
ALTER TABLE `livros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
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
