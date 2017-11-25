-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 29-Out-2017 às 11:53
-- Versão do servidor: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `appmeucampus`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cardapio`
--

CREATE TABLE `cardapio` (
  `id` int(11) NOT NULL,
  `data` date NOT NULL,
  `tipo_refeicao` varchar(1) NOT NULL COMMENT '(A) Almoço / (J) Jantar',
  `descricao` varchar(250) NOT NULL,
  `data_inclusao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario_inclusao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `evento`
--

CREATE TABLE `evento` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(500) DEFAULT NULL,
  `data_hora_inicial` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_hora_final` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `local` varchar(100) DEFAULT NULL,
  `caminho_arquivo_anexo` varchar(150) DEFAULT NULL,
  `data_inclusao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario_inclusao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `noticia`
--

CREATE TABLE `noticia` (
  `id` int(11) NOT NULL,
  `titulo` varchar(250) NOT NULL,
  `texto` blob NOT NULL,
  `data_hora_publicacao` timestamp NULL DEFAULT NULL,
  `usuario_publicacao` int(11) DEFAULT NULL,
  `data_hora_atualizacao` timestamp NULL DEFAULT NULL,
  `usuario_atualizacao` int(11) DEFAULT NULL,
  `qtd_visualizacoes` int(11) DEFAULT '0',
  `status` varchar(1) NOT NULL DEFAULT 'A' COMMENT '(A) Ativa / (I) Inativa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `noticia`
--

INSERT INTO `noticia` (`id`, `titulo`, `texto`, `data_hora_publicacao`, `usuario_publicacao`, `data_hora_atualizacao`, `usuario_atualizacao`, `qtd_visualizacoes`, `status`) VALUES
(3, 'Primeiro teste de inclusão', 0x3c703e4573746520266561637574653b206f203c7370616e207374796c653d22746578742d6465636f726174696f6e3a20756e6465726c696e653b223e7072696d6569726f3c2f7370616e3e207465737465206465203c7374726f6e673e696e636c7573266174696c64653b6f3c2f7374726f6e673e206465203c656d3e6e6f74266961637574653b636961733c2f656d3e2e3c2f703e0d0a3c703e4c696e6b2070617261206e6f76617320696e666f726d612663636564696c3b266f74696c64653b65733a266e6273703b3c2f703e0d0a3c703e3c6120687265663d22687474703a2f2f62616d6275692e69666d672e6564752e62722f706f7274616c2f756c74696d61732d6e6f7469636961732f756c74696d61732d6e6f7469636961732f6e6f74696369612d7072696e636970616c2f636f6e637572736f2d706172612d6372696163616f2d646f2d6c6f676f7469706f2d64652d35302d616e6f732d646f2d63616d7075732d62616d62756922207461726765743d225f626c616e6b222072656c3d226e6f6f70656e6572223e436c69717565206171756920706172612061627269722061206e6f74266961637574653b6369612072656c6163696f6e6164613c2f613e3c2f703e, '2017-10-29 09:28:21', 1, '2017-10-29 10:27:16', 1, 0, 'A'),
(8, 'Segunda inclusão de notícias', 0x3c70207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c7374726f6e673e546573746520646520696e636c7573266174696c64653b6f206465206e6f74266961637574653b636961733c2f7374726f6e673e3c2f703e0d0a3c703e54657374616e646f2e2e2e3c2f703e0d0a3c703e5265616c697a616e646f207465737465732e3c2f703e0d0a3c6f6c3e0d0a3c6c693e416272697220612070266161637574653b67696e6120783b3c2f6c693e0d0a3c6c693e41636573736172206f20636f6d706f6e656e74653b3c2f6c693e0d0a3c6c693e436c69636172206e6f20626f74266174696c64653b6f202253616c766172223b3c2f6c693e0d0a3c6c693e456e63657272617220612061706c6963612663636564696c3b266174696c64653b6f2e3c2f6c693e0d0a3c2f6f6c3e0d0a3c703e546573746520646520696d6167656d3a3c2f703e0d0a3c703e3c696d67207372633d22687474703a2f2f62616d6275692e69666d672e6564752e62722f706f7274616c2f696d616765732f494d4147454d2f4d6f64656c6f5f335f2d5f436f6e637572736f5f3337322e706e6722202f3e3c2f703e, '2017-10-29 09:34:26', 1, '2017-10-29 10:28:37', 1, 0, 'A'),
(9, 'teste de status', 0x3c703e617361733c2f703e, '2017-10-29 10:32:25', 1, NULL, NULL, 0, 'A');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `login` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `senha` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `tipo` varchar(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '(A) Administrador/(R) Relações Institucionais / (C) Cardápio',
  `ultimo_login` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `login`, `senha`, `email`, `status`, `tipo`, `ultimo_login`) VALUES
(1, 'Administrador', 'adm', '$2y$10$RoXq.Dh71qYyVEgxH5ombOg4xGdjwU84Oo4I9fdV0u27r4rhX5cOa', 'eduardo.melo@ifmg.edu.br', 'A', 'A', '2017-10-29 10:52:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cardapio`
--
ALTER TABLE `cardapio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cardapio_usuario` (`usuario_inclusao`);

--
-- Indexes for table `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_evento_usuario` (`usuario_inclusao`);

--
-- Indexes for table `noticia`
--
ALTER TABLE `noticia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_noticia_usuario_1` (`usuario_publicacao`),
  ADD KEY `fk_noticia_usuario_2` (`usuario_atualizacao`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cardapio`
--
ALTER TABLE `cardapio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `evento`
--
ALTER TABLE `evento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `noticia`
--
ALTER TABLE `noticia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `cardapio`
--
ALTER TABLE `cardapio`
  ADD CONSTRAINT `fk_cardapio_usuario` FOREIGN KEY (`usuario_inclusao`) REFERENCES `usuario` (`id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `fk_evento_usuario` FOREIGN KEY (`usuario_inclusao`) REFERENCES `usuario` (`id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `noticia`
--
ALTER TABLE `noticia`
  ADD CONSTRAINT `fk_noticia_usuario_1` FOREIGN KEY (`usuario_publicacao`) REFERENCES `usuario` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_noticia_usuario_2` FOREIGN KEY (`usuario_atualizacao`) REFERENCES `usuario` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
