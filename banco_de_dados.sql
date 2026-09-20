-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17/11/2023 às 03:03
-- Versão do servidor: 10.4.27-MariaDB
-- Versão do PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `nxgestao`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `boletos`
--

CREATE TABLE `boletos` (
  `id_boleto` int(9) NOT NULL,
  `id` text NOT NULL,
  `code` int(11) NOT NULL,
  `reference` varchar(129) NOT NULL,
  `dueDate` date NOT NULL,
  `link` text NOT NULL,
  `checkoutUrl` text NOT NULL,
  `installmentLink` text NOT NULL,
  `payNumber` text NOT NULL,
  `amount` double NOT NULL,
  `status` varchar(129) NOT NULL,
  `json` text NOT NULL,
  `id_empresa` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `caixas`
--

CREATE TABLE `caixas` (
  `id_caixa` int(9) NOT NULL,
  `data_de_abertura` date NOT NULL,
  `data_de_fechamento` date NOT NULL,
  `hora_de_abertura` time NOT NULL,
  `hora_de_fechamento` time NOT NULL,
  `valor_inicial` double NOT NULL,
  `valor_total` double NOT NULL,
  `valor_de_fechamento` double NOT NULL,
  `observacoes` varchar(512) NOT NULL,
  `status` varchar(18) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias_dos_produtos`
--

CREATE TABLE `categorias_dos_produtos` (
  `id_categoria` int(9) NOT NULL,
  `nome` varchar(128) NOT NULL,
  `descricao` varchar(512) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(9) NOT NULL,
  `tipo` int(11) NOT NULL,
  `nome` varchar(128) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `razao_social` varchar(128) NOT NULL,
  `cnpj` varchar(14) NOT NULL,
  `isento` int(11) NOT NULL,
  `ie` varchar(32) NOT NULL,
  `cep` varchar(12) NOT NULL,
  `logradouro` varchar(128) NOT NULL,
  `numero` varchar(5) NOT NULL,
  `complemento` varchar(128) NOT NULL,
  `bairro` varchar(128) NOT NULL,
  `fixo` varchar(12) NOT NULL,
  `celular_1` varchar(12) NOT NULL,
  `celular_2` varchar(12) NOT NULL,
  `email` varchar(128) NOT NULL,
  `id_uf` int(11) NOT NULL,
  `id_municipio` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `compromissos`
--

CREATE TABLE `compromissos` (
  `id_compromisso` int(9) NOT NULL,
  `horario` varchar(5) NOT NULL,
  `data` date NOT NULL,
  `compromisso` varchar(512) NOT NULL,
  `status` varchar(128) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `configuracoes`
--

CREATE TABLE `configuracoes` (
  `id_config` int(9) NOT NULL,
  `nome_do_app` varchar(128) NOT NULL,
  `tema` int(11) NOT NULL,
  `xNome` varchar(128) NOT NULL,
  `xFant` varchar(128) NOT NULL,
  `CNPJ` varchar(14) NOT NULL,
  `telefone` varchar(11) NOT NULL,
  `endereco` varchar(256) NOT NULL,
  `arquivo-imagem-de-fundo-login` varchar(128) NOT NULL,
  `logomarca` varchar(128) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `configuracoes`
--

INSERT INTO `configuracoes` (`id_config`, `nome_do_app`, `tema`, `xNome`, `xFant`, `CNPJ`, `telefone`, `endereco`, `arquivo-imagem-de-fundo-login`, `logomarca`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Nome do App', 4, 'NxGestão Sistema de Gestão', 'NxGestão', '0000000000000', '69999342343', 'Rua das Dores, Quadra 09 Lote 23', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `configuracoes_api_boletos`
--

CREATE TABLE `configuracoes_api_boletos` (
  `id_config` int(9) NOT NULL,
  `clientId` varchar(129) NOT NULL,
  `clientSecret` varchar(129) NOT NULL,
  `token_privado` varchar(129) NOT NULL,
  `authorization_server` varchar(129) NOT NULL,
  `api_integration` varchar(129) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `configuracoes_api_boletos`
--

INSERT INTO `configuracoes_api_boletos` (`id_config`, `clientId`, `clientSecret`, `token_privado`, `authorization_server`, `api_integration`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'ksfk492wQzySNRQE', 'S(0lGMiu^D<rw<c|*=AhK)hXBJ6hHh,C', '79E027C7065F33EE91666B3AE8F6172E60D1A6DC3B5B79F7698D96E7446F8F75', 'https://sandbox.boletobancario.com/authorization-server/oauth/token', 'https://sandbox.boletobancario.com/api-integration/charges', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `configuracoes_do_painel`
--

CREATE TABLE `configuracoes_do_painel` (
  `id_configuracao` int(9) NOT NULL,
  `tamanho_da_senha` int(11) NOT NULL,
  `cor_da_senha` varchar(128) NOT NULL,
  `tamanho_ultimas_senhas` int(11) NOT NULL,
  `tamanho_letreiro` int(11) NOT NULL,
  `cor_do_letreiro` varchar(128) NOT NULL,
  `cor_do_fundo_painel` varchar(128) NOT NULL,
  `texto_do_letreiro` varchar(128) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `contas_a_pagar`
--

CREATE TABLE `contas_a_pagar` (
  `id_conta` int(9) NOT NULL,
  `status` varchar(32) NOT NULL,
  `nome` varchar(128) NOT NULL,
  `data_de_vencimento` date NOT NULL,
  `valor` double NOT NULL,
  `observacoes` varchar(512) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `contas_a_receber`
--

CREATE TABLE `contas_a_receber` (
  `id_conta` int(9) NOT NULL,
  `status` varchar(32) NOT NULL,
  `nome` varchar(128) NOT NULL,
  `data_de_vencimento` date NOT NULL,
  `valor` double NOT NULL,
  `observacoes` varchar(512) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `controle_de_acesso`
--

CREATE TABLE `controle_de_acesso` (
  `id_controle_de_acesso` int(9) NOT NULL,
  `venda_rapida` int(11) NOT NULL,
  `pdv` int(11) NOT NULL,
  `pesquisa_produto` int(11) NOT NULL,
  `historico_de_vendas` int(11) NOT NULL,
  `orcamentos` int(11) NOT NULL,
  `pedidos` int(11) NOT NULL,
  `ordem_de_servico` int(11) NOT NULL,
  `novo_pedido` int(11) NOT NULL,
  `mesas` int(11) NOT NULL,
  `entregas` int(11) NOT NULL,
  `abrir_painel` int(11) NOT NULL,
  `transmitir_no_painel` int(11) NOT NULL,
  `configs` int(11) NOT NULL,
  `clientes` int(11) NOT NULL,
  `fornecedores` int(11) NOT NULL,
  `funcionarios` int(11) NOT NULL,
  `vendedores` int(11) NOT NULL,
  `entregadores` int(11) NOT NULL,
  `tecnicos` int(11) NOT NULL,
  `servico_mao_de_obra` int(11) NOT NULL,
  `transportadoras` int(11) NOT NULL,
  `produtos` int(11) NOT NULL,
  `reposicoes` int(11) NOT NULL,
  `saida_de_mercadorias` int(11) NOT NULL,
  `inventario_do_estoque` int(11) NOT NULL,
  `categoria_dos_produtos` int(11) NOT NULL,
  `caixas` int(11) NOT NULL,
  `lancamentos` int(11) NOT NULL,
  `retiradas_do_caixa` int(11) NOT NULL,
  `despesas` int(11) NOT NULL,
  `contas_a_pagar` int(11) NOT NULL,
  `contas_a_receber` int(11) NOT NULL,
  `relatorio_dre` int(11) NOT NULL,
  `nfe` int(11) NOT NULL,
  `nfce` int(11) NOT NULL,
  `vendas_historico_completo` int(11) NOT NULL,
  `vendas_por_cliente` int(11) NOT NULL,
  `vendas_por_vendedor` int(11) NOT NULL,
  `estoque_produtos` int(11) NOT NULL,
  `estoque_minimo` int(11) NOT NULL,
  `estoque_inventario` int(11) NOT NULL,
  `estoque_validade_do_produto` int(11) NOT NULL,
  `financeiro_movimentacao_de_entradas_e_saidas` int(11) NOT NULL,
  `financeiro_faturamento_diario` int(11) NOT NULL,
  `financeiro_faturamento_detalhado` int(11) NOT NULL,
  `financeiro_lancamentos` int(11) NOT NULL,
  `financeiro_retiradas_do_caixa` int(11) NOT NULL,
  `financeiro_despesas` int(11) NOT NULL,
  `financeiro_contas_a_pagar` int(11) NOT NULL,
  `financeiro_contas_a_receber` int(11) NOT NULL,
  `financeiro_dre` int(11) NOT NULL,
  `geral_clientes` int(11) NOT NULL,
  `geral_fornecedores` int(11) NOT NULL,
  `geral_funcionarios` int(11) NOT NULL,
  `geral_vendedores` int(11) NOT NULL,
  `agenda` int(11) NOT NULL,
  `usuarios` int(11) NOT NULL,
  `config_da_conta` int(11) NOT NULL,
  `config_da_empresa` int(11) NOT NULL,
  `config_nfe_e_nfce` int(11) NOT NULL,
  `widget_clientes` int(11) NOT NULL,
  `widget_produtos` int(11) NOT NULL,
  `widget_vendas` int(11) NOT NULL,
  `widget_lancamentos` int(11) NOT NULL,
  `widget_faturamento` int(11) NOT NULL,
  `widget_os` int(11) NOT NULL,
  `grafico_faturamento_linha` int(11) NOT NULL,
  `grafico_faturamento_barras` int(11) NOT NULL,
  `tabela_contas_a_pagar` int(11) NOT NULL,
  `tabela_contas_a_receber` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `id_login` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `despesas`
--

CREATE TABLE `despesas` (
  `id_despesa` int(9) NOT NULL,
  `tipo` varchar(64) NOT NULL,
  `descricao` varchar(128) NOT NULL,
  `valor` double NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `observacoes` varchar(512) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `empresas`
--

CREATE TABLE `empresas` (
  `id_empresa` int(9) NOT NULL,
  `status` varchar(128) NOT NULL,
  `CNPJ` varchar(128) NOT NULL,
  `xNome` varchar(128) NOT NULL,
  `xFant` varchar(128) NOT NULL,
  `IE` varchar(128) NOT NULL,
  `dia_do_pagamento` int(11) NOT NULL,
  `logomarca` varchar(128) NOT NULL,
  `CEP` varchar(128) NOT NULL,
  `xLgr` varchar(128) NOT NULL,
  `nro` varchar(128) NOT NULL,
  `xCpl` varchar(128) NOT NULL,
  `xBairro` varchar(128) NOT NULL,
  `fone` varchar(128) NOT NULL,
  `natOp` varchar(128) NOT NULL,
  `serie` varchar(128) NOT NULL,
  `verProc` varchar(128) NOT NULL,
  `nNF_homologacao` varchar(128) NOT NULL,
  `nNF_producao` varchar(128) NOT NULL,
  `tpAmb_NFe` varchar(128) NOT NULL,
  `nNFC_homologacao` varchar(128) NOT NULL,
  `nNFC_producao` varchar(128) NOT NULL,
  `tpAmb_NFCe` varchar(128) NOT NULL,
  `CSC_Id` varchar(128) NOT NULL,
  `CSC` varchar(128) NOT NULL,
  `certificado` varchar(128) NOT NULL,
  `senha_do_certificado` varchar(128) NOT NULL,
  `id_uf` int(11) NOT NULL,
  `id_municipio` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `entregadores`
--

CREATE TABLE `entregadores` (
  `id_entregador` int(9) NOT NULL,
  `status` varchar(128) NOT NULL,
  `nome` varchar(512) NOT NULL,
  `data_inicio_das_atividades` date NOT NULL,
  `anotacoes` varchar(512) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `entregas`
--

CREATE TABLE `entregas` (
  `id_entrega` int(9) NOT NULL,
  `status` varchar(128) NOT NULL,
  `nome` varchar(128) NOT NULL,
  `endereco` varchar(512) NOT NULL,
  `troco_para` double NOT NULL,
  `forma_de_pagamento` varchar(128) NOT NULL,
  `servico` varchar(128) NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `fixo` varchar(15) NOT NULL,
  `celular_1` varchar(15) NOT NULL,
  `celular_2` varchar(15) NOT NULL,
  `data_inicio_das_atividades` date NOT NULL,
  `observacoes` varchar(512) NOT NULL,
  `id_entregador` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `equipamentos_os`
--

CREATE TABLE `equipamentos_os` (
  `id_equipamento` int(9) NOT NULL,
  `equipamento` varchar(128) NOT NULL,
  `marca` varchar(128) NOT NULL,
  `modelo` varchar(128) NOT NULL,
  `serie` varchar(128) NOT NULL,
  `condicoes` varchar(2048) NOT NULL,
  `defeitos` varchar(2048) NOT NULL,
  `acessorios` varchar(2048) NOT NULL,
  `solucao` varchar(2048) NOT NULL,
  `laudo_tecnico` varchar(2048) NOT NULL,
  `termos_de_garantia` varchar(2048) NOT NULL,
  `id_ordem` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `equipamentos_os_provisorio`
--

CREATE TABLE `equipamentos_os_provisorio` (
  `id_equipamento` int(9) NOT NULL,
  `equipamento` varchar(128) NOT NULL,
  `marca` varchar(128) NOT NULL,
  `modelo` varchar(128) NOT NULL,
  `serie` varchar(128) NOT NULL,
  `condicoes` varchar(2048) NOT NULL,
  `defeitos` varchar(2048) NOT NULL,
  `acessorios` varchar(2048) NOT NULL,
  `solucao` varchar(2048) NOT NULL,
  `laudo_tecnico` varchar(2048) NOT NULL,
  `termos_de_garantia` varchar(2048) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `formas_de_pagamento`
--

CREATE TABLE `formas_de_pagamento` (
  `id_forma` int(9) NOT NULL,
  `nome` varchar(128) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `formas_de_pagamento`
--

INSERT INTO `formas_de_pagamento` (`id_forma`, `nome`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Dinheiro', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Cheque', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Cartão de Crédito', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Cartão de Débito', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Crédito Loja', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'Vale Alimentação', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'Vale Refeição', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'Vale Presente', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'Vale Combustível', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'Programa de Fidelidade', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'Outros', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'Débito em Conta', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'Boleto Bancário', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'Transfência', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'Depósito em Conta', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'Nota Promissória', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'PIX', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedores`
--

CREATE TABLE `fornecedores` (
  `id_fornecedor` int(9) NOT NULL,
  `nome_do_representante` varchar(128) NOT NULL,
  `nome_da_empresa` varchar(128) NOT NULL,
  `cnpj` varchar(128) NOT NULL,
  `ie` varchar(128) NOT NULL,
  `cep` varchar(9) NOT NULL,
  `logradouro` varchar(128) NOT NULL,
  `numero` varchar(5) NOT NULL,
  `complemento` varchar(128) NOT NULL,
  `bairro` varchar(128) NOT NULL,
  `comercial` varchar(16) NOT NULL,
  `celular_1` varchar(16) NOT NULL,
  `celular_2` varchar(16) NOT NULL,
  `email` varchar(128) NOT NULL,
  `id_uf` int(11) NOT NULL,
  `id_municipio` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id_funcionario` int(9) NOT NULL,
  `status` varchar(32) NOT NULL,
  `nome` varchar(128) NOT NULL,
  `data_de_nascimento` date NOT NULL,
  `cpf` varchar(32) NOT NULL,
  `cep` varchar(9) NOT NULL,
  `logradouro` varchar(128) NOT NULL,
  `numero` varchar(5) NOT NULL,
  `complemento` varchar(128) NOT NULL,
  `bairro` varchar(128) NOT NULL,
  `municipio` varchar(128) NOT NULL,
  `fixo` varchar(16) NOT NULL,
  `celular_1` varchar(16) NOT NULL,
  `celular_2` varchar(16) NOT NULL,
  `email` varchar(128) NOT NULL,
  `cargo` varchar(128) NOT NULL,
  `data_de_contratacao` date NOT NULL,
  `data_inicio_das_atividades` date NOT NULL,
  `salario` double NOT NULL,
  `detalhes_da_atividade` varchar(521) NOT NULL,
  `id_uf` int(11) NOT NULL,
  `id_municipio` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `historico_de_senhas`
--

CREATE TABLE `historico_de_senhas` (
  `id_historico` int(9) NOT NULL,
  `senha` varchar(128) NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `inventarios_do_estoque`
--

CREATE TABLE `inventarios_do_estoque` (
  `id_inventario` int(9) NOT NULL,
  `descricao` varchar(62) NOT NULL,
  `data` date NOT NULL,
  `observacoes` varchar(128) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `lancamentos`
--

CREATE TABLE `lancamentos` (
  `id_lancamento` int(9) NOT NULL,
  `descricao` varchar(128) NOT NULL,
  `valor` double NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `observacoes` text NOT NULL,
  `id_caixa` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `login`
--

CREATE TABLE `login` (
  `id_login` int(9) NOT NULL,
  `usuario` varchar(128) NOT NULL,
  `senha` varchar(128) NOT NULL,
  `tipo` int(11) NOT NULL,
  `esse_usuario_e_admin` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `login`
--

INSERT INTO `login` (`id_login`, `usuario`, `senha`, `tipo`, `esse_usuario_e_admin`, `id_empresa`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', '123', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `mesas`
--

CREATE TABLE `mesas` (
  `id_mesa` int(9) NOT NULL,
  `status` varchar(128) NOT NULL,
  `qtd_de_pessoas` int(11) NOT NULL,
  `nome` varchar(128) NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` text NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2020-08-24-122243', 'App\\Database\\Migrations\\Unidades', 'default', 'App', 1624480563, 1),
(2, '2020-08-24-122244', 'App\\Database\\Migrations\\Ufs', 'default', 'App', 1624480564, 1),
(3, '2020-08-24-122245', 'App\\Database\\Migrations\\Municipios', 'default', 'App', 1624480564, 1),
(4, '2020-08-24-122411', 'App\\Database\\Migrations\\Empresas', 'default', 'App', 1624480565, 1),
(5, '2020-08-24-122412', 'App\\Database\\Migrations\\Login', 'default', 'App', 1624480565, 1),
(6, '2020-08-24-122413', 'App\\Database\\Migrations\\ControleDeAcesso', 'default', 'App', 1624480565, 1),
(7, '2020-08-24-123242', 'App\\Database\\Migrations\\Clientes', 'default', 'App', 1624480566, 1),
(8, '2020-08-24-123459', 'App\\Database\\Migrations\\CategoriasDosProdutos', 'default', 'App', 1624480566, 1),
(9, '2020-08-24-123537', 'App\\Database\\Migrations\\Fornecedores', 'default', 'App', 1624480566, 1),
(10, '2020-08-24-123616', 'App\\Database\\Migrations\\Produtos', 'default', 'App', 1624480566, 1),
(11, '2020-08-24-123652', 'App\\Database\\Migrations\\Caixas', 'default', 'App', 1624480566, 1),
(12, '2020-08-24-123726', 'App\\Database\\Migrations\\Lancamentos', 'default', 'App', 1624480567, 1),
(13, '2020-08-24-123802', 'App\\Database\\Migrations\\Retiradas', 'default', 'App', 1624480567, 1),
(14, '2020-08-24-123835', 'App\\Database\\Migrations\\Despesas', 'default', 'App', 1624480567, 1),
(15, '2020-08-24-123910', 'App\\Database\\Migrations\\Reposicoes', 'default', 'App', 1624480567, 1),
(16, '2020-08-24-123943', 'App\\Database\\Migrations\\SaidaDeMercadorias', 'default', 'App', 1624480568, 1),
(17, '2020-08-24-124020', 'App\\Database\\Migrations\\ContasAPagar', 'default', 'App', 1624480568, 1),
(18, '2020-08-24-124056', 'App\\Database\\Migrations\\ContasAReceber', 'default', 'App', 1624480568, 1),
(19, '2020-08-24-124139', 'App\\Database\\Migrations\\ProdutosDoPdv', 'default', 'App', 1624480568, 1),
(20, '2020-08-24-124347', 'App\\Database\\Migrations\\FormasDePagamento', 'default', 'App', 1624480568, 1),
(21, '2020-08-24-183651', 'App\\Database\\Migrations\\InventarioDoEstoque', 'default', 'App', 1624480569, 1),
(22, '2020-08-24-183734', 'App\\Database\\Migrations\\ProdutosDoInventarioDoEstoque', 'default', 'App', 1624480569, 1),
(23, '2020-08-24-183818', 'App\\Database\\Migrations\\Funcionarios', 'default', 'App', 1624480569, 1),
(24, '2020-08-24-183900', 'App\\Database\\Migrations\\PagamentosDoCliente', 'default', 'App', 1624480570, 1),
(25, '2020-08-24-184236', 'App\\Database\\Migrations\\Vendedores', 'default', 'App', 1624480570, 1),
(26, '2020-08-24-184318', 'App\\Database\\Migrations\\Vendas', 'default', 'App', 1624480570, 1),
(27, '2020-08-25-142411', 'App\\Database\\Migrations\\ProdutosDaVenda', 'default', 'App', 1624480570, 1),
(28, '2020-08-25-142505', 'App\\Database\\Migrations\\VendaRapida', 'default', 'App', 1624480571, 1),
(29, '2020-08-25-142550', 'App\\Database\\Migrations\\ProdutosDaVendaRapida', 'default', 'App', 1624480571, 1),
(30, '2020-08-25-142644', 'App\\Database\\Migrations\\Nfces', 'default', 'App', 1624480571, 1),
(31, '2020-08-25-142719', 'App\\Database\\Migrations\\Nfes', 'default', 'App', 1624480571, 1),
(32, '2020-08-25-142845', 'App\\Database\\Migrations\\Orcamentos', 'default', 'App', 1624480572, 1),
(33, '2020-08-25-142921', 'App\\Database\\Migrations\\ProdutosDoOrcamento', 'default', 'App', 1624480572, 1),
(34, '2020-08-25-142954', 'App\\Database\\Migrations\\Pedidos', 'default', 'App', 1624480572, 1),
(35, '2020-08-25-143037', 'App\\Database\\Migrations\\ProdutosDoPedido', 'default', 'App', 1624480572, 1),
(36, '2020-08-25-143223', 'App\\Database\\Migrations\\Tecnicos', 'default', 'App', 1624480573, 1),
(37, '2020-08-25-143257', 'App\\Database\\Migrations\\ServicosMaoDeObra', 'default', 'App', 1624480573, 1),
(38, '2020-08-25-143613', 'App\\Database\\Migrations\\ServicosMaoDeObraProvisorio', 'default', 'App', 1624480573, 1),
(39, '2020-08-25-143742', 'App\\Database\\Migrations\\EquipamentosOsProvisorio', 'default', 'App', 1624480574, 1),
(40, '2020-08-25-143816', 'App\\Database\\Migrations\\ProdutosPecasOsProvisorio', 'default', 'App', 1624480574, 1),
(41, '2020-08-25-143856', 'App\\Database\\Migrations\\OrdensDeServicos', 'default', 'App', 1624480574, 1),
(42, '2020-08-25-144108', 'App\\Database\\Migrations\\ServicosMaoDeObraDaOs', 'default', 'App', 1624480574, 1),
(43, '2020-08-25-144137', 'App\\Database\\Migrations\\EquipamentosOs', 'default', 'App', 1624480575, 1),
(44, '2020-08-25-144207', 'App\\Database\\Migrations\\ProdutosPecasOs', 'default', 'App', 1624480575, 1),
(45, '2020-08-25-144256', 'App\\Database\\Migrations\\ProvisorioAddProdutoPorXml', 'default', 'App', 1624480575, 1),
(46, '2020-08-25-144457', 'App\\Database\\Migrations\\ProvisorioReposicaoProdutosPorXml', 'default', 'App', 1624480576, 1),
(47, '2020-08-25-144631', 'App\\Database\\Migrations\\Mesas', 'default', 'App', 1624480576, 1),
(48, '2020-08-25-144709', 'App\\Database\\Migrations\\ProvisorioProdutosFood', 'default', 'App', 1624480576, 1),
(49, '2020-08-25-144755', 'App\\Database\\Migrations\\PagamentosFood', 'default', 'App', 1624480577, 1),
(50, '2020-08-25-144834', 'App\\Database\\Migrations\\ProvisorioProdutosDaMesaFood', 'default', 'App', 1624480577, 1),
(51, '2020-09-16-171431', 'App\\Database\\Migrations\\Entregadores', 'default', 'App', 1624480577, 1),
(52, '2020-09-16-181723', 'App\\Database\\Migrations\\Servicos', 'default', 'App', 1624480577, 1),
(53, '2020-09-16-181724', 'App\\Database\\Migrations\\Entregas', 'default', 'App', 1624480578, 1),
(54, '2020-11-06-200325', 'App\\Database\\Migrations\\ConfiguracoesDoPainel', 'default', 'App', 1624480578, 1),
(55, '2020-11-06-201004', 'App\\Database\\Migrations\\Painel', 'default', 'App', 1624480578, 1),
(56, '2020-11-06-201358', 'App\\Database\\Migrations\\HistoricoDeSenhas', 'default', 'App', 1624480578, 1),
(57, '2021-01-07-184556', 'App\\Database\\Migrations\\Configuracoes', 'default', 'App', 1624480579, 1),
(58, '2021-01-09-152937', 'App\\Database\\Migrations\\PagamentosDaEmpresa', 'default', 'App', 1624480579, 1),
(59, '2021-01-19-132755', 'App\\Database\\Migrations\\Compromissos', 'default', 'App', 1624480579, 1),
(60, '2021-01-25-162334', 'App\\Database\\Migrations\\Transportadoras', 'default', 'App', 1624480579, 1),
(61, '2021-01-27-165054', 'App\\Database\\Migrations\\NfeAvulsoProdutos', 'default', 'App', 1624480580, 1),
(62, '2021-01-30-001808', 'App\\Database\\Migrations\\NfesAvulsa', 'default', 'App', 1624480581, 1),
(63, '2021-02-01-212320', 'App\\Database\\Migrations\\Boletos', 'default', 'App', 1624480581, 1),
(64, '2021-02-02-121601', 'App\\Database\\Migrations\\ConfiguracoesApiBoletos', 'default', 'App', 1624480581, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `municipios`
--

CREATE TABLE `municipios` (
  `id_municipio` int(9) NOT NULL,
  `codigo` varchar(7) NOT NULL,
  `municipio` varchar(128) NOT NULL,
  `id_uf` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `municipios`
--

INSERT INTO `municipios` (`id_municipio`, `codigo`, `municipio`, `id_uf`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1100015', 'ALTA FLORESTA DOESTE', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, '1100379', 'ALTO ALEGRE DOS PARECIS', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, '1100403', 'ALTO PARAÍSO', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, '1100346', 'ALVORADA DOESTE', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, '1100023', 'ARIQUEMES', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, '1100452', 'BURITIS', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, '1100031', 'CABIXI', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, '1100601', 'CACAULÂNDIA', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, '1100049', 'CACOAL', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, '1100700', 'CAMPO NOVO DE RONDÔNIA', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, '1100809', 'CANDEIAS DO JAMARI', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, '1100908', 'CASTANHEIRAS', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, '1100056', 'CEREJEIRAS', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, '1100924', 'CHUPINGUAIA', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, '1100064', 'COLORADO DO OESTE', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, '1100072', 'CORUMBIARA', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, '1100080', 'COSTA MARQUES', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, '1100940', 'CUJUBIM', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, '1100098', 'ESPIGÃO DOESTE', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, '1101005', 'GOVERNADOR JORGE TEIXEIRA', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, '1100106', 'GUAJARÁ-MIRIM', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, '1101104', 'ITAPUÃ DO OESTE', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, '1100114', 'JARU', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, '1100122', 'JI-PARANÁ', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, '1100130', 'MACHADINHO DOESTE', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, '1101203', 'MINISTRO ANDREAZZA', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, '1101302', 'MIRANTE DA SERRA', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, '1101401', 'MONTE NEGRO', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, '1100148', 'NOVA BRASILÂNDIA DOESTE', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, '1100338', 'NOVA MAMORÉ', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, '1101435', 'NOVA UNIÃO', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, '1100502', 'NOVO HORIZONTE DO OESTE', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, '1100155', 'OURO PRETO DO OESTE', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, '1101450', 'PARECIS', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, '1100189', 'PIMENTA BUENO', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, '1101468', 'PIMENTEIRAS DO OESTE', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, '1100205', 'PORTO VELHO', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, '1100254', 'PRESIDENTE MÉDICI', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, '1101476', 'PRIMAVERA DE RONDÔNIA', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, '1100262', 'RIO CRESPO', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, '1100288', 'ROLIM DE MOURA', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, '1100296', 'SANTA LUZIA DOESTE', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, '1101484', 'SÃO FELIPE DOESTE', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, '1101492', 'SÃO FRANCISCO DO GUAPORÉ', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, '1100320', 'SÃO MIGUEL DO GUAPORÉ', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, '1101500', 'SERINGUEIRAS', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, '1101559', 'TEIXEIRÓPOLIS', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, '1101609', 'THEOBROMA', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, '1101708', 'URUPÁ', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, '1101757', 'VALE DO ANARI', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, '1101807', 'VALE DO PARAÍSO', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, '1100304', 'VILHENA', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, '1200013', 'ACRELÂNDIA', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, '1200054', 'ASSIS BRASIL', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, '1200104', 'BRASILÉIA', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, '1200138', 'BUJARI', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, '1200179', 'CAPIXABA', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, '1200203', 'CRUZEIRO DO SUL', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, '1200252', 'EPITACIOLÂNDIA', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, '1200302', 'FEIJÓ', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, '1200328', 'JORDÃO', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, '1200336', 'MÂNCIO LIMA', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, '1200344', 'MANOEL URBANO', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, '1200351', 'MARECHAL THAUMATURGO', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, '1200385', 'PLÁCIDO DE CASTRO', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, '1200807', 'PORTO ACRE', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, '1200393', 'PORTO WALTER', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, '1200401', 'RIO BRANCO', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, '1200427', 'RODRIGUES ALVES', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, '1200435', 'SANTA ROSA DO PURUS', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, '1200500', 'SENA MADUREIRA', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, '1200450', 'SENADOR GUIOMARD', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, '1200609', 'TARAUACÁ', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, '1200708', 'XAPURI', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, '1300029', 'ALVARÃES', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, '1300060', 'AMATURÁ', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, '1300086', 'ANAMÃ', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, '1300102', 'ANORI', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, '1300144', 'APUÍ', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, '1300201', 'ATALAIA DO NORTE', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, '1300300', 'AUTAZES', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, '1300409', 'BARCELOS', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, '1300508', 'BARREIRINHA', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, '1300607', 'BENJAMIN CONSTANT', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, '1300631', 'BERURI', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, '1300680', 'BOA VISTA DO RAMOS', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, '1300706', 'BOCA DO ACRE', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, '1300805', 'BORBA', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, '1300839', 'CAAPIRANGA', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, '1300904', 'CANUTAMA', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, '1301001', 'CARAUARI', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, '1301100', 'CAREIRO', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, '1301159', 'CAREIRO DA VÁRZEA', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, '1301209', 'COARI', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, '1301308', 'CODAJÁS', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, '1301407', 'EIRUNEPÉ', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, '1301506', 'ENVIRA', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, '1301605', 'FONTE BOA', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, '1301654', 'GUAJARÁ', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, '1301704', 'HUMAITÁ', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, '1301803', 'IPIXUNA', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, '1301852', 'IRANDUBA', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, '1301902', 'ITACOATIARA', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, '1301951', 'ITAMARATI', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, '1302009', 'ITAPIRANGA', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, '1302108', 'JAPURÁ', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, '1302207', 'JURUÁ', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, '1302306', 'JUTAÍ', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, '1302405', 'LÁBREA', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, '1302504', 'MANACAPURU', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, '1302553', 'MANAQUIRI', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, '1302603', 'MANAUS', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, '1302702', 'MANICORÉ', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, '1302801', 'MARAÃ', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, '1302900', 'MAUÉS', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, '1303007', 'NHAMUNDÁ', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, '1303106', 'NOVA OLINDA DO NORTE', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, '1303205', 'NOVO AIRÃO', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, '1303304', 'NOVO ARIPUANÃ', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, '1303403', 'PARINTINS', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, '1303502', 'PAUINI', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, '1303536', 'PRESIDENTE FIGUEIREDO', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, '1303569', 'RIO PRETO DA EVA', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, '1303601', 'SANTA ISABEL DO RIO NEGRO', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, '1303700', 'SANTO ANTÔNIO DO IÇÁ', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, '1303809', 'SÃO GABRIEL DA CACHOEIRA', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, '1303908', 'SÃO PAULO DE OLIVENÇA', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, '1303957', 'SÃO SEBASTIÃO DO UATUMÃ', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, '1304005', 'SILVES', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, '1304062', 'TABATINGA', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, '1304104', 'TAPAUÁ', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, '1304203', 'TEFÉ', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, '1304237', 'TONANTINS', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, '1304260', 'UARINI', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, '1304302', 'URUCARÁ', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, '1304401', 'URUCURITUBA', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, '1400050', 'ALTO ALEGRE', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, '1400027', 'AMAJARI', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, '1400100', 'BOA VISTA', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, '1400159', 'BONFIM', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, '1400175', 'CANTÁ', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, '1400209', 'CARACARAÍ', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, '1400233', 'CAROEBE', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, '1400282', 'IRACEMA', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, '1400308', 'MUCAJAÍ', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, '1400407', 'NORMANDIA', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, '1400456', 'PACARAIMA', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, '1400472', 'RORAINÓPOLIS', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, '1400506', 'SÃO JOÃO DA BALIZA', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, '1400605', 'SÃO LUIZ', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, '1400704', 'UIRAMUTÃ', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, '1500107', 'ABAETETUBA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, '1500131', 'ABEL FIGUEIREDO', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, '1500206', 'ACARÁ', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, '1500305', 'AFUÁ', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, '1500347', 'ÁGUA AZUL DO NORTE', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, '1500404', 'ALENQUER', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, '1500503', 'ALMEIRIM', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, '1500602', 'ALTAMIRA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, '1500701', 'ANAJÁS', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(161, '1500800', 'ANANINDEUA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(162, '1500859', 'ANAPU', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, '1500909', 'AUGUSTO CORRÊA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, '1500958', 'AURORA DO PARÁ', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, '1501006', 'AVEIRO', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, '1501105', 'BAGRE', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(167, '1501204', 'BAIÃO', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, '1501253', 'BANNACH', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, '1501303', 'BARCARENA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, '1501402', 'BELÉM', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(171, '1501451', 'BELTERRA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(172, '1501501', 'BENEVIDES', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, '1501576', 'BOM JESUS DO TOCANTINS', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, '1501600', 'BONITO', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, '1501709', 'BRAGANÇA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, '1501725', 'BRASIL NOVO', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, '1501758', 'BREJO GRANDE DO ARAGUAIA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(178, '1501782', 'BREU BRANCO', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, '1501808', 'BREVES', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, '1501907', 'BUJARU', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(181, '1502004', 'CACHOEIRA DO ARARI', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(182, '1501956', 'CACHOEIRA DO PIRIÁ', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(183, '1502103', 'CAMETÁ', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(184, '1502152', 'CANAÃ DOS CARAJÁS', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, '1502202', 'CAPANEMA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, '1502301', 'CAPITÃO POÇO', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(187, '1502400', 'CASTANHAL', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, '1502509', 'CHAVES', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(189, '1502608', 'COLARES', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(190, '1502707', 'CONCEIÇÃO DO ARAGUAIA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(191, '1502756', 'CONCÓRDIA DO PARÁ', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(192, '1502764', 'CUMARU DO NORTE', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, '1502772', 'CURIONÓPOLIS', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, '1502806', 'CURRALINHO', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(195, '1502855', 'CURUÁ', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196, '1502905', 'CURUÇÁ', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197, '1502939', 'DOM ELISEU', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, '1502954', 'ELDORADO DO CARAJÁS', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, '1503002', 'FARO', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(200, '1503044', 'FLORESTA DO ARAGUAIA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(201, '1503077', 'GARRAFÃO DO NORTE', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(202, '1503093', 'GOIANÉSIA DO PARÁ', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(203, '1503101', 'GURUPÁ', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(204, '1503200', 'IGARAPÉ-AÇU', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(205, '1503309', 'IGARAPÉ-MIRI', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(206, '1503408', 'INHANGAPI', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(207, '1503457', 'IPIXUNA DO PARÁ', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(208, '1503507', 'IRITUIA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(209, '1503606', 'ITAITUBA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(210, '1503705', 'ITUPIRANGA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(211, '1503754', 'JACAREACANGA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(212, '1503804', 'JACUNDÁ', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(213, '1503903', 'JURUTI', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(214, '1504000', 'LIMOEIRO DO AJURU', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(215, '1504059', 'MÃE DO RIO', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(216, '1504109', 'MAGALHÃES BARATA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(217, '1504208', 'MARABÁ', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(218, '1504307', 'MARACANÃ', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(219, '1504406', 'MARAPANIM', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(220, '1504422', 'MARITUBA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(221, '1504455', 'MEDICILÂNDIA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(222, '1504505', 'MELGAÇO', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(223, '1504604', 'MOCAJUBA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(224, '1504703', 'MOJU', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(225, '1504752', 'MOJUÍ DOS CAMPOS', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(226, '1504802', 'MONTE ALEGRE', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(227, '1504901', 'MUANÁ', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(228, '1504950', 'NOVA ESPERANÇA DO PIRIÁ', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(229, '1504976', 'NOVA IPIXUNA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(230, '1505007', 'NOVA TIMBOTEUA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(231, '1505031', 'NOVO PROGRESSO', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(232, '1505064', 'NOVO REPARTIMENTO', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(233, '1505106', 'ÓBIDOS', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(234, '1505205', 'OEIRAS DO PARÁ', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(235, '1505304', 'ORIXIMINÁ', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(236, '1505403', 'OURÉM', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(237, '1505437', 'OURILÂNDIA DO NORTE', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(238, '1505486', 'PACAJÁ', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(239, '1505494', 'PALESTINA DO PARÁ', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(240, '1505502', 'PARAGOMINAS', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(241, '1505536', 'PARAUAPEBAS', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(242, '1505551', 'PAU DARCO', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(243, '1505601', 'PEIXE-BOI', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(244, '1505635', 'PIÇARRA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(245, '1505650', 'PLACAS', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(246, '1505700', 'PONTA DE PEDRAS', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(247, '1505809', 'PORTEL', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(248, '1505908', 'PORTO DE MOZ', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(249, '1506005', 'PRAINHA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(250, '1506104', 'PRIMAVERA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(251, '1506112', 'QUATIPURU', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(252, '1506138', 'REDENÇÃO', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(253, '1506161', 'RIO MARIA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(254, '1506187', 'RONDON DO PARÁ', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(255, '1506195', 'RURÓPOLIS', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(256, '1506203', 'SALINÓPOLIS', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(257, '1506302', 'SALVATERRA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(258, '1506351', 'SANTA BÁRBARA DO PARÁ', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(259, '1506401', 'SANTA CRUZ DO ARARI', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(260, '1506500', 'SANTA IZABEL DO PARÁ', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(261, '1506559', 'SANTA LUZIA DO PARÁ', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(262, '1506583', 'SANTA MARIA DAS BARREIRAS', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(263, '1506609', 'SANTA MARIA DO PARÁ', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(264, '1506708', 'SANTANA DO ARAGUAIA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(265, '1506807', 'SANTARÉM', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(266, '1506906', 'SANTARÉM NOVO', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(267, '1507003', 'SANTO ANTÔNIO DO TAUÁ', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(268, '1507102', 'SÃO CAETANO DE ODIVELAS', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(269, '1507151', 'SÃO DOMINGOS DO ARAGUAIA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(270, '1507201', 'SÃO DOMINGOS DO CAPIM', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(271, '1507300', 'SÃO FÉLIX DO XINGU', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(272, '1507409', 'SÃO FRANCISCO DO PARÁ', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(273, '1507458', 'SÃO GERALDO DO ARAGUAIA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(274, '1507466', 'SÃO JOÃO DA PONTA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(275, '1507474', 'SÃO JOÃO DE PIRABAS', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(276, '1507508', 'SÃO JOÃO DO ARAGUAIA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(277, '1507607', 'SÃO MIGUEL DO GUAMÁ', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(278, '1507706', 'SÃO SEBASTIÃO DA BOA VISTA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(279, '1507755', 'SAPUCAIA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(280, '1507805', 'SENADOR JOSÉ PORFÍRIO', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(281, '1507904', 'SOURE', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(282, '1507953', 'TAILÂNDIA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(283, '1507961', 'TERRA ALTA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(284, '1507979', 'TERRA SANTA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(285, '1508001', 'TOMÉ-AÇU', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(286, '1508035', 'TRACUATEUA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(287, '1508050', 'TRAIRÃO', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(288, '1508084', 'TUCUMÃ', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(289, '1508100', 'TUCURUÍ', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(290, '1508126', 'ULIANÓPOLIS', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(291, '1508159', 'URUARÁ', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(292, '1508209', 'VIGIA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(293, '1508308', 'VISEU', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(294, '1508357', 'VITÓRIA DO XINGU', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(295, '1508407', 'XINGUARA', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(296, '1600105', 'AMAPÁ', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(297, '1600204', 'CALÇOENE', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(298, '1600212', 'CUTIAS', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(299, '1600238', 'FERREIRA GOMES', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(300, '1600253', 'ITAUBAL', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(301, '1600279', 'LARANJAL DO JARI', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(302, '1600303', 'MACAPÁ', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(303, '1600402', 'MAZAGÃO', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(304, '1600501', 'OIAPOQUE', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(305, '1600154', 'PEDRA BRANCA DO AMAPARI', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(306, '1600535', 'PORTO GRANDE', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(307, '1600550', 'PRACUÚBA', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(308, '1600600', 'SANTANA', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(309, '1600055', 'SERRA DO NAVIO', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(310, '1600709', 'TARTARUGALZINHO', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(311, '1600808', 'VITÓRIA DO JARI', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(312, '1700251', 'ABREULÂNDIA', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(313, '1700301', 'AGUIARNÓPOLIS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(314, '1700350', 'ALIANÇA DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(315, '1700400', 'ALMAS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(316, '1700707', 'ALVORADA', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(317, '1701002', 'ANANÁS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(318, '1701051', 'ANGICO', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(319, '1701101', 'APARECIDA DO RIO NEGRO', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(320, '1701309', 'ARAGOMINAS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(321, '1701903', 'ARAGUACEMA', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(322, '1702000', 'ARAGUAÇU', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(323, '1702109', 'ARAGUAÍNA', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(324, '1702158', 'ARAGUANÃ', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(325, '1702208', 'ARAGUATINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(326, '1702307', 'ARAPOEMA', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(327, '1702406', 'ARRAIAS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(328, '1702554', 'AUGUSTINÓPOLIS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(329, '1702703', 'AURORA DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(330, '1702901', 'AXIXÁ DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(331, '1703008', 'BABAÇULÂNDIA', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(332, '1703057', 'BANDEIRANTES DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(333, '1703073', 'BARRA DO OURO', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(334, '1703107', 'BARROLÂNDIA', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(335, '1703206', 'BERNARDO SAYÃO', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(336, '1703305', 'BOM JESUS DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(337, '1703602', 'BRASILÂNDIA DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(338, '1703701', 'BREJINHO DE NAZARÉ', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(339, '1703800', 'BURITI DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(340, '1703826', 'CACHOEIRINHA', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(341, '1703842', 'CAMPOS LINDOS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(342, '1703867', 'CARIRI DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(343, '1703883', 'CARMOLÂNDIA', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(344, '1703891', 'CARRASCO BONITO', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(345, '1703909', 'CASEARA', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(346, '1704105', 'CENTENÁRIO', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(347, '1705102', 'CHAPADA DA NATIVIDADE', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(348, '1704600', 'CHAPADA DE AREIA', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(349, '1705508', 'COLINAS DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(350, '1716703', 'COLMÉIA', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(351, '1705557', 'COMBINADO', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(352, '1705607', 'CONCEIÇÃO DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(353, '1706001', 'COUTO MAGALHÃES', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(354, '1706100', 'CRISTALÂNDIA', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(355, '1706258', 'CRIXÁS DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(356, '1706506', 'DARCINÓPOLIS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(357, '1707009', 'DIANÓPOLIS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(358, '1707108', 'DIVINÓPOLIS DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(359, '1707207', 'DOIS IRMÃOS DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(360, '1707306', 'DUERÉ', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(361, '1707405', 'ESPERANTINA', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(362, '1707553', 'FÁTIMA', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(363, '1707652', 'FIGUEIRÓPOLIS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(364, '1707702', 'FILADÉLFIA', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(365, '1708205', 'FORMOSO DO ARAGUAIA', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(366, '1708304', 'GOIANORTE', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(367, '1709005', 'GOIATINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(368, '1709302', 'GUARAÍ', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(369, '1709500', 'GURUPI', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(370, '1709807', 'IPUEIRAS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(371, '1710508', 'ITACAJÁ', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(372, '1710706', 'ITAGUATINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(373, '1710904', 'ITAPIRATINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(374, '1711100', 'ITAPORÃ DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(375, '1711506', 'JAÚ DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(376, '1711803', 'JUARINA', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(377, '1711902', 'LAGOA DA CONFUSÃO', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(378, '1711951', 'LAGOA DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(379, '1712009', 'LAJEADO', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(380, '1712157', 'LAVANDEIRA', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(381, '1712405', 'LIZARDA', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(382, '1712454', 'LUZINÓPOLIS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(383, '1712504', 'MARIANÓPOLIS DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(384, '1712702', 'MATEIROS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(385, '1712801', 'MAURILÂNDIA DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(386, '1713205', 'MIRACEMA DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(387, '1713304', 'MIRANORTE', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(388, '1713601', 'MONTE DO CARMO', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(389, '1713700', 'MONTE SANTO DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(390, '1713957', 'MURICILÂNDIA', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(391, '1714203', 'NATIVIDADE', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(392, '1714302', 'NAZARÉ', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(393, '1714880', 'NOVA OLINDA', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(394, '1715002', 'NOVA ROSALÂNDIA', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(395, '1715101', 'NOVO ACORDO', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(396, '1715150', 'NOVO ALEGRE', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(397, '1715259', 'NOVO JARDIM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(398, '1715507', 'OLIVEIRA DE FÁTIMA', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(399, '1721000', 'PALMAS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(400, '1715705', 'PALMEIRANTE', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(401, '1713809', 'PALMEIRAS DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(402, '1715754', 'PALMEIRÓPOLIS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(403, '1716109', 'PARAÍSO DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(404, '1716208', 'PARANÃ', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(405, '1716307', 'PAU DARCO', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(406, '1716505', 'PEDRO AFONSO', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(407, '1716604', 'PEIXE', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(408, '1716653', 'PEQUIZEIRO', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(409, '1717008', 'PINDORAMA DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(410, '1717206', 'PIRAQUÊ', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(411, '1717503', 'PIUM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(412, '1717800', 'PONTE ALTA DO BOM JESUS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(413, '1717909', 'PONTE ALTA DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(414, '1718006', 'PORTO ALEGRE DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(415, '1718204', 'PORTO NACIONAL', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(416, '1718303', 'PRAIA NORTE', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(417, '1718402', 'PRESIDENTE KENNEDY', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(418, '1718451', 'PUGMIL', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(419, '1718501', 'RECURSOLÂNDIA', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(420, '1718550', 'RIACHINHO', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(421, '1718659', 'RIO DA CONCEIÇÃO', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(422, '1718709', 'RIO DOS BOIS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(423, '1718758', 'RIO SONO', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(424, '1718808', 'SAMPAIO', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(425, '1718840', 'SANDOLÂNDIA', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(426, '1718865', 'SANTA FÉ DO ARAGUAIA', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(427, '1718881', 'SANTA MARIA DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(428, '1718899', 'SANTA RITA DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(429, '1718907', 'SANTA ROSA DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(430, '1719004', 'SANTA TEREZA DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(431, '1720002', 'SANTA TEREZINHA DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(432, '1720101', 'SÃO BENTO DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(433, '1720150', 'SÃO FÉLIX DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(434, '1720200', 'SÃO MIGUEL DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(435, '1720259', 'SÃO SALVADOR DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(436, '1720309', 'SÃO SEBASTIÃO DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(437, '1720499', 'SÃO VALÉRIO', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(438, '1720655', 'SILVANÓPOLIS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(439, '1720804', 'SÍTIO NOVO DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(440, '1720853', 'SUCUPIRA', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(441, '1708254', 'TABOCÃO', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(442, '1720903', 'TAGUATINGA', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(443, '1720937', 'TAIPAS DO TOCANTINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(444, '1720978', 'TALISMÃ', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(445, '1721109', 'TOCANTÍNIA', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(446, '1721208', 'TOCANTINÓPOLIS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(447, '1721257', 'TUPIRAMA', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(448, '1721307', 'TUPIRATINS', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(449, '1722081', 'WANDERLÂNDIA', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(450, '1722107', 'XAMBIOÁ', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(451, '2100055', 'AÇAILÂNDIA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(452, '2100105', 'AFONSO CUNHA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(453, '2100154', 'ÁGUA DOCE DO MARANHÃO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(454, '2100204', 'ALCÂNTARA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(455, '2100303', 'ALDEIAS ALTAS', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(456, '2100402', 'ALTAMIRA DO MARANHÃO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(457, '2100436', 'ALTO ALEGRE DO MARANHÃO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(458, '2100477', 'ALTO ALEGRE DO PINDARÉ', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(459, '2100501', 'ALTO PARNAÍBA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(460, '2100550', 'AMAPÁ DO MARANHÃO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(461, '2100600', 'AMARANTE DO MARANHÃO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(462, '2100709', 'ANAJATUBA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(463, '2100808', 'ANAPURUS', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(464, '2100832', 'APICUM-AÇU', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(465, '2100873', 'ARAGUANÃ', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(466, '2100907', 'ARAIOSES', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(467, '2100956', 'ARAME', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(468, '2101004', 'ARARI', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(469, '2101103', 'AXIXÁ', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(470, '2101202', 'BACABAL', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(471, '2101251', 'BACABEIRA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(472, '2101301', 'BACURI', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(473, '2101350', 'BACURITUBA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(474, '2101400', 'BALSAS', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(475, '2101509', 'BARÃO DE GRAJAÚ', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `municipios` (`id_municipio`, `codigo`, `municipio`, `id_uf`, `created_at`, `updated_at`, `deleted_at`) VALUES
(476, '2101608', 'BARRA DO CORDA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(477, '2101707', 'BARREIRINHAS', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(478, '2101772', 'BELA VISTA DO MARANHÃO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(479, '2101731', 'BELÁGUA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(480, '2101806', 'BENEDITO LEITE', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(481, '2101905', 'BEQUIMÃO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(482, '2101939', 'BERNARDO DO MEARIM', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(483, '2101970', 'BOA VISTA DO GURUPI', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(484, '2102002', 'BOM JARDIM', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(485, '2102036', 'BOM JESUS DAS SELVAS', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(486, '2102077', 'BOM LUGAR', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(487, '2102101', 'BREJO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(488, '2102150', 'BREJO DE AREIA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(489, '2102200', 'BURITI', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(490, '2102309', 'BURITI BRAVO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(491, '2102325', 'BURITICUPU', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(492, '2102358', 'BURITIRANA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(493, '2102374', 'CACHOEIRA GRANDE', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(494, '2102408', 'CAJAPIÓ', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(495, '2102507', 'CAJARI', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(496, '2102556', 'CAMPESTRE DO MARANHÃO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(497, '2102606', 'CÂNDIDO MENDES', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(498, '2102705', 'CANTANHEDE', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(499, '2102754', 'CAPINZAL DO NORTE', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(500, '2102804', 'CAROLINA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(501, '2102903', 'CARUTAPERA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(502, '2103000', 'CAXIAS', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(503, '2103109', 'CEDRAL', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(504, '2103125', 'CENTRAL DO MARANHÃO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(505, '2103158', 'CENTRO DO GUILHERME', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(506, '2103174', 'CENTRO NOVO DO MARANHÃO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(507, '2103208', 'CHAPADINHA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(508, '2103257', 'CIDELÂNDIA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(509, '2103307', 'CODÓ', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(510, '2103406', 'COELHO NETO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(511, '2103505', 'COLINAS', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(512, '2103554', 'CONCEIÇÃO DO LAGO-AÇU', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(513, '2103604', 'COROATÁ', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(514, '2103703', 'CURURUPU', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(515, '2103752', 'DAVINÓPOLIS', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(516, '2103802', 'DOM PEDRO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(517, '2103901', 'DUQUE BACELAR', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(518, '2104008', 'ESPERANTINÓPOLIS', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(519, '2104057', 'ESTREITO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(520, '2104073', 'FEIRA NOVA DO MARANHÃO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(521, '2104081', 'FERNANDO FALCÃO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(522, '2104099', 'FORMOSA DA SERRA NEGRA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(523, '2104107', 'FORTALEZA DOS NOGUEIRAS', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(524, '2104206', 'FORTUNA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(525, '2104305', 'GODOFREDO VIANA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(526, '2104404', 'GONÇALVES DIAS', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(527, '2104503', 'GOVERNADOR ARCHER', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(528, '2104552', 'GOVERNADOR EDISON LOBÃO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(529, '2104602', 'GOVERNADOR EUGÊNIO BARROS', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(530, '2104628', 'GOVERNADOR LUIZ ROCHA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(531, '2104651', 'GOVERNADOR NEWTON BELLO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(532, '2104677', 'GOVERNADOR NUNES FREIRE', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(533, '2104701', 'GRAÇA ARANHA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(534, '2104800', 'GRAJAÚ', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(535, '2104909', 'GUIMARÃES', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(536, '2105005', 'HUMBERTO DE CAMPOS', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(537, '2105104', 'ICATU', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(538, '2105153', 'IGARAPÉ DO MEIO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(539, '2105203', 'IGARAPÉ GRANDE', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(540, '2105302', 'IMPERATRIZ', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(541, '2105351', 'ITAIPAVA DO GRAJAÚ', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(542, '2105401', 'ITAPECURU MIRIM', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(543, '2105427', 'ITINGA DO MARANHÃO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(544, '2105450', 'JATOBÁ', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(545, '2105476', 'JENIPAPO DOS VIEIRAS', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(546, '2105500', 'JOÃO LISBOA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(547, '2105609', 'JOSELÂNDIA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(548, '2105658', 'JUNCO DO MARANHÃO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(549, '2105708', 'LAGO DA PEDRA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(550, '2105807', 'LAGO DO JUNCO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(551, '2105948', 'LAGO DOS RODRIGUES', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(552, '2105906', 'LAGO VERDE', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(553, '2105922', 'LAGOA DO MATO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(554, '2105963', 'LAGOA GRANDE DO MARANHÃO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(555, '2105989', 'LAJEADO NOVO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(556, '2106003', 'LIMA CAMPOS', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(557, '2106102', 'LORETO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(558, '2106201', 'LUÍS DOMINGUES', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(559, '2106300', 'MAGALHÃES DE ALMEIDA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(560, '2106326', 'MARACAÇUMÉ', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(561, '2106359', 'MARAJÁ DO SENA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(562, '2106375', 'MARANHÃOZINHO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(563, '2106409', 'MATA ROMA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(564, '2106508', 'MATINHA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(565, '2106607', 'MATÕES', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(566, '2106631', 'MATÕES DO NORTE', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(567, '2106672', 'MILAGRES DO MARANHÃO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(568, '2106706', 'MIRADOR', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(569, '2106755', 'MIRANDA DO NORTE', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(570, '2106805', 'MIRINZAL', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(571, '2106904', 'MONÇÃO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(572, '2107001', 'MONTES ALTOS', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(573, '2107100', 'MORROS', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(574, '2107209', 'NINA RODRIGUES', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(575, '2107258', 'NOVA COLINAS', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(576, '2107308', 'NOVA IORQUE', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(577, '2107357', 'NOVA OLINDA DO MARANHÃO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(578, '2107407', 'OLHO DÁGUA DAS CUNHÃS', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(579, '2107456', 'OLINDA NOVA DO MARANHÃO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(580, '2107506', 'PAÇO DO LUMIAR', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(581, '2107605', 'PALMEIRÂNDIA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(582, '2107704', 'PARAIBANO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(583, '2107803', 'PARNARAMA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(584, '2107902', 'PASSAGEM FRANCA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(585, '2108009', 'PASTOS BONS', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(586, '2108058', 'PAULINO NEVES', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(587, '2108108', 'PAULO RAMOS', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(588, '2108207', 'PEDREIRAS', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(589, '2108256', 'PEDRO DO ROSÁRIO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(590, '2108306', 'PENALVA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(591, '2108405', 'PERI MIRIM', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(592, '2108454', 'PERITORÓ', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(593, '2108504', 'PINDARÉ-MIRIM', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(594, '2108603', 'PINHEIRO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(595, '2108702', 'PIO XII', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(596, '2108801', 'PIRAPEMAS', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(597, '2108900', 'POÇÃO DE PEDRAS', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(598, '2109007', 'PORTO FRANCO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(599, '2109056', 'PORTO RICO DO MARANHÃO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(600, '2109106', 'PRESIDENTE DUTRA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(601, '2109205', 'PRESIDENTE JUSCELINO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(602, '2109239', 'PRESIDENTE MÉDICI', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(603, '2109270', 'PRESIDENTE SARNEY', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(604, '2109304', 'PRESIDENTE VARGAS', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(605, '2109403', 'PRIMEIRA CRUZ', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(606, '2109452', 'RAPOSA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(607, '2109502', 'RIACHÃO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(608, '2109551', 'RIBAMAR FIQUENE', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(609, '2109601', 'ROSÁRIO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(610, '2109700', 'SAMBAÍBA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(611, '2109759', 'SANTA FILOMENA DO MARANHÃO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(612, '2109809', 'SANTA HELENA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(613, '2109908', 'SANTA INÊS', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(614, '2110005', 'SANTA LUZIA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(615, '2110039', 'SANTA LUZIA DO PARUÁ', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(616, '2110104', 'SANTA QUITÉRIA DO MARANHÃO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(617, '2110203', 'SANTA RITA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(618, '2110237', 'SANTANA DO MARANHÃO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(619, '2110278', 'SANTO AMARO DO MARANHÃO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(620, '2110302', 'SANTO ANTÔNIO DOS LOPES', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(621, '2110401', 'SÃO BENEDITO DO RIO PRETO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(622, '2110500', 'SÃO BENTO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(623, '2110609', 'SÃO BERNARDO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(624, '2110658', 'SÃO DOMINGOS DO AZEITÃO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(625, '2110708', 'SÃO DOMINGOS DO MARANHÃO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(626, '2110807', 'SÃO FÉLIX DE BALSAS', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(627, '2110856', 'SÃO FRANCISCO DO BREJÃO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(628, '2110906', 'SÃO FRANCISCO DO MARANHÃO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(629, '2111003', 'SÃO JOÃO BATISTA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(630, '2111029', 'SÃO JOÃO DO CARÚ', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(631, '2111052', 'SÃO JOÃO DO PARAÍSO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(632, '2111078', 'SÃO JOÃO DO SOTER', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(633, '2111102', 'SÃO JOÃO DOS PATOS', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(634, '2111201', 'SÃO JOSÉ DE RIBAMAR', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(635, '2111250', 'SÃO JOSÉ DOS BASÍLIOS', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(636, '2111300', 'SÃO LUÍS', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(637, '2111409', 'SÃO LUÍS GONZAGA DO MARANHÃO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(638, '2111508', 'SÃO MATEUS DO MARANHÃO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(639, '2111532', 'SÃO PEDRO DA ÁGUA BRANCA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(640, '2111573', 'SÃO PEDRO DOS CRENTES', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(641, '2111607', 'SÃO RAIMUNDO DAS MANGABEIRAS', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(642, '2111631', 'SÃO RAIMUNDO DO DOCA BEZERRA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(643, '2111672', 'SÃO ROBERTO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(644, '2111706', 'SÃO VICENTE FERRER', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(645, '2111722', 'SATUBINHA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(646, '2111748', 'SENADOR ALEXANDRE COSTA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(647, '2111763', 'SENADOR LA ROCQUE', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(648, '2111789', 'SERRANO DO MARANHÃO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(649, '2111805', 'SÍTIO NOVO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(650, '2111904', 'SUCUPIRA DO NORTE', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(651, '2111953', 'SUCUPIRA DO RIACHÃO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(652, '2112001', 'TASSO FRAGOSO', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(653, '2112100', 'TIMBIRAS', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(654, '2112209', 'TIMON', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(655, '2112233', 'TRIZIDELA DO VALE', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(656, '2112274', 'TUFILÂNDIA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(657, '2112308', 'TUNTUM', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(658, '2112407', 'TURIAÇU', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(659, '2112456', 'TURILÂNDIA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(660, '2112506', 'TUTÓIA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(661, '2112605', 'URBANO SANTOS', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(662, '2112704', 'VARGEM GRANDE', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(663, '2112803', 'VIANA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(664, '2112852', 'VILA NOVA DOS MARTÍRIOS', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(665, '2112902', 'VITÓRIA DO MEARIM', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(666, '2113009', 'VITORINO FREIRE', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(667, '2114007', 'ZÉ DOCA', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(668, '2200053', 'ACAUÃ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(669, '2200103', 'AGRICOLÂNDIA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(670, '2200202', 'ÁGUA BRANCA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(671, '2200251', 'ALAGOINHA DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(672, '2200277', 'ALEGRETE DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(673, '2200301', 'ALTO LONGÁ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(674, '2200400', 'ALTOS', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(675, '2200459', 'ALVORADA DO GURGUÉIA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(676, '2200509', 'AMARANTE', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(677, '2200608', 'ANGICAL DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(678, '2200707', 'ANÍSIO DE ABREU', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(679, '2200806', 'ANTÔNIO ALMEIDA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(680, '2200905', 'AROAZES', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(681, '2200954', 'AROEIRAS DO ITAIM', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(682, '2201002', 'ARRAIAL', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(683, '2201051', 'ASSUNÇÃO DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(684, '2201101', 'AVELINO LOPES', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(685, '2201150', 'BAIXA GRANDE DO RIBEIRO', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(686, '2201176', 'BARRA DALCÂNTARA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(687, '2201200', 'BARRAS', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(688, '2201309', 'BARREIRAS DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(689, '2201408', 'BARRO DURO', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(690, '2201507', 'BATALHA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(691, '2201556', 'BELA VISTA DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(692, '2201572', 'BELÉM DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(693, '2201606', 'BENEDITINOS', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(694, '2201705', 'BERTOLÍNIA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(695, '2201739', 'BETÂNIA DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(696, '2201770', 'BOA HORA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(697, '2201804', 'BOCAINA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(698, '2201903', 'BOM JESUS', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(699, '2201919', 'BOM PRINCÍPIO DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(700, '2201929', 'BONFIM DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(701, '2201945', 'BOQUEIRÃO DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(702, '2201960', 'BRASILEIRA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(703, '2201988', 'BREJO DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(704, '2202000', 'BURITI DOS LOPES', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(705, '2202026', 'BURITI DOS MONTES', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(706, '2202059', 'CABECEIRAS DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(707, '2202075', 'CAJAZEIRAS DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(708, '2202083', 'CAJUEIRO DA PRAIA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(709, '2202091', 'CALDEIRÃO GRANDE DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(710, '2202109', 'CAMPINAS DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(711, '2202117', 'CAMPO ALEGRE DO FIDALGO', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(712, '2202133', 'CAMPO GRANDE DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(713, '2202174', 'CAMPO LARGO DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(714, '2202208', 'CAMPO MAIOR', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(715, '2202251', 'CANAVIEIRA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(716, '2202307', 'CANTO DO BURITI', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(717, '2202406', 'CAPITÃO DE CAMPOS', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(718, '2202455', 'CAPITÃO GERVÁSIO OLIVEIRA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(719, '2202505', 'CARACOL', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(720, '2202539', 'CARAÚBAS DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(721, '2202554', 'CARIDADE DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(722, '2202604', 'CASTELO DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(723, '2202653', 'CAXINGÓ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(724, '2202703', 'COCAL', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(725, '2202711', 'COCAL DE TELHA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(726, '2202729', 'COCAL DOS ALVES', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(727, '2202737', 'COIVARAS', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(728, '2202752', 'COLÔNIA DO GURGUÉIA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(729, '2202778', 'COLÔNIA DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(730, '2202802', 'CONCEIÇÃO DO CANINDÉ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(731, '2202851', 'CORONEL JOSÉ DIAS', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(732, '2202901', 'CORRENTE', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(733, '2203008', 'CRISTALÂNDIA DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(734, '2203107', 'CRISTINO CASTRO', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(735, '2203206', 'CURIMATÁ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(736, '2203230', 'CURRAIS', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(737, '2203271', 'CURRAL NOVO DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(738, '2203255', 'CURRALINHOS', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(739, '2203305', 'DEMERVAL LOBÃO', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(740, '2203354', 'DIRCEU ARCOVERDE', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(741, '2203404', 'DOM EXPEDITO LOPES', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(742, '2203453', 'DOM INOCÊNCIO', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(743, '2203420', 'DOMINGOS MOURÃO', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(744, '2203503', 'ELESBÃO VELOSO', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(745, '2203602', 'ELISEU MARTINS', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(746, '2203701', 'ESPERANTINA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(747, '2203750', 'FARTURA DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(748, '2203800', 'FLORES DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(749, '2203859', 'FLORESTA DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(750, '2203909', 'FLORIANO', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(751, '2204006', 'FRANCINÓPOLIS', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(752, '2204105', 'FRANCISCO AYRES', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(753, '2204154', 'FRANCISCO MACEDO', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(754, '2204204', 'FRANCISCO SANTOS', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(755, '2204303', 'FRONTEIRAS', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(756, '2204352', 'GEMINIANO', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(757, '2204402', 'GILBUÉS', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(758, '2204501', 'GUADALUPE', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(759, '2204550', 'GUARIBAS', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(760, '2204600', 'HUGO NAPOLEÃO', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(761, '2204659', 'ILHA GRANDE', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(762, '2204709', 'INHUMA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(763, '2204808', 'IPIRANGA DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(764, '2204907', 'ISAÍAS COELHO', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(765, '2205003', 'ITAINÓPOLIS', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(766, '2205102', 'ITAUEIRA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(767, '2205151', 'JACOBINA DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(768, '2205201', 'JAICÓS', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(769, '2205250', 'JARDIM DO MULATO', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(770, '2205276', 'JATOBÁ DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(771, '2205300', 'JERUMENHA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(772, '2205359', 'JOÃO COSTA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(773, '2205409', 'JOAQUIM PIRES', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(774, '2205458', 'JOCA MARQUES', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(775, '2205508', 'JOSÉ DE FREITAS', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(776, '2205516', 'JUAZEIRO DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(777, '2205524', 'JÚLIO BORGES', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(778, '2205532', 'JUREMA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(779, '2205557', 'LAGOA ALEGRE', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(780, '2205573', 'LAGOA DE SÃO FRANCISCO', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(781, '2205565', 'LAGOA DO BARRO DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(782, '2205581', 'LAGOA DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(783, '2205599', 'LAGOA DO SÍTIO', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(784, '2205540', 'LAGOINHA DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(785, '2205607', 'LANDRI SALES', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(786, '2205706', 'LUÍS CORREIA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(787, '2205805', 'LUZILÂNDIA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(788, '2205854', 'MADEIRO', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(789, '2205904', 'MANOEL EMÍDIO', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(790, '2205953', 'MARCOLÂNDIA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(791, '2206001', 'MARCOS PARENTE', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(792, '2206050', 'MASSAPÊ DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(793, '2206100', 'MATIAS OLÍMPIO', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(794, '2206209', 'MIGUEL ALVES', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(795, '2206308', 'MIGUEL LEÃO', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(796, '2206357', 'MILTON BRANDÃO', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(797, '2206407', 'MONSENHOR GIL', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(798, '2206506', 'MONSENHOR HIPÓLITO', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(799, '2206605', 'MONTE ALEGRE DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(800, '2206654', 'MORRO CABEÇA NO TEMPO', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(801, '2206670', 'MORRO DO CHAPÉU DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(802, '2206696', 'MURICI DOS PORTELAS', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(803, '2206704', 'NAZARÉ DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(804, '2206720', 'NAZÁRIA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(805, '2206753', 'NOSSA SENHORA DE NAZARÉ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(806, '2206803', 'NOSSA SENHORA DOS REMÉDIOS', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(807, '2207959', 'NOVA SANTA RITA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(808, '2206902', 'NOVO ORIENTE DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(809, '2206951', 'NOVO SANTO ANTÔNIO', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(810, '2207009', 'OEIRAS', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(811, '2207108', 'OLHO DÁGUA DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(812, '2207207', 'PADRE MARCOS', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(813, '2207306', 'PAES LANDIM', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(814, '2207355', 'PAJEÚ DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(815, '2207405', 'PALMEIRA DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(816, '2207504', 'PALMEIRAIS', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(817, '2207553', 'PAQUETÁ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(818, '2207603', 'PARNAGUÁ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(819, '2207702', 'PARNAÍBA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(820, '2207751', 'PASSAGEM FRANCA DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(821, '2207777', 'PATOS DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(822, '2207793', 'PAU DARCO DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(823, '2207801', 'PAULISTANA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(824, '2207850', 'PAVUSSU', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(825, '2207900', 'PEDRO II', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(826, '2207934', 'PEDRO LAURENTINO', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(827, '2208007', 'PICOS', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(828, '2208106', 'PIMENTEIRAS', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(829, '2208205', 'PIO IX', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(830, '2208304', 'PIRACURUCA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(831, '2208403', 'PIRIPIRI', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(832, '2208502', 'PORTO', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(833, '2208551', 'PORTO ALEGRE DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(834, '2208601', 'PRATA DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(835, '2208650', 'QUEIMADA NOVA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(836, '2208700', 'REDENÇÃO DO GURGUÉIA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(837, '2208809', 'REGENERAÇÃO', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(838, '2208858', 'RIACHO FRIO', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(839, '2208874', 'RIBEIRA DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(840, '2208908', 'RIBEIRO GONÇALVES', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(841, '2209005', 'RIO GRANDE DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(842, '2209104', 'SANTA CRUZ DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(843, '2209153', 'SANTA CRUZ DOS MILAGRES', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(844, '2209203', 'SANTA FILOMENA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(845, '2209302', 'SANTA LUZ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(846, '2209377', 'SANTA ROSA DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(847, '2209351', 'SANTANA DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(848, '2209401', 'SANTO ANTÔNIO DE LISBOA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(849, '2209450', 'SANTO ANTÔNIO DOS MILAGRES', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(850, '2209500', 'SANTO INÁCIO DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(851, '2209559', 'SÃO BRAZ DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(852, '2209609', 'SÃO FÉLIX DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(853, '2209658', 'SÃO FRANCISCO DE ASSIS DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(854, '2209708', 'SÃO FRANCISCO DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(855, '2209757', 'SÃO GONÇALO DO GURGUÉIA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(856, '2209807', 'SÃO GONÇALO DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(857, '2209856', 'SÃO JOÃO DA CANABRAVA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(858, '2209872', 'SÃO JOÃO DA FRONTEIRA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(859, '2209906', 'SÃO JOÃO DA SERRA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(860, '2209955', 'SÃO JOÃO DA VARJOTA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(861, '2209971', 'SÃO JOÃO DO ARRAIAL', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(862, '2210003', 'SÃO JOÃO DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(863, '2210052', 'SÃO JOSÉ DO DIVINO', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(864, '2210102', 'SÃO JOSÉ DO PEIXE', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(865, '2210201', 'SÃO JOSÉ DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(866, '2210300', 'SÃO JULIÃO', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(867, '2210359', 'SÃO LOURENÇO DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(868, '2210375', 'SÃO LUIS DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(869, '2210383', 'SÃO MIGUEL DA BAIXA GRANDE', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(870, '2210391', 'SÃO MIGUEL DO FIDALGO', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(871, '2210409', 'SÃO MIGUEL DO TAPUIO', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(872, '2210508', 'SÃO PEDRO DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(873, '2210607', 'SÃO RAIMUNDO NONATO', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(874, '2210623', 'SEBASTIÃO BARROS', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(875, '2210631', 'SEBASTIÃO LEAL', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(876, '2210656', 'SIGEFREDO PACHECO', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(877, '2210706', 'SIMÕES', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(878, '2210805', 'SIMPLÍCIO MENDES', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(879, '2210904', 'SOCORRO DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(880, '2210938', 'SUSSUAPARA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(881, '2210953', 'TAMBORIL DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(882, '2210979', 'TANQUE DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(883, '2211001', 'TERESINA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(884, '2211100', 'UNIÃO', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(885, '2211209', 'URUÇUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(886, '2211308', 'VALENÇA DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(887, '2211357', 'VÁRZEA BRANCA', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(888, '2211407', 'VÁRZEA GRANDE', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(889, '2211506', 'VERA MENDES', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(890, '2211605', 'VILA NOVA DO PIAUÍ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(891, '2211704', 'WALL FERRAZ', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(892, '2300101', 'ABAIARA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(893, '2300150', 'ACARAPE', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(894, '2300200', 'ACARAÚ', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(895, '2300309', 'ACOPIARA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(896, '2300408', 'AIUABA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(897, '2300507', 'ALCÂNTARAS', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(898, '2300606', 'ALTANEIRA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(899, '2300705', 'ALTO SANTO', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(900, '2300754', 'AMONTADA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(901, '2300804', 'ANTONINA DO NORTE', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(902, '2300903', 'APUIARÉS', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(903, '2301000', 'AQUIRAZ', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(904, '2301109', 'ARACATI', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(905, '2301208', 'ARACOIABA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(906, '2301257', 'ARARENDÁ', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(907, '2301307', 'ARARIPE', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(908, '2301406', 'ARATUBA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(909, '2301505', 'ARNEIROZ', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(910, '2301604', 'ASSARÉ', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(911, '2301703', 'AURORA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(912, '2301802', 'BAIXIO', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(913, '2301851', 'BANABUIÚ', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(914, '2301901', 'BARBALHA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(915, '2301950', 'BARREIRA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(916, '2302008', 'BARRO', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(917, '2302057', 'BARROQUINHA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(918, '2302107', 'BATURITÉ', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(919, '2302206', 'BEBERIBE', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(920, '2302305', 'BELA CRUZ', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(921, '2302404', 'BOA VIAGEM', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(922, '2302503', 'BREJO SANTO', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(923, '2302602', 'CAMOCIM', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(924, '2302701', 'CAMPOS SALES', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(925, '2302800', 'CANINDÉ', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(926, '2302909', 'CAPISTRANO', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(927, '2303006', 'CARIDADE', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(928, '2303105', 'CARIRÉ', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(929, '2303204', 'CARIRIAÇU', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(930, '2303303', 'CARIÚS', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(931, '2303402', 'CARNAUBAL', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(932, '2303501', 'CASCAVEL', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(933, '2303600', 'CATARINA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(934, '2303659', 'CATUNDA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(935, '2303709', 'CAUCAIA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(936, '2303808', 'CEDRO', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(937, '2303907', 'CHAVAL', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(938, '2303931', 'CHORÓ', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(939, '2303956', 'CHOROZINHO', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(940, '2304004', 'COREAÚ', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(941, '2304103', 'CRATEÚS', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(942, '2304202', 'CRATO', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(943, '2304236', 'CROATÁ', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `municipios` (`id_municipio`, `codigo`, `municipio`, `id_uf`, `created_at`, `updated_at`, `deleted_at`) VALUES
(944, '2304251', 'CRUZ', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(945, '2304269', 'DEPUTADO IRAPUAN PINHEIRO', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(946, '2304277', 'ERERÉ', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(947, '2304285', 'EUSÉBIO', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(948, '2304301', 'FARIAS BRITO', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(949, '2304350', 'FORQUILHA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(950, '2304400', 'FORTALEZA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(951, '2304459', 'FORTIM', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(952, '2304509', 'FRECHEIRINHA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(953, '2304608', 'GENERAL SAMPAIO', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(954, '2304657', 'GRAÇA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(955, '2304707', 'GRANJA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(956, '2304806', 'GRANJEIRO', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(957, '2304905', 'GROAÍRAS', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(958, '2304954', 'GUAIÚBA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(959, '2305001', 'GUARACIABA DO NORTE', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(960, '2305100', 'GUARAMIRANGA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(961, '2305209', 'HIDROLÂNDIA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(962, '2305233', 'HORIZONTE', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(963, '2305266', 'IBARETAMA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(964, '2305308', 'IBIAPINA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(965, '2305332', 'IBICUITINGA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(966, '2305357', 'ICAPUÍ', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(967, '2305407', 'ICÓ', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(968, '2305506', 'IGUATU', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(969, '2305605', 'INDEPENDÊNCIA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(970, '2305654', 'IPAPORANGA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(971, '2305704', 'IPAUMIRIM', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(972, '2305803', 'IPU', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(973, '2305902', 'IPUEIRAS', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(974, '2306009', 'IRACEMA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(975, '2306108', 'IRAUÇUBA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(976, '2306207', 'ITAIÇABA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(977, '2306256', 'ITAITINGA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(978, '2306306', 'ITAPAJÉ', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(979, '2306405', 'ITAPIPOCA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(980, '2306504', 'ITAPIÚNA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(981, '2306553', 'ITAREMA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(982, '2306603', 'ITATIRA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(983, '2306702', 'JAGUARETAMA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(984, '2306801', 'JAGUARIBARA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(985, '2306900', 'JAGUARIBE', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(986, '2307007', 'JAGUARUANA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(987, '2307106', 'JARDIM', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(988, '2307205', 'JATI', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(989, '2307254', 'JIJOCA DE JERICOACOARA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(990, '2307304', 'JUAZEIRO DO NORTE', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(991, '2307403', 'JUCÁS', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(992, '2307502', 'LAVRAS DA MANGABEIRA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(993, '2307601', 'LIMOEIRO DO NORTE', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(994, '2307635', 'MADALENA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(995, '2307650', 'MARACANAÚ', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(996, '2307700', 'MARANGUAPE', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(997, '2307809', 'MARCO', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(998, '2307908', 'MARTINÓPOLE', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(999, '2308005', 'MASSAPÊ', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1000, '2308104', 'MAURITI', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1001, '2308203', 'MERUOCA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1002, '2308302', 'MILAGRES', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1003, '2308351', 'MILHÃ', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1004, '2308377', 'MIRAÍMA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1005, '2308401', 'MISSÃO VELHA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1006, '2308500', 'MOMBAÇA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1007, '2308609', 'MONSENHOR TABOSA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1008, '2308708', 'MORADA NOVA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1009, '2308807', 'MORAÚJO', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1010, '2308906', 'MORRINHOS', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1011, '2309003', 'MUCAMBO', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1012, '2309102', 'MULUNGU', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1013, '2309201', 'NOVA OLINDA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1014, '2309300', 'NOVA RUSSAS', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1015, '2309409', 'NOVO ORIENTE', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1016, '2309458', 'OCARA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1017, '2309508', 'ORÓS', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1018, '2309607', 'PACAJUS', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1019, '2309706', 'PACATUBA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1020, '2309805', 'PACOTI', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1021, '2309904', 'PACUJÁ', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1022, '2310001', 'PALHANO', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1023, '2310100', 'PALMÁCIA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1024, '2310209', 'PARACURU', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1025, '2310258', 'PARAIPABA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1026, '2310308', 'PARAMBU', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1027, '2310407', 'PARAMOTI', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1028, '2310506', 'PEDRA BRANCA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1029, '2310605', 'PENAFORTE', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1030, '2310704', 'PENTECOSTE', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1031, '2310803', 'PEREIRO', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1032, '2310852', 'PINDORETAMA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1033, '2310902', 'PIQUET CARNEIRO', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1034, '2310951', 'PIRES FERREIRA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1035, '2311009', 'PORANGA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1036, '2311108', 'PORTEIRAS', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1037, '2311207', 'POTENGI', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1038, '2311231', 'POTIRETAMA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1039, '2311264', 'QUITERIANÓPOLIS', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1040, '2311306', 'QUIXADÁ', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1041, '2311355', 'QUIXELÔ', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1042, '2311405', 'QUIXERAMOBIM', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1043, '2311504', 'QUIXERÉ', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1044, '2311603', 'REDENÇÃO', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1045, '2311702', 'RERIUTABA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1046, '2311801', 'RUSSAS', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1047, '2311900', 'SABOEIRO', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1048, '2311959', 'SALITRE', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1049, '2312205', 'SANTA QUITÉRIA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1050, '2312007', 'SANTANA DO ACARAÚ', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1051, '2312106', 'SANTANA DO CARIRI', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1052, '2312304', 'SÃO BENEDITO', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1053, '2312403', 'SÃO GONÇALO DO AMARANTE', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1054, '2312502', 'SÃO JOÃO DO JAGUARIBE', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1055, '2312601', 'SÃO LUÍS DO CURU', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1056, '2312700', 'SENADOR POMPEU', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1057, '2312809', 'SENADOR SÁ', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1058, '2312908', 'SOBRAL', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1059, '2313005', 'SOLONÓPOLE', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1060, '2313104', 'TABULEIRO DO NORTE', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1061, '2313203', 'TAMBORIL', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1062, '2313252', 'TARRAFAS', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1063, '2313302', 'TAUÁ', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1064, '2313351', 'TEJUÇUOCA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1065, '2313401', 'TIANGUÁ', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1066, '2313500', 'TRAIRI', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1067, '2313559', 'TURURU', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1068, '2313609', 'UBAJARA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1069, '2313708', 'UMARI', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1070, '2313757', 'UMIRIM', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1071, '2313807', 'URUBURETAMA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1072, '2313906', 'URUOCA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1073, '2313955', 'VARJOTA', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1074, '2314003', 'VÁRZEA ALEGRE', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1075, '2314102', 'VIÇOSA DO CEARÁ', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1076, '2400109', 'ACARI', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1077, '2400208', 'AÇU', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1078, '2400307', 'AFONSO BEZERRA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1079, '2400406', 'ÁGUA NOVA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1080, '2400505', 'ALEXANDRIA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1081, '2400604', 'ALMINO AFONSO', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1082, '2400703', 'ALTO DO RODRIGUES', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1083, '2400802', 'ANGICOS', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1084, '2400901', 'ANTÔNIO MARTINS', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1085, '2401008', 'APODI', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1086, '2401107', 'AREIA BRANCA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1087, '2401206', 'ARÊS', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1088, '2401404', 'BAÍA FORMOSA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1089, '2401453', 'BARAÚNA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1090, '2401503', 'BARCELONA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1091, '2401602', 'BENTO FERNANDES', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1092, '2401651', 'BODÓ', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1093, '2401701', 'BOM JESUS', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1094, '2401800', 'BREJINHO', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1095, '2401859', 'CAIÇARA DO NORTE', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1096, '2401909', 'CAIÇARA DO RIO DO VENTO', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1097, '2402006', 'CAICÓ', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1098, '2401305', 'CAMPO GRANDE', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1099, '2402105', 'CAMPO REDONDO', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1100, '2402204', 'CANGUARETAMA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1101, '2402303', 'CARAÚBAS', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1102, '2402402', 'CARNAÚBA DOS DANTAS', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1103, '2402501', 'CARNAUBAIS', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1104, '2402600', 'CEARÁ-MIRIM', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1105, '2402709', 'CERRO CORÁ', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1106, '2402808', 'CORONEL EZEQUIEL', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1107, '2402907', 'CORONEL JOÃO PESSOA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1108, '2403004', 'CRUZETA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1109, '2403103', 'CURRAIS NOVOS', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1110, '2403202', 'DOUTOR SEVERIANO', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1111, '2403301', 'ENCANTO', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1112, '2403400', 'EQUADOR', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1113, '2403509', 'ESPÍRITO SANTO', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1114, '2403608', 'EXTREMOZ', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1115, '2403707', 'FELIPE GUERRA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1116, '2403756', 'FERNANDO PEDROZA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1117, '2403806', 'FLORÂNIA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1118, '2403905', 'FRANCISCO DANTAS', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1119, '2404002', 'FRUTUOSO GOMES', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1120, '2404101', 'GALINHOS', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1121, '2404200', 'GOIANINHA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1122, '2404309', 'GOVERNADOR DIX-SEPT ROSADO', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1123, '2404408', 'GROSSOS', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1124, '2404507', 'GUAMARÉ', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1125, '2404606', 'IELMO MARINHO', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1126, '2404705', 'IPANGUAÇU', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1127, '2404804', 'IPUEIRA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1128, '2404853', 'ITAJÁ', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1129, '2404903', 'ITAÚ', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1130, '2405009', 'JAÇANÃ', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1131, '2405108', 'JANDAÍRA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1132, '2405207', 'JANDUÍS', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1133, '2405306', 'JANUÁRIO CICCO', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1134, '2405405', 'JAPI', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1135, '2405504', 'JARDIM DE ANGICOS', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1136, '2405603', 'JARDIM DE PIRANHAS', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1137, '2405702', 'JARDIM DO SERIDÓ', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1138, '2405801', 'JOÃO CÂMARA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1139, '2405900', 'JOÃO DIAS', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1140, '2406007', 'JOSÉ DA PENHA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1141, '2406106', 'JUCURUTU', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1142, '2406155', 'JUNDIÁ', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1143, '2406205', 'LAGOA DANTA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1144, '2406304', 'LAGOA DE PEDRAS', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1145, '2406403', 'LAGOA DE VELHOS', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1146, '2406502', 'LAGOA NOVA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1147, '2406601', 'LAGOA SALGADA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1148, '2406700', 'LAJES', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1149, '2406809', 'LAJES PINTADAS', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1150, '2406908', 'LUCRÉCIA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1151, '2407005', 'LUÍS GOMES', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1152, '2407104', 'MACAÍBA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1153, '2407203', 'MACAU', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1154, '2407252', 'MAJOR SALES', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1155, '2407302', 'MARCELINO VIEIRA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1156, '2407401', 'MARTINS', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1157, '2407500', 'MAXARANGUAPE', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1158, '2407609', 'MESSIAS TARGINO', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1159, '2407708', 'MONTANHAS', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1160, '2407807', 'MONTE ALEGRE', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1161, '2407906', 'MONTE DAS GAMELEIRAS', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1162, '2408003', 'MOSSORÓ', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1163, '2408102', 'NATAL', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1164, '2408201', 'NÍSIA FLORESTA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1165, '2408300', 'NOVA CRUZ', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1166, '2408409', 'OLHO DÁGUA DO BORGES', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1167, '2408508', 'OURO BRANCO', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1168, '2408607', 'PARANÁ', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1169, '2408706', 'PARAÚ', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1170, '2408805', 'PARAZINHO', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1171, '2408904', 'PARELHAS', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1172, '2403251', 'PARNAMIRIM', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1173, '2409100', 'PASSA E FICA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1174, '2409209', 'PASSAGEM', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1175, '2409308', 'PATU', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1176, '2409407', 'PAU DOS FERROS', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1177, '2409506', 'PEDRA GRANDE', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1178, '2409605', 'PEDRA PRETA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1179, '2409704', 'PEDRO AVELINO', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1180, '2409803', 'PEDRO VELHO', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1181, '2409902', 'PENDÊNCIAS', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1182, '2410009', 'PILÕES', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1183, '2410108', 'POÇO BRANCO', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1184, '2410207', 'PORTALEGRE', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1185, '2410256', 'PORTO DO MANGUE', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1186, '2410405', 'PUREZA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1187, '2410504', 'RAFAEL FERNANDES', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1188, '2410603', 'RAFAEL GODEIRO', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1189, '2410702', 'RIACHO DA CRUZ', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1190, '2410801', 'RIACHO DE SANTANA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1191, '2410900', 'RIACHUELO', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1192, '2408953', 'RIO DO FOGO', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1193, '2411007', 'RODOLFO FERNANDES', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1194, '2411106', 'RUY BARBOSA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1195, '2411205', 'SANTA CRUZ', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1196, '2409332', 'SANTA MARIA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1197, '2411403', 'SANTANA DO MATOS', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1198, '2411429', 'SANTANA DO SERIDÓ', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1199, '2411502', 'SANTO ANTÔNIO', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1200, '2411601', 'SÃO BENTO DO NORTE', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1201, '2411700', 'SÃO BENTO DO TRAIRÍ', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1202, '2411809', 'SÃO FERNANDO', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1203, '2411908', 'SÃO FRANCISCO DO OESTE', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1204, '2412005', 'SÃO GONÇALO DO AMARANTE', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1205, '2412104', 'SÃO JOÃO DO SABUGI', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1206, '2412203', 'SÃO JOSÉ DE MIPIBU', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1207, '2412302', 'SÃO JOSÉ DO CAMPESTRE', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1208, '2412401', 'SÃO JOSÉ DO SERIDÓ', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1209, '2412500', 'SÃO MIGUEL', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1210, '2412559', 'SÃO MIGUEL DO GOSTOSO', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1211, '2412609', 'SÃO PAULO DO POTENGI', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1212, '2412708', 'SÃO PEDRO', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1213, '2412807', 'SÃO RAFAEL', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1214, '2412906', 'SÃO TOMÉ', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1215, '2413003', 'SÃO VICENTE', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1216, '2413102', 'SENADOR ELÓI DE SOUZA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1217, '2413201', 'SENADOR GEORGINO AVELINO', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1218, '2410306', 'SERRA CAIADA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1219, '2413300', 'SERRA DE SÃO BENTO', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1220, '2413359', 'SERRA DO MEL', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1221, '2413409', 'SERRA NEGRA DO NORTE', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1222, '2413508', 'SERRINHA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1223, '2413557', 'SERRINHA DOS PINTOS', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1224, '2413607', 'SEVERIANO MELO', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1225, '2413706', 'SÍTIO NOVO', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1226, '2413805', 'TABOLEIRO GRANDE', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1227, '2413904', 'TAIPU', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1228, '2414001', 'TANGARÁ', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1229, '2414100', 'TENENTE ANANIAS', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1230, '2414159', 'TENENTE LAURENTINO CRUZ', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1231, '2411056', 'TIBAU', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1232, '2414209', 'TIBAU DO SUL', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1233, '2414308', 'TIMBAÚBA DOS BATISTAS', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1234, '2414407', 'TOUROS', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1235, '2414456', 'TRIUNFO POTIGUAR', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1236, '2414506', 'UMARIZAL', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1237, '2414605', 'UPANEMA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1238, '2414704', 'VÁRZEA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1239, '2414753', 'VENHA-VER', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1240, '2414803', 'VERA CRUZ', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1241, '2414902', 'VIÇOSA', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1242, '2415008', 'VILA FLOR', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1243, '2500106', 'ÁGUA BRANCA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1244, '2500205', 'AGUIAR', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1245, '2500304', 'ALAGOA GRANDE', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1246, '2500403', 'ALAGOA NOVA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1247, '2500502', 'ALAGOINHA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1248, '2500536', 'ALCANTIL', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1249, '2500577', 'ALGODÃO DE JANDAÍRA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1250, '2500601', 'ALHANDRA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1251, '2500734', 'AMPARO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1252, '2500775', 'APARECIDA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1253, '2500809', 'ARAÇAGI', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1254, '2500908', 'ARARA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1255, '2501005', 'ARARUNA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1256, '2501104', 'AREIA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1257, '2501153', 'AREIA DE BARAÚNAS', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1258, '2501203', 'AREIAL', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1259, '2501302', 'AROEIRAS', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1260, '2501351', 'ASSUNÇÃO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1261, '2501401', 'BAÍA DA TRAIÇÃO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1262, '2501500', 'BANANEIRAS', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1263, '2501534', 'BARAÚNA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1264, '2501609', 'BARRA DE SANTA ROSA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1265, '2501575', 'BARRA DE SANTANA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1266, '2501708', 'BARRA DE SÃO MIGUEL', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1267, '2501807', 'BAYEUX', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1268, '2501906', 'BELÉM', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1269, '2502003', 'BELÉM DO BREJO DO CRUZ', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1270, '2502052', 'BERNARDINO BATISTA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1271, '2502102', 'BOA VENTURA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1272, '2502151', 'BOA VISTA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1273, '2502201', 'BOM JESUS', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1274, '2502300', 'BOM SUCESSO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1275, '2502409', 'BONITO DE SANTA FÉ', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1276, '2502508', 'BOQUEIRÃO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1277, '2502706', 'BORBOREMA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1278, '2502805', 'BREJO DO CRUZ', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1279, '2502904', 'BREJO DOS SANTOS', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1280, '2503001', 'CAAPORÃ', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1281, '2503100', 'CABACEIRAS', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1282, '2503209', 'CABEDELO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1283, '2503308', 'CACHOEIRA DOS ÍNDIOS', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1284, '2503407', 'CACIMBA DE AREIA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1285, '2503506', 'CACIMBA DE DENTRO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1286, '2503555', 'CACIMBAS', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1287, '2503605', 'CAIÇARA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1288, '2503704', 'CAJAZEIRAS', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1289, '2503753', 'CAJAZEIRINHAS', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1290, '2503803', 'CALDAS BRANDÃO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1291, '2503902', 'CAMALAÚ', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1292, '2504009', 'CAMPINA GRANDE', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1293, '2504033', 'CAPIM', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1294, '2504074', 'CARAÚBAS', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1295, '2504108', 'CARRAPATEIRA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1296, '2504157', 'CASSERENGUE', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1297, '2504207', 'CATINGUEIRA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1298, '2504306', 'CATOLÉ DO ROCHA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1299, '2504355', 'CATURITÉ', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1300, '2504405', 'CONCEIÇÃO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1301, '2504504', 'CONDADO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1302, '2504603', 'CONDE', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1303, '2504702', 'CONGO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1304, '2504801', 'COREMAS', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1305, '2504850', 'COXIXOLA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1306, '2504900', 'CRUZ DO ESPÍRITO SANTO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1307, '2505006', 'CUBATI', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1308, '2505105', 'CUITÉ', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1309, '2505238', 'CUITÉ DE MAMANGUAPE', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1310, '2505204', 'CUITEGI', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1311, '2505279', 'CURRAL DE CIMA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1312, '2505303', 'CURRAL VELHO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1313, '2505352', 'DAMIÃO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1314, '2505402', 'DESTERRO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1315, '2505600', 'DIAMANTE', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1316, '2505709', 'DONA INÊS', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1317, '2505808', 'DUAS ESTRADAS', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1318, '2505907', 'EMAS', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1319, '2506004', 'ESPERANÇA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1320, '2506103', 'FAGUNDES', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1321, '2506202', 'FREI MARTINHO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1322, '2506251', 'GADO BRAVO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1323, '2506301', 'GUARABIRA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1324, '2506400', 'GURINHÉM', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1325, '2506509', 'GURJÃO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1326, '2506608', 'IBIARA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1327, '2502607', 'IGARACY', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1328, '2506707', 'IMACULADA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1329, '2506806', 'INGÁ', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1330, '2506905', 'ITABAIANA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1331, '2507002', 'ITAPORANGA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1332, '2507101', 'ITAPOROROCA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1333, '2507200', 'ITATUBA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1334, '2507309', 'JACARAÚ', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1335, '2507408', 'JERICÓ', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1336, '2507507', 'JOÃO PESSOA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1337, '2513653', 'JOCA CLAUDINO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1338, '2507606', 'JUAREZ TÁVORA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1339, '2507705', 'JUAZEIRINHO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1340, '2507804', 'JUNCO DO SERIDÓ', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1341, '2507903', 'JURIPIRANGA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1342, '2508000', 'JURU', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1343, '2508109', 'LAGOA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1344, '2508208', 'LAGOA DE DENTRO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1345, '2508307', 'LAGOA SECA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1346, '2508406', 'LASTRO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1347, '2508505', 'LIVRAMENTO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1348, '2508554', 'LOGRADOURO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1349, '2508604', 'LUCENA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1350, '2508703', 'MÃE DÁGUA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1351, '2508802', 'MALTA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1352, '2508901', 'MAMANGUAPE', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1353, '2509008', 'MANAÍRA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1354, '2509057', 'MARCAÇÃO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1355, '2509107', 'MARI', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1356, '2509156', 'MARIZÓPOLIS', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1357, '2509206', 'MASSARANDUBA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1358, '2509305', 'MATARACA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1359, '2509339', 'MATINHAS', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1360, '2509370', 'MATO GROSSO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1361, '2509396', 'MATURÉIA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1362, '2509404', 'MOGEIRO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1363, '2509503', 'MONTADAS', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1364, '2509602', 'MONTE HOREBE', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1365, '2509701', 'MONTEIRO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1366, '2509800', 'MULUNGU', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1367, '2509909', 'NATUBA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1368, '2510006', 'NAZAREZINHO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1369, '2510105', 'NOVA FLORESTA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1370, '2510204', 'NOVA OLINDA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1371, '2510303', 'NOVA PALMEIRA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1372, '2510402', 'OLHO DÁGUA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1373, '2510501', 'OLIVEDOS', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1374, '2510600', 'OURO VELHO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1375, '2510659', 'PARARI', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1376, '2510709', 'PASSAGEM', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1377, '2510808', 'PATOS', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1378, '2510907', 'PAULISTA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1379, '2511004', 'PEDRA BRANCA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1380, '2511103', 'PEDRA LAVRADA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1381, '2511202', 'PEDRAS DE FOGO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1382, '2512721', 'PEDRO RÉGIS', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1383, '2511301', 'PIANCÓ', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1384, '2511400', 'PICUÍ', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1385, '2511509', 'PILAR', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1386, '2511608', 'PILÕES', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1387, '2511707', 'PILÕEZINHOS', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1388, '2511806', 'PIRPIRITUBA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1389, '2511905', 'PITIMBU', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1390, '2512002', 'POCINHOS', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1391, '2512036', 'POÇO DANTAS', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1392, '2512077', 'POÇO DE JOSÉ DE MOURA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1393, '2512101', 'POMBAL', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1394, '2512200', 'PRATA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1395, '2512309', 'PRINCESA ISABEL', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1396, '2512408', 'PUXINANÃ', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1397, '2512507', 'QUEIMADAS', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1398, '2512606', 'QUIXABA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1399, '2512705', 'REMÍGIO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1400, '2512747', 'RIACHÃO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1401, '2512754', 'RIACHÃO DO BACAMARTE', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1402, '2512762', 'RIACHÃO DO POÇO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1403, '2512788', 'RIACHO DE SANTO ANTÔNIO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1404, '2512804', 'RIACHO DOS CAVALOS', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1405, '2512903', 'RIO TINTO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1406, '2513000', 'SALGADINHO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1407, '2513109', 'SALGADO DE SÃO FÉLIX', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1408, '2513158', 'SANTA CECÍLIA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1409, '2513208', 'SANTA CRUZ', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1410, '2513307', 'SANTA HELENA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1411, '2513356', 'SANTA INÊS', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1412, '2513406', 'SANTA LUZIA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1413, '2513703', 'SANTA RITA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1414, '2513802', 'SANTA TERESINHA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1415, '2513505', 'SANTANA DE MANGUEIRA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1416, '2513604', 'SANTANA DOS GARROTES', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1417, '2513851', 'SANTO ANDRÉ', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1418, '2513927', 'SÃO BENTINHO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1419, '2513901', 'SÃO BENTO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1420, '2513968', 'SÃO DOMINGOS', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `municipios` (`id_municipio`, `codigo`, `municipio`, `id_uf`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1421, '2513943', 'SÃO DOMINGOS DO CARIRI', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1422, '2513984', 'SÃO FRANCISCO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1423, '2514008', 'SÃO JOÃO DO CARIRI', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1424, '2500700', 'SÃO JOÃO DO RIO DO PEIXE', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1425, '2514107', 'SÃO JOÃO DO TIGRE', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1426, '2514206', 'SÃO JOSÉ DA LAGOA TAPADA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1427, '2514305', 'SÃO JOSÉ DE CAIANA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1428, '2514404', 'SÃO JOSÉ DE ESPINHARAS', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1429, '2514503', 'SÃO JOSÉ DE PIRANHAS', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1430, '2514552', 'SÃO JOSÉ DE PRINCESA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1431, '2514602', 'SÃO JOSÉ DO BONFIM', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1432, '2514651', 'SÃO JOSÉ DO BREJO DO CRUZ', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1433, '2514701', 'SÃO JOSÉ DO SABUGI', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1434, '2514800', 'SÃO JOSÉ DOS CORDEIROS', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1435, '2514453', 'SÃO JOSÉ DOS RAMOS', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1436, '2514909', 'SÃO MAMEDE', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1437, '2515005', 'SÃO MIGUEL DE TAIPU', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1438, '2515104', 'SÃO SEBASTIÃO DE LAGOA DE ROÇA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1439, '2515203', 'SÃO SEBASTIÃO DO UMBUZEIRO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1440, '2515401', 'SÃO VICENTE DO SERIDÓ', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1441, '2515302', 'SAPÉ', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1442, '2515500', 'SERRA BRANCA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1443, '2515609', 'SERRA DA RAIZ', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1444, '2515708', 'SERRA GRANDE', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1445, '2515807', 'SERRA REDONDA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1446, '2515906', 'SERRARIA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1447, '2515930', 'SERTÃOZINHO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1448, '2515971', 'SOBRADO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1449, '2516003', 'SOLÂNEA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1450, '2516102', 'SOLEDADE', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1451, '2516151', 'SOSSÊGO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1452, '2516201', 'SOUSA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1453, '2516300', 'SUMÉ', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1454, '2516409', 'TACIMA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1455, '2516508', 'TAPEROÁ', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1456, '2516607', 'TAVARES', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1457, '2516706', 'TEIXEIRA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1458, '2516755', 'TENÓRIO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1459, '2516805', 'TRIUNFO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1460, '2516904', 'UIRAÚNA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1461, '2517001', 'UMBUZEIRO', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1462, '2517100', 'VÁRZEA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1463, '2517209', 'VIEIRÓPOLIS', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1464, '2505501', 'VISTA SERRANA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1465, '2517407', 'ZABELÊ', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1466, '2600054', 'ABREU E LIMA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1467, '2600104', 'AFOGADOS DA INGAZEIRA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1468, '2600203', 'AFRÂNIO', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1469, '2600302', 'AGRESTINA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1470, '2600401', 'ÁGUA PRETA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1471, '2600500', 'ÁGUAS BELAS', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1472, '2600609', 'ALAGOINHA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1473, '2600708', 'ALIANÇA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1474, '2600807', 'ALTINHO', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1475, '2600906', 'AMARAJI', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1476, '2601003', 'ANGELIM', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1477, '2601052', 'ARAÇOIABA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1478, '2601102', 'ARARIPINA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1479, '2601201', 'ARCOVERDE', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1480, '2601300', 'BARRA DE GUABIRABA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1481, '2601409', 'BARREIROS', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1482, '2601508', 'BELÉM DE MARIA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1483, '2601607', 'BELÉM DO SÃO FRANCISCO', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1484, '2601706', 'BELO JARDIM', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1485, '2601805', 'BETÂNIA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1486, '2601904', 'BEZERROS', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1487, '2602001', 'BODOCÓ', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1488, '2602100', 'BOM CONSELHO', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1489, '2602209', 'BOM JARDIM', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1490, '2602308', 'BONITO', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1491, '2602407', 'BREJÃO', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1492, '2602506', 'BREJINHO', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1493, '2602605', 'BREJO DA MADRE DE DEUS', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1494, '2602704', 'BUENOS AIRES', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1495, '2602803', 'BUÍQUE', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1496, '2602902', 'CABO DE SANTO AGOSTINHO', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1497, '2603009', 'CABROBÓ', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1498, '2603108', 'CACHOEIRINHA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1499, '2603207', 'CAETÉS', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1500, '2603306', 'CALÇADO', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1501, '2603405', 'CALUMBI', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1502, '2603454', 'CAMARAGIBE', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1503, '2603504', 'CAMOCIM DE SÃO FÉLIX', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1504, '2603603', 'CAMUTANGA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1505, '2603702', 'CANHOTINHO', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1506, '2603801', 'CAPOEIRAS', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1507, '2603900', 'CARNAÍBA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1508, '2603926', 'CARNAUBEIRA DA PENHA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1509, '2604007', 'CARPINA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1510, '2604106', 'CARUARU', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1511, '2604155', 'CASINHAS', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1512, '2604205', 'CATENDE', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1513, '2604304', 'CEDRO', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1514, '2604403', 'CHÃ DE ALEGRIA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1515, '2604502', 'CHÃ GRANDE', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1516, '2604601', 'CONDADO', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1517, '2604700', 'CORRENTES', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1518, '2604809', 'CORTÊS', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1519, '2604908', 'CUMARU', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1520, '2605004', 'CUPIRA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1521, '2605103', 'CUSTÓDIA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1522, '2605152', 'DORMENTES', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1523, '2605202', 'ESCADA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1524, '2605301', 'EXU', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1525, '2605400', 'FEIRA NOVA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1526, '2605459', 'FERNANDO DE NORONHA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1527, '2605509', 'FERREIROS', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1528, '2605608', 'FLORES', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1529, '2605707', 'FLORESTA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1530, '2605806', 'FREI MIGUELINHO', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1531, '2605905', 'GAMELEIRA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1532, '2606002', 'GARANHUNS', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1533, '2606101', 'GLÓRIA DO GOITÁ', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1534, '2606200', 'GOIANA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1535, '2606309', 'GRANITO', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1536, '2606408', 'GRAVATÁ', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1537, '2606507', 'IATI', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1538, '2606606', 'IBIMIRIM', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1539, '2606705', 'IBIRAJUBA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1540, '2606804', 'IGARASSU', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1541, '2606903', 'IGUARACY', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1542, '2607604', 'ILHA DE ITAMARACÁ', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1543, '2607000', 'INAJÁ', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1544, '2607109', 'INGAZEIRA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1545, '2607208', 'IPOJUCA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1546, '2607307', 'IPUBI', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1547, '2607406', 'ITACURUBA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1548, '2607505', 'ITAÍBA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1549, '2607653', 'ITAMBÉ', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1550, '2607703', 'ITAPETIM', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1551, '2607752', 'ITAPISSUMA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1552, '2607802', 'ITAQUITINGA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1553, '2607901', 'JABOATÃO DOS GUARARAPES', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1554, '2607950', 'JAQUEIRA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1555, '2608008', 'JATAÚBA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1556, '2608057', 'JATOBÁ', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1557, '2608107', 'JOÃO ALFREDO', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1558, '2608206', 'JOAQUIM NABUCO', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1559, '2608255', 'JUCATI', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1560, '2608305', 'JUPI', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1561, '2608404', 'JUREMA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1562, '2608503', 'LAGOA DE ITAENGA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1563, '2608453', 'LAGOA DO CARRO', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1564, '2608602', 'LAGOA DO OURO', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1565, '2608701', 'LAGOA DOS GATOS', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1566, '2608750', 'LAGOA GRANDE', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1567, '2608800', 'LAJEDO', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1568, '2608909', 'LIMOEIRO', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1569, '2609006', 'MACAPARANA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1570, '2609105', 'MACHADOS', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1571, '2609154', 'MANARI', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1572, '2609204', 'MARAIAL', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1573, '2609303', 'MIRANDIBA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1574, '2614303', 'MOREILÂNDIA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1575, '2609402', 'MORENO', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1576, '2609501', 'NAZARÉ DA MATA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1577, '2609600', 'OLINDA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1578, '2609709', 'OROBÓ', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1579, '2609808', 'OROCÓ', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1580, '2609907', 'OURICURI', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1581, '2610004', 'PALMARES', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1582, '2610103', 'PALMEIRINA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1583, '2610202', 'PANELAS', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1584, '2610301', 'PARANATAMA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1585, '2610400', 'PARNAMIRIM', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1586, '2610509', 'PASSIRA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1587, '2610608', 'PAUDALHO', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1588, '2610707', 'PAULISTA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1589, '2610806', 'PEDRA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1590, '2610905', 'PESQUEIRA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1591, '2611002', 'PETROLÂNDIA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1592, '2611101', 'PETROLINA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1593, '2611200', 'POÇÃO', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1594, '2611309', 'POMBOS', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1595, '2611408', 'PRIMAVERA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1596, '2611507', 'QUIPAPÁ', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1597, '2611533', 'QUIXABA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1598, '2611606', 'RECIFE', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1599, '2611705', 'RIACHO DAS ALMAS', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1600, '2611804', 'RIBEIRÃO', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1601, '2611903', 'RIO FORMOSO', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1602, '2612000', 'SAIRÉ', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1603, '2612109', 'SALGADINHO', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1604, '2612208', 'SALGUEIRO', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1605, '2612307', 'SALOÁ', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1606, '2612406', 'SANHARÓ', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1607, '2612455', 'SANTA CRUZ', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1608, '2612471', 'SANTA CRUZ DA BAIXA VERDE', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1609, '2612505', 'SANTA CRUZ DO CAPIBARIBE', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1610, '2612554', 'SANTA FILOMENA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1611, '2612604', 'SANTA MARIA DA BOA VISTA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1612, '2612703', 'SANTA MARIA DO CAMBUCÁ', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1613, '2612802', 'SANTA TEREZINHA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1614, '2612901', 'SÃO BENEDITO DO SUL', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1615, '2613008', 'SÃO BENTO DO UNA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1616, '2613107', 'SÃO CAITANO', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1617, '2613206', 'SÃO JOÃO', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1618, '2613305', 'SÃO JOAQUIM DO MONTE', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1619, '2613404', 'SÃO JOSÉ DA COROA GRANDE', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1620, '2613503', 'SÃO JOSÉ DO BELMONTE', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1621, '2613602', 'SÃO JOSÉ DO EGITO', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1622, '2613701', 'SÃO LOURENÇO DA MATA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1623, '2613800', 'SÃO VICENTE FÉRRER', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1624, '2613909', 'SERRA TALHADA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1625, '2614006', 'SERRITA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1626, '2614105', 'SERTÂNIA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1627, '2614204', 'SIRINHAÉM', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1628, '2614402', 'SOLIDÃO', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1629, '2614501', 'SURUBIM', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1630, '2614600', 'TABIRA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1631, '2614709', 'TACAIMBÓ', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1632, '2614808', 'TACARATU', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1633, '2614857', 'TAMANDARÉ', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1634, '2615003', 'TAQUARITINGA DO NORTE', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1635, '2615102', 'TEREZINHA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1636, '2615201', 'TERRA NOVA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1637, '2615300', 'TIMBAÚBA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1638, '2615409', 'TORITAMA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1639, '2615508', 'TRACUNHAÉM', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1640, '2615607', 'TRINDADE', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1641, '2615706', 'TRIUNFO', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1642, '2615805', 'TUPANATINGA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1643, '2615904', 'TUPARETAMA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1644, '2616001', 'VENTUROSA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1645, '2616100', 'VERDEJANTE', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1646, '2616183', 'VERTENTE DO LÉRIO', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1647, '2616209', 'VERTENTES', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1648, '2616308', 'VICÊNCIA', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1649, '2616407', 'VITÓRIA DE SANTO ANTÃO', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1650, '2616506', 'XEXÉU', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1651, '2700102', 'ÁGUA BRANCA', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1652, '2700201', 'ANADIA', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1653, '2700300', 'ARAPIRACA', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1654, '2700409', 'ATALAIA', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1655, '2700508', 'BARRA DE SANTO ANTÔNIO', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1656, '2700607', 'BARRA DE SÃO MIGUEL', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1657, '2700706', 'BATALHA', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1658, '2700805', 'BELÉM', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1659, '2700904', 'BELO MONTE', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1660, '2701001', 'BOCA DA MATA', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1661, '2701100', 'BRANQUINHA', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1662, '2701209', 'CACIMBINHAS', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1663, '2701308', 'CAJUEIRO', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1664, '2701357', 'CAMPESTRE', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1665, '2701407', 'CAMPO ALEGRE', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1666, '2701506', 'CAMPO GRANDE', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1667, '2701605', 'CANAPI', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1668, '2701704', 'CAPELA', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1669, '2701803', 'CARNEIROS', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1670, '2701902', 'CHÃ PRETA', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1671, '2702009', 'COITÉ DO NÓIA', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1672, '2702108', 'COLÔNIA LEOPOLDINA', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1673, '2702207', 'COQUEIRO SECO', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1674, '2702306', 'CORURIPE', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1675, '2702355', 'CRAÍBAS', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1676, '2702405', 'DELMIRO GOUVEIA', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1677, '2702504', 'DOIS RIACHOS', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1678, '2702553', 'ESTRELA DE ALAGOAS', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1679, '2702603', 'FEIRA GRANDE', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1680, '2702702', 'FELIZ DESERTO', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1681, '2702801', 'FLEXEIRAS', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1682, '2702900', 'GIRAU DO PONCIANO', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1683, '2703007', 'IBATEGUARA', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1684, '2703106', 'IGACI', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1685, '2703205', 'IGREJA NOVA', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1686, '2703304', 'INHAPI', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1687, '2703403', 'JACARÉ DOS HOMENS', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1688, '2703502', 'JACUÍPE', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1689, '2703601', 'JAPARATINGA', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1690, '2703700', 'JARAMATAIA', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1691, '2703759', 'JEQUIÁ DA PRAIA', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1692, '2703809', 'JOAQUIM GOMES', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1693, '2703908', 'JUNDIÁ', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1694, '2704005', 'JUNQUEIRO', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1695, '2704104', 'LAGOA DA CANOA', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1696, '2704203', 'LIMOEIRO DE ANADIA', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1697, '2704302', 'MACEIÓ', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1698, '2704401', 'MAJOR ISIDORO', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1699, '2704906', 'MAR VERMELHO', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1700, '2704500', 'MARAGOGI', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1701, '2704609', 'MARAVILHA', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1702, '2704708', 'MARECHAL DEODORO', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1703, '2704807', 'MARIBONDO', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1704, '2705002', 'MATA GRANDE', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1705, '2705101', 'MATRIZ DE CAMARAGIBE', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1706, '2705200', 'MESSIAS', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1707, '2705309', 'MINADOR DO NEGRÃO', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1708, '2705408', 'MONTEIRÓPOLIS', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1709, '2705507', 'MURICI', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1710, '2705606', 'NOVO LINO', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1711, '2705705', 'OLHO DÁGUA DAS FLORES', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1712, '2705804', 'OLHO DÁGUA DO CASADO', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1713, '2705903', 'OLHO DÁGUA GRANDE', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1714, '2706000', 'OLIVENÇA', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1715, '2706109', 'OURO BRANCO', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1716, '2706208', 'PALESTINA', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1717, '2706307', 'PALMEIRA DOS ÍNDIOS', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1718, '2706406', 'PÃO DE AÇÚCAR', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1719, '2706422', 'PARICONHA', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1720, '2706448', 'PARIPUEIRA', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1721, '2706505', 'PASSO DE CAMARAGIBE', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1722, '2706604', 'PAULO JACINTO', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1723, '2706703', 'PENEDO', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1724, '2706802', 'PIAÇABUÇU', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1725, '2706901', 'PILAR', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1726, '2707008', 'PINDOBA', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1727, '2707107', 'PIRANHAS', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1728, '2707206', 'POÇO DAS TRINCHEIRAS', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1729, '2707305', 'PORTO CALVO', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1730, '2707404', 'PORTO DE PEDRAS', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1731, '2707503', 'PORTO REAL DO COLÉGIO', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1732, '2707602', 'QUEBRANGULO', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1733, '2707701', 'RIO LARGO', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1734, '2707800', 'ROTEIRO', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1735, '2707909', 'SANTA LUZIA DO NORTE', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1736, '2708006', 'SANTANA DO IPANEMA', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1737, '2708105', 'SANTANA DO MUNDAÚ', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1738, '2708204', 'SÃO BRÁS', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1739, '2708303', 'SÃO JOSÉ DA LAJE', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1740, '2708402', 'SÃO JOSÉ DA TAPERA', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1741, '2708501', 'SÃO LUÍS DO QUITUNDE', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1742, '2708600', 'SÃO MIGUEL DOS CAMPOS', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1743, '2708709', 'SÃO MIGUEL DOS MILAGRES', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1744, '2708808', 'SÃO SEBASTIÃO', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1745, '2708907', 'SATUBA', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1746, '2708956', 'SENADOR RUI PALMEIRA', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1747, '2709004', 'TANQUE DARCA', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1748, '2709103', 'TAQUARANA', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1749, '2709152', 'TEOTÔNIO VILELA', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1750, '2709202', 'TRAIPU', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1751, '2709301', 'UNIÃO DOS PALMARES', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1752, '2709400', 'VIÇOSA', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1753, '2800100', 'AMPARO DE SÃO FRANCISCO', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1754, '2800209', 'AQUIDABÃ', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1755, '2800308', 'ARACAJU', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1756, '2800407', 'ARAUÁ', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1757, '2800506', 'AREIA BRANCA', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1758, '2800605', 'BARRA DOS COQUEIROS', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1759, '2800670', 'BOQUIM', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1760, '2800704', 'BREJO GRANDE', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1761, '2801009', 'CAMPO DO BRITO', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1762, '2801108', 'CANHOBA', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1763, '2801207', 'CANINDÉ DE SÃO FRANCISCO', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1764, '2801306', 'CAPELA', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1765, '2801405', 'CARIRA', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1766, '2801504', 'CARMÓPOLIS', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1767, '2801603', 'CEDRO DE SÃO JOÃO', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1768, '2801702', 'CRISTINÁPOLIS', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1769, '2801900', 'CUMBE', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1770, '2802007', 'DIVINA PASTORA', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1771, '2802106', 'ESTÂNCIA', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1772, '2802205', 'FEIRA NOVA', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1773, '2802304', 'FREI PAULO', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1774, '2802403', 'GARARU', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1775, '2802502', 'GENERAL MAYNARD', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1776, '2802601', 'GRACHO CARDOSO', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1777, '2802700', 'ILHA DAS FLORES', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1778, '2802809', 'INDIAROBA', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1779, '2802908', 'ITABAIANA', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1780, '2803005', 'ITABAIANINHA', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1781, '2803104', 'ITABI', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1782, '2803203', 'ITAPORANGA DAJUDA', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1783, '2803302', 'JAPARATUBA', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1784, '2803401', 'JAPOATÃ', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1785, '2803500', 'LAGARTO', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1786, '2803609', 'LARANJEIRAS', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1787, '2803708', 'MACAMBIRA', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1788, '2803807', 'MALHADA DOS BOIS', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1789, '2803906', 'MALHADOR', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1790, '2804003', 'MARUIM', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1791, '2804102', 'MOITA BONITA', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1792, '2804201', 'MONTE ALEGRE DE SERGIPE', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1793, '2804300', 'MURIBECA', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1794, '2804409', 'NEÓPOLIS', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1795, '2804458', 'NOSSA SENHORA APARECIDA', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1796, '2804508', 'NOSSA SENHORA DA GLÓRIA', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1797, '2804607', 'NOSSA SENHORA DAS DORES', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1798, '2804706', 'NOSSA SENHORA DE LOURDES', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1799, '2804805', 'NOSSA SENHORA DO SOCORRO', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1800, '2804904', 'PACATUBA', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1801, '2805000', 'PEDRA MOLE', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1802, '2805109', 'PEDRINHAS', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1803, '2805208', 'PINHÃO', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1804, '2805307', 'PIRAMBU', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1805, '2805406', 'POÇO REDONDO', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1806, '2805505', 'POÇO VERDE', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1807, '2805604', 'PORTO DA FOLHA', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1808, '2805703', 'PROPRIÁ', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1809, '2805802', 'RIACHÃO DO DANTAS', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1810, '2805901', 'RIACHUELO', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1811, '2806008', 'RIBEIRÓPOLIS', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1812, '2806107', 'ROSÁRIO DO CATETE', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1813, '2806206', 'SALGADO', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1814, '2806305', 'SANTA LUZIA DO ITANHY', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1815, '2806503', 'SANTA ROSA DE LIMA', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1816, '2806404', 'SANTANA DO SÃO FRANCISCO', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1817, '2806602', 'SANTO AMARO DAS BROTAS', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1818, '2806701', 'SÃO CRISTÓVÃO', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1819, '2806800', 'SÃO DOMINGOS', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1820, '2806909', 'SÃO FRANCISCO', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1821, '2807006', 'SÃO MIGUEL DO ALEIXO', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1822, '2807105', 'SIMÃO DIAS', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1823, '2807204', 'SIRIRI', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1824, '2807303', 'TELHA', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1825, '2807402', 'TOBIAS BARRETO', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1826, '2807501', 'TOMAR DO GERU', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1827, '2807600', 'UMBAÚBA', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1828, '2900108', 'ABAÍRA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1829, '2900207', 'ABARÉ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1830, '2900306', 'ACAJUTIBA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1831, '2900355', 'ADUSTINA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1832, '2900405', 'ÁGUA FRIA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1833, '2900603', 'AIQUARA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1834, '2900702', 'ALAGOINHAS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1835, '2900801', 'ALCOBAÇA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1836, '2900900', 'ALMADINA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1837, '2901007', 'AMARGOSA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1838, '2901106', 'AMÉLIA RODRIGUES', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1839, '2901155', 'AMÉRICA DOURADA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1840, '2901205', 'ANAGÉ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1841, '2901304', 'ANDARAÍ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1842, '2901353', 'ANDORINHA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1843, '2901403', 'ANGICAL', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1844, '2901502', 'ANGUERA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1845, '2901601', 'ANTAS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1846, '2901700', 'ANTÔNIO CARDOSO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1847, '2901809', 'ANTÔNIO GONÇALVES', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1848, '2901908', 'APORÁ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1849, '2901957', 'APUAREMA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1850, '2902054', 'ARAÇÁS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1851, '2902005', 'ARACATU', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1852, '2902104', 'ARACI', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1853, '2902203', 'ARAMARI', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1854, '2902252', 'ARATACA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1855, '2902302', 'ARATUÍPE', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1856, '2902401', 'AURELINO LEAL', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1857, '2902500', 'BAIANÓPOLIS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1858, '2902609', 'BAIXA GRANDE', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1859, '2902658', 'BANZAÊ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1860, '2902708', 'BARRA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1861, '2902807', 'BARRA DA ESTIVA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1862, '2902906', 'BARRA DO CHOÇA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1863, '2903003', 'BARRA DO MENDES', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1864, '2903102', 'BARRA DO ROCHA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1865, '2903201', 'BARREIRAS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1866, '2903235', 'BARRO ALTO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1867, '2903300', 'BARRO PRETO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1868, '2903276', 'BARROCAS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1869, '2903409', 'BELMONTE', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1870, '2903508', 'BELO CAMPO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1871, '2903607', 'BIRITINGA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1872, '2903706', 'BOA NOVA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1873, '2903805', 'BOA VISTA DO TUPIM', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1874, '2903904', 'BOM JESUS DA LAPA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1875, '2903953', 'BOM JESUS DA SERRA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1876, '2904001', 'BONINAL', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1877, '2904050', 'BONITO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1878, '2904100', 'BOQUIRA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1879, '2904209', 'BOTUPORÃ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1880, '2904308', 'BREJÕES', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1881, '2904407', 'BREJOLÂNDIA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1882, '2904506', 'BROTAS DE MACAÚBAS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1883, '2904605', 'BRUMADO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1884, '2904704', 'BUERAREMA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1885, '2904753', 'BURITIRAMA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1886, '2904803', 'CAATIBA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1887, '2904852', 'CABACEIRAS DO PARAGUAÇU', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1888, '2904902', 'CACHOEIRA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1889, '2905008', 'CACULÉ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1890, '2905107', 'CAÉM', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1891, '2905156', 'CAETANOS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1892, '2905206', 'CAETITÉ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1893, '2905305', 'CAFARNAUM', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1894, '2905404', 'CAIRU', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `municipios` (`id_municipio`, `codigo`, `municipio`, `id_uf`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1895, '2905503', 'CALDEIRÃO GRANDE', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1896, '2905602', 'CAMACAN', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1897, '2905701', 'CAMAÇARI', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1898, '2905800', 'CAMAMU', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1899, '2905909', 'CAMPO ALEGRE DE LOURDES', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1900, '2906006', 'CAMPO FORMOSO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1901, '2906105', 'CANÁPOLIS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1902, '2906204', 'CANARANA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1903, '2906303', 'CANAVIEIRAS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1904, '2906402', 'CANDEAL', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1905, '2906501', 'CANDEIAS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1906, '2906600', 'CANDIBA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1907, '2906709', 'CÂNDIDO SALES', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1908, '2906808', 'CANSANÇÃO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1909, '2906824', 'CANUDOS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1910, '2906857', 'CAPELA DO ALTO ALEGRE', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1911, '2906873', 'CAPIM GROSSO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1912, '2906899', 'CARAÍBAS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1913, '2906907', 'CARAVELAS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1914, '2907004', 'CARDEAL DA SILVA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1915, '2907103', 'CARINHANHA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1916, '2907202', 'CASA NOVA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1917, '2907301', 'CASTRO ALVES', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1918, '2907400', 'CATOLÂNDIA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1919, '2907509', 'CATU', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1920, '2907558', 'CATURAMA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1921, '2907608', 'CENTRAL', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1922, '2907707', 'CHORROCHÓ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1923, '2907806', 'CÍCERO DANTAS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1924, '2907905', 'CIPÓ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1925, '2908002', 'COARACI', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1926, '2908101', 'COCOS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1927, '2908200', 'CONCEIÇÃO DA FEIRA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1928, '2908309', 'CONCEIÇÃO DO ALMEIDA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1929, '2908408', 'CONCEIÇÃO DO COITÉ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1930, '2908507', 'CONCEIÇÃO DO JACUÍPE', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1931, '2908606', 'CONDE', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1932, '2908705', 'CONDEÚBA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1933, '2908804', 'CONTENDAS DO SINCORÁ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1934, '2908903', 'CORAÇÃO DE MARIA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1935, '2909000', 'CORDEIROS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1936, '2909109', 'CORIBE', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1937, '2909208', 'CORONEL JOÃO SÁ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1938, '2909307', 'CORRENTINA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1939, '2909406', 'COTEGIPE', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1940, '2909505', 'CRAVOLÂNDIA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1941, '2909604', 'CRISÓPOLIS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1942, '2909703', 'CRISTÓPOLIS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1943, '2909802', 'CRUZ DAS ALMAS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1944, '2909901', 'CURAÇÁ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1945, '2910008', 'DÁRIO MEIRA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1946, '2910057', 'DIAS DÁVILA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1947, '2910107', 'DOM BASÍLIO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1948, '2910206', 'DOM MACEDO COSTA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1949, '2910305', 'ELÍSIO MEDRADO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1950, '2910404', 'ENCRUZILHADA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1951, '2910503', 'ENTRE RIOS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1952, '2900504', 'ÉRICO CARDOSO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1953, '2910602', 'ESPLANADA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1954, '2910701', 'EUCLIDES DA CUNHA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1955, '2910727', 'EUNÁPOLIS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1956, '2910750', 'FÁTIMA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1957, '2910776', 'FEIRA DA MATA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1958, '2910800', 'FEIRA DE SANTANA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1959, '2910859', 'FILADÉLFIA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1960, '2910909', 'FIRMINO ALVES', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1961, '2911006', 'FLORESTA AZUL', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1962, '2911105', 'FORMOSA DO RIO PRETO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1963, '2911204', 'GANDU', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1964, '2911253', 'GAVIÃO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1965, '2911303', 'GENTIO DO OURO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1966, '2911402', 'GLÓRIA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1967, '2911501', 'GONGOGI', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1968, '2911600', 'GOVERNADOR MANGABEIRA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1969, '2911659', 'GUAJERU', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1970, '2911709', 'GUANAMBI', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1971, '2911808', 'GUARATINGA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1972, '2911857', 'HELIÓPOLIS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1973, '2911907', 'IAÇU', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1974, '2912004', 'IBIASSUCÊ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1975, '2912103', 'IBICARAÍ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1976, '2912202', 'IBICOARA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1977, '2912301', 'IBICUÍ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1978, '2912400', 'IBIPEBA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1979, '2912509', 'IBIPITANGA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1980, '2912608', 'IBIQUERA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1981, '2912707', 'IBIRAPITANGA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1982, '2912806', 'IBIRAPUÃ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1983, '2912905', 'IBIRATAIA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1984, '2913002', 'IBITIARA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1985, '2913101', 'IBITITÁ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1986, '2913200', 'IBOTIRAMA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1987, '2913309', 'ICHU', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1988, '2913408', 'IGAPORÃ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1989, '2913457', 'IGRAPIÚNA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1990, '2913507', 'IGUAÍ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1991, '2913606', 'ILHÉUS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1992, '2913705', 'INHAMBUPE', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1993, '2913804', 'IPECAETÁ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1994, '2913903', 'IPIAÚ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1995, '2914000', 'IPIRÁ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1996, '2914109', 'IPUPIARA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1997, '2914208', 'IRAJUBA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1998, '2914307', 'IRAMAIA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1999, '2914406', 'IRAQUARA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2000, '2914505', 'IRARÁ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2001, '2914604', 'IRECÊ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2002, '2914653', 'ITABELA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2003, '2914703', 'ITABERABA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2004, '2914802', 'ITABUNA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2005, '2914901', 'ITACARÉ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2006, '2915007', 'ITAETÉ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2007, '2915106', 'ITAGI', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2008, '2915205', 'ITAGIBÁ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2009, '2915304', 'ITAGIMIRIM', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2010, '2915353', 'ITAGUAÇU DA BAHIA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2011, '2915403', 'ITAJU DO COLÔNIA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2012, '2915502', 'ITAJUÍPE', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2013, '2915601', 'ITAMARAJU', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2014, '2915700', 'ITAMARI', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2015, '2915809', 'ITAMBÉ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2016, '2915908', 'ITANAGRA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2017, '2916005', 'ITANHÉM', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2018, '2916104', 'ITAPARICA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2019, '2916203', 'ITAPÉ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2020, '2916302', 'ITAPEBI', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2021, '2916401', 'ITAPETINGA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2022, '2916500', 'ITAPICURU', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2023, '2916609', 'ITAPITANGA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2024, '2916708', 'ITAQUARA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2025, '2916807', 'ITARANTIM', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2026, '2916856', 'ITATIM', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2027, '2916906', 'ITIRUÇU', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2028, '2917003', 'ITIÚBA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2029, '2917102', 'ITORORÓ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2030, '2917201', 'ITUAÇU', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2031, '2917300', 'ITUBERÁ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2032, '2917334', 'IUIU', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2033, '2917359', 'JABORANDI', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2034, '2917409', 'JACARACI', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2035, '2917508', 'JACOBINA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2036, '2917607', 'JAGUAQUARA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2037, '2917706', 'JAGUARARI', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2038, '2917805', 'JAGUARIPE', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2039, '2917904', 'JANDAÍRA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2040, '2918001', 'JEQUIÉ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2041, '2918100', 'JEREMOABO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2042, '2918209', 'JIQUIRIÇÁ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2043, '2918308', 'JITAÚNA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2044, '2918357', 'JOÃO DOURADO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2045, '2918407', 'JUAZEIRO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2046, '2918456', 'JUCURUÇU', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2047, '2918506', 'JUSSARA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2048, '2918555', 'JUSSARI', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2049, '2918605', 'JUSSIAPE', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2050, '2918704', 'LAFAIETE COUTINHO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2051, '2918753', 'LAGOA REAL', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2052, '2918803', 'LAJE', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2053, '2918902', 'LAJEDÃO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2054, '2919009', 'LAJEDINHO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2055, '2919058', 'LAJEDO DO TABOCAL', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2056, '2919108', 'LAMARÃO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2057, '2919157', 'LAPÃO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2058, '2919207', 'LAURO DE FREITAS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2059, '2919306', 'LENÇÓIS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2060, '2919405', 'LICÍNIO DE ALMEIDA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2061, '2919504', 'LIVRAMENTO DE NOSSA SENHORA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2062, '2919553', 'LUÍS EDUARDO MAGALHÃES', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2063, '2919603', 'MACAJUBA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2064, '2919702', 'MACARANI', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2065, '2919801', 'MACAÚBAS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2066, '2919900', 'MACURURÉ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2067, '2919926', 'MADRE DE DEUS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2068, '2919959', 'MAETINGA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2069, '2920007', 'MAIQUINIQUE', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2070, '2920106', 'MAIRI', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2071, '2920205', 'MALHADA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2072, '2920304', 'MALHADA DE PEDRAS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2073, '2920403', 'MANOEL VITORINO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2074, '2920452', 'MANSIDÃO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2075, '2920502', 'MARACÁS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2076, '2920601', 'MARAGOGIPE', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2077, '2920700', 'MARAÚ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2078, '2920809', 'MARCIONÍLIO SOUZA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2079, '2920908', 'MASCOTE', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2080, '2921005', 'MATA DE SÃO JOÃO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2081, '2921054', 'MATINA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2082, '2921104', 'MEDEIROS NETO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2083, '2921203', 'MIGUEL CALMON', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2084, '2921302', 'MILAGRES', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2085, '2921401', 'MIRANGABA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2086, '2921450', 'MIRANTE', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2087, '2921500', 'MONTE SANTO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2088, '2921609', 'MORPARÁ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2089, '2921708', 'MORRO DO CHAPÉU', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2090, '2921807', 'MORTUGABA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2091, '2921906', 'MUCUGÊ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2092, '2922003', 'MUCURI', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2093, '2922052', 'MULUNGU DO MORRO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2094, '2922102', 'MUNDO NOVO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2095, '2922201', 'MUNIZ FERREIRA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2096, '2922250', 'MUQUÉM DO SÃO FRANCISCO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2097, '2922300', 'MURITIBA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2098, '2922409', 'MUTUÍPE', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2099, '2922508', 'NAZARÉ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2100, '2922607', 'NILO PEÇANHA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2101, '2922656', 'NORDESTINA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2102, '2922706', 'NOVA CANAÃ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2103, '2922730', 'NOVA FÁTIMA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2104, '2922755', 'NOVA IBIÁ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2105, '2922805', 'NOVA ITARANA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2106, '2922854', 'NOVA REDENÇÃO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2107, '2922904', 'NOVA SOURE', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2108, '2923001', 'NOVA VIÇOSA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2109, '2923035', 'NOVO HORIZONTE', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2110, '2923050', 'NOVO TRIUNFO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2111, '2923100', 'OLINDINA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2112, '2923209', 'OLIVEIRA DOS BREJINHOS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2113, '2923308', 'OURIÇANGAS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2114, '2923357', 'OUROLÂNDIA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2115, '2923407', 'PALMAS DE MONTE ALTO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2116, '2923506', 'PALMEIRAS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2117, '2923605', 'PARAMIRIM', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2118, '2923704', 'PARATINGA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2119, '2923803', 'PARIPIRANGA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2120, '2923902', 'PAU BRASIL', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2121, '2924009', 'PAULO AFONSO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2122, '2924058', 'PÉ DE SERRA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2123, '2924108', 'PEDRÃO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2124, '2924207', 'PEDRO ALEXANDRE', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2125, '2924306', 'PIATÃ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2126, '2924405', 'PILÃO ARCADO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2127, '2924504', 'PINDAÍ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2128, '2924603', 'PINDOBAÇU', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2129, '2924652', 'PINTADAS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2130, '2924678', 'PIRAÍ DO NORTE', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2131, '2924702', 'PIRIPÁ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2132, '2924801', 'PIRITIBA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2133, '2924900', 'PLANALTINO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2134, '2925006', 'PLANALTO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2135, '2925105', 'POÇÕES', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2136, '2925204', 'POJUCA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2137, '2925253', 'PONTO NOVO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2138, '2925303', 'PORTO SEGURO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2139, '2925402', 'POTIRAGUÁ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2140, '2925501', 'PRADO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2141, '2925600', 'PRESIDENTE DUTRA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2142, '2925709', 'PRESIDENTE JÂNIO QUADROS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2143, '2925758', 'PRESIDENTE TANCREDO NEVES', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2144, '2925808', 'QUEIMADAS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2145, '2925907', 'QUIJINGUE', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2146, '2925931', 'QUIXABEIRA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2147, '2925956', 'RAFAEL JAMBEIRO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2148, '2926004', 'REMANSO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2149, '2926103', 'RETIROLÂNDIA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2150, '2926202', 'RIACHÃO DAS NEVES', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2151, '2926301', 'RIACHÃO DO JACUÍPE', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2152, '2926400', 'RIACHO DE SANTANA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2153, '2926509', 'RIBEIRA DO AMPARO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2154, '2926608', 'RIBEIRA DO POMBAL', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2155, '2926657', 'RIBEIRÃO DO LARGO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2156, '2926707', 'RIO DE CONTAS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2157, '2926806', 'RIO DO ANTÔNIO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2158, '2926905', 'RIO DO PIRES', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2159, '2927002', 'RIO REAL', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2160, '2927101', 'RODELAS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2161, '2927200', 'RUY BARBOSA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2162, '2927309', 'SALINAS DA MARGARIDA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2163, '2927408', 'SALVADOR', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2164, '2927507', 'SANTA BÁRBARA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2165, '2927606', 'SANTA BRÍGIDA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2166, '2927705', 'SANTA CRUZ CABRÁLIA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2167, '2927804', 'SANTA CRUZ DA VITÓRIA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2168, '2927903', 'SANTA INÊS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2169, '2928059', 'SANTA LUZIA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2170, '2928109', 'SANTA MARIA DA VITÓRIA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2171, '2928406', 'SANTA RITA DE CÁSSIA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2172, '2928505', 'SANTA TEREZINHA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2173, '2928000', 'SANTALUZ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2174, '2928208', 'SANTANA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2175, '2928307', 'SANTANÓPOLIS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2176, '2928604', 'SANTO AMARO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2177, '2928703', 'SANTO ANTÔNIO DE JESUS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2178, '2928802', 'SANTO ESTÊVÃO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2179, '2928901', 'SÃO DESIDÉRIO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2180, '2928950', 'SÃO DOMINGOS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2181, '2929107', 'SÃO FELIPE', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2182, '2929008', 'SÃO FÉLIX', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2183, '2929057', 'SÃO FÉLIX DO CORIBE', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2184, '2929206', 'SÃO FRANCISCO DO CONDE', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2185, '2929255', 'SÃO GABRIEL', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2186, '2929305', 'SÃO GONÇALO DOS CAMPOS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2187, '2929354', 'SÃO JOSÉ DA VITÓRIA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2188, '2929370', 'SÃO JOSÉ DO JACUÍPE', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2189, '2929404', 'SÃO MIGUEL DAS MATAS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2190, '2929503', 'SÃO SEBASTIÃO DO PASSÉ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2191, '2929602', 'SAPEAÇU', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2192, '2929701', 'SÁTIRO DIAS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2193, '2929750', 'SAUBARA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2194, '2929800', 'SAÚDE', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2195, '2929909', 'SEABRA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2196, '2930006', 'SEBASTIÃO LARANJEIRAS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2197, '2930105', 'SENHOR DO BONFIM', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2198, '2930204', 'SENTO SÉ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2199, '2930154', 'SERRA DO RAMALHO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2200, '2930303', 'SERRA DOURADA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2201, '2930402', 'SERRA PRETA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2202, '2930501', 'SERRINHA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2203, '2930600', 'SERROLÂNDIA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2204, '2930709', 'SIMÕES FILHO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2205, '2930758', 'SÍTIO DO MATO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2206, '2930766', 'SÍTIO DO QUINTO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2207, '2930774', 'SOBRADINHO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2208, '2930808', 'SOUTO SOARES', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2209, '2930907', 'TABOCAS DO BREJO VELHO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2210, '2931004', 'TANHAÇU', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2211, '2931053', 'TANQUE NOVO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2212, '2931103', 'TANQUINHO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2213, '2931202', 'TAPEROÁ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2214, '2931301', 'TAPIRAMUTÁ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2215, '2931350', 'TEIXEIRA DE FREITAS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2216, '2931400', 'TEODORO SAMPAIO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2217, '2931509', 'TEOFILÂNDIA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2218, '2931608', 'TEOLÂNDIA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2219, '2931707', 'TERRA NOVA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2220, '2931806', 'TREMEDAL', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2221, '2931905', 'TUCANO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2222, '2932002', 'UAUÁ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2223, '2932101', 'UBAÍRA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2224, '2932200', 'UBAITABA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2225, '2932309', 'UBATÃ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2226, '2932408', 'UIBAÍ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2227, '2932457', 'UMBURANAS', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2228, '2932507', 'UNA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2229, '2932606', 'URANDI', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2230, '2932705', 'URUÇUCA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2231, '2932804', 'UTINGA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2232, '2932903', 'VALENÇA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2233, '2933000', 'VALENTE', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2234, '2933059', 'VÁRZEA DA ROÇA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2235, '2933109', 'VÁRZEA DO POÇO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2236, '2933158', 'VÁRZEA NOVA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2237, '2933174', 'VARZEDO', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2238, '2933208', 'VERA CRUZ', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2239, '2933257', 'VEREDA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2240, '2933307', 'VITÓRIA DA CONQUISTA', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2241, '2933406', 'WAGNER', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2242, '2933455', 'WANDERLEY', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2243, '2933505', 'WENCESLAU GUIMARÃES', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2244, '2933604', 'XIQUE-XIQUE', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2245, '3100104', 'ABADIA DOS DOURADOS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2246, '3100203', 'ABAETÉ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2247, '3100302', 'ABRE CAMPO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2248, '3100401', 'ACAIACA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2249, '3100500', 'AÇUCENA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2250, '3100609', 'ÁGUA BOA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2251, '3100708', 'ÁGUA COMPRIDA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2252, '3100807', 'AGUANIL', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2253, '3100906', 'ÁGUAS FORMOSAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2254, '3101003', 'ÁGUAS VERMELHAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2255, '3101102', 'AIMORÉS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2256, '3101201', 'AIURUOCA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2257, '3101300', 'ALAGOA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2258, '3101409', 'ALBERTINA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2259, '3101508', 'ALÉM PARAÍBA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2260, '3101607', 'ALFENAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2261, '3101631', 'ALFREDO VASCONCELOS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2262, '3101706', 'ALMENARA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2263, '3101805', 'ALPERCATA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2264, '3101904', 'ALPINÓPOLIS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2265, '3102001', 'ALTEROSA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2266, '3102050', 'ALTO CAPARAÓ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2267, '3153509', 'ALTO JEQUITIBÁ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2268, '3102100', 'ALTO RIO DOCE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2269, '3102209', 'ALVARENGA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2270, '3102308', 'ALVINÓPOLIS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2271, '3102407', 'ALVORADA DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2272, '3102506', 'AMPARO DO SERRA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2273, '3102605', 'ANDRADAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2274, '3102803', 'ANDRELÂNDIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2275, '3102852', 'ANGELÂNDIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2276, '3102902', 'ANTÔNIO CARLOS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2277, '3103009', 'ANTÔNIO DIAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2278, '3103108', 'ANTÔNIO PRADO DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2279, '3103207', 'ARAÇAÍ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2280, '3103306', 'ARACITABA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2281, '3103405', 'ARAÇUAÍ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2282, '3103504', 'ARAGUARI', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2283, '3103603', 'ARANTINA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2284, '3103702', 'ARAPONGA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2285, '3103751', 'ARAPORÃ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2286, '3103801', 'ARAPUÁ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2287, '3103900', 'ARAÚJOS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2288, '3104007', 'ARAXÁ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2289, '3104106', 'ARCEBURGO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2290, '3104205', 'ARCOS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2291, '3104304', 'AREADO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2292, '3104403', 'ARGIRITA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2293, '3104452', 'ARICANDUVA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2294, '3104502', 'ARINOS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2295, '3104601', 'ASTOLFO DUTRA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2296, '3104700', 'ATALÉIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2297, '3104809', 'AUGUSTO DE LIMA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2298, '3104908', 'BAEPENDI', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2299, '3105004', 'BALDIM', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2300, '3105103', 'BAMBUÍ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2301, '3105202', 'BANDEIRA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2302, '3105301', 'BANDEIRA DO SUL', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2303, '3105400', 'BARÃO DE COCAIS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2304, '3105509', 'BARÃO DE MONTE ALTO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2305, '3105608', 'BARBACENA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2306, '3105707', 'BARRA LONGA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2307, '3105905', 'BARROSO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2308, '3106002', 'BELA VISTA DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2309, '3106101', 'BELMIRO BRAGA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2310, '3106200', 'BELO HORIZONTE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2311, '3106309', 'BELO ORIENTE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2312, '3106408', 'BELO VALE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2313, '3106507', 'BERILO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2314, '3106655', 'BERIZAL', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2315, '3106606', 'BERTÓPOLIS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2316, '3106705', 'BETIM', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2317, '3106804', 'BIAS FORTES', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2318, '3106903', 'BICAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2319, '3107000', 'BIQUINHAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2320, '3107109', 'BOA ESPERANÇA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2321, '3107208', 'BOCAINA DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2322, '3107307', 'BOCAIÚVA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2323, '3107406', 'BOM DESPACHO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2324, '3107505', 'BOM JARDIM DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2325, '3107604', 'BOM JESUS DA PENHA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2326, '3107703', 'BOM JESUS DO AMPARO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2327, '3107802', 'BOM JESUS DO GALHO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2328, '3107901', 'BOM REPOUSO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2329, '3108008', 'BOM SUCESSO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2330, '3108107', 'BONFIM', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2331, '3108206', 'BONFINÓPOLIS DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2332, '3108255', 'BONITO DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2333, '3108305', 'BORDA DA MATA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2334, '3108404', 'BOTELHOS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2335, '3108503', 'BOTUMIRIM', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2336, '3108701', 'BRÁS PIRES', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2337, '3108552', 'BRASILÂNDIA DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2338, '3108602', 'BRASÍLIA DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2339, '3108800', 'BRAÚNAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2340, '3108909', 'BRAZÓPOLIS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2341, '3109006', 'BRUMADINHO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2342, '3109105', 'BUENO BRANDÃO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2343, '3109204', 'BUENÓPOLIS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2344, '3109253', 'BUGRE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2345, '3109303', 'BURITIS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2346, '3109402', 'BURITIZEIRO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2347, '3109451', 'CABECEIRA GRANDE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2348, '3109501', 'CABO VERDE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2349, '3109600', 'CACHOEIRA DA PRATA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2350, '3109709', 'CACHOEIRA DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2351, '3102704', 'CACHOEIRA DE PAJEÚ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2352, '3109808', 'CACHOEIRA DOURADA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2353, '3109907', 'CAETANÓPOLIS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2354, '3110004', 'CAETÉ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2355, '3110103', 'CAIANA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2356, '3110202', 'CAJURI', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2357, '3110301', 'CALDAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2358, '3110400', 'CAMACHO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2359, '3110509', 'CAMANDUCAIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2360, '3110608', 'CAMBUÍ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2361, '3110707', 'CAMBUQUIRA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2362, '3110806', 'CAMPANÁRIO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2363, '3110905', 'CAMPANHA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2364, '3111002', 'CAMPESTRE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2365, '3111101', 'CAMPINA VERDE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2366, '3111150', 'CAMPO AZUL', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2367, '3111200', 'CAMPO BELO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2368, '3111309', 'CAMPO DO MEIO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2369, '3111408', 'CAMPO FLORIDO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2370, '3111507', 'CAMPOS ALTOS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `municipios` (`id_municipio`, `codigo`, `municipio`, `id_uf`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2371, '3111606', 'CAMPOS GERAIS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2372, '3111903', 'CANA VERDE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2373, '3111705', 'CANAÃ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2374, '3111804', 'CANÁPOLIS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2375, '3112000', 'CANDEIAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2376, '3112059', 'CANTAGALO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2377, '3112109', 'CAPARAÓ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2378, '3112208', 'CAPELA NOVA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2379, '3112307', 'CAPELINHA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2380, '3112406', 'CAPETINGA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2381, '3112505', 'CAPIM BRANCO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2382, '3112604', 'CAPINÓPOLIS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2383, '3112653', 'CAPITÃO ANDRADE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2384, '3112703', 'CAPITÃO ENÉAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2385, '3112802', 'CAPITÓLIO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2386, '3112901', 'CAPUTIRA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2387, '3113008', 'CARAÍ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2388, '3113107', 'CARANAÍBA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2389, '3113206', 'CARANDAÍ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2390, '3113305', 'CARANGOLA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2391, '3113404', 'CARATINGA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2392, '3113503', 'CARBONITA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2393, '3113602', 'CAREAÇU', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2394, '3113701', 'CARLOS CHAGAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2395, '3113800', 'CARMÉSIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2396, '3113909', 'CARMO DA CACHOEIRA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2397, '3114006', 'CARMO DA MATA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2398, '3114105', 'CARMO DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2399, '3114204', 'CARMO DO CAJURU', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2400, '3114303', 'CARMO DO PARANAÍBA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2401, '3114402', 'CARMO DO RIO CLARO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2402, '3114501', 'CARMÓPOLIS DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2403, '3114550', 'CARNEIRINHO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2404, '3114600', 'CARRANCAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2405, '3114709', 'CARVALHÓPOLIS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2406, '3114808', 'CARVALHOS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2407, '3114907', 'CASA GRANDE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2408, '3115003', 'CASCALHO RICO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2409, '3115102', 'CÁSSIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2410, '3115300', 'CATAGUASES', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2411, '3115359', 'CATAS ALTAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2412, '3115409', 'CATAS ALTAS DA NORUEGA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2413, '3115458', 'CATUJI', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2414, '3115474', 'CATUTI', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2415, '3115508', 'CAXAMBU', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2416, '3115607', 'CEDRO DO ABAETÉ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2417, '3115706', 'CENTRAL DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2418, '3115805', 'CENTRALINA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2419, '3115904', 'CHÁCARA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2420, '3116001', 'CHALÉ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2421, '3116100', 'CHAPADA DO NORTE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2422, '3116159', 'CHAPADA GAÚCHA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2423, '3116209', 'CHIADOR', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2424, '3116308', 'CIPOTÂNEA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2425, '3116407', 'CLARAVAL', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2426, '3116506', 'CLARO DOS POÇÕES', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2427, '3116605', 'CLÁUDIO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2428, '3116704', 'COIMBRA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2429, '3116803', 'COLUNA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2430, '3116902', 'COMENDADOR GOMES', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2431, '3117009', 'COMERCINHO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2432, '3117108', 'CONCEIÇÃO DA APARECIDA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2433, '3115201', 'CONCEIÇÃO DA BARRA DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2434, '3117306', 'CONCEIÇÃO DAS ALAGOAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2435, '3117207', 'CONCEIÇÃO DAS PEDRAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2436, '3117405', 'CONCEIÇÃO DE IPANEMA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2437, '3117504', 'CONCEIÇÃO DO MATO DENTRO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2438, '3117603', 'CONCEIÇÃO DO PARÁ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2439, '3117702', 'CONCEIÇÃO DO RIO VERDE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2440, '3117801', 'CONCEIÇÃO DOS OUROS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2441, '3117836', 'CÔNEGO MARINHO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2442, '3117876', 'CONFINS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2443, '3117900', 'CONGONHAL', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2444, '3118007', 'CONGONHAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2445, '3118106', 'CONGONHAS DO NORTE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2446, '3118205', 'CONQUISTA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2447, '3118304', 'CONSELHEIRO LAFAIETE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2448, '3118403', 'CONSELHEIRO PENA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2449, '3118502', 'CONSOLAÇÃO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2450, '3118601', 'CONTAGEM', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2451, '3118700', 'COQUEIRAL', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2452, '3118809', 'CORAÇÃO DE JESUS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2453, '3118908', 'CORDISBURGO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2454, '3119005', 'CORDISLÂNDIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2455, '3119104', 'CORINTO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2456, '3119203', 'COROACI', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2457, '3119302', 'COROMANDEL', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2458, '3119401', 'CORONEL FABRICIANO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2459, '3119500', 'CORONEL MURTA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2460, '3119609', 'CORONEL PACHECO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2461, '3119708', 'CORONEL XAVIER CHAVES', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2462, '3119807', 'CÓRREGO DANTA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2463, '3119906', 'CÓRREGO DO BOM JESUS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2464, '3119955', 'CÓRREGO FUNDO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2465, '3120003', 'CÓRREGO NOVO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2466, '3120102', 'COUTO DE MAGALHÃES DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2467, '3120151', 'CRISÓLITA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2468, '3120201', 'CRISTAIS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2469, '3120300', 'CRISTÁLIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2470, '3120409', 'CRISTIANO OTONI', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2471, '3120508', 'CRISTINA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2472, '3120607', 'CRUCILÂNDIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2473, '3120706', 'CRUZEIRO DA FORTALEZA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2474, '3120805', 'CRUZÍLIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2475, '3120839', 'CUPARAQUE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2476, '3120870', 'CURRAL DE DENTRO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2477, '3120904', 'CURVELO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2478, '3121001', 'DATAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2479, '3121100', 'DELFIM MOREIRA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2480, '3121209', 'DELFINÓPOLIS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2481, '3121258', 'DELTA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2482, '3121308', 'DESCOBERTO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2483, '3121407', 'DESTERRO DE ENTRE RIOS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2484, '3121506', 'DESTERRO DO MELO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2485, '3121605', 'DIAMANTINA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2486, '3121704', 'DIOGO DE VASCONCELOS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2487, '3121803', 'DIONÍSIO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2488, '3121902', 'DIVINÉSIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2489, '3122009', 'DIVINO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2490, '3122108', 'DIVINO DAS LARANJEIRAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2491, '3122207', 'DIVINOLÂNDIA DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2492, '3122306', 'DIVINÓPOLIS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2493, '3122355', 'DIVISA ALEGRE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2494, '3122405', 'DIVISA NOVA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2495, '3122454', 'DIVISÓPOLIS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2496, '3122470', 'DOM BOSCO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2497, '3122504', 'DOM CAVATI', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2498, '3122603', 'DOM JOAQUIM', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2499, '3122702', 'DOM SILVÉRIO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2500, '3122801', 'DOM VIÇOSO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2501, '3122900', 'DONA EUZÉBIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2502, '3123007', 'DORES DE CAMPOS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2503, '3123106', 'DORES DE GUANHÃES', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2504, '3123205', 'DORES DO INDAIÁ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2505, '3123304', 'DORES DO TURVO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2506, '3123403', 'DORESÓPOLIS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2507, '3123502', 'DOURADOQUARA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2508, '3123528', 'DURANDÉ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2509, '3123601', 'ELÓI MENDES', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2510, '3123700', 'ENGENHEIRO CALDAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2511, '3123809', 'ENGENHEIRO NAVARRO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2512, '3123858', 'ENTRE FOLHAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2513, '3123908', 'ENTRE RIOS DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2514, '3124005', 'ERVÁLIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2515, '3124104', 'ESMERALDAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2516, '3124203', 'ESPERA FELIZ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2517, '3124302', 'ESPINOSA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2518, '3124401', 'ESPÍRITO SANTO DO DOURADO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2519, '3124500', 'ESTIVA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2520, '3124609', 'ESTRELA DALVA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2521, '3124708', 'ESTRELA DO INDAIÁ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2522, '3124807', 'ESTRELA DO SUL', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2523, '3124906', 'EUGENÓPOLIS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2524, '3125002', 'EWBANK DA CÂMARA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2525, '3125101', 'EXTREMA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2526, '3125200', 'FAMA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2527, '3125309', 'FARIA LEMOS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2528, '3125408', 'FELÍCIO DOS SANTOS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2529, '3125606', 'FELISBURGO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2530, '3125705', 'FELIXLÂNDIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2531, '3125804', 'FERNANDES TOURINHO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2532, '3125903', 'FERROS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2533, '3125952', 'FERVEDOURO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2534, '3126000', 'FLORESTAL', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2535, '3126109', 'FORMIGA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2536, '3126208', 'FORMOSO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2537, '3126307', 'FORTALEZA DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2538, '3126406', 'FORTUNA DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2539, '3126505', 'FRANCISCO BADARÓ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2540, '3126604', 'FRANCISCO DUMONT', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2541, '3126703', 'FRANCISCO SÁ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2542, '3126752', 'FRANCISCÓPOLIS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2543, '3126802', 'FREI GASPAR', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2544, '3126901', 'FREI INOCÊNCIO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2545, '3126950', 'FREI LAGONEGRO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2546, '3127008', 'FRONTEIRA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2547, '3127057', 'FRONTEIRA DOS VALES', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2548, '3127073', 'FRUTA DE LEITE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2549, '3127107', 'FRUTAL', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2550, '3127206', 'FUNILÂNDIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2551, '3127305', 'GALILÉIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2552, '3127339', 'GAMELEIRAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2553, '3127354', 'GLAUCILÂNDIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2554, '3127370', 'GOIABEIRA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2555, '3127388', 'GOIANÁ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2556, '3127404', 'GONÇALVES', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2557, '3127503', 'GONZAGA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2558, '3127602', 'GOUVEIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2559, '3127701', 'GOVERNADOR VALADARES', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2560, '3127800', 'GRÃO MOGOL', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2561, '3127909', 'GRUPIARA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2562, '3128006', 'GUANHÃES', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2563, '3128105', 'GUAPÉ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2564, '3128204', 'GUARACIABA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2565, '3128253', 'GUARACIAMA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2566, '3128303', 'GUARANÉSIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2567, '3128402', 'GUARANI', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2568, '3128501', 'GUARARÁ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2569, '3128600', 'GUARDA-MOR', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2570, '3128709', 'GUAXUPÉ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2571, '3128808', 'GUIDOVAL', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2572, '3128907', 'GUIMARÂNIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2573, '3129004', 'GUIRICEMA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2574, '3129103', 'GURINHATÃ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2575, '3129202', 'HELIODORA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2576, '3129301', 'IAPU', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2577, '3129400', 'IBERTIOGA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2578, '3129509', 'IBIÁ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2579, '3129608', 'IBIAÍ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2580, '3129657', 'IBIRACATU', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2581, '3129707', 'IBIRACI', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2582, '3129806', 'IBIRITÉ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2583, '3129905', 'IBITIÚRA DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2584, '3130002', 'IBITURUNA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2585, '3130051', 'ICARAÍ DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2586, '3130101', 'IGARAPÉ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2587, '3130200', 'IGARATINGA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2588, '3130309', 'IGUATAMA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2589, '3130408', 'IJACI', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2590, '3130507', 'ILICÍNEA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2591, '3130556', 'IMBÉ DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2592, '3130606', 'INCONFIDENTES', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2593, '3130655', 'INDAIABIRA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2594, '3130705', 'INDIANÓPOLIS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2595, '3130804', 'INGAÍ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2596, '3130903', 'INHAPIM', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2597, '3131000', 'INHAÚMA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2598, '3131109', 'INIMUTABA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2599, '3131158', 'IPABA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2600, '3131208', 'IPANEMA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2601, '3131307', 'IPATINGA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2602, '3131406', 'IPIAÇU', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2603, '3131505', 'IPUIÚNA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2604, '3131604', 'IRAÍ DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2605, '3131703', 'ITABIRA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2606, '3131802', 'ITABIRINHA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2607, '3131901', 'ITABIRITO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2608, '3132008', 'ITACAMBIRA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2609, '3132107', 'ITACARAMBI', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2610, '3132206', 'ITAGUARA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2611, '3132305', 'ITAIPÉ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2612, '3132404', 'ITAJUBÁ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2613, '3132503', 'ITAMARANDIBA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2614, '3132602', 'ITAMARATI DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2615, '3132701', 'ITAMBACURI', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2616, '3132800', 'ITAMBÉ DO MATO DENTRO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2617, '3132909', 'ITAMOGI', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2618, '3133006', 'ITAMONTE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2619, '3133105', 'ITANHANDU', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2620, '3133204', 'ITANHOMI', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2621, '3133303', 'ITAOBIM', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2622, '3133402', 'ITAPAGIPE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2623, '3133501', 'ITAPECERICA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2624, '3133600', 'ITAPEVA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2625, '3133709', 'ITATIAIUÇU', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2626, '3133758', 'ITAÚ DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2627, '3133808', 'ITAÚNA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2628, '3133907', 'ITAVERAVA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2629, '3134004', 'ITINGA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2630, '3134103', 'ITUETA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2631, '3134202', 'ITUIUTABA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2632, '3134301', 'ITUMIRIM', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2633, '3134400', 'ITURAMA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2634, '3134509', 'ITUTINGA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2635, '3134608', 'JABOTICATUBAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2636, '3134707', 'JACINTO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2637, '3134806', 'JACUÍ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2638, '3134905', 'JACUTINGA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2639, '3135001', 'JAGUARAÇU', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2640, '3135050', 'JAÍBA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2641, '3135076', 'JAMPRUCA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2642, '3135100', 'JANAÚBA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2643, '3135209', 'JANUÁRIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2644, '3135308', 'JAPARAÍBA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2645, '3135357', 'JAPONVAR', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2646, '3135407', 'JECEABA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2647, '3135456', 'JENIPAPO DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2648, '3135506', 'JEQUERI', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2649, '3135605', 'JEQUITAÍ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2650, '3135704', 'JEQUITIBÁ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2651, '3135803', 'JEQUITINHONHA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2652, '3135902', 'JESUÂNIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2653, '3136009', 'JOAÍMA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2654, '3136108', 'JOANÉSIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2655, '3136207', 'JOÃO MONLEVADE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2656, '3136306', 'JOÃO PINHEIRO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2657, '3136405', 'JOAQUIM FELÍCIO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2658, '3136504', 'JORDÂNIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2659, '3136520', 'JOSÉ GONÇALVES DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2660, '3136553', 'JOSÉ RAYDAN', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2661, '3136579', 'JOSENÓPOLIS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2662, '3136652', 'JUATUBA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2663, '3136702', 'JUIZ DE FORA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2664, '3136801', 'JURAMENTO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2665, '3136900', 'JURUAIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2666, '3136959', 'JUVENÍLIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2667, '3137007', 'LADAINHA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2668, '3137106', 'LAGAMAR', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2669, '3137205', 'LAGOA DA PRATA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2670, '3137304', 'LAGOA DOS PATOS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2671, '3137403', 'LAGOA DOURADA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2672, '3137502', 'LAGOA FORMOSA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2673, '3137536', 'LAGOA GRANDE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2674, '3137601', 'LAGOA SANTA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2675, '3137700', 'LAJINHA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2676, '3137809', 'LAMBARI', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2677, '3137908', 'LAMIM', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2678, '3138005', 'LARANJAL', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2679, '3138104', 'LASSANCE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2680, '3138203', 'LAVRAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2681, '3138302', 'LEANDRO FERREIRA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2682, '3138351', 'LEME DO PRADO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2683, '3138401', 'LEOPOLDINA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2684, '3138500', 'LIBERDADE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2685, '3138609', 'LIMA DUARTE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2686, '3138625', 'LIMEIRA DO OESTE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2687, '3138658', 'LONTRA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2688, '3138674', 'LUISBURGO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2689, '3138682', 'LUISLÂNDIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2690, '3138708', 'LUMINÁRIAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2691, '3138807', 'LUZ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2692, '3138906', 'MACHACALIS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2693, '3139003', 'MACHADO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2694, '3139102', 'MADRE DE DEUS DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2695, '3139201', 'MALACACHETA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2696, '3139250', 'MAMONAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2697, '3139300', 'MANGA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2698, '3139409', 'MANHUAÇU', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2699, '3139508', 'MANHUMIRIM', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2700, '3139607', 'MANTENA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2701, '3139805', 'MAR DE ESPANHA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2702, '3139706', 'MARAVILHAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2703, '3139904', 'MARIA DA FÉ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2704, '3140001', 'MARIANA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2705, '3140100', 'MARILAC', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2706, '3140159', 'MÁRIO CAMPOS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2707, '3140209', 'MARIPÁ DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2708, '3140308', 'MARLIÉRIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2709, '3140407', 'MARMELÓPOLIS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2710, '3140506', 'MARTINHO CAMPOS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2711, '3140530', 'MARTINS SOARES', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2712, '3140555', 'MATA VERDE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2713, '3140605', 'MATERLÂNDIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2714, '3140704', 'MATEUS LEME', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2715, '3171501', 'MATHIAS LOBATO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2716, '3140803', 'MATIAS BARBOSA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2717, '3140852', 'MATIAS CARDOSO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2718, '3140902', 'MATIPÓ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2719, '3141009', 'MATO VERDE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2720, '3141108', 'MATOZINHOS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2721, '3141207', 'MATUTINA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2722, '3141306', 'MEDEIROS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2723, '3141405', 'MEDINA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2724, '3141504', 'MENDES PIMENTEL', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2725, '3141603', 'MERCÊS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2726, '3141702', 'MESQUITA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2727, '3141801', 'MINAS NOVAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2728, '3141900', 'MINDURI', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2729, '3142007', 'MIRABELA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2730, '3142106', 'MIRADOURO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2731, '3142205', 'MIRAÍ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2732, '3142254', 'MIRAVÂNIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2733, '3142304', 'MOEDA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2734, '3142403', 'MOEMA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2735, '3142502', 'MONJOLOS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2736, '3142601', 'MONSENHOR PAULO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2737, '3142700', 'MONTALVÂNIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2738, '3142809', 'MONTE ALEGRE DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2739, '3142908', 'MONTE AZUL', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2740, '3143005', 'MONTE BELO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2741, '3143104', 'MONTE CARMELO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2742, '3143153', 'MONTE FORMOSO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2743, '3143203', 'MONTE SANTO DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2744, '3143401', 'MONTE SIÃO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2745, '3143302', 'MONTES CLAROS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2746, '3143450', 'MONTEZUMA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2747, '3143500', 'MORADA NOVA DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2748, '3143609', 'MORRO DA GARÇA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2749, '3143708', 'MORRO DO PILAR', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2750, '3143807', 'MUNHOZ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2751, '3143906', 'MURIAÉ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2752, '3144003', 'MUTUM', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2753, '3144102', 'MUZAMBINHO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2754, '3144201', 'NACIP RAYDAN', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2755, '3144300', 'NANUQUE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2756, '3144359', 'NAQUE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2757, '3144375', 'NATALÂNDIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2758, '3144409', 'NATÉRCIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2759, '3144508', 'NAZARENO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2760, '3144607', 'NEPOMUCENO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2761, '3144656', 'NINHEIRA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2762, '3144672', 'NOVA BELÉM', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2763, '3144706', 'NOVA ERA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2764, '3144805', 'NOVA LIMA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2765, '3144904', 'NOVA MÓDICA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2766, '3145000', 'NOVA PONTE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2767, '3145059', 'NOVA PORTEIRINHA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2768, '3145109', 'NOVA RESENDE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2769, '3145208', 'NOVA SERRANA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2770, '3136603', 'NOVA UNIÃO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2771, '3145307', 'NOVO CRUZEIRO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2772, '3145356', 'NOVO ORIENTE DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2773, '3145372', 'NOVORIZONTE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2774, '3145406', 'OLARIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2775, '3145455', 'OLHOS-DÁGUA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2776, '3145505', 'OLÍMPIO NORONHA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2777, '3145604', 'OLIVEIRA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2778, '3145703', 'OLIVEIRA FORTES', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2779, '3145802', 'ONÇA DE PITANGUI', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2780, '3145851', 'ORATÓRIOS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2781, '3145877', 'ORIZÂNIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2782, '3145901', 'OURO BRANCO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2783, '3146008', 'OURO FINO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2784, '3146107', 'OURO PRETO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2785, '3146206', 'OURO VERDE DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2786, '3146255', 'PADRE CARVALHO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2787, '3146305', 'PADRE PARAÍSO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2788, '3146552', 'PAI PEDRO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2789, '3146404', 'PAINEIRAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2790, '3146503', 'PAINS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2791, '3146602', 'PAIVA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2792, '3146701', 'PALMA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2793, '3146750', 'PALMÓPOLIS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2794, '3146909', 'PAPAGAIOS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2795, '3147105', 'PARÁ DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2796, '3147006', 'PARACATU', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2797, '3147204', 'PARAGUAÇU', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2798, '3147303', 'PARAISÓPOLIS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2799, '3147402', 'PARAOPEBA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2800, '3147600', 'PASSA QUATRO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2801, '3147709', 'PASSA TEMPO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2802, '3147808', 'PASSA VINTE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2803, '3147501', 'PASSABÉM', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2804, '3147907', 'PASSOS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2805, '3147956', 'PATIS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2806, '3148004', 'PATOS DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2807, '3148103', 'PATROCÍNIO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2808, '3148202', 'PATROCÍNIO DO MURIAÉ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2809, '3148301', 'PAULA CÂNDIDO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2810, '3148400', 'PAULISTAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2811, '3148509', 'PAVÃO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2812, '3148608', 'PEÇANHA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2813, '3148707', 'PEDRA AZUL', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2814, '3148756', 'PEDRA BONITA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2815, '3148806', 'PEDRA DO ANTA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2816, '3148905', 'PEDRA DO INDAIÁ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2817, '3149002', 'PEDRA DOURADA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2818, '3149101', 'PEDRALVA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2819, '3149150', 'PEDRAS DE MARIA DA CRUZ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2820, '3149200', 'PEDRINÓPOLIS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2821, '3149309', 'PEDRO LEOPOLDO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2822, '3149408', 'PEDRO TEIXEIRA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2823, '3149507', 'PEQUERI', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2824, '3149606', 'PEQUI', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2825, '3149705', 'PERDIGÃO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2826, '3149804', 'PERDIZES', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2827, '3149903', 'PERDÕES', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2828, '3149952', 'PERIQUITO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2829, '3150000', 'PESCADOR', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2830, '3150109', 'PIAU', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2831, '3150158', 'PIEDADE DE CARATINGA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2832, '3150208', 'PIEDADE DE PONTE NOVA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2833, '3150307', 'PIEDADE DO RIO GRANDE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2834, '3150406', 'PIEDADE DOS GERAIS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2835, '3150505', 'PIMENTA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2836, '3150539', 'PINGO DÁGUA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2837, '3150570', 'PINTÓPOLIS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2838, '3150604', 'PIRACEMA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2839, '3150703', 'PIRAJUBA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2840, '3150802', 'PIRANGA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2841, '3150901', 'PIRANGUÇU', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2842, '3151008', 'PIRANGUINHO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2843, '3151107', 'PIRAPETINGA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2844, '3151206', 'PIRAPORA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2845, '3151305', 'PIRAÚBA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `municipios` (`id_municipio`, `codigo`, `municipio`, `id_uf`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2846, '3151404', 'PITANGUI', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2847, '3151503', 'PIUMHI', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2848, '3151602', 'PLANURA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2849, '3151701', 'POÇO FUNDO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2850, '3151800', 'POÇOS DE CALDAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2851, '3151909', 'POCRANE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2852, '3152006', 'POMPÉU', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2853, '3152105', 'PONTE NOVA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2854, '3152131', 'PONTO CHIQUE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2855, '3152170', 'PONTO DOS VOLANTES', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2856, '3152204', 'PORTEIRINHA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2857, '3152303', 'PORTO FIRME', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2858, '3152402', 'POTÉ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2859, '3152501', 'POUSO ALEGRE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2860, '3152600', 'POUSO ALTO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2861, '3152709', 'PRADOS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2862, '3152808', 'PRATA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2863, '3152907', 'PRATÁPOLIS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2864, '3153004', 'PRATINHA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2865, '3153103', 'PRESIDENTE BERNARDES', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2866, '3153202', 'PRESIDENTE JUSCELINO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2867, '3153301', 'PRESIDENTE KUBITSCHEK', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2868, '3153400', 'PRESIDENTE OLEGÁRIO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2869, '3153608', 'PRUDENTE DE MORAIS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2870, '3153707', 'QUARTEL GERAL', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2871, '3153806', 'QUELUZITO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2872, '3153905', 'RAPOSOS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2873, '3154002', 'RAUL SOARES', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2874, '3154101', 'RECREIO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2875, '3154150', 'REDUTO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2876, '3154200', 'RESENDE COSTA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2877, '3154309', 'RESPLENDOR', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2878, '3154408', 'RESSAQUINHA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2879, '3154457', 'RIACHINHO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2880, '3154507', 'RIACHO DOS MACHADOS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2881, '3154606', 'RIBEIRÃO DAS NEVES', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2882, '3154705', 'RIBEIRÃO VERMELHO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2883, '3154804', 'RIO ACIMA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2884, '3154903', 'RIO CASCA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2885, '3155108', 'RIO DO PRADO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2886, '3155009', 'RIO DOCE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2887, '3155207', 'RIO ESPERA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2888, '3155306', 'RIO MANSO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2889, '3155405', 'RIO NOVO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2890, '3155504', 'RIO PARANAÍBA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2891, '3155603', 'RIO PARDO DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2892, '3155702', 'RIO PIRACICABA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2893, '3155801', 'RIO POMBA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2894, '3155900', 'RIO PRETO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2895, '3156007', 'RIO VERMELHO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2896, '3156106', 'RITÁPOLIS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2897, '3156205', 'ROCHEDO DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2898, '3156304', 'RODEIRO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2899, '3156403', 'ROMARIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2900, '3156452', 'ROSÁRIO DA LIMEIRA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2901, '3156502', 'RUBELITA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2902, '3156601', 'RUBIM', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2903, '3156700', 'SABARÁ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2904, '3156809', 'SABINÓPOLIS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2905, '3156908', 'SACRAMENTO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2906, '3157005', 'SALINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2907, '3157104', 'SALTO DA DIVISA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2908, '3157203', 'SANTA BÁRBARA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2909, '3157252', 'SANTA BÁRBARA DO LESTE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2910, '3157278', 'SANTA BÁRBARA DO MONTE VERDE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2911, '3157302', 'SANTA BÁRBARA DO TUGÚRIO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2912, '3157336', 'SANTA CRUZ DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2913, '3157377', 'SANTA CRUZ DE SALINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2914, '3157401', 'SANTA CRUZ DO ESCALVADO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2915, '3157500', 'SANTA EFIGÊNIA DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2916, '3157609', 'SANTA FÉ DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2917, '3157658', 'SANTA HELENA DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2918, '3157708', 'SANTA JULIANA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2919, '3157807', 'SANTA LUZIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2920, '3157906', 'SANTA MARGARIDA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2921, '3158003', 'SANTA MARIA DE ITABIRA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2922, '3158102', 'SANTA MARIA DO SALTO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2923, '3158201', 'SANTA MARIA DO SUAÇUÍ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2924, '3159209', 'SANTA RITA DE CALDAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2925, '3159407', 'SANTA RITA DE IBITIPOCA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2926, '3159308', 'SANTA RITA DE JACUTINGA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2927, '3159357', 'SANTA RITA DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2928, '3159506', 'SANTA RITA DO ITUETO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2929, '3159605', 'SANTA RITA DO SAPUCAÍ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2930, '3159704', 'SANTA ROSA DA SERRA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2931, '3159803', 'SANTA VITÓRIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2932, '3158300', 'SANTANA DA VARGEM', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2933, '3158409', 'SANTANA DE CATAGUASES', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2934, '3158508', 'SANTANA DE PIRAPAMA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2935, '3158607', 'SANTANA DO DESERTO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2936, '3158706', 'SANTANA DO GARAMBÉU', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2937, '3158805', 'SANTANA DO JACARÉ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2938, '3158904', 'SANTANA DO MANHUAÇU', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2939, '3158953', 'SANTANA DO PARAÍSO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2940, '3159001', 'SANTANA DO RIACHO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2941, '3159100', 'SANTANA DOS MONTES', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2942, '3159902', 'SANTO ANTÔNIO DO AMPARO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2943, '3160009', 'SANTO ANTÔNIO DO AVENTUREIRO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2944, '3160108', 'SANTO ANTÔNIO DO GRAMA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2945, '3160207', 'SANTO ANTÔNIO DO ITAMBÉ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2946, '3160306', 'SANTO ANTÔNIO DO JACINTO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2947, '3160405', 'SANTO ANTÔNIO DO MONTE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2948, '3160454', 'SANTO ANTÔNIO DO RETIRO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2949, '3160504', 'SANTO ANTÔNIO DO RIO ABAIXO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2950, '3160603', 'SANTO HIPÓLITO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2951, '3160702', 'SANTOS DUMONT', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2952, '3160801', 'SÃO BENTO ABADE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2953, '3160900', 'SÃO BRÁS DO SUAÇUÍ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2954, '3160959', 'SÃO DOMINGOS DAS DORES', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2955, '3161007', 'SÃO DOMINGOS DO PRATA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2956, '3161056', 'SÃO FÉLIX DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2957, '3161106', 'SÃO FRANCISCO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2958, '3161205', 'SÃO FRANCISCO DE PAULA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2959, '3161304', 'SÃO FRANCISCO DE SALES', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2960, '3161403', 'SÃO FRANCISCO DO GLÓRIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2961, '3161502', 'SÃO GERALDO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2962, '3161601', 'SÃO GERALDO DA PIEDADE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2963, '3161650', 'SÃO GERALDO DO BAIXIO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2964, '3161700', 'SÃO GONÇALO DO ABAETÉ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2965, '3161809', 'SÃO GONÇALO DO PARÁ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2966, '3161908', 'SÃO GONÇALO DO RIO ABAIXO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2967, '3125507', 'SÃO GONÇALO DO RIO PRETO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2968, '3162005', 'SÃO GONÇALO DO SAPUCAÍ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2969, '3162104', 'SÃO GOTARDO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2970, '3162203', 'SÃO JOÃO BATISTA DO GLÓRIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2971, '3162252', 'SÃO JOÃO DA LAGOA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2972, '3162302', 'SÃO JOÃO DA MATA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2973, '3162401', 'SÃO JOÃO DA PONTE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2974, '3162450', 'SÃO JOÃO DAS MISSÕES', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2975, '3162500', 'SÃO JOÃO DEL REI', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2976, '3162559', 'SÃO JOÃO DO MANHUAÇU', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2977, '3162575', 'SÃO JOÃO DO MANTENINHA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2978, '3162609', 'SÃO JOÃO DO ORIENTE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2979, '3162658', 'SÃO JOÃO DO PACUÍ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2980, '3162708', 'SÃO JOÃO DO PARAÍSO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2981, '3162807', 'SÃO JOÃO EVANGELISTA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2982, '3162906', 'SÃO JOÃO NEPOMUCENO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2983, '3162922', 'SÃO JOAQUIM DE BICAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2984, '3162948', 'SÃO JOSÉ DA BARRA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2985, '3162955', 'SÃO JOSÉ DA LAPA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2986, '3163003', 'SÃO JOSÉ DA SAFIRA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2987, '3163102', 'SÃO JOSÉ DA VARGINHA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2988, '3163201', 'SÃO JOSÉ DO ALEGRE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2989, '3163300', 'SÃO JOSÉ DO DIVINO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2990, '3163409', 'SÃO JOSÉ DO GOIABAL', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2991, '3163508', 'SÃO JOSÉ DO JACURI', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2992, '3163607', 'SÃO JOSÉ DO MANTIMENTO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2993, '3163706', 'SÃO LOURENÇO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2994, '3163805', 'SÃO MIGUEL DO ANTA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2995, '3163904', 'SÃO PEDRO DA UNIÃO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2996, '3164100', 'SÃO PEDRO DO SUAÇUÍ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2997, '3164001', 'SÃO PEDRO DOS FERROS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2998, '3164209', 'SÃO ROMÃO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2999, '3164308', 'SÃO ROQUE DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3000, '3164407', 'SÃO SEBASTIÃO DA BELA VISTA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3001, '3164431', 'SÃO SEBASTIÃO DA VARGEM ALEGRE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3002, '3164472', 'SÃO SEBASTIÃO DO ANTA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3003, '3164506', 'SÃO SEBASTIÃO DO MARANHÃO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3004, '3164605', 'SÃO SEBASTIÃO DO OESTE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3005, '3164704', 'SÃO SEBASTIÃO DO PARAÍSO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3006, '3164803', 'SÃO SEBASTIÃO DO RIO PRETO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3007, '3164902', 'SÃO SEBASTIÃO DO RIO VERDE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3008, '3165008', 'SÃO TIAGO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3009, '3165107', 'SÃO TOMÁS DE AQUINO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3010, '3165206', 'SÃO TOMÉ DAS LETRAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3011, '3165305', 'SÃO VICENTE DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3012, '3165404', 'SAPUCAÍ-MIRIM', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3013, '3165503', 'SARDOÁ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3014, '3165537', 'SARZEDO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3015, '3165560', 'SEM-PEIXE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3016, '3165578', 'SENADOR AMARAL', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3017, '3165602', 'SENADOR CORTES', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3018, '3165701', 'SENADOR FIRMINO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3019, '3165800', 'SENADOR JOSÉ BENTO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3020, '3165909', 'SENADOR MODESTINO GONÇALVES', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3021, '3166006', 'SENHORA DE OLIVEIRA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3022, '3166105', 'SENHORA DO PORTO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3023, '3166204', 'SENHORA DOS REMÉDIOS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3024, '3166303', 'SERICITA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3025, '3166402', 'SERITINGA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3026, '3166501', 'SERRA AZUL DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3027, '3166600', 'SERRA DA SAUDADE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3028, '3166808', 'SERRA DO SALITRE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3029, '3166709', 'SERRA DOS AIMORÉS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3030, '3166907', 'SERRANIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3031, '3166956', 'SERRANÓPOLIS DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3032, '3167004', 'SERRANOS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3033, '3167103', 'SERRO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3034, '3167202', 'SETE LAGOAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3035, '3165552', 'SETUBINHA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3036, '3167301', 'SILVEIRÂNIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3037, '3167400', 'SILVIANÓPOLIS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3038, '3167509', 'SIMÃO PEREIRA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3039, '3167608', 'SIMONÉSIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3040, '3167707', 'SOBRÁLIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3041, '3167806', 'SOLEDADE DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3042, '3167905', 'TABULEIRO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3043, '3168002', 'TAIOBEIRAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3044, '3168051', 'TAPARUBA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3045, '3168101', 'TAPIRA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3046, '3168200', 'TAPIRAÍ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3047, '3168309', 'TAQUARAÇU DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3048, '3168408', 'TARUMIRIM', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3049, '3168507', 'TEIXEIRAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3050, '3168606', 'TEÓFILO OTONI', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3051, '3168705', 'TIMÓTEO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3052, '3168804', 'TIRADENTES', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3053, '3168903', 'TIROS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3054, '3169000', 'TOCANTINS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3055, '3169059', 'TOCOS DO MOJI', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3056, '3169109', 'TOLEDO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3057, '3169208', 'TOMBOS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3058, '3169307', 'TRÊS CORAÇÕES', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3059, '3169356', 'TRÊS MARIAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3060, '3169406', 'TRÊS PONTAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3061, '3169505', 'TUMIRITINGA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3062, '3169604', 'TUPACIGUARA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3063, '3169703', 'TURMALINA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3064, '3169802', 'TURVOLÂNDIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3065, '3169901', 'UBÁ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3066, '3170008', 'UBAÍ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3067, '3170057', 'UBAPORANGA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3068, '3170107', 'UBERABA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3069, '3170206', 'UBERLÂNDIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3070, '3170305', 'UMBURATIBA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3071, '3170404', 'UNAÍ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3072, '3170438', 'UNIÃO DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3073, '3170479', 'URUANA DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3074, '3170503', 'URUCÂNIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3075, '3170529', 'URUCUIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3076, '3170578', 'VARGEM ALEGRE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3077, '3170602', 'VARGEM BONITA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3078, '3170651', 'VARGEM GRANDE DO RIO PARDO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3079, '3170701', 'VARGINHA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3080, '3170750', 'VARJÃO DE MINAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3081, '3170800', 'VÁRZEA DA PALMA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3082, '3170909', 'VARZELÂNDIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3083, '3171006', 'VAZANTE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3084, '3171030', 'VERDELÂNDIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3085, '3171071', 'VEREDINHA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3086, '3171105', 'VERÍSSIMO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3087, '3171154', 'VERMELHO NOVO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3088, '3171204', 'VESPASIANO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3089, '3171303', 'VIÇOSA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3090, '3171402', 'VIEIRAS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3091, '3171600', 'VIRGEM DA LAPA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3092, '3171709', 'VIRGÍNIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3093, '3171808', 'VIRGINÓPOLIS', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3094, '3171907', 'VIRGOLÂNDIA', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3095, '3172004', 'VISCONDE DO RIO BRANCO', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3096, '3172103', 'VOLTA GRANDE', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3097, '3172202', 'WENCESLAU BRAZ', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3098, '3200102', 'AFONSO CLÁUDIO', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3099, '3200169', 'ÁGUA DOCE DO NORTE', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3100, '3200136', 'ÁGUIA BRANCA', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3101, '3200201', 'ALEGRE', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3102, '3200300', 'ALFREDO CHAVES', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3103, '3200359', 'ALTO RIO NOVO', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3104, '3200409', 'ANCHIETA', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3105, '3200508', 'APIACÁ', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3106, '3200607', 'ARACRUZ', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3107, '3200706', 'ATÍLIO VIVACQUA', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3108, '3200805', 'BAIXO GUANDU', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3109, '3200904', 'BARRA DE SÃO FRANCISCO', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3110, '3201001', 'BOA ESPERANÇA', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3111, '3201100', 'BOM JESUS DO NORTE', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3112, '3201159', 'BREJETUBA', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3113, '3201209', 'CACHOEIRO DE ITAPEMIRIM', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3114, '3201308', 'CARIACICA', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3115, '3201407', 'CASTELO', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3116, '3201506', 'COLATINA', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3117, '3201605', 'CONCEIÇÃO DA BARRA', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3118, '3201704', 'CONCEIÇÃO DO CASTELO', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3119, '3201803', 'DIVINO DE SÃO LOURENÇO', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3120, '3201902', 'DOMINGOS MARTINS', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3121, '3202009', 'DORES DO RIO PRETO', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3122, '3202108', 'ECOPORANGA', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3123, '3202207', 'FUNDÃO', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3124, '3202256', 'GOVERNADOR LINDENBERG', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3125, '3202306', 'GUAÇUÍ', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3126, '3202405', 'GUARAPARI', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3127, '3202454', 'IBATIBA', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3128, '3202504', 'IBIRAÇU', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3129, '3202553', 'IBITIRAMA', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3130, '3202603', 'ICONHA', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3131, '3202652', 'IRUPI', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3132, '3202702', 'ITAGUAÇU', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3133, '3202801', 'ITAPEMIRIM', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3134, '3202900', 'ITARANA', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3135, '3203007', 'IÚNA', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3136, '3203056', 'JAGUARÉ', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3137, '3203106', 'JERÔNIMO MONTEIRO', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3138, '3203130', 'JOÃO NEIVA', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3139, '3203163', 'LARANJA DA TERRA', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3140, '3203205', 'LINHARES', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3141, '3203304', 'MANTENÓPOLIS', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3142, '3203320', 'MARATAÍZES', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3143, '3203346', 'MARECHAL FLORIANO', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3144, '3203353', 'MARILÂNDIA', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3145, '3203403', 'MIMOSO DO SUL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3146, '3203502', 'MONTANHA', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3147, '3203601', 'MUCURICI', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3148, '3203700', 'MUNIZ FREIRE', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3149, '3203809', 'MUQUI', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3150, '3203908', 'NOVA VENÉCIA', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3151, '3204005', 'PANCAS', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3152, '3204054', 'PEDRO CANÁRIO', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3153, '3204104', 'PINHEIROS', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3154, '3204203', 'PIÚMA', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3155, '3204252', 'PONTO BELO', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3156, '3204302', 'PRESIDENTE KENNEDY', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3157, '3204351', 'RIO BANANAL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3158, '3204401', 'RIO NOVO DO SUL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3159, '3204500', 'SANTA LEOPOLDINA', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3160, '3204559', 'SANTA MARIA DE JETIBÁ', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3161, '3204609', 'SANTA TERESA', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3162, '3204658', 'SÃO DOMINGOS DO NORTE', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3163, '3204708', 'SÃO GABRIEL DA PALHA', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3164, '3204807', 'SÃO JOSÉ DO CALÇADO', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3165, '3204906', 'SÃO MATEUS', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3166, '3204955', 'SÃO ROQUE DO CANAÃ', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3167, '3205002', 'SERRA', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3168, '3205010', 'SOORETAMA', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3169, '3205036', 'VARGEM ALTA', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3170, '3205069', 'VENDA NOVA DO IMIGRANTE', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3171, '3205101', 'VIANA', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3172, '3205150', 'VILA PAVÃO', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3173, '3205176', 'VILA VALÉRIO', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3174, '3205200', 'VILA VELHA', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3175, '3205309', 'VITÓRIA', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3176, '3300100', 'ANGRA DOS REIS', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3177, '3300159', 'APERIBÉ', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3178, '3300209', 'ARARUAMA', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3179, '3300225', 'AREAL', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3180, '3300233', 'ARMAÇÃO DOS BÚZIOS', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3181, '3300258', 'ARRAIAL DO CABO', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3182, '3300308', 'BARRA DO PIRAÍ', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3183, '3300407', 'BARRA MANSA', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3184, '3300456', 'BELFORD ROXO', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3185, '3300506', 'BOM JARDIM', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3186, '3300605', 'BOM JESUS DO ITABAPOANA', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3187, '3300704', 'CABO FRIO', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3188, '3300803', 'CACHOEIRAS DE MACACU', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3189, '3300902', 'CAMBUCI', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3190, '3301009', 'CAMPOS DOS GOYTACAZES', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3191, '3301108', 'CANTAGALO', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3192, '3300936', 'CARAPEBUS', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3193, '3301157', 'CARDOSO MOREIRA', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3194, '3301207', 'CARMO', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3195, '3301306', 'CASIMIRO DE ABREU', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3196, '3300951', 'COMENDADOR LEVY GASPARIAN', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3197, '3301405', 'CONCEIÇÃO DE MACABU', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3198, '3301504', 'CORDEIRO', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3199, '3301603', 'DUAS BARRAS', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3200, '3301702', 'DUQUE DE CAXIAS', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3201, '3301801', 'ENGENHEIRO PAULO DE FRONTIN', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3202, '3301850', 'GUAPIMIRIM', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3203, '3301876', 'IGUABA GRANDE', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3204, '3301900', 'ITABORAÍ', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3205, '3302007', 'ITAGUAÍ', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3206, '3302056', 'ITALVA', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3207, '3302106', 'ITAOCARA', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3208, '3302205', 'ITAPERUNA', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3209, '3302254', 'ITATIAIA', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3210, '3302270', 'JAPERI', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3211, '3302304', 'LAJE DO MURIAÉ', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3212, '3302403', 'MACAÉ', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3213, '3302452', 'MACUCO', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3214, '3302502', 'MAGÉ', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3215, '3302601', 'MANGARATIBA', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3216, '3302700', 'MARICÁ', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3217, '3302809', 'MENDES', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3218, '3302858', 'MESQUITA', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3219, '3302908', 'MIGUEL PEREIRA', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3220, '3303005', 'MIRACEMA', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3221, '3303104', 'NATIVIDADE', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3222, '3303203', 'NILÓPOLIS', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3223, '3303302', 'NITERÓI', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3224, '3303401', 'NOVA FRIBURGO', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3225, '3303500', 'NOVA IGUAÇU', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3226, '3303609', 'PARACAMBI', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3227, '3303708', 'PARAÍBA DO SUL', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3228, '3303807', 'PARATY', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3229, '3303856', 'PATY DO ALFERES', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3230, '3303906', 'PETRÓPOLIS', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3231, '3303955', 'PINHEIRAL', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3232, '3304003', 'PIRAÍ', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3233, '3304102', 'PORCIÚNCULA', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3234, '3304110', 'PORTO REAL', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3235, '3304128', 'QUATIS', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3236, '3304144', 'QUEIMADOS', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3237, '3304151', 'QUISSAMÃ', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3238, '3304201', 'RESENDE', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3239, '3304300', 'RIO BONITO', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3240, '3304409', 'RIO CLARO', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3241, '3304508', 'RIO DAS FLORES', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3242, '3304524', 'RIO DAS OSTRAS', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3243, '3304557', 'RIO DE JANEIRO', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3244, '3304607', 'SANTA MARIA MADALENA', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3245, '3304706', 'SANTO ANTÔNIO DE PÁDUA', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3246, '3304805', 'SÃO FIDÉLIS', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3247, '3304755', 'SÃO FRANCISCO DE ITABAPOANA', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3248, '3304904', 'SÃO GONÇALO', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3249, '3305000', 'SÃO JOÃO DA BARRA', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3250, '3305109', 'SÃO JOÃO DE MERITI', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3251, '3305133', 'SÃO JOSÉ DE UBÁ', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3252, '3305158', 'SÃO JOSÉ DO VALE DO RIO PRETO', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3253, '3305208', 'SÃO PEDRO DA ALDEIA', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3254, '3305307', 'SÃO SEBASTIÃO DO ALTO', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3255, '3305406', 'SAPUCAIA', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3256, '3305505', 'SAQUAREMA', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3257, '3305554', 'SEROPÉDICA', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3258, '3305604', 'SILVA JARDIM', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3259, '3305703', 'SUMIDOURO', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3260, '3305752', 'TANGUÁ', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3261, '3305802', 'TERESÓPOLIS', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3262, '3305901', 'TRAJANO DE MORAES', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3263, '3306008', 'TRÊS RIOS', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3264, '3306107', 'VALENÇA', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3265, '3306156', 'VARRE-SAI', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3266, '3306206', 'VASSOURAS', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3267, '3306305', 'VOLTA REDONDA', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3268, '3500105', 'ADAMANTINA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3269, '3500204', 'ADOLFO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3270, '3500303', 'AGUAÍ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3271, '3500402', 'ÁGUAS DA PRATA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3272, '3500501', 'ÁGUAS DE LINDÓIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3273, '3500550', 'ÁGUAS DE SANTA BÁRBARA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3274, '3500600', 'ÁGUAS DE SÃO PEDRO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3275, '3500709', 'AGUDOS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3276, '3500758', 'ALAMBARI', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3277, '3500808', 'ALFREDO MARCONDES', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3278, '3500907', 'ALTAIR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3279, '3501004', 'ALTINÓPOLIS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3280, '3501103', 'ALTO ALEGRE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3281, '3501152', 'ALUMÍNIO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3282, '3501202', 'ÁLVARES FLORENCE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3283, '3501301', 'ÁLVARES MACHADO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3284, '3501400', 'ÁLVARO DE CARVALHO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3285, '3501509', 'ALVINLÂNDIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3286, '3501608', 'AMERICANA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3287, '3501707', 'AMÉRICO BRASILIENSE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3288, '3501806', 'AMÉRICO DE CAMPOS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3289, '3501905', 'AMPARO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3290, '3502002', 'ANALÂNDIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3291, '3502101', 'ANDRADINA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3292, '3502200', 'ANGATUBA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3293, '3502309', 'ANHEMBI', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3294, '3502408', 'ANHUMAS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3295, '3502507', 'APARECIDA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3296, '3502606', 'APARECIDA DOESTE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3297, '3502705', 'APIAÍ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3298, '3502754', 'ARAÇARIGUAMA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3299, '3502804', 'ARAÇATUBA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3300, '3502903', 'ARAÇOIABA DA SERRA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3301, '3503000', 'ARAMINA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3302, '3503109', 'ARANDU', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3303, '3503158', 'ARAPEÍ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3304, '3503208', 'ARARAQUARA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3305, '3503307', 'ARARAS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3306, '3503356', 'ARCO-ÍRIS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3307, '3503406', 'AREALVA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3308, '3503505', 'AREIAS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3309, '3503604', 'AREIÓPOLIS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3310, '3503703', 'ARIRANHA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `municipios` (`id_municipio`, `codigo`, `municipio`, `id_uf`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3311, '3503802', 'ARTUR NOGUEIRA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3312, '3503901', 'ARUJÁ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3313, '3503950', 'ASPÁSIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3314, '3504008', 'ASSIS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3315, '3504107', 'ATIBAIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3316, '3504206', 'AURIFLAMA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3317, '3504305', 'AVAÍ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3318, '3504404', 'AVANHANDAVA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3319, '3504503', 'AVARÉ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3320, '3504602', 'BADY BASSITT', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3321, '3504701', 'BALBINOS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3322, '3504800', 'BÁLSAMO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3323, '3504909', 'BANANAL', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3324, '3505005', 'BARÃO DE ANTONINA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3325, '3505104', 'BARBOSA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3326, '3505203', 'BARIRI', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3327, '3505302', 'BARRA BONITA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3328, '3505351', 'BARRA DO CHAPÉU', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3329, '3505401', 'BARRA DO TURVO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3330, '3505500', 'BARRETOS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3331, '3505609', 'BARRINHA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3332, '3505708', 'BARUERI', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3333, '3505807', 'BASTOS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3334, '3505906', 'BATATAIS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3335, '3506003', 'BAURU', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3336, '3506102', 'BEBEDOURO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3337, '3506201', 'BENTO DE ABREU', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3338, '3506300', 'BERNARDINO DE CAMPOS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3339, '3506359', 'BERTIOGA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3340, '3506409', 'BILAC', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3341, '3506508', 'BIRIGUI', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3342, '3506607', 'BIRITIBA MIRIM', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3343, '3506706', 'BOA ESPERANÇA DO SUL', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3344, '3506805', 'BOCAINA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3345, '3506904', 'BOFETE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3346, '3507001', 'BOITUVA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3347, '3507100', 'BOM JESUS DOS PERDÕES', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3348, '3507159', 'BOM SUCESSO DE ITARARÉ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3349, '3507209', 'BORÁ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3350, '3507308', 'BORACÉIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3351, '3507407', 'BORBOREMA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3352, '3507456', 'BOREBI', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3353, '3507506', 'BOTUCATU', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3354, '3507605', 'BRAGANÇA PAULISTA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3355, '3507704', 'BRAÚNA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3356, '3507753', 'BREJO ALEGRE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3357, '3507803', 'BRODOWSKI', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3358, '3507902', 'BROTAS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3359, '3508009', 'BURI', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3360, '3508108', 'BURITAMA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3361, '3508207', 'BURITIZAL', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3362, '3508306', 'CABRÁLIA PAULISTA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3363, '3508405', 'CABREÚVA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3364, '3508504', 'CAÇAPAVA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3365, '3508603', 'CACHOEIRA PAULISTA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3366, '3508702', 'CACONDE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3367, '3508801', 'CAFELÂNDIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3368, '3508900', 'CAIABU', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3369, '3509007', 'CAIEIRAS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3370, '3509106', 'CAIUÁ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3371, '3509205', 'CAJAMAR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3372, '3509254', 'CAJATI', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3373, '3509304', 'CAJOBI', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3374, '3509403', 'CAJURU', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3375, '3509452', 'CAMPINA DO MONTE ALEGRE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3376, '3509502', 'CAMPINAS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3377, '3509601', 'CAMPO LIMPO PAULISTA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3378, '3509700', 'CAMPOS DO JORDÃO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3379, '3509809', 'CAMPOS NOVOS PAULISTA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3380, '3509908', 'CANANÉIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3381, '3509957', 'CANAS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3382, '3510005', 'CÂNDIDO MOTA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3383, '3510104', 'CÂNDIDO RODRIGUES', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3384, '3510153', 'CANITAR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3385, '3510203', 'CAPÃO BONITO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3386, '3510302', 'CAPELA DO ALTO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3387, '3510401', 'CAPIVARI', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3388, '3510500', 'CARAGUATATUBA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3389, '3510609', 'CARAPICUÍBA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3390, '3510708', 'CARDOSO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3391, '3510807', 'CASA BRANCA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3392, '3510906', 'CÁSSIA DOS COQUEIROS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3393, '3511003', 'CASTILHO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3394, '3511102', 'CATANDUVA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3395, '3511201', 'CATIGUÁ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3396, '3511300', 'CEDRAL', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3397, '3511409', 'CERQUEIRA CÉSAR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3398, '3511508', 'CERQUILHO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3399, '3511607', 'CESÁRIO LANGE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3400, '3511706', 'CHARQUEADA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3401, '3557204', 'CHAVANTES', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3402, '3511904', 'CLEMENTINA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3403, '3512001', 'COLINA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3404, '3512100', 'COLÔMBIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3405, '3512209', 'CONCHAL', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3406, '3512308', 'CONCHAS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3407, '3512407', 'CORDEIRÓPOLIS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3408, '3512506', 'COROADOS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3409, '3512605', 'CORONEL MACEDO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3410, '3512704', 'CORUMBATAÍ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3411, '3512803', 'COSMÓPOLIS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3412, '3512902', 'COSMORAMA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3413, '3513009', 'COTIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3414, '3513108', 'CRAVINHOS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3415, '3513207', 'CRISTAIS PAULISTA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3416, '3513306', 'CRUZÁLIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3417, '3513405', 'CRUZEIRO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3418, '3513504', 'CUBATÃO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3419, '3513603', 'CUNHA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3420, '3513702', 'DESCALVADO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3421, '3513801', 'DIADEMA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3422, '3513850', 'DIRCE REIS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3423, '3513900', 'DIVINOLÂNDIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3424, '3514007', 'DOBRADA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3425, '3514106', 'DOIS CÓRREGOS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3426, '3514205', 'DOLCINÓPOLIS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3427, '3514304', 'DOURADO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3428, '3514403', 'DRACENA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3429, '3514502', 'DUARTINA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3430, '3514601', 'DUMONT', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3431, '3514700', 'ECHAPORÃ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3432, '3514809', 'ELDORADO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3433, '3514908', 'ELIAS FAUSTO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3434, '3514924', 'ELISIÁRIO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3435, '3514957', 'EMBAÚBA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3436, '3515004', 'EMBU DAS ARTES', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3437, '3515103', 'EMBU-GUAÇU', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3438, '3515129', 'EMILIANÓPOLIS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3439, '3515152', 'ENGENHEIRO COELHO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3440, '3515186', 'ESPÍRITO SANTO DO PINHAL', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3441, '3515194', 'ESPÍRITO SANTO DO TURVO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3442, '3557303', 'ESTIVA GERBI', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3443, '3515301', 'ESTRELA DO NORTE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3444, '3515202', 'ESTRELA DOESTE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3445, '3515350', 'EUCLIDES DA CUNHA PAULISTA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3446, '3515400', 'FARTURA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3447, '3515608', 'FERNANDO PRESTES', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3448, '3515509', 'FERNANDÓPOLIS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3449, '3515657', 'FERNÃO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3450, '3515707', 'FERRAZ DE VASCONCELOS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3451, '3515806', 'FLORA RICA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3452, '3515905', 'FLOREAL', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3453, '3516002', 'FLÓRIDA PAULISTA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3454, '3516101', 'FLORÍNEA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3455, '3516200', 'FRANCA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3456, '3516309', 'FRANCISCO MORATO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3457, '3516408', 'FRANCO DA ROCHA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3458, '3516507', 'GABRIEL MONTEIRO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3459, '3516606', 'GÁLIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3460, '3516705', 'GARÇA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3461, '3516804', 'GASTÃO VIDIGAL', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3462, '3516853', 'GAVIÃO PEIXOTO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3463, '3516903', 'GENERAL SALGADO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3464, '3517000', 'GETULINA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3465, '3517109', 'GLICÉRIO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3466, '3517208', 'GUAIÇARA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3467, '3517307', 'GUAIMBÊ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3468, '3517406', 'GUAÍRA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3469, '3517505', 'GUAPIAÇU', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3470, '3517604', 'GUAPIARA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3471, '3517703', 'GUARÁ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3472, '3517802', 'GUARAÇAÍ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3473, '3517901', 'GUARACI', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3474, '3518008', 'GUARANI DOESTE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3475, '3518107', 'GUARANTÃ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3476, '3518206', 'GUARARAPES', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3477, '3518305', 'GUARAREMA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3478, '3518404', 'GUARATINGUETÁ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3479, '3518503', 'GUAREÍ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3480, '3518602', 'GUARIBA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3481, '3518701', 'GUARUJÁ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3482, '3518800', 'GUARULHOS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3483, '3518859', 'GUATAPARÁ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3484, '3518909', 'GUZOLÂNDIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3485, '3519006', 'HERCULÂNDIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3486, '3519055', 'HOLAMBRA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3487, '3519071', 'HORTOLÂNDIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3488, '3519105', 'IACANGA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3489, '3519204', 'IACRI', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3490, '3519253', 'IARAS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3491, '3519303', 'IBATÉ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3492, '3519402', 'IBIRÁ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3493, '3519501', 'IBIRAREMA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3494, '3519600', 'IBITINGA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3495, '3519709', 'IBIÚNA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3496, '3519808', 'ICÉM', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3497, '3519907', 'IEPÊ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3498, '3520004', 'IGARAÇU DO TIETÊ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3499, '3520103', 'IGARAPAVA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3500, '3520202', 'IGARATÁ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3501, '3520301', 'IGUAPE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3502, '3520426', 'ILHA COMPRIDA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3503, '3520442', 'ILHA SOLTEIRA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3504, '3520400', 'ILHABELA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3505, '3520509', 'INDAIATUBA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3506, '3520608', 'INDIANA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3507, '3520707', 'INDIAPORÃ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3508, '3520806', 'INÚBIA PAULISTA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3509, '3520905', 'IPAUSSU', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3510, '3521002', 'IPERÓ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3511, '3521101', 'IPEÚNA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3512, '3521150', 'IPIGUÁ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3513, '3521200', 'IPORANGA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3514, '3521309', 'IPUÃ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3515, '3521408', 'IRACEMÁPOLIS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3516, '3521507', 'IRAPUÃ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3517, '3521606', 'IRAPURU', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3518, '3521705', 'ITABERÁ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3519, '3521804', 'ITAÍ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3520, '3521903', 'ITAJOBI', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3521, '3522000', 'ITAJU', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3522, '3522109', 'ITANHAÉM', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3523, '3522158', 'ITAOCA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3524, '3522208', 'ITAPECERICA DA SERRA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3525, '3522307', 'ITAPETININGA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3526, '3522406', 'ITAPEVA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3527, '3522505', 'ITAPEVI', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3528, '3522604', 'ITAPIRA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3529, '3522653', 'ITAPIRAPUÃ PAULISTA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3530, '3522703', 'ITÁPOLIS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3531, '3522802', 'ITAPORANGA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3532, '3522901', 'ITAPUÍ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3533, '3523008', 'ITAPURA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3534, '3523107', 'ITAQUAQUECETUBA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3535, '3523206', 'ITARARÉ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3536, '3523305', 'ITARIRI', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3537, '3523404', 'ITATIBA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3538, '3523503', 'ITATINGA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3539, '3523602', 'ITIRAPINA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3540, '3523701', 'ITIRAPUÃ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3541, '3523800', 'ITOBI', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3542, '3523909', 'ITU', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3543, '3524006', 'ITUPEVA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3544, '3524105', 'ITUVERAVA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3545, '3524204', 'JABORANDI', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3546, '3524303', 'JABOTICABAL', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3547, '3524402', 'JACAREÍ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3548, '3524501', 'JACI', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3549, '3524600', 'JACUPIRANGA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3550, '3524709', 'JAGUARIÚNA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3551, '3524808', 'JALES', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3552, '3524907', 'JAMBEIRO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3553, '3525003', 'JANDIRA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3554, '3525102', 'JARDINÓPOLIS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3555, '3525201', 'JARINU', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3556, '3525300', 'JAÚ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3557, '3525409', 'JERIQUARA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3558, '3525508', 'JOANÓPOLIS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3559, '3525607', 'JOÃO RAMALHO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3560, '3525706', 'JOSÉ BONIFÁCIO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3561, '3525805', 'JÚLIO MESQUITA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3562, '3525854', 'JUMIRIM', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3563, '3525904', 'JUNDIAÍ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3564, '3526001', 'JUNQUEIRÓPOLIS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3565, '3526100', 'JUQUIÁ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3566, '3526209', 'JUQUITIBA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3567, '3526308', 'LAGOINHA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3568, '3526407', 'LARANJAL PAULISTA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3569, '3526506', 'LAVÍNIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3570, '3526605', 'LAVRINHAS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3571, '3526704', 'LEME', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3572, '3526803', 'LENÇÓIS PAULISTA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3573, '3526902', 'LIMEIRA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3574, '3527009', 'LINDÓIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3575, '3527108', 'LINS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3576, '3527207', 'LORENA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3577, '3527256', 'LOURDES', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3578, '3527306', 'LOUVEIRA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3579, '3527405', 'LUCÉLIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3580, '3527504', 'LUCIANÓPOLIS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3581, '3527603', 'LUÍS ANTÔNIO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3582, '3527702', 'LUIZIÂNIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3583, '3527801', 'LUPÉRCIO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3584, '3527900', 'LUTÉCIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3585, '3528007', 'MACATUBA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3586, '3528106', 'MACAUBAL', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3587, '3528205', 'MACEDÔNIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3588, '3528304', 'MAGDA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3589, '3528403', 'MAIRINQUE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3590, '3528502', 'MAIRIPORÃ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3591, '3528601', 'MANDURI', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3592, '3528700', 'MARABÁ PAULISTA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3593, '3528809', 'MARACAÍ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3594, '3528858', 'MARAPOAMA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3595, '3528908', 'MARIÁPOLIS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3596, '3529005', 'MARÍLIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3597, '3529104', 'MARINÓPOLIS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3598, '3529203', 'MARTINÓPOLIS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3599, '3529302', 'MATÃO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3600, '3529401', 'MAUÁ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3601, '3529500', 'MENDONÇA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3602, '3529609', 'MERIDIANO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3603, '3529658', 'MESÓPOLIS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3604, '3529708', 'MIGUELÓPOLIS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3605, '3529807', 'MINEIROS DO TIETÊ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3606, '3530003', 'MIRA ESTRELA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3607, '3529906', 'MIRACATU', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3608, '3530102', 'MIRANDÓPOLIS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3609, '3530201', 'MIRANTE DO PARANAPANEMA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3610, '3530300', 'MIRASSOL', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3611, '3530409', 'MIRASSOLÂNDIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3612, '3530508', 'MOCOCA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3613, '3530607', 'MOGI DAS CRUZES', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3614, '3530706', 'MOGI GUAÇU', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3615, '3530805', 'MOGI MIRIM', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3616, '3530904', 'MOMBUCA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3617, '3531001', 'MONÇÕES', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3618, '3531100', 'MONGAGUÁ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3619, '3531209', 'MONTE ALEGRE DO SUL', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3620, '3531308', 'MONTE ALTO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3621, '3531407', 'MONTE APRAZÍVEL', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3622, '3531506', 'MONTE AZUL PAULISTA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3623, '3531605', 'MONTE CASTELO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3624, '3531803', 'MONTE MOR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3625, '3531704', 'MONTEIRO LOBATO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3626, '3531902', 'MORRO AGUDO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3627, '3532009', 'MORUNGABA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3628, '3532058', 'MOTUCA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3629, '3532108', 'MURUTINGA DO SUL', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3630, '3532157', 'NANTES', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3631, '3532207', 'NARANDIBA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3632, '3532306', 'NATIVIDADE DA SERRA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3633, '3532405', 'NAZARÉ PAULISTA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3634, '3532504', 'NEVES PAULISTA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3635, '3532603', 'NHANDEARA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3636, '3532702', 'NIPOÃ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3637, '3532801', 'NOVA ALIANÇA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3638, '3532827', 'NOVA CAMPINA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3639, '3532843', 'NOVA CANAÃ PAULISTA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3640, '3532868', 'NOVA CASTILHO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3641, '3532900', 'NOVA EUROPA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3642, '3533007', 'NOVA GRANADA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3643, '3533106', 'NOVA GUATAPORANGA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3644, '3533205', 'NOVA INDEPENDÊNCIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3645, '3533304', 'NOVA LUZITÂNIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3646, '3533403', 'NOVA ODESSA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3647, '3533254', 'NOVAIS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3648, '3533502', 'NOVO HORIZONTE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3649, '3533601', 'NUPORANGA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3650, '3533700', 'OCAUÇU', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3651, '3533809', 'ÓLEO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3652, '3533908', 'OLÍMPIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3653, '3534005', 'ONDA VERDE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3654, '3534104', 'ORIENTE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3655, '3534203', 'ORINDIÚVA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3656, '3534302', 'ORLÂNDIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3657, '3534401', 'OSASCO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3658, '3534500', 'OSCAR BRESSANE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3659, '3534609', 'OSVALDO CRUZ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3660, '3534708', 'OURINHOS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3661, '3534807', 'OURO VERDE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3662, '3534757', 'OUROESTE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3663, '3534906', 'PACAEMBU', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3664, '3535002', 'PALESTINA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3665, '3535101', 'PALMARES PAULISTA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3666, '3535200', 'PALMEIRA DOESTE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3667, '3535309', 'PALMITAL', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3668, '3535408', 'PANORAMA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3669, '3535507', 'PARAGUAÇU PAULISTA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3670, '3535606', 'PARAIBUNA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3671, '3535705', 'PARAÍSO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3672, '3535804', 'PARANAPANEMA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3673, '3535903', 'PARANAPUÃ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3674, '3536000', 'PARAPUÃ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3675, '3536109', 'PARDINHO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3676, '3536208', 'PARIQUERA-AÇU', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3677, '3536257', 'PARISI', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3678, '3536307', 'PATROCÍNIO PAULISTA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3679, '3536406', 'PAULICÉIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3680, '3536505', 'PAULÍNIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3681, '3536570', 'PAULISTÂNIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3682, '3536604', 'PAULO DE FARIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3683, '3536703', 'PEDERNEIRAS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3684, '3536802', 'PEDRA BELA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3685, '3536901', 'PEDRANÓPOLIS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3686, '3537008', 'PEDREGULHO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3687, '3537107', 'PEDREIRA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3688, '3537156', 'PEDRINHAS PAULISTA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3689, '3537206', 'PEDRO DE TOLEDO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3690, '3537305', 'PENÁPOLIS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3691, '3537404', 'PEREIRA BARRETO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3692, '3537503', 'PEREIRAS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3693, '3537602', 'PERUÍBE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3694, '3537701', 'PIACATU', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3695, '3537800', 'PIEDADE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3696, '3537909', 'PILAR DO SUL', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3697, '3538006', 'PINDAMONHANGABA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3698, '3538105', 'PINDORAMA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3699, '3538204', 'PINHALZINHO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3700, '3538303', 'PIQUEROBI', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3701, '3538501', 'PIQUETE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3702, '3538600', 'PIRACAIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3703, '3538709', 'PIRACICABA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3704, '3538808', 'PIRAJU', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3705, '3538907', 'PIRAJUÍ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3706, '3539004', 'PIRANGI', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3707, '3539103', 'PIRAPORA DO BOM JESUS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3708, '3539202', 'PIRAPOZINHO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3709, '3539301', 'PIRASSUNUNGA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3710, '3539400', 'PIRATININGA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3711, '3539509', 'PITANGUEIRAS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3712, '3539608', 'PLANALTO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3713, '3539707', 'PLATINA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3714, '3539806', 'POÁ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3715, '3539905', 'POLONI', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3716, '3540002', 'POMPÉIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3717, '3540101', 'PONGAÍ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3718, '3540200', 'PONTAL', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3719, '3540259', 'PONTALINDA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3720, '3540309', 'PONTES GESTAL', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3721, '3540408', 'POPULINA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3722, '3540507', 'PORANGABA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3723, '3540606', 'PORTO FELIZ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3724, '3540705', 'PORTO FERREIRA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3725, '3540754', 'POTIM', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3726, '3540804', 'POTIRENDABA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3727, '3540853', 'PRACINHA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3728, '3540903', 'PRADÓPOLIS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3729, '3541000', 'PRAIA GRANDE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3730, '3541059', 'PRATÂNIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3731, '3541109', 'PRESIDENTE ALVES', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3732, '3541208', 'PRESIDENTE BERNARDES', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3733, '3541307', 'PRESIDENTE EPITÁCIO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3734, '3541406', 'PRESIDENTE PRUDENTE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3735, '3541505', 'PRESIDENTE VENCESLAU', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3736, '3541604', 'PROMISSÃO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3737, '3541653', 'QUADRA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3738, '3541703', 'QUATÁ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3739, '3541802', 'QUEIROZ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3740, '3541901', 'QUELUZ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3741, '3542008', 'QUINTANA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3742, '3542107', 'RAFARD', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3743, '3542206', 'RANCHARIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3744, '3542305', 'REDENÇÃO DA SERRA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3745, '3542404', 'REGENTE FEIJÓ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3746, '3542503', 'REGINÓPOLIS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3747, '3542602', 'REGISTRO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3748, '3542701', 'RESTINGA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3749, '3542800', 'RIBEIRA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3750, '3542909', 'RIBEIRÃO BONITO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3751, '3543006', 'RIBEIRÃO BRANCO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3752, '3543105', 'RIBEIRÃO CORRENTE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3753, '3543204', 'RIBEIRÃO DO SUL', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3754, '3543238', 'RIBEIRÃO DOS ÍNDIOS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3755, '3543253', 'RIBEIRÃO GRANDE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3756, '3543303', 'RIBEIRÃO PIRES', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3757, '3543402', 'RIBEIRÃO PRETO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3758, '3543600', 'RIFAINA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3759, '3543709', 'RINCÃO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3760, '3543808', 'RINÓPOLIS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3761, '3543907', 'RIO CLARO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3762, '3544004', 'RIO DAS PEDRAS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3763, '3544103', 'RIO GRANDE DA SERRA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3764, '3544202', 'RIOLÂNDIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3765, '3543501', 'RIVERSUL', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3766, '3544251', 'ROSANA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3767, '3544301', 'ROSEIRA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3768, '3544400', 'RUBIÁCEA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3769, '3544509', 'RUBINÉIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3770, '3544608', 'SABINO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3771, '3544707', 'SAGRES', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3772, '3544806', 'SALES', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3773, '3544905', 'SALES OLIVEIRA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3774, '3545001', 'SALESÓPOLIS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3775, '3545100', 'SALMOURÃO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3776, '3545159', 'SALTINHO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3777, '3545209', 'SALTO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3778, '3545308', 'SALTO DE PIRAPORA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3779, '3545407', 'SALTO GRANDE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3780, '3545506', 'SANDOVALINA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3781, '3545605', 'SANTA ADÉLIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3782, '3545704', 'SANTA ALBERTINA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3783, '3545803', 'SANTA BÁRBARA DOESTE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3784, '3546009', 'SANTA BRANCA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3785, '3546108', 'SANTA CLARA DOESTE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3786, '3546207', 'SANTA CRUZ DA CONCEIÇÃO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3787, '3546256', 'SANTA CRUZ DA ESPERANÇA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3788, '3546306', 'SANTA CRUZ DAS PALMEIRAS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3789, '3546405', 'SANTA CRUZ DO RIO PARDO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `municipios` (`id_municipio`, `codigo`, `municipio`, `id_uf`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3790, '3546504', 'SANTA ERNESTINA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3791, '3546603', 'SANTA FÉ DO SUL', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3792, '3546702', 'SANTA GERTRUDES', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3793, '3546801', 'SANTA ISABEL', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3794, '3546900', 'SANTA LÚCIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3795, '3547007', 'SANTA MARIA DA SERRA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3796, '3547106', 'SANTA MERCEDES', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3797, '3547502', 'SANTA RITA DO PASSA QUATRO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3798, '3547403', 'SANTA RITA DOESTE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3799, '3547601', 'SANTA ROSA DE VITERBO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3800, '3547650', 'SANTA SALETE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3801, '3547205', 'SANTANA DA PONTE PENSA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3802, '3547304', 'SANTANA DE PARNAÍBA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3803, '3547700', 'SANTO ANASTÁCIO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3804, '3547809', 'SANTO ANDRÉ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3805, '3547908', 'SANTO ANTÔNIO DA ALEGRIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3806, '3548005', 'SANTO ANTÔNIO DE POSSE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3807, '3548054', 'SANTO ANTÔNIO DO ARACANGUÁ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3808, '3548104', 'SANTO ANTÔNIO DO JARDIM', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3809, '3548203', 'SANTO ANTÔNIO DO PINHAL', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3810, '3548302', 'SANTO EXPEDITO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3811, '3548401', 'SANTÓPOLIS DO AGUAPEÍ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3812, '3548500', 'SANTOS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3813, '3548609', 'SÃO BENTO DO SAPUCAÍ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3814, '3548708', 'SÃO BERNARDO DO CAMPO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3815, '3548807', 'SÃO CAETANO DO SUL', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3816, '3548906', 'SÃO CARLOS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3817, '3549003', 'SÃO FRANCISCO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3818, '3549102', 'SÃO JOÃO DA BOA VISTA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3819, '3549201', 'SÃO JOÃO DAS DUAS PONTES', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3820, '3549250', 'SÃO JOÃO DE IRACEMA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3821, '3549300', 'SÃO JOÃO DO PAU DALHO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3822, '3549409', 'SÃO JOAQUIM DA BARRA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3823, '3549508', 'SÃO JOSÉ DA BELA VISTA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3824, '3549607', 'SÃO JOSÉ DO BARREIRO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3825, '3549706', 'SÃO JOSÉ DO RIO PARDO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3826, '3549805', 'SÃO JOSÉ DO RIO PRETO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3827, '3549904', 'SÃO JOSÉ DOS CAMPOS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3828, '3549953', 'SÃO LOURENÇO DA SERRA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3829, '3550001', 'SÃO LUIZ DO PARAITINGA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3830, '3550100', 'SÃO MANUEL', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3831, '3550209', 'SÃO MIGUEL ARCANJO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3832, '3550308', 'SÃO PAULO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3833, '3550407', 'SÃO PEDRO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3834, '3550506', 'SÃO PEDRO DO TURVO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3835, '3550605', 'SÃO ROQUE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3836, '3550704', 'SÃO SEBASTIÃO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3837, '3550803', 'SÃO SEBASTIÃO DA GRAMA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3838, '3550902', 'SÃO SIMÃO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3839, '3551009', 'SÃO VICENTE', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3840, '3551108', 'SARAPUÍ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3841, '3551207', 'SARUTAIÁ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3842, '3551306', 'SEBASTIANÓPOLIS DO SUL', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3843, '3551405', 'SERRA AZUL', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3844, '3551603', 'SERRA NEGRA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3845, '3551504', 'SERRANA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3846, '3551702', 'SERTÃOZINHO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3847, '3551801', 'SETE BARRAS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3848, '3551900', 'SEVERÍNIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3849, '3552007', 'SILVEIRAS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3850, '3552106', 'SOCORRO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3851, '3552205', 'SOROCABA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3852, '3552304', 'SUD MENNUCCI', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3853, '3552403', 'SUMARÉ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3854, '3552551', 'SUZANÁPOLIS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3855, '3552502', 'SUZANO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3856, '3552601', 'TABAPUÃ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3857, '3552700', 'TABATINGA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3858, '3552809', 'TABOÃO DA SERRA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3859, '3552908', 'TACIBA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3860, '3553005', 'TAGUAÍ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3861, '3553104', 'TAIAÇU', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3862, '3553203', 'TAIÚVA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3863, '3553302', 'TAMBAÚ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3864, '3553401', 'TANABI', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3865, '3553500', 'TAPIRAÍ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3866, '3553609', 'TAPIRATIBA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3867, '3553658', 'TAQUARAL', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3868, '3553708', 'TAQUARITINGA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3869, '3553807', 'TAQUARITUBA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3870, '3553856', 'TAQUARIVAÍ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3871, '3553906', 'TARABAI', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3872, '3553955', 'TARUMÃ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3873, '3554003', 'TATUÍ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3874, '3554102', 'TAUBATÉ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3875, '3554201', 'TEJUPÁ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3876, '3554300', 'TEODORO SAMPAIO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3877, '3554409', 'TERRA ROXA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3878, '3554508', 'TIETÊ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3879, '3554607', 'TIMBURI', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3880, '3554656', 'TORRE DE PEDRA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3881, '3554706', 'TORRINHA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3882, '3554755', 'TRABIJU', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3883, '3554805', 'TREMEMBÉ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3884, '3554904', 'TRÊS FRONTEIRAS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3885, '3554953', 'TUIUTI', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3886, '3555000', 'TUPÃ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3887, '3555109', 'TUPI PAULISTA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3888, '3555208', 'TURIÚBA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3889, '3555307', 'TURMALINA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3890, '3555356', 'UBARANA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3891, '3555406', 'UBATUBA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3892, '3555505', 'UBIRAJARA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3893, '3555604', 'UCHOA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3894, '3555703', 'UNIÃO PAULISTA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3895, '3555802', 'URÂNIA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3896, '3555901', 'URU', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3897, '3556008', 'URUPÊS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3898, '3556107', 'VALENTIM GENTIL', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3899, '3556206', 'VALINHOS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3900, '3556305', 'VALPARAÍSO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3901, '3556354', 'VARGEM', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3902, '3556404', 'VARGEM GRANDE DO SUL', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3903, '3556453', 'VARGEM GRANDE PAULISTA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3904, '3556503', 'VÁRZEA PAULISTA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3905, '3556602', 'VERA CRUZ', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3906, '3556701', 'VINHEDO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3907, '3556800', 'VIRADOURO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3908, '3556909', 'VISTA ALEGRE DO ALTO', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3909, '3556958', 'VITÓRIA BRASIL', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3910, '3557006', 'VOTORANTIM', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3911, '3557105', 'VOTUPORANGA', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3912, '3557154', 'ZACARIAS', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3913, '4100103', 'ABATIÁ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3914, '4100202', 'ADRIANÓPOLIS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3915, '4100301', 'AGUDOS DO SUL', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3916, '4100400', 'ALMIRANTE TAMANDARÉ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3917, '4100459', 'ALTAMIRA DO PARANÁ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3918, '4128625', 'ALTO PARAÍSO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3919, '4100608', 'ALTO PARANÁ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3920, '4100707', 'ALTO PIQUIRI', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3921, '4100509', 'ALTÔNIA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3922, '4100806', 'ALVORADA DO SUL', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3923, '4100905', 'AMAPORÃ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3924, '4101002', 'AMPÉRE', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3925, '4101051', 'ANAHY', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3926, '4101101', 'ANDIRÁ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3927, '4101150', 'ÂNGULO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3928, '4101200', 'ANTONINA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3929, '4101309', 'ANTÔNIO OLINTO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3930, '4101408', 'APUCARANA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3931, '4101507', 'ARAPONGAS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3932, '4101606', 'ARAPOTI', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3933, '4101655', 'ARAPUÃ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3934, '4101705', 'ARARUNA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3935, '4101804', 'ARAUCÁRIA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3936, '4101853', 'ARIRANHA DO IVAÍ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3937, '4101903', 'ASSAÍ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3938, '4102000', 'ASSIS CHATEAUBRIAND', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3939, '4102109', 'ASTORGA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3940, '4102208', 'ATALAIA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3941, '4102307', 'BALSA NOVA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3942, '4102406', 'BANDEIRANTES', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3943, '4102505', 'BARBOSA FERRAZ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3944, '4102703', 'BARRA DO JACARÉ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3945, '4102604', 'BARRACÃO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3946, '4102752', 'BELA VISTA DA CAROBA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3947, '4102802', 'BELA VISTA DO PARAÍSO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3948, '4102901', 'BITURUNA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3949, '4103008', 'BOA ESPERANÇA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3950, '4103024', 'BOA ESPERANÇA DO IGUAÇU', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3951, '4103040', 'BOA VENTURA DE SÃO ROQUE', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3952, '4103057', 'BOA VISTA DA APARECIDA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3953, '4103107', 'BOCAIÚVA DO SUL', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3954, '4103156', 'BOM JESUS DO SUL', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3955, '4103206', 'BOM SUCESSO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3956, '4103222', 'BOM SUCESSO DO SUL', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3957, '4103305', 'BORRAZÓPOLIS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3958, '4103354', 'BRAGANEY', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3959, '4103370', 'BRASILÂNDIA DO SUL', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3960, '4103404', 'CAFEARA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3961, '4103453', 'CAFELÂNDIA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3962, '4103479', 'CAFEZAL DO SUL', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3963, '4103503', 'CALIFÓRNIA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3964, '4103602', 'CAMBARÁ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3965, '4103701', 'CAMBÉ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3966, '4103800', 'CAMBIRA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3967, '4103909', 'CAMPINA DA LAGOA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3968, '4103958', 'CAMPINA DO SIMÃO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3969, '4104006', 'CAMPINA GRANDE DO SUL', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3970, '4104055', 'CAMPO BONITO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3971, '4104105', 'CAMPO DO TENENTE', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3972, '4104204', 'CAMPO LARGO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3973, '4104253', 'CAMPO MAGRO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3974, '4104303', 'CAMPO MOURÃO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3975, '4104402', 'CÂNDIDO DE ABREU', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3976, '4104428', 'CANDÓI', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3977, '4104451', 'CANTAGALO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3978, '4104501', 'CAPANEMA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3979, '4104600', 'CAPITÃO LEÔNIDAS MARQUES', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3980, '4104659', 'CARAMBEÍ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3981, '4104709', 'CARLÓPOLIS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3982, '4104808', 'CASCAVEL', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3983, '4104907', 'CASTRO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3984, '4105003', 'CATANDUVAS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3985, '4105102', 'CENTENÁRIO DO SUL', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3986, '4105201', 'CERRO AZUL', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3987, '4105300', 'CÉU AZUL', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3988, '4105409', 'CHOPINZINHO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3989, '4105508', 'CIANORTE', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3990, '4105607', 'CIDADE GAÚCHA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3991, '4105706', 'CLEVELÂNDIA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3992, '4105805', 'COLOMBO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3993, '4105904', 'COLORADO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3994, '4106001', 'CONGONHINHAS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3995, '4106100', 'CONSELHEIRO MAIRINCK', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3996, '4106209', 'CONTENDA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3997, '4106308', 'CORBÉLIA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3998, '4106407', 'CORNÉLIO PROCÓPIO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3999, '4106456', 'CORONEL DOMINGOS SOARES', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4000, '4106506', 'CORONEL VIVIDA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4001, '4106555', 'CORUMBATAÍ DO SUL', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4002, '4106803', 'CRUZ MACHADO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4003, '4106571', 'CRUZEIRO DO IGUAÇU', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4004, '4106605', 'CRUZEIRO DO OESTE', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4005, '4106704', 'CRUZEIRO DO SUL', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4006, '4106852', 'CRUZMALTINA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4007, '4106902', 'CURITIBA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4008, '4107009', 'CURIÚVA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4009, '4107108', 'DIAMANTE DO NORTE', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4010, '4107124', 'DIAMANTE DO SUL', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4011, '4107157', 'DIAMANTE DOESTE', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4012, '4107207', 'DOIS VIZINHOS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4013, '4107256', 'DOURADINA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4014, '4107306', 'DOUTOR CAMARGO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4015, '4128633', 'DOUTOR ULYSSES', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4016, '4107405', 'ENÉAS MARQUES', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4017, '4107504', 'ENGENHEIRO BELTRÃO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4018, '4107538', 'ENTRE RIOS DO OESTE', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4019, '4107520', 'ESPERANÇA NOVA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4020, '4107546', 'ESPIGÃO ALTO DO IGUAÇU', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4021, '4107553', 'FAROL', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4022, '4107603', 'FAXINAL', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4023, '4107652', 'FAZENDA RIO GRANDE', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4024, '4107702', 'FÊNIX', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4025, '4107736', 'FERNANDES PINHEIRO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4026, '4107751', 'FIGUEIRA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4027, '4107850', 'FLOR DA SERRA DO SUL', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4028, '4107801', 'FLORAÍ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4029, '4107900', 'FLORESTA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4030, '4108007', 'FLORESTÓPOLIS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4031, '4108106', 'FLÓRIDA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4032, '4108205', 'FORMOSA DO OESTE', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4033, '4108304', 'FOZ DO IGUAÇU', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4034, '4108452', 'FOZ DO JORDÃO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4035, '4108320', 'FRANCISCO ALVES', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4036, '4108403', 'FRANCISCO BELTRÃO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4037, '4108502', 'GENERAL CARNEIRO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4038, '4108551', 'GODOY MOREIRA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4039, '4108601', 'GOIOERÊ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4040, '4108650', 'GOIOXIM', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4041, '4108700', 'GRANDES RIOS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4042, '4108809', 'GUAÍRA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4043, '4108908', 'GUAIRAÇÁ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4044, '4108957', 'GUAMIRANGA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4045, '4109005', 'GUAPIRAMA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4046, '4109104', 'GUAPOREMA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4047, '4109203', 'GUARACI', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4048, '4109302', 'GUARANIAÇU', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4049, '4109401', 'GUARAPUAVA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4050, '4109500', 'GUARAQUEÇABA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4051, '4109609', 'GUARATUBA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4052, '4109658', 'HONÓRIO SERPA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4053, '4109708', 'IBAITI', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4054, '4109757', 'IBEMA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4055, '4109807', 'IBIPORÃ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4056, '4109906', 'ICARAÍMA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4057, '4110003', 'IGUARAÇU', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4058, '4110052', 'IGUATU', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4059, '4110078', 'IMBAÚ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4060, '4110102', 'IMBITUVA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4061, '4110201', 'INÁCIO MARTINS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4062, '4110300', 'INAJÁ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4063, '4110409', 'INDIANÓPOLIS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4064, '4110508', 'IPIRANGA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4065, '4110607', 'IPORÃ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4066, '4110656', 'IRACEMA DO OESTE', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4067, '4110706', 'IRATI', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4068, '4110805', 'IRETAMA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4069, '4110904', 'ITAGUAJÉ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4070, '4110953', 'ITAIPULÂNDIA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4071, '4111001', 'ITAMBARACÁ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4072, '4111100', 'ITAMBÉ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4073, '4111209', 'ITAPEJARA DOESTE', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4074, '4111258', 'ITAPERUÇU', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4075, '4111308', 'ITAÚNA DO SUL', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4076, '4111407', 'IVAÍ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4077, '4111506', 'IVAIPORÃ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4078, '4111555', 'IVATÉ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4079, '4111605', 'IVATUBA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4080, '4111704', 'JABOTI', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4081, '4111803', 'JACAREZINHO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4082, '4111902', 'JAGUAPITÃ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4083, '4112009', 'JAGUARIAÍVA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4084, '4112108', 'JANDAIA DO SUL', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4085, '4112207', 'JANIÓPOLIS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4086, '4112306', 'JAPIRA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4087, '4112405', 'JAPURÁ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4088, '4112504', 'JARDIM ALEGRE', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4089, '4112603', 'JARDIM OLINDA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4090, '4112702', 'JATAIZINHO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4091, '4112751', 'JESUÍTAS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4092, '4112801', 'JOAQUIM TÁVORA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4093, '4112900', 'JUNDIAÍ DO SUL', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4094, '4112959', 'JURANDA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4095, '4113007', 'JUSSARA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4096, '4113106', 'KALORÉ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4097, '4113205', 'LAPA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4098, '4113254', 'LARANJAL', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4099, '4113304', 'LARANJEIRAS DO SUL', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4100, '4113403', 'LEÓPOLIS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4101, '4113429', 'LIDIANÓPOLIS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4102, '4113452', 'LINDOESTE', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4103, '4113502', 'LOANDA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4104, '4113601', 'LOBATO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4105, '4113700', 'LONDRINA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4106, '4113734', 'LUIZIANA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4107, '4113759', 'LUNARDELLI', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4108, '4113809', 'LUPIONÓPOLIS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4109, '4113908', 'MALLET', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4110, '4114005', 'MAMBORÊ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4111, '4114104', 'MANDAGUAÇU', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4112, '4114203', 'MANDAGUARI', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4113, '4114302', 'MANDIRITUBA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4114, '4114351', 'MANFRINÓPOLIS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4115, '4114401', 'MANGUEIRINHA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4116, '4114500', 'MANOEL RIBAS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4117, '4114609', 'MARECHAL CÂNDIDO RONDON', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4118, '4114708', 'MARIA HELENA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4119, '4114807', 'MARIALVA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4120, '4114906', 'MARILÂNDIA DO SUL', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4121, '4115002', 'MARILENA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4122, '4115101', 'MARILUZ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4123, '4115200', 'MARINGÁ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4124, '4115309', 'MARIÓPOLIS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4125, '4115358', 'MARIPÁ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4126, '4115408', 'MARMELEIRO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4127, '4115457', 'MARQUINHO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4128, '4115507', 'MARUMBI', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4129, '4115606', 'MATELÂNDIA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4130, '4115705', 'MATINHOS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4131, '4115739', 'MATO RICO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4132, '4115754', 'MAUÁ DA SERRA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4133, '4115804', 'MEDIANEIRA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4134, '4115853', 'MERCEDES', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4135, '4115903', 'MIRADOR', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4136, '4116000', 'MIRASELVA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4137, '4116059', 'MISSAL', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4138, '4116109', 'MOREIRA SALES', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4139, '4116208', 'MORRETES', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4140, '4116307', 'MUNHOZ DE MELO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4141, '4116406', 'NOSSA SENHORA DAS GRAÇAS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4142, '4116505', 'NOVA ALIANÇA DO IVAÍ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4143, '4116604', 'NOVA AMÉRICA DA COLINA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4144, '4116703', 'NOVA AURORA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4145, '4116802', 'NOVA CANTU', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4146, '4116901', 'NOVA ESPERANÇA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4147, '4116950', 'NOVA ESPERANÇA DO SUDOESTE', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4148, '4117008', 'NOVA FÁTIMA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4149, '4117057', 'NOVA LARANJEIRAS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4150, '4117107', 'NOVA LONDRINA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4151, '4117206', 'NOVA OLÍMPIA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4152, '4117255', 'NOVA PRATA DO IGUAÇU', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4153, '4117214', 'NOVA SANTA BÁRBARA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4154, '4117222', 'NOVA SANTA ROSA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4155, '4117271', 'NOVA TEBAS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4156, '4117297', 'NOVO ITACOLOMI', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4157, '4117305', 'ORTIGUEIRA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4158, '4117404', 'OURIZONA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4159, '4117453', 'OURO VERDE DO OESTE', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4160, '4117503', 'PAIÇANDU', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4161, '4117602', 'PALMAS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4162, '4117701', 'PALMEIRA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4163, '4117800', 'PALMITAL', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4164, '4117909', 'PALOTINA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4165, '4118006', 'PARAÍSO DO NORTE', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4166, '4118105', 'PARANACITY', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4167, '4118204', 'PARANAGUÁ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4168, '4118303', 'PARANAPOEMA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4169, '4118402', 'PARANAVAÍ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4170, '4118451', 'PATO BRAGADO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4171, '4118501', 'PATO BRANCO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4172, '4118600', 'PAULA FREITAS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4173, '4118709', 'PAULO FRONTIN', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4174, '4118808', 'PEABIRU', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4175, '4118857', 'PEROBAL', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4176, '4118907', 'PÉROLA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4177, '4119004', 'PÉROLA DOESTE', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4178, '4119103', 'PIÊN', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4179, '4119152', 'PINHAIS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4180, '4119251', 'PINHAL DE SÃO BENTO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4181, '4119202', 'PINHALÃO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4182, '4119301', 'PINHÃO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4183, '4119400', 'PIRAÍ DO SUL', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4184, '4119509', 'PIRAQUARA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4185, '4119608', 'PITANGA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4186, '4119657', 'PITANGUEIRAS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4187, '4119707', 'PLANALTINA DO PARANÁ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4188, '4119806', 'PLANALTO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4189, '4119905', 'PONTA GROSSA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4190, '4119954', 'PONTAL DO PARANÁ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4191, '4120002', 'PORECATU', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4192, '4120101', 'PORTO AMAZONAS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4193, '4120150', 'PORTO BARREIRO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4194, '4120200', 'PORTO RICO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4195, '4120309', 'PORTO VITÓRIA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4196, '4120333', 'PRADO FERREIRA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4197, '4120358', 'PRANCHITA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4198, '4120408', 'PRESIDENTE CASTELO BRANCO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4199, '4120507', 'PRIMEIRO DE MAIO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4200, '4120606', 'PRUDENTÓPOLIS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4201, '4120655', 'QUARTO CENTENÁRIO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4202, '4120705', 'QUATIGUÁ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4203, '4120804', 'QUATRO BARRAS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4204, '4120853', 'QUATRO PONTES', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4205, '4120903', 'QUEDAS DO IGUAÇU', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4206, '4121000', 'QUERÊNCIA DO NORTE', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4207, '4121109', 'QUINTA DO SOL', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4208, '4121208', 'QUITANDINHA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4209, '4121257', 'RAMILÂNDIA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4210, '4121307', 'RANCHO ALEGRE', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4211, '4121356', 'RANCHO ALEGRE DOESTE', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4212, '4121406', 'REALEZA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4213, '4121505', 'REBOUÇAS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4214, '4121604', 'RENASCENÇA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4215, '4121703', 'RESERVA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4216, '4121752', 'RESERVA DO IGUAÇU', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4217, '4121802', 'RIBEIRÃO CLARO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4218, '4121901', 'RIBEIRÃO DO PINHAL', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4219, '4122008', 'RIO AZUL', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4220, '4122107', 'RIO BOM', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4221, '4122156', 'RIO BONITO DO IGUAÇU', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4222, '4122172', 'RIO BRANCO DO IVAÍ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4223, '4122206', 'RIO BRANCO DO SUL', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4224, '4122305', 'RIO NEGRO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4225, '4122404', 'ROLÂNDIA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4226, '4122503', 'RONCADOR', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4227, '4122602', 'RONDON', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4228, '4122651', 'ROSÁRIO DO IVAÍ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4229, '4122701', 'SABÁUDIA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4230, '4122800', 'SALGADO FILHO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4231, '4122909', 'SALTO DO ITARARÉ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4232, '4123006', 'SALTO DO LONTRA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4233, '4123105', 'SANTA AMÉLIA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4234, '4123204', 'SANTA CECÍLIA DO PAVÃO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4235, '4123303', 'SANTA CRUZ DE MONTE CASTELO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4236, '4123402', 'SANTA FÉ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4237, '4123501', 'SANTA HELENA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4238, '4123600', 'SANTA INÊS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4239, '4123709', 'SANTA ISABEL DO IVAÍ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4240, '4123808', 'SANTA IZABEL DO OESTE', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4241, '4123824', 'SANTA LÚCIA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4242, '4123857', 'SANTA MARIA DO OESTE', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4243, '4123907', 'SANTA MARIANA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4244, '4123956', 'SANTA MÔNICA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4245, '4124020', 'SANTA TEREZA DO OESTE', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4246, '4124053', 'SANTA TEREZINHA DE ITAIPU', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4247, '4124004', 'SANTANA DO ITARARÉ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4248, '4124103', 'SANTO ANTÔNIO DA PLATINA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4249, '4124202', 'SANTO ANTÔNIO DO CAIUÁ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4250, '4124301', 'SANTO ANTÔNIO DO PARAÍSO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4251, '4124400', 'SANTO ANTÔNIO DO SUDOESTE', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4252, '4124509', 'SANTO INÁCIO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4253, '4124608', 'SÃO CARLOS DO IVAÍ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4254, '4124707', 'SÃO JERÔNIMO DA SERRA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4255, '4124806', 'SÃO JOÃO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4256, '4124905', 'SÃO JOÃO DO CAIUÁ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4257, '4125001', 'SÃO JOÃO DO IVAÍ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4258, '4125100', 'SÃO JOÃO DO TRIUNFO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4259, '4125308', 'SÃO JORGE DO IVAÍ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `municipios` (`id_municipio`, `codigo`, `municipio`, `id_uf`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4260, '4125357', 'SÃO JORGE DO PATROCÍNIO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4261, '4125209', 'SÃO JORGE DOESTE', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4262, '4125407', 'SÃO JOSÉ DA BOA VISTA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4263, '4125456', 'SÃO JOSÉ DAS PALMEIRAS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4264, '4125506', 'SÃO JOSÉ DOS PINHAIS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4265, '4125555', 'SÃO MANOEL DO PARANÁ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4266, '4125605', 'SÃO MATEUS DO SUL', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4267, '4125704', 'SÃO MIGUEL DO IGUAÇU', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4268, '4125753', 'SÃO PEDRO DO IGUAÇU', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4269, '4125803', 'SÃO PEDRO DO IVAÍ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4270, '4125902', 'SÃO PEDRO DO PARANÁ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4271, '4126009', 'SÃO SEBASTIÃO DA AMOREIRA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4272, '4126108', 'SÃO TOMÉ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4273, '4126207', 'SAPOPEMA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4274, '4126256', 'SARANDI', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4275, '4126272', 'SAUDADE DO IGUAÇU', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4276, '4126306', 'SENGÉS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4277, '4126355', 'SERRANÓPOLIS DO IGUAÇU', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4278, '4126405', 'SERTANEJA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4279, '4126504', 'SERTANÓPOLIS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4280, '4126603', 'SIQUEIRA CAMPOS', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4281, '4126652', 'SULINA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4282, '4126678', 'TAMARANA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4283, '4126702', 'TAMBOARA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4284, '4126801', 'TAPEJARA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4285, '4126900', 'TAPIRA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4286, '4127007', 'TEIXEIRA SOARES', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4287, '4127106', 'TELÊMACO BORBA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4288, '4127205', 'TERRA BOA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4289, '4127304', 'TERRA RICA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4290, '4127403', 'TERRA ROXA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4291, '4127502', 'TIBAGI', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4292, '4127601', 'TIJUCAS DO SUL', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4293, '4127700', 'TOLEDO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4294, '4127809', 'TOMAZINA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4295, '4127858', 'TRÊS BARRAS DO PARANÁ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4296, '4127882', 'TUNAS DO PARANÁ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4297, '4127908', 'TUNEIRAS DO OESTE', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4298, '4127957', 'TUPÃSSI', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4299, '4127965', 'TURVO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4300, '4128005', 'UBIRATÃ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4301, '4128104', 'UMUARAMA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4302, '4128203', 'UNIÃO DA VITÓRIA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4303, '4128302', 'UNIFLOR', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4304, '4128401', 'URAÍ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4305, '4128534', 'VENTANIA', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4306, '4128559', 'VERA CRUZ DO OESTE', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4307, '4128609', 'VERÊ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4308, '4128658', 'VIRMOND', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4309, '4128708', 'VITORINO', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4310, '4128500', 'WENCESLAU BRAZ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4311, '4128807', 'XAMBRÊ', 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4312, '4200051', 'ABDON BATISTA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4313, '4200101', 'ABELARDO LUZ', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4314, '4200200', 'AGROLÂNDIA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4315, '4200309', 'AGRONÔMICA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4316, '4200408', 'ÁGUA DOCE', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4317, '4200507', 'ÁGUAS DE CHAPECÓ', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4318, '4200556', 'ÁGUAS FRIAS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4319, '4200606', 'ÁGUAS MORNAS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4320, '4200705', 'ALFREDO WAGNER', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4321, '4200754', 'ALTO BELA VISTA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4322, '4200804', 'ANCHIETA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4323, '4200903', 'ANGELINA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4324, '4201000', 'ANITA GARIBALDI', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4325, '4201109', 'ANITÁPOLIS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4326, '4201208', 'ANTÔNIO CARLOS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4327, '4201257', 'APIÚNA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4328, '4201273', 'ARABUTÃ', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4329, '4201307', 'ARAQUARI', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4330, '4201406', 'ARARANGUÁ', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4331, '4201505', 'ARMAZÉM', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4332, '4201604', 'ARROIO TRINTA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4333, '4201653', 'ARVOREDO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4334, '4201703', 'ASCURRA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4335, '4201802', 'ATALANTA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4336, '4201901', 'AURORA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4337, '4201950', 'BALNEÁRIO ARROIO DO SILVA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4338, '4202057', 'BALNEÁRIO BARRA DO SUL', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4339, '4202008', 'BALNEÁRIO CAMBORIÚ', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4340, '4202073', 'BALNEÁRIO GAIVOTA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4341, '4212809', 'BALNEÁRIO PIÇARRAS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4342, '4220000', 'BALNEÁRIO RINCÃO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4343, '4202081', 'BANDEIRANTE', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4344, '4202099', 'BARRA BONITA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4345, '4202107', 'BARRA VELHA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4346, '4202131', 'BELA VISTA DO TOLDO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4347, '4202156', 'BELMONTE', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4348, '4202206', 'BENEDITO NOVO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4349, '4202305', 'BIGUAÇU', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4350, '4202404', 'BLUMENAU', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4351, '4202438', 'BOCAINA DO SUL', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4352, '4202503', 'BOM JARDIM DA SERRA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4353, '4202537', 'BOM JESUS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4354, '4202578', 'BOM JESUS DO OESTE', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4355, '4202602', 'BOM RETIRO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4356, '4202453', 'BOMBINHAS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4357, '4202701', 'BOTUVERÁ', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4358, '4202800', 'BRAÇO DO NORTE', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4359, '4202859', 'BRAÇO DO TROMBUDO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4360, '4202875', 'BRUNÓPOLIS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4361, '4202909', 'BRUSQUE', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4362, '4203006', 'CAÇADOR', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4363, '4203105', 'CAIBI', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4364, '4203154', 'CALMON', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4365, '4203204', 'CAMBORIÚ', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4366, '4203303', 'CAMPO ALEGRE', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4367, '4203402', 'CAMPO BELO DO SUL', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4368, '4203501', 'CAMPO ERÊ', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4369, '4203600', 'CAMPOS NOVOS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4370, '4203709', 'CANELINHA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4371, '4203808', 'CANOINHAS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4372, '4203253', 'CAPÃO ALTO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4373, '4203907', 'CAPINZAL', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4374, '4203956', 'CAPIVARI DE BAIXO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4375, '4204004', 'CATANDUVAS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4376, '4204103', 'CAXAMBU DO SUL', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4377, '4204152', 'CELSO RAMOS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4378, '4204178', 'CERRO NEGRO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4379, '4204194', 'CHAPADÃO DO LAGEADO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4380, '4204202', 'CHAPECÓ', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4381, '4204251', 'COCAL DO SUL', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4382, '4204301', 'CONCÓRDIA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4383, '4204350', 'CORDILHEIRA ALTA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4384, '4204400', 'CORONEL FREITAS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4385, '4204459', 'CORONEL MARTINS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4386, '4204558', 'CORREIA PINTO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4387, '4204509', 'CORUPÁ', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4388, '4204608', 'CRICIÚMA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4389, '4204707', 'CUNHA PORÃ', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4390, '4204756', 'CUNHATAÍ', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4391, '4204806', 'CURITIBANOS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4392, '4204905', 'DESCANSO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4393, '4205001', 'DIONÍSIO CERQUEIRA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4394, '4205100', 'DONA EMMA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4395, '4205159', 'DOUTOR PEDRINHO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4396, '4205175', 'ENTRE RIOS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4397, '4205191', 'ERMO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4398, '4205209', 'ERVAL VELHO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4399, '4205308', 'FAXINAL DOS GUEDES', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4400, '4205357', 'FLOR DO SERTÃO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4401, '4205407', 'FLORIANÓPOLIS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4402, '4205431', 'FORMOSA DO SUL', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4403, '4205456', 'FORQUILHINHA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4404, '4205506', 'FRAIBURGO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4405, '4205555', 'FREI ROGÉRIO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4406, '4205605', 'GALVÃO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4407, '4205704', 'GAROPABA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4408, '4205803', 'GARUVA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4409, '4205902', 'GASPAR', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4410, '4206009', 'GOVERNADOR CELSO RAMOS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4411, '4206108', 'GRÃO PARÁ', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4412, '4206207', 'GRAVATAL', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4413, '4206306', 'GUABIRUBA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4414, '4206405', 'GUARACIABA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4415, '4206504', 'GUARAMIRIM', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4416, '4206603', 'GUARUJÁ DO SUL', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4417, '4206652', 'GUATAMBÚ', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4418, '4206702', 'HERVAL DOESTE', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4419, '4206751', 'IBIAM', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4420, '4206801', 'IBICARÉ', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4421, '4206900', 'IBIRAMA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4422, '4207007', 'IÇARA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4423, '4207106', 'ILHOTA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4424, '4207205', 'IMARUÍ', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4425, '4207304', 'IMBITUBA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4426, '4207403', 'IMBUIA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4427, '4207502', 'INDAIAL', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4428, '4207577', 'IOMERÊ', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4429, '4207601', 'IPIRA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4430, '4207650', 'IPORÃ DO OESTE', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4431, '4207684', 'IPUAÇU', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4432, '4207700', 'IPUMIRIM', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4433, '4207759', 'IRACEMINHA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4434, '4207809', 'IRANI', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4435, '4207858', 'IRATI', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4436, '4207908', 'IRINEÓPOLIS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4437, '4208005', 'ITÁ', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4438, '4208104', 'ITAIÓPOLIS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4439, '4208203', 'ITAJAÍ', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4440, '4208302', 'ITAPEMA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4441, '4208401', 'ITAPIRANGA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4442, '4208450', 'ITAPOÁ', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4443, '4208500', 'ITUPORANGA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4444, '4208609', 'JABORÁ', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4445, '4208708', 'JACINTO MACHADO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4446, '4208807', 'JAGUARUNA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4447, '4208906', 'JARAGUÁ DO SUL', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4448, '4208955', 'JARDINÓPOLIS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4449, '4209003', 'JOAÇABA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4450, '4209102', 'JOINVILLE', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4451, '4209151', 'JOSÉ BOITEUX', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4452, '4209177', 'JUPIÁ', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4453, '4209201', 'LACERDÓPOLIS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4454, '4209300', 'LAGES', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4455, '4209409', 'LAGUNA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4456, '4209458', 'LAJEADO GRANDE', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4457, '4209508', 'LAURENTINO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4458, '4209607', 'LAURO MÜLLER', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4459, '4209706', 'LEBON RÉGIS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4460, '4209805', 'LEOBERTO LEAL', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4461, '4209854', 'LINDÓIA DO SUL', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4462, '4209904', 'LONTRAS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4463, '4210001', 'LUIZ ALVES', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4464, '4210035', 'LUZERNA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4465, '4210050', 'MACIEIRA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4466, '4210100', 'MAFRA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4467, '4210209', 'MAJOR GERCINO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4468, '4210308', 'MAJOR VIEIRA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4469, '4210407', 'MARACAJÁ', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4470, '4210506', 'MARAVILHA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4471, '4210555', 'MAREMA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4472, '4210605', 'MASSARANDUBA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4473, '4210704', 'MATOS COSTA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4474, '4210803', 'MELEIRO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4475, '4210852', 'MIRIM DOCE', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4476, '4210902', 'MODELO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4477, '4211009', 'MONDAÍ', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4478, '4211058', 'MONTE CARLO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4479, '4211108', 'MONTE CASTELO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4480, '4211207', 'MORRO DA FUMAÇA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4481, '4211256', 'MORRO GRANDE', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4482, '4211306', 'NAVEGANTES', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4483, '4211405', 'NOVA ERECHIM', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4484, '4211454', 'NOVA ITABERABA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4485, '4211504', 'NOVA TRENTO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4486, '4211603', 'NOVA VENEZA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4487, '4211652', 'NOVO HORIZONTE', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4488, '4211702', 'ORLEANS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4489, '4211751', 'OTACÍLIO COSTA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4490, '4211801', 'OURO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4491, '4211850', 'OURO VERDE', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4492, '4211876', 'PAIAL', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4493, '4211892', 'PAINEL', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4494, '4211900', 'PALHOÇA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4495, '4212007', 'PALMA SOLA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4496, '4212056', 'PALMEIRA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4497, '4212106', 'PALMITOS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4498, '4212205', 'PAPANDUVA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4499, '4212239', 'PARAÍSO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4500, '4212254', 'PASSO DE TORRES', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4501, '4212270', 'PASSOS MAIA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4502, '4212304', 'PAULO LOPES', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4503, '4212403', 'PEDRAS GRANDES', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4504, '4212502', 'PENHA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4505, '4212601', 'PERITIBA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4506, '4212650', 'PESCARIA BRAVA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4507, '4212700', 'PETROLÂNDIA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4508, '4212908', 'PINHALZINHO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4509, '4213005', 'PINHEIRO PRETO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4510, '4213104', 'PIRATUBA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4511, '4213153', 'PLANALTO ALEGRE', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4512, '4213203', 'POMERODE', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4513, '4213302', 'PONTE ALTA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4514, '4213351', 'PONTE ALTA DO NORTE', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4515, '4213401', 'PONTE SERRADA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4516, '4213500', 'PORTO BELO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4517, '4213609', 'PORTO UNIÃO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4518, '4213708', 'POUSO REDONDO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4519, '4213807', 'PRAIA GRANDE', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4520, '4213906', 'PRESIDENTE CASTELLO BRANCO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4521, '4214003', 'PRESIDENTE GETÚLIO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4522, '4214102', 'PRESIDENTE NEREU', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4523, '4214151', 'PRINCESA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4524, '4214201', 'QUILOMBO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4525, '4214300', 'RANCHO QUEIMADO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4526, '4214409', 'RIO DAS ANTAS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4527, '4214508', 'RIO DO CAMPO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4528, '4214607', 'RIO DO OESTE', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4529, '4214805', 'RIO DO SUL', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4530, '4214706', 'RIO DOS CEDROS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4531, '4214904', 'RIO FORTUNA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4532, '4215000', 'RIO NEGRINHO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4533, '4215059', 'RIO RUFINO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4534, '4215075', 'RIQUEZA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4535, '4215109', 'RODEIO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4536, '4215208', 'ROMELÂNDIA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4537, '4215307', 'SALETE', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4538, '4215356', 'SALTINHO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4539, '4215406', 'SALTO VELOSO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4540, '4215455', 'SANGÃO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4541, '4215505', 'SANTA CECÍLIA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4542, '4215554', 'SANTA HELENA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4543, '4215604', 'SANTA ROSA DE LIMA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4544, '4215653', 'SANTA ROSA DO SUL', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4545, '4215679', 'SANTA TEREZINHA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4546, '4215687', 'SANTA TEREZINHA DO PROGRESSO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4547, '4215695', 'SANTIAGO DO SUL', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4548, '4215703', 'SANTO AMARO DA IMPERATRIZ', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4549, '4215802', 'SÃO BENTO DO SUL', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4550, '4215752', 'SÃO BERNARDINO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4551, '4215901', 'SÃO BONIFÁCIO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4552, '4216008', 'SÃO CARLOS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4553, '4216057', 'SÃO CRISTÓVÃO DO SUL', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4554, '4216107', 'SÃO DOMINGOS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4555, '4216206', 'SÃO FRANCISCO DO SUL', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4556, '4216305', 'SÃO JOÃO BATISTA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4557, '4216354', 'SÃO JOÃO DO ITAPERIÚ', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4558, '4216255', 'SÃO JOÃO DO OESTE', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4559, '4216404', 'SÃO JOÃO DO SUL', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4560, '4216503', 'SÃO JOAQUIM', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4561, '4216602', 'SÃO JOSÉ', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4562, '4216701', 'SÃO JOSÉ DO CEDRO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4563, '4216800', 'SÃO JOSÉ DO CERRITO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4564, '4216909', 'SÃO LOURENÇO DO OESTE', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4565, '4217006', 'SÃO LUDGERO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4566, '4217105', 'SÃO MARTINHO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4567, '4217154', 'SÃO MIGUEL DA BOA VISTA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4568, '4217204', 'SÃO MIGUEL DO OESTE', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4569, '4217253', 'SÃO PEDRO DE ALCÂNTARA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4570, '4217303', 'SAUDADES', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4571, '4217402', 'SCHROEDER', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4572, '4217501', 'SEARA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4573, '4217550', 'SERRA ALTA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4574, '4217600', 'SIDERÓPOLIS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4575, '4217709', 'SOMBRIO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4576, '4217758', 'SUL BRASIL', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4577, '4217808', 'TAIÓ', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4578, '4217907', 'TANGARÁ', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4579, '4217956', 'TIGRINHOS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4580, '4218004', 'TIJUCAS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4581, '4218103', 'TIMBÉ DO SUL', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4582, '4218202', 'TIMBÓ', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4583, '4218251', 'TIMBÓ GRANDE', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4584, '4218301', 'TRÊS BARRAS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4585, '4218350', 'TREVISO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4586, '4218400', 'TREZE DE MAIO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4587, '4218509', 'TREZE TÍLIAS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4588, '4218608', 'TROMBUDO CENTRAL', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4589, '4218707', 'TUBARÃO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4590, '4218756', 'TUNÁPOLIS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4591, '4218806', 'TURVO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4592, '4218855', 'UNIÃO DO OESTE', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4593, '4218905', 'URUBICI', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4594, '4218954', 'URUPEMA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4595, '4219002', 'URUSSANGA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4596, '4219101', 'VARGEÃO', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4597, '4219150', 'VARGEM', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4598, '4219176', 'VARGEM BONITA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4599, '4219200', 'VIDAL RAMOS', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4600, '4219309', 'VIDEIRA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4601, '4219358', 'VITOR MEIRELES', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4602, '4219408', 'WITMARSUM', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4603, '4219507', 'XANXERÊ', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4604, '4219606', 'XAVANTINA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4605, '4219705', 'XAXIM', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4606, '4219853', 'ZORTÉA', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4607, '4300034', 'ACEGUÁ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4608, '4300059', 'ÁGUA SANTA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4609, '4300109', 'AGUDO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4610, '4300208', 'AJURICABA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4611, '4300307', 'ALECRIM', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4612, '4300406', 'ALEGRETE', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4613, '4300455', 'ALEGRIA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4614, '4300471', 'ALMIRANTE TAMANDARÉ DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4615, '4300505', 'ALPESTRE', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4616, '4300554', 'ALTO ALEGRE', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4617, '4300570', 'ALTO FELIZ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4618, '4300604', 'ALVORADA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4619, '4300638', 'AMARAL FERRADOR', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4620, '4300646', 'AMETISTA DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4621, '4300661', 'ANDRÉ DA ROCHA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4622, '4300703', 'ANTA GORDA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4623, '4300802', 'ANTÔNIO PRADO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4624, '4300851', 'ARAMBARÉ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4625, '4300877', 'ARARICÁ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4626, '4300901', 'ARATIBA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4627, '4301008', 'ARROIO DO MEIO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4628, '4301073', 'ARROIO DO PADRE', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4629, '4301057', 'ARROIO DO SAL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4630, '4301206', 'ARROIO DO TIGRE', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4631, '4301107', 'ARROIO DOS RATOS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4632, '4301305', 'ARROIO GRANDE', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4633, '4301404', 'ARVOREZINHA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4634, '4301503', 'AUGUSTO PESTANA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4635, '4301552', 'ÁUREA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4636, '4301602', 'BAGÉ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4637, '4301636', 'BALNEÁRIO PINHAL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4638, '4301651', 'BARÃO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4639, '4301701', 'BARÃO DE COTEGIPE', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4640, '4301750', 'BARÃO DO TRIUNFO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4641, '4301859', 'BARRA DO GUARITA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4642, '4301875', 'BARRA DO QUARAÍ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4643, '4301909', 'BARRA DO RIBEIRO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4644, '4301925', 'BARRA DO RIO AZUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4645, '4301958', 'BARRA FUNDA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4646, '4301800', 'BARRACÃO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4647, '4302006', 'BARROS CASSAL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4648, '4302055', 'BENJAMIN CONSTANT DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4649, '4302105', 'BENTO GONÇALVES', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4650, '4302154', 'BOA VISTA DAS MISSÕES', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4651, '4302204', 'BOA VISTA DO BURICÁ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4652, '4302220', 'BOA VISTA DO CADEADO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4653, '4302238', 'BOA VISTA DO INCRA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4654, '4302253', 'BOA VISTA DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4655, '4302303', 'BOM JESUS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4656, '4302352', 'BOM PRINCÍPIO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4657, '4302378', 'BOM PROGRESSO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4658, '4302402', 'BOM RETIRO DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4659, '4302451', 'BOQUEIRÃO DO LEÃO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4660, '4302501', 'BOSSOROCA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4661, '4302584', 'BOZANO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4662, '4302600', 'BRAGA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4663, '4302659', 'BROCHIER', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4664, '4302709', 'BUTIÁ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4665, '4302808', 'CAÇAPAVA DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4666, '4302907', 'CACEQUI', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4667, '4303004', 'CACHOEIRA DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4668, '4303103', 'CACHOEIRINHA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4669, '4303202', 'CACIQUE DOBLE', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4670, '4303301', 'CAIBATÉ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4671, '4303400', 'CAIÇARA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4672, '4303509', 'CAMAQUÃ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4673, '4303558', 'CAMARGO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4674, '4303608', 'CAMBARÁ DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4675, '4303673', 'CAMPESTRE DA SERRA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4676, '4303707', 'CAMPINA DAS MISSÕES', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4677, '4303806', 'CAMPINAS DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4678, '4303905', 'CAMPO BOM', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4679, '4304002', 'CAMPO NOVO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4680, '4304101', 'CAMPOS BORGES', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4681, '4304200', 'CANDELÁRIA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4682, '4304309', 'CÂNDIDO GODÓI', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4683, '4304358', 'CANDIOTA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4684, '4304408', 'CANELA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4685, '4304507', 'CANGUÇU', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4686, '4304606', 'CANOAS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4687, '4304614', 'CANUDOS DO VALE', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4688, '4304622', 'CAPÃO BONITO DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4689, '4304630', 'CAPÃO DA CANOA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4690, '4304655', 'CAPÃO DO CIPÓ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4691, '4304663', 'CAPÃO DO LEÃO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4692, '4304689', 'CAPELA DE SANTANA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4693, '4304697', 'CAPITÃO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4694, '4304671', 'CAPIVARI DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4695, '4304713', 'CARAÁ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4696, '4304705', 'CARAZINHO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4697, '4304804', 'CARLOS BARBOSA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4698, '4304853', 'CARLOS GOMES', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4699, '4304903', 'CASCA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4700, '4304952', 'CASEIROS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4701, '4305009', 'CATUÍPE', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4702, '4305108', 'CAXIAS DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4703, '4305116', 'CENTENÁRIO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4704, '4305124', 'CERRITO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4705, '4305132', 'CERRO BRANCO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4706, '4305157', 'CERRO GRANDE', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4707, '4305173', 'CERRO GRANDE DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4708, '4305207', 'CERRO LARGO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4709, '4305306', 'CHAPADA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4710, '4305355', 'CHARQUEADAS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4711, '4305371', 'CHARRUA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4712, '4305405', 'CHIAPETTA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4713, '4305439', 'CHUÍ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4714, '4305447', 'CHUVISCA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4715, '4305454', 'CIDREIRA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4716, '4305504', 'CIRÍACO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4717, '4305587', 'COLINAS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4718, '4305603', 'COLORADO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4719, '4305702', 'CONDOR', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4720, '4305801', 'CONSTANTINA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4721, '4305835', 'COQUEIRO BAIXO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4722, '4305850', 'COQUEIROS DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4723, '4305871', 'CORONEL BARROS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4724, '4305900', 'CORONEL BICACO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4725, '4305934', 'CORONEL PILAR', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4726, '4305959', 'COTIPORÃ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4727, '4305975', 'COXILHA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4728, '4306007', 'CRISSIUMAL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4729, '4306056', 'CRISTAL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4730, '4306072', 'CRISTAL DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4731, '4306106', 'CRUZ ALTA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4732, '4306130', 'CRUZALTENSE', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4733, '4306205', 'CRUZEIRO DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `municipios` (`id_municipio`, `codigo`, `municipio`, `id_uf`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4734, '4306304', 'DAVID CANABARRO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4735, '4306320', 'DERRUBADAS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4736, '4306353', 'DEZESSEIS DE NOVEMBRO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4737, '4306379', 'DILERMANDO DE AGUIAR', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4738, '4306403', 'DOIS IRMÃOS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4739, '4306429', 'DOIS IRMÃOS DAS MISSÕES', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4740, '4306452', 'DOIS LAJEADOS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4741, '4306502', 'DOM FELICIANO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4742, '4306601', 'DOM PEDRITO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4743, '4306551', 'DOM PEDRO DE ALCÂNTARA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4744, '4306700', 'DONA FRANCISCA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4745, '4306734', 'DOUTOR MAURÍCIO CARDOSO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4746, '4306759', 'DOUTOR RICARDO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4747, '4306767', 'ELDORADO DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4748, '4306809', 'ENCANTADO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4749, '4306908', 'ENCRUZILHADA DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4750, '4306924', 'ENGENHO VELHO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4751, '4306957', 'ENTRE RIOS DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4752, '4306932', 'ENTRE-IJUÍS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4753, '4306973', 'EREBANGO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4754, '4307005', 'ERECHIM', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4755, '4307054', 'ERNESTINA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4756, '4307203', 'ERVAL GRANDE', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4757, '4307302', 'ERVAL SECO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4758, '4307401', 'ESMERALDA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4759, '4307450', 'ESPERANÇA DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4760, '4307500', 'ESPUMOSO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4761, '4307559', 'ESTAÇÃO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4762, '4307609', 'ESTÂNCIA VELHA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4763, '4307708', 'ESTEIO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4764, '4307807', 'ESTRELA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4765, '4307815', 'ESTRELA VELHA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4766, '4307831', 'EUGÊNIO DE CASTRO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4767, '4307864', 'FAGUNDES VARELA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4768, '4307906', 'FARROUPILHA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4769, '4308003', 'FAXINAL DO SOTURNO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4770, '4308052', 'FAXINALZINHO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4771, '4308078', 'FAZENDA VILANOVA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4772, '4308102', 'FELIZ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4773, '4308201', 'FLORES DA CUNHA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4774, '4308250', 'FLORIANO PEIXOTO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4775, '4308300', 'FONTOURA XAVIER', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4776, '4308409', 'FORMIGUEIRO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4777, '4308433', 'FORQUETINHA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4778, '4308458', 'FORTALEZA DOS VALOS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4779, '4308508', 'FREDERICO WESTPHALEN', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4780, '4308607', 'GARIBALDI', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4781, '4308656', 'GARRUCHOS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4782, '4308706', 'GAURAMA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4783, '4308805', 'GENERAL CÂMARA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4784, '4308854', 'GENTIL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4785, '4308904', 'GETÚLIO VARGAS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4786, '4309001', 'GIRUÁ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4787, '4309050', 'GLORINHA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4788, '4309100', 'GRAMADO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4789, '4309126', 'GRAMADO DOS LOUREIROS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4790, '4309159', 'GRAMADO XAVIER', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4791, '4309209', 'GRAVATAÍ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4792, '4309258', 'GUABIJU', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4793, '4309308', 'GUAÍBA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4794, '4309407', 'GUAPORÉ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4795, '4309506', 'GUARANI DAS MISSÕES', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4796, '4309555', 'HARMONIA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4797, '4307104', 'HERVAL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4798, '4309571', 'HERVEIRAS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4799, '4309605', 'HORIZONTINA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4800, '4309654', 'HULHA NEGRA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4801, '4309704', 'HUMAITÁ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4802, '4309753', 'IBARAMA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4803, '4309803', 'IBIAÇÁ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4804, '4309902', 'IBIRAIARAS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4805, '4309951', 'IBIRAPUITÃ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4806, '4310009', 'IBIRUBÁ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4807, '4310108', 'IGREJINHA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4808, '4310207', 'IJUÍ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4809, '4310306', 'ILÓPOLIS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4810, '4310330', 'IMBÉ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4811, '4310363', 'IMIGRANTE', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4812, '4310405', 'INDEPENDÊNCIA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4813, '4310413', 'INHACORÁ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4814, '4310439', 'IPÊ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4815, '4310462', 'IPIRANGA DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4816, '4310504', 'IRAÍ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4817, '4310538', 'ITAARA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4818, '4310553', 'ITACURUBI', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4819, '4310579', 'ITAPUCA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4820, '4310603', 'ITAQUI', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4821, '4310652', 'ITATI', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4822, '4310702', 'ITATIBA DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4823, '4310751', 'IVORÁ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4824, '4310801', 'IVOTI', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4825, '4310850', 'JABOTICABA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4826, '4310876', 'JACUIZINHO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4827, '4310900', 'JACUTINGA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4828, '4311007', 'JAGUARÃO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4829, '4311106', 'JAGUARI', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4830, '4311122', 'JAQUIRANA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4831, '4311130', 'JARI', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4832, '4311155', 'JÓIA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4833, '4311205', 'JÚLIO DE CASTILHOS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4834, '4311239', 'LAGOA BONITA DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4835, '4311270', 'LAGOA DOS TRÊS CANTOS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4836, '4311304', 'LAGOA VERMELHA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4837, '4311254', 'LAGOÃO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4838, '4311403', 'LAJEADO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4839, '4311429', 'LAJEADO DO BUGRE', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4840, '4311502', 'LAVRAS DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4841, '4311601', 'LIBERATO SALZANO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4842, '4311627', 'LINDOLFO COLLOR', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4843, '4311643', 'LINHA NOVA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4844, '4311718', 'MAÇAMBARÁ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4845, '4311700', 'MACHADINHO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4846, '4311734', 'MAMPITUBA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4847, '4311759', 'MANOEL VIANA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4848, '4311775', 'MAQUINÉ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4849, '4311791', 'MARATÁ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4850, '4311809', 'MARAU', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4851, '4311908', 'MARCELINO RAMOS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4852, '4311981', 'MARIANA PIMENTEL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4853, '4312005', 'MARIANO MORO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4854, '4312054', 'MARQUES DE SOUZA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4855, '4312104', 'MATA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4856, '4312138', 'MATO CASTELHANO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4857, '4312153', 'MATO LEITÃO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4858, '4312179', 'MATO QUEIMADO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4859, '4312203', 'MAXIMILIANO DE ALMEIDA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4860, '4312252', 'MINAS DO LEÃO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4861, '4312302', 'MIRAGUAÍ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4862, '4312351', 'MONTAURI', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4863, '4312377', 'MONTE ALEGRE DOS CAMPOS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4864, '4312385', 'MONTE BELO DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4865, '4312401', 'MONTENEGRO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4866, '4312427', 'MORMAÇO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4867, '4312443', 'MORRINHOS DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4868, '4312450', 'MORRO REDONDO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4869, '4312476', 'MORRO REUTER', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4870, '4312500', 'MOSTARDAS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4871, '4312609', 'MUÇUM', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4872, '4312617', 'MUITOS CAPÕES', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4873, '4312625', 'MULITERNO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4874, '4312658', 'NÃO-ME-TOQUE', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4875, '4312674', 'NICOLAU VERGUEIRO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4876, '4312708', 'NONOAI', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4877, '4312757', 'NOVA ALVORADA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4878, '4312807', 'NOVA ARAÇÁ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4879, '4312906', 'NOVA BASSANO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4880, '4312955', 'NOVA BOA VISTA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4881, '4313003', 'NOVA BRÉSCIA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4882, '4313011', 'NOVA CANDELÁRIA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4883, '4313037', 'NOVA ESPERANÇA DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4884, '4313060', 'NOVA HARTZ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4885, '4313086', 'NOVA PÁDUA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4886, '4313102', 'NOVA PALMA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4887, '4313201', 'NOVA PETRÓPOLIS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4888, '4313300', 'NOVA PRATA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4889, '4313334', 'NOVA RAMADA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4890, '4313359', 'NOVA ROMA DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4891, '4313375', 'NOVA SANTA RITA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4892, '4313490', 'NOVO BARREIRO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4893, '4313391', 'NOVO CABRAIS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4894, '4313409', 'NOVO HAMBURGO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4895, '4313425', 'NOVO MACHADO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4896, '4313441', 'NOVO TIRADENTES', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4897, '4313466', 'NOVO XINGU', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4898, '4313508', 'OSÓRIO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4899, '4313607', 'PAIM FILHO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4900, '4313656', 'PALMARES DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4901, '4313706', 'PALMEIRA DAS MISSÕES', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4902, '4313805', 'PALMITINHO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4903, '4313904', 'PANAMBI', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4904, '4313953', 'PANTANO GRANDE', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4905, '4314001', 'PARAÍ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4906, '4314027', 'PARAÍSO DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4907, '4314035', 'PARECI NOVO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4908, '4314050', 'PAROBÉ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4909, '4314068', 'PASSA SETE', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4910, '4314076', 'PASSO DO SOBRADO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4911, '4314100', 'PASSO FUNDO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4912, '4314134', 'PAULO BENTO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4913, '4314159', 'PAVERAMA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4914, '4314175', 'PEDRAS ALTAS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4915, '4314209', 'PEDRO OSÓRIO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4916, '4314308', 'PEJUÇARA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4917, '4314407', 'PELOTAS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4918, '4314423', 'PICADA CAFÉ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4919, '4314456', 'PINHAL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4920, '4314464', 'PINHAL DA SERRA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4921, '4314472', 'PINHAL GRANDE', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4922, '4314498', 'PINHEIRINHO DO VALE', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4923, '4314506', 'PINHEIRO MACHADO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4924, '4314548', 'PINTO BANDEIRA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4925, '4314555', 'PIRAPÓ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4926, '4314605', 'PIRATINI', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4927, '4314704', 'PLANALTO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4928, '4314753', 'POÇO DAS ANTAS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4929, '4314779', 'PONTÃO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4930, '4314787', 'PONTE PRETA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4931, '4314803', 'PORTÃO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4932, '4314902', 'PORTO ALEGRE', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4933, '4315008', 'PORTO LUCENA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4934, '4315057', 'PORTO MAUÁ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4935, '4315073', 'PORTO VERA CRUZ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4936, '4315107', 'PORTO XAVIER', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4937, '4315131', 'POUSO NOVO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4938, '4315149', 'PRESIDENTE LUCENA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4939, '4315156', 'PROGRESSO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4940, '4315172', 'PROTÁSIO ALVES', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4941, '4315206', 'PUTINGA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4942, '4315305', 'QUARAÍ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4943, '4315313', 'QUATRO IRMÃOS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4944, '4315321', 'QUEVEDOS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4945, '4315354', 'QUINZE DE NOVEMBRO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4946, '4315404', 'REDENTORA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4947, '4315453', 'RELVADO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4948, '4315503', 'RESTINGA SÊCA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4949, '4315552', 'RIO DOS ÍNDIOS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4950, '4315602', 'RIO GRANDE', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4951, '4315701', 'RIO PARDO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4952, '4315750', 'RIOZINHO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4953, '4315800', 'ROCA SALES', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4954, '4315909', 'RODEIO BONITO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4955, '4315958', 'ROLADOR', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4956, '4316006', 'ROLANTE', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4957, '4316105', 'RONDA ALTA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4958, '4316204', 'RONDINHA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4959, '4316303', 'ROQUE GONZALES', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4960, '4316402', 'ROSÁRIO DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4961, '4316428', 'SAGRADA FAMÍLIA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4962, '4316436', 'SALDANHA MARINHO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4963, '4316451', 'SALTO DO JACUÍ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4964, '4316477', 'SALVADOR DAS MISSÕES', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4965, '4316501', 'SALVADOR DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4966, '4316600', 'SANANDUVA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4967, '4316709', 'SANTA BÁRBARA DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4968, '4316733', 'SANTA CECÍLIA DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4969, '4316758', 'SANTA CLARA DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4970, '4316808', 'SANTA CRUZ DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4971, '4316972', 'SANTA MARGARIDA DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4972, '4316907', 'SANTA MARIA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4973, '4316956', 'SANTA MARIA DO HERVAL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4974, '4317202', 'SANTA ROSA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4975, '4317251', 'SANTA TEREZA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4976, '4317301', 'SANTA VITÓRIA DO PALMAR', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4977, '4317004', 'SANTANA DA BOA VISTA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4978, '4317103', 'SANTANA DO LIVRAMENTO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4979, '4317400', 'SANTIAGO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4980, '4317509', 'SANTO ÂNGELO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4981, '4317608', 'SANTO ANTÔNIO DA PATRULHA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4982, '4317707', 'SANTO ANTÔNIO DAS MISSÕES', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4983, '4317558', 'SANTO ANTÔNIO DO PALMA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4984, '4317756', 'SANTO ANTÔNIO DO PLANALTO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4985, '4317806', 'SANTO AUGUSTO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4986, '4317905', 'SANTO CRISTO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4987, '4317954', 'SANTO EXPEDITO DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4988, '4318002', 'SÃO BORJA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4989, '4318051', 'SÃO DOMINGOS DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4990, '4318101', 'SÃO FRANCISCO DE ASSIS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4991, '4318200', 'SÃO FRANCISCO DE PAULA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4992, '4318309', 'SÃO GABRIEL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4993, '4318408', 'SÃO JERÔNIMO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4994, '4318424', 'SÃO JOÃO DA URTIGA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4995, '4318432', 'SÃO JOÃO DO POLÊSINE', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4996, '4318440', 'SÃO JORGE', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4997, '4318457', 'SÃO JOSÉ DAS MISSÕES', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4998, '4318465', 'SÃO JOSÉ DO HERVAL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4999, '4318481', 'SÃO JOSÉ DO HORTÊNCIO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5000, '4318499', 'SÃO JOSÉ DO INHACORÁ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5001, '4318507', 'SÃO JOSÉ DO NORTE', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5002, '4318606', 'SÃO JOSÉ DO OURO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5003, '4318614', 'SÃO JOSÉ DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5004, '4318622', 'SÃO JOSÉ DOS AUSENTES', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5005, '4318705', 'SÃO LEOPOLDO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5006, '4318804', 'SÃO LOURENÇO DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5007, '4318903', 'SÃO LUIZ GONZAGA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5008, '4319000', 'SÃO MARCOS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5009, '4319109', 'SÃO MARTINHO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5010, '4319125', 'SÃO MARTINHO DA SERRA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5011, '4319158', 'SÃO MIGUEL DAS MISSÕES', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5012, '4319208', 'SÃO NICOLAU', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5013, '4319307', 'SÃO PAULO DAS MISSÕES', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5014, '4319356', 'SÃO PEDRO DA SERRA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5015, '4319364', 'SÃO PEDRO DAS MISSÕES', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5016, '4319372', 'SÃO PEDRO DO BUTIÁ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5017, '4319406', 'SÃO PEDRO DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5018, '4319505', 'SÃO SEBASTIÃO DO CAÍ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5019, '4319604', 'SÃO SEPÉ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5020, '4319703', 'SÃO VALENTIM', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5021, '4319711', 'SÃO VALENTIM DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5022, '4319737', 'SÃO VALÉRIO DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5023, '4319752', 'SÃO VENDELINO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5024, '4319802', 'SÃO VICENTE DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5025, '4319901', 'SAPIRANGA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5026, '4320008', 'SAPUCAIA DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5027, '4320107', 'SARANDI', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5028, '4320206', 'SEBERI', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5029, '4320230', 'SEDE NOVA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5030, '4320263', 'SEGREDO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5031, '4320305', 'SELBACH', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5032, '4320321', 'SENADOR SALGADO FILHO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5033, '4320354', 'SENTINELA DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5034, '4320404', 'SERAFINA CORRÊA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5035, '4320453', 'SÉRIO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5036, '4320503', 'SERTÃO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5037, '4320552', 'SERTÃO SANTANA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5038, '4320578', 'SETE DE SETEMBRO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5039, '4320602', 'SEVERIANO DE ALMEIDA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5040, '4320651', 'SILVEIRA MARTINS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5041, '4320677', 'SINIMBU', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5042, '4320701', 'SOBRADINHO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5043, '4320800', 'SOLEDADE', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5044, '4320859', 'TABAÍ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5045, '4320909', 'TAPEJARA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5046, '4321006', 'TAPERA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5047, '4321105', 'TAPES', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5048, '4321204', 'TAQUARA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5049, '4321303', 'TAQUARI', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5050, '4321329', 'TAQUARUÇU DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5051, '4321352', 'TAVARES', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5052, '4321402', 'TENENTE PORTELA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5053, '4321436', 'TERRA DE AREIA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5054, '4321451', 'TEUTÔNIA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5055, '4321469', 'TIO HUGO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5056, '4321477', 'TIRADENTES DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5057, '4321493', 'TOROPI', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5058, '4321501', 'TORRES', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5059, '4321600', 'TRAMANDAÍ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5060, '4321626', 'TRAVESSEIRO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5061, '4321634', 'TRÊS ARROIOS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5062, '4321667', 'TRÊS CACHOEIRAS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5063, '4321709', 'TRÊS COROAS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5064, '4321808', 'TRÊS DE MAIO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5065, '4321832', 'TRÊS FORQUILHAS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5066, '4321857', 'TRÊS PALMEIRAS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5067, '4321907', 'TRÊS PASSOS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5068, '4321956', 'TRINDADE DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5069, '4322004', 'TRIUNFO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5070, '4322103', 'TUCUNDUVA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5071, '4322152', 'TUNAS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5072, '4322186', 'TUPANCI DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5073, '4322202', 'TUPANCIRETÃ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5074, '4322251', 'TUPANDI', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5075, '4322301', 'TUPARENDI', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5076, '4322327', 'TURUÇU', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5077, '4322343', 'UBIRETAMA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5078, '4322350', 'UNIÃO DA SERRA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5079, '4322376', 'UNISTALDA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5080, '4322400', 'URUGUAIANA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5081, '4322509', 'VACARIA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5082, '4322533', 'VALE DO SOL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5083, '4322541', 'VALE REAL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5084, '4322525', 'VALE VERDE', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5085, '4322558', 'VANINI', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5086, '4322608', 'VENÂNCIO AIRES', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5087, '4322707', 'VERA CRUZ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5088, '4322806', 'VERANÓPOLIS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5089, '4322855', 'VESPASIANO CORRÊA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5090, '4322905', 'VIADUTOS', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5091, '4323002', 'VIAMÃO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5092, '4323101', 'VICENTE DUTRA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5093, '4323200', 'VICTOR GRAEFF', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5094, '4323309', 'VILA FLORES', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5095, '4323358', 'VILA LÂNGARO', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5096, '4323408', 'VILA MARIA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5097, '4323457', 'VILA NOVA DO SUL', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5098, '4323507', 'VISTA ALEGRE', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5099, '4323606', 'VISTA ALEGRE DO PRATA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5100, '4323705', 'VISTA GAÚCHA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5101, '4323754', 'VITÓRIA DAS MISSÕES', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5102, '4323770', 'WESTFÁLIA', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5103, '4323804', 'XANGRI-LÁ', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5104, '5000203', 'ÁGUA CLARA', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5105, '5000252', 'ALCINÓPOLIS', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5106, '5000609', 'AMAMBAI', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5107, '5000708', 'ANASTÁCIO', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5108, '5000807', 'ANAURILÂNDIA', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5109, '5000856', 'ANGÉLICA', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5110, '5000906', 'ANTÔNIO JOÃO', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5111, '5001003', 'APARECIDA DO TABOADO', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5112, '5001102', 'AQUIDAUANA', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5113, '5001243', 'ARAL MOREIRA', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5114, '5001508', 'BANDEIRANTES', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5115, '5001904', 'BATAGUASSU', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5116, '5002001', 'BATAYPORÃ', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5117, '5002100', 'BELA VISTA', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5118, '5002159', 'BODOQUENA', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5119, '5002209', 'BONITO', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5120, '5002308', 'BRASILÂNDIA', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5121, '5002407', 'CAARAPÓ', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5122, '5002605', 'CAMAPUÃ', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5123, '5002704', 'CAMPO GRANDE', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5124, '5002803', 'CARACOL', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5125, '5002902', 'CASSILÂNDIA', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5126, '5002951', 'CHAPADÃO DO SUL', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5127, '5003108', 'CORGUINHO', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5128, '5003157', 'CORONEL SAPUCAIA', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5129, '5003207', 'CORUMBÁ', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5130, '5003256', 'COSTA RICA', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5131, '5003306', 'COXIM', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5132, '5003454', 'DEODÁPOLIS', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5133, '5003488', 'DOIS IRMÃOS DO BURITI', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5134, '5003504', 'DOURADINA', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5135, '5003702', 'DOURADOS', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5136, '5003751', 'ELDORADO', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5137, '5003801', 'FÁTIMA DO SUL', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5138, '5003900', 'FIGUEIRÃO', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5139, '5004007', 'GLÓRIA DE DOURADOS', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5140, '5004106', 'GUIA LOPES DA LAGUNA', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5141, '5004304', 'IGUATEMI', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5142, '5004403', 'INOCÊNCIA', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5143, '5004502', 'ITAPORÃ', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5144, '5004601', 'ITAQUIRAÍ', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5145, '5004700', 'IVINHEMA', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5146, '5004809', 'JAPORÃ', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5147, '5004908', 'JARAGUARI', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5148, '5005004', 'JARDIM', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5149, '5005103', 'JATEÍ', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5150, '5005152', 'JUTI', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5151, '5005202', 'LADÁRIO', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5152, '5005251', 'LAGUNA CARAPÃ', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5153, '5005400', 'MARACAJU', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5154, '5005608', 'MIRANDA', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5155, '5005681', 'MUNDO NOVO', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5156, '5005707', 'NAVIRAÍ', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5157, '5005806', 'NIOAQUE', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5158, '5006002', 'NOVA ALVORADA DO SUL', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5159, '5006200', 'NOVA ANDRADINA', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5160, '5006259', 'NOVO HORIZONTE DO SUL', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5161, '5006275', 'PARAÍSO DAS ÁGUAS', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5162, '5006309', 'PARANAÍBA', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5163, '5006358', 'PARANHOS', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5164, '5006408', 'PEDRO GOMES', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5165, '5006606', 'PONTA PORÃ', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5166, '5006903', 'PORTO MURTINHO', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5167, '5007109', 'RIBAS DO RIO PARDO', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5168, '5007208', 'RIO BRILHANTE', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5169, '5007307', 'RIO NEGRO', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5170, '5007406', 'RIO VERDE DE MATO GROSSO', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5171, '5007505', 'ROCHEDO', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5172, '5007554', 'SANTA RITA DO PARDO', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5173, '5007695', 'SÃO GABRIEL DO OESTE', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5174, '5007802', 'SELVÍRIA', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5175, '5007703', 'SETE QUEDAS', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5176, '5007901', 'SIDROLÂNDIA', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5177, '5007935', 'SONORA', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5178, '5007950', 'TACURU', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5179, '5007976', 'TAQUARUSSU', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5180, '5008008', 'TERENOS', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5181, '5008305', 'TRÊS LAGOAS', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5182, '5008404', 'VICENTINA', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5183, '5100102', 'ACORIZAL', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5184, '5100201', 'ÁGUA BOA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5185, '5100250', 'ALTA FLORESTA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5186, '5100300', 'ALTO ARAGUAIA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5187, '5100359', 'ALTO BOA VISTA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5188, '5100409', 'ALTO GARÇAS', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5189, '5100508', 'ALTO PARAGUAI', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5190, '5100607', 'ALTO TAQUARI', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5191, '5100805', 'APIACÁS', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5192, '5101001', 'ARAGUAIANA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5193, '5101209', 'ARAGUAINHA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5194, '5101258', 'ARAPUTANGA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5195, '5101308', 'ARENÁPOLIS', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5196, '5101407', 'ARIPUANÃ', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5197, '5101605', 'BARÃO DE MELGAÇO', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5198, '5101704', 'BARRA DO BUGRES', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5199, '5101803', 'BARRA DO GARÇAS', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5200, '5101852', 'BOM JESUS DO ARAGUAIA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5201, '5101902', 'BRASNORTE', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5202, '5102504', 'CÁCERES', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5203, '5102603', 'CAMPINÁPOLIS', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5204, '5102637', 'CAMPO NOVO DO PARECIS', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `municipios` (`id_municipio`, `codigo`, `municipio`, `id_uf`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5205, '5102678', 'CAMPO VERDE', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5206, '5102686', 'CAMPOS DE JÚLIO', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5207, '5102694', 'CANABRAVA DO NORTE', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5208, '5102702', 'CANARANA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5209, '5102793', 'CARLINDA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5210, '5102850', 'CASTANHEIRA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5211, '5103007', 'CHAPADA DOS GUIMARÃES', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5212, '5103056', 'CLÁUDIA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5213, '5103106', 'COCALINHO', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5214, '5103205', 'COLÍDER', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5215, '5103254', 'COLNIZA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5216, '5103304', 'COMODORO', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5217, '5103353', 'CONFRESA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5218, '5103361', 'CONQUISTA DOESTE', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5219, '5103379', 'COTRIGUAÇU', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5220, '5103403', 'CUIABÁ', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5221, '5103437', 'CURVELÂNDIA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5222, '5103452', 'DENISE', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5223, '5103502', 'DIAMANTINO', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5224, '5103601', 'DOM AQUINO', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5225, '5103700', 'FELIZ NATAL', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5226, '5103809', 'FIGUEIRÓPOLIS DOESTE', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5227, '5103858', 'GAÚCHA DO NORTE', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5228, '5103908', 'GENERAL CARNEIRO', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5229, '5103957', 'GLÓRIA DOESTE', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5230, '5104104', 'GUARANTÃ DO NORTE', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5231, '5104203', 'GUIRATINGA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5232, '5104500', 'INDIAVAÍ', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5233, '5104526', 'IPIRANGA DO NORTE', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5234, '5104542', 'ITANHANGÁ', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5235, '5104559', 'ITAÚBA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5236, '5104609', 'ITIQUIRA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5237, '5104807', 'JACIARA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5238, '5104906', 'JANGADA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5239, '5105002', 'JAURU', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5240, '5105101', 'JUARA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5241, '5105150', 'JUÍNA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5242, '5105176', 'JURUENA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5243, '5105200', 'JUSCIMEIRA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5244, '5105234', 'LAMBARI DOESTE', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5245, '5105259', 'LUCAS DO RIO VERDE', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5246, '5105309', 'LUCIARA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5247, '5105580', 'MARCELÂNDIA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5248, '5105606', 'MATUPÁ', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5249, '5105622', 'MIRASSOL DOESTE', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5250, '5105903', 'NOBRES', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5251, '5106000', 'NORTELÂNDIA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5252, '5106109', 'NOSSA SENHORA DO LIVRAMENTO', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5253, '5106158', 'NOVA BANDEIRANTES', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5254, '5106208', 'NOVA BRASILÂNDIA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5255, '5106216', 'NOVA CANAÃ DO NORTE', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5256, '5108808', 'NOVA GUARITA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5257, '5106182', 'NOVA LACERDA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5258, '5108857', 'NOVA MARILÂNDIA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5259, '5108907', 'NOVA MARINGÁ', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5260, '5108956', 'NOVA MONTE VERDE', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5261, '5106224', 'NOVA MUTUM', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5262, '5106174', 'NOVA NAZARÉ', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5263, '5106232', 'NOVA OLÍMPIA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5264, '5106190', 'NOVA SANTA HELENA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5265, '5106240', 'NOVA UBIRATÃ', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5266, '5106257', 'NOVA XAVANTINA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5267, '5106273', 'NOVO HORIZONTE DO NORTE', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5268, '5106265', 'NOVO MUNDO', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5269, '5106315', 'NOVO SANTO ANTÔNIO', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5270, '5106281', 'NOVO SÃO JOAQUIM', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5271, '5106299', 'PARANAÍTA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5272, '5106307', 'PARANATINGA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5273, '5106372', 'PEDRA PRETA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5274, '5106422', 'PEIXOTO DE AZEVEDO', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5275, '5106455', 'PLANALTO DA SERRA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5276, '5106505', 'POCONÉ', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5277, '5106653', 'PONTAL DO ARAGUAIA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5278, '5106703', 'PONTE BRANCA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5279, '5106752', 'PONTES E LACERDA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5280, '5106778', 'PORTO ALEGRE DO NORTE', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5281, '5106802', 'PORTO DOS GAÚCHOS', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5282, '5106828', 'PORTO ESPERIDIÃO', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5283, '5106851', 'PORTO ESTRELA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5284, '5107008', 'POXORÉU', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5285, '5107040', 'PRIMAVERA DO LESTE', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5286, '5107065', 'QUERÊNCIA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5287, '5107156', 'RESERVA DO CABAÇAL', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5288, '5107180', 'RIBEIRÃO CASCALHEIRA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5289, '5107198', 'RIBEIRÃOZINHO', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5290, '5107206', 'RIO BRANCO', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5291, '5107578', 'RONDOLÂNDIA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5292, '5107602', 'RONDONÓPOLIS', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5293, '5107701', 'ROSÁRIO OESTE', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5294, '5107750', 'SALTO DO CÉU', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5295, '5107248', 'SANTA CARMEM', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5296, '5107743', 'SANTA CRUZ DO XINGU', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5297, '5107768', 'SANTA RITA DO TRIVELATO', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5298, '5107776', 'SANTA TEREZINHA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5299, '5107263', 'SANTO AFONSO', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5300, '5107792', 'SANTO ANTÔNIO DO LESTE', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5301, '5107800', 'SANTO ANTÔNIO DO LEVERGER', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5302, '5107859', 'SÃO FÉLIX DO ARAGUAIA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5303, '5107297', 'SÃO JOSÉ DO POVO', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5304, '5107305', 'SÃO JOSÉ DO RIO CLARO', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5305, '5107354', 'SÃO JOSÉ DO XINGU', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5306, '5107107', 'SÃO JOSÉ DOS QUATRO MARCOS', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5307, '5107404', 'SÃO PEDRO DA CIPA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5308, '5107875', 'SAPEZAL', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5309, '5107883', 'SERRA NOVA DOURADA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5310, '5107909', 'SINOP', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5311, '5107925', 'SORRISO', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5312, '5107941', 'TABAPORÃ', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5313, '5107958', 'TANGARÁ DA SERRA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5314, '5108006', 'TAPURAH', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5315, '5108055', 'TERRA NOVA DO NORTE', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5316, '5108105', 'TESOURO', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5317, '5108204', 'TORIXORÉU', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5318, '5108303', 'UNIÃO DO SUL', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5319, '5108352', 'VALE DE SÃO DOMINGOS', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5320, '5108402', 'VÁRZEA GRANDE', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5321, '5108501', 'VERA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5322, '5105507', 'VILA BELA DA SANTÍSSIMA TRINDADE', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5323, '5108600', 'VILA RICA', 51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5324, '5200050', 'ABADIA DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5325, '5200100', 'ABADIÂNIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5326, '5200134', 'ACREÚNA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5327, '5200159', 'ADELÂNDIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5328, '5200175', 'ÁGUA FRIA DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5329, '5200209', 'ÁGUA LIMPA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5330, '5200258', 'ÁGUAS LINDAS DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5331, '5200308', 'ALEXÂNIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5332, '5200506', 'ALOÂNDIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5333, '5200555', 'ALTO HORIZONTE', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5334, '5200605', 'ALTO PARAÍSO DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5335, '5200803', 'ALVORADA DO NORTE', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5336, '5200829', 'AMARALINA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5337, '5200852', 'AMERICANO DO BRASIL', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5338, '5200902', 'AMORINÓPOLIS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5339, '5201108', 'ANÁPOLIS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5340, '5201207', 'ANHANGUERA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5341, '5201306', 'ANICUNS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5342, '5201405', 'APARECIDA DE GOIÂNIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5343, '5201454', 'APARECIDA DO RIO DOCE', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5344, '5201504', 'APORÉ', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5345, '5201603', 'ARAÇU', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5346, '5201702', 'ARAGARÇAS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5347, '5201801', 'ARAGOIÂNIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5348, '5202155', 'ARAGUAPAZ', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5349, '5202353', 'ARENÓPOLIS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5350, '5202502', 'ARUANÃ', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5351, '5202601', 'AURILÂNDIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5352, '5202809', 'AVELINÓPOLIS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5353, '5203104', 'BALIZA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5354, '5203203', 'BARRO ALTO', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5355, '5203302', 'BELA VISTA DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5356, '5203401', 'BOM JARDIM DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5357, '5203500', 'BOM JESUS DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5358, '5203559', 'BONFINÓPOLIS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5359, '5203575', 'BONÓPOLIS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5360, '5203609', 'BRAZABRANTES', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5361, '5203807', 'BRITÂNIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5362, '5203906', 'BURITI ALEGRE', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5363, '5203939', 'BURITI DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5364, '5203962', 'BURITINÓPOLIS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5365, '5204003', 'CABECEIRAS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5366, '5204102', 'CACHOEIRA ALTA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5367, '5204201', 'CACHOEIRA DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5368, '5204250', 'CACHOEIRA DOURADA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5369, '5204300', 'CAÇU', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5370, '5204409', 'CAIAPÔNIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5371, '5204508', 'CALDAS NOVAS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5372, '5204557', 'CALDAZINHA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5373, '5204607', 'CAMPESTRE DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5374, '5204656', 'CAMPINAÇU', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5375, '5204706', 'CAMPINORTE', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5376, '5204805', 'CAMPO ALEGRE DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5377, '5204854', 'CAMPO LIMPO DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5378, '5204904', 'CAMPOS BELOS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5379, '5204953', 'CAMPOS VERDES', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5380, '5205000', 'CARMO DO RIO VERDE', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5381, '5205059', 'CASTELÂNDIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5382, '5205109', 'CATALÃO', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5383, '5205208', 'CATURAÍ', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5384, '5205307', 'CAVALCANTE', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5385, '5205406', 'CERES', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5386, '5205455', 'CEZARINA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5387, '5205471', 'CHAPADÃO DO CÉU', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5388, '5205497', 'CIDADE OCIDENTAL', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5389, '5205513', 'COCALZINHO DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5390, '5205521', 'COLINAS DO SUL', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5391, '5205703', 'CÓRREGO DO OURO', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5392, '5205802', 'CORUMBÁ DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5393, '5205901', 'CORUMBAÍBA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5394, '5206206', 'CRISTALINA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5395, '5206305', 'CRISTIANÓPOLIS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5396, '5206404', 'CRIXÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5397, '5206503', 'CROMÍNIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5398, '5206602', 'CUMARI', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5399, '5206701', 'DAMIANÓPOLIS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5400, '5206800', 'DAMOLÂNDIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5401, '5206909', 'DAVINÓPOLIS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5402, '5207105', 'DIORAMA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5403, '5208301', 'DIVINÓPOLIS DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5404, '5207253', 'DOVERLÂNDIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5405, '5207352', 'EDEALINA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5406, '5207402', 'EDÉIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5407, '5207501', 'ESTRELA DO NORTE', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5408, '5207535', 'FAINA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5409, '5207600', 'FAZENDA NOVA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5410, '5207808', 'FIRMINÓPOLIS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5411, '5207907', 'FLORES DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5412, '5208004', 'FORMOSA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5413, '5208103', 'FORMOSO', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5414, '5208152', 'GAMELEIRA DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5415, '5208400', 'GOIANÁPOLIS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5416, '5208509', 'GOIANDIRA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5417, '5208608', 'GOIANÉSIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5418, '5208707', 'GOIÂNIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5419, '5208806', 'GOIANIRA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5420, '5208905', 'GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5421, '5209101', 'GOIATUBA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5422, '5209150', 'GOUVELÂNDIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5423, '5209200', 'GUAPÓ', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5424, '5209291', 'GUARAÍTA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5425, '5209408', 'GUARANI DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5426, '5209457', 'GUARINOS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5427, '5209606', 'HEITORAÍ', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5428, '5209705', 'HIDROLÂNDIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5429, '5209804', 'HIDROLINA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5430, '5209903', 'IACIARA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5431, '5209937', 'INACIOLÂNDIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5432, '5209952', 'INDIARA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5433, '5210000', 'INHUMAS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5434, '5210109', 'IPAMERI', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5435, '5210158', 'IPIRANGA DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5436, '5210208', 'IPORÁ', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5437, '5210307', 'ISRAELÂNDIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5438, '5210406', 'ITABERAÍ', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5439, '5210562', 'ITAGUARI', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5440, '5210604', 'ITAGUARU', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5441, '5210802', 'ITAJÁ', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5442, '5210901', 'ITAPACI', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5443, '5211008', 'ITAPIRAPUÃ', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5444, '5211206', 'ITAPURANGA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5445, '5211305', 'ITARUMÃ', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5446, '5211404', 'ITAUÇU', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5447, '5211503', 'ITUMBIARA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5448, '5211602', 'IVOLÂNDIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5449, '5211701', 'JANDAIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5450, '5211800', 'JARAGUÁ', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5451, '5211909', 'JATAÍ', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5452, '5212006', 'JAUPACI', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5453, '5212055', 'JESÚPOLIS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5454, '5212105', 'JOVIÂNIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5455, '5212204', 'JUSSARA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5456, '5212253', 'LAGOA SANTA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5457, '5212303', 'LEOPOLDO DE BULHÕES', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5458, '5212501', 'LUZIÂNIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5459, '5212600', 'MAIRIPOTABA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5460, '5212709', 'MAMBAÍ', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5461, '5212808', 'MARA ROSA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5462, '5212907', 'MARZAGÃO', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5463, '5212956', 'MATRINCHÃ', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5464, '5213004', 'MAURILÂNDIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5465, '5213053', 'MIMOSO DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5466, '5213087', 'MINAÇU', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5467, '5213103', 'MINEIROS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5468, '5213400', 'MOIPORÁ', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5469, '5213509', 'MONTE ALEGRE DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5470, '5213707', 'MONTES CLAROS DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5471, '5213756', 'MONTIVIDIU', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5472, '5213772', 'MONTIVIDIU DO NORTE', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5473, '5213806', 'MORRINHOS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5474, '5213855', 'MORRO AGUDO DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5475, '5213905', 'MOSSÂMEDES', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5476, '5214002', 'MOZARLÂNDIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5477, '5214051', 'MUNDO NOVO', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5478, '5214101', 'MUTUNÓPOLIS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5479, '5214408', 'NAZÁRIO', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5480, '5214507', 'NERÓPOLIS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5481, '5214606', 'NIQUELÂNDIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5482, '5214705', 'NOVA AMÉRICA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5483, '5214804', 'NOVA AURORA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5484, '5214838', 'NOVA CRIXÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5485, '5214861', 'NOVA GLÓRIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5486, '5214879', 'NOVA IGUAÇU DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5487, '5214903', 'NOVA ROMA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5488, '5215009', 'NOVA VENEZA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5489, '5215207', 'NOVO BRASIL', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5490, '5215231', 'NOVO GAMA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5491, '5215256', 'NOVO PLANALTO', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5492, '5215306', 'ORIZONA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5493, '5215405', 'OURO VERDE DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5494, '5215504', 'OUVIDOR', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5495, '5215603', 'PADRE BERNARDO', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5496, '5215652', 'PALESTINA DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5497, '5215702', 'PALMEIRAS DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5498, '5215801', 'PALMELO', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5499, '5215900', 'PALMINÓPOLIS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5500, '5216007', 'PANAMÁ', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5501, '5216304', 'PARANAIGUARA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5502, '5216403', 'PARAÚNA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5503, '5216452', 'PEROLÂNDIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5504, '5216809', 'PETROLINA DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5505, '5216908', 'PILAR DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5506, '5217104', 'PIRACANJUBA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5507, '5217203', 'PIRANHAS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5508, '5217302', 'PIRENÓPOLIS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5509, '5217401', 'PIRES DO RIO', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5510, '5217609', 'PLANALTINA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5511, '5217708', 'PONTALINA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5512, '5218003', 'PORANGATU', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5513, '5218052', 'PORTEIRÃO', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5514, '5218102', 'PORTELÂNDIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5515, '5218300', 'POSSE', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5516, '5218391', 'PROFESSOR JAMIL', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5517, '5218508', 'QUIRINÓPOLIS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5518, '5218607', 'RIALMA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5519, '5218706', 'RIANÁPOLIS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5520, '5218789', 'RIO QUENTE', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5521, '5218805', 'RIO VERDE', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5522, '5218904', 'RUBIATABA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5523, '5219001', 'SANCLERLÂNDIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5524, '5219100', 'SANTA BÁRBARA DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5525, '5219209', 'SANTA CRUZ DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5526, '5219258', 'SANTA FÉ DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5527, '5219308', 'SANTA HELENA DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5528, '5219357', 'SANTA ISABEL', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5529, '5219407', 'SANTA RITA DO ARAGUAIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5530, '5219456', 'SANTA RITA DO NOVO DESTINO', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5531, '5219506', 'SANTA ROSA DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5532, '5219605', 'SANTA TEREZA DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5533, '5219704', 'SANTA TEREZINHA DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5534, '5219712', 'SANTO ANTÔNIO DA BARRA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5535, '5219738', 'SANTO ANTÔNIO DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5536, '5219753', 'SANTO ANTÔNIO DO DESCOBERTO', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5537, '5219803', 'SÃO DOMINGOS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5538, '5219902', 'SÃO FRANCISCO DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5539, '5220058', 'SÃO JOÃO DA PARAÚNA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5540, '5220009', 'SÃO JOÃO DALIANÇA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5541, '5220108', 'SÃO LUÍS DE MONTES BELOS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5542, '5220157', 'SÃO LUIZ DO NORTE', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5543, '5220207', 'SÃO MIGUEL DO ARAGUAIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5544, '5220264', 'SÃO MIGUEL DO PASSA QUATRO', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5545, '5220280', 'SÃO PATRÍCIO', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5546, '5220405', 'SÃO SIMÃO', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5547, '5220454', 'SENADOR CANEDO', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5548, '5220504', 'SERRANÓPOLIS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5549, '5220603', 'SILVÂNIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5550, '5220686', 'SIMOLÂNDIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5551, '5220702', 'SÍTIO DABADIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5552, '5221007', 'TAQUARAL DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5553, '5221080', 'TERESINA DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5554, '5221197', 'TEREZÓPOLIS DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5555, '5221304', 'TRÊS RANCHOS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5556, '5221403', 'TRINDADE', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5557, '5221452', 'TROMBAS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5558, '5221502', 'TURVÂNIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5559, '5221551', 'TURVELÂNDIA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5560, '5221577', 'UIRAPURU', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5561, '5221601', 'URUAÇU', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5562, '5221700', 'URUANA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5563, '5221809', 'URUTAÍ', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5564, '5221858', 'VALPARAÍSO DE GOIÁS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5565, '5221908', 'VARJÃO', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5566, '5222005', 'VIANÓPOLIS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5567, '5222054', 'VICENTINÓPOLIS', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5568, '5222203', 'VILA BOA', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5569, '5222302', 'VILA PROPÍCIO', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5570, '5300108', 'BRASÍLIA', 53, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `nfces`
--

CREATE TABLE `nfces` (
  `id_nfce` int(9) NOT NULL,
  `status` varchar(32) NOT NULL,
  `chave` varchar(128) NOT NULL,
  `xml` text NOT NULL,
  `protocolo` text NOT NULL,
  `erro` text NOT NULL,
  `numero_da_nota` int(11) NOT NULL,
  `valor_da_nota` double NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `id_venda` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `nfes`
--

CREATE TABLE `nfes` (
  `id_nfe` int(9) NOT NULL,
  `status` varchar(32) NOT NULL,
  `chave` varchar(128) NOT NULL,
  `xml` text NOT NULL,
  `protocolo` text NOT NULL,
  `erro` text NOT NULL,
  `numero_da_nota` int(11) NOT NULL,
  `valor_da_nota` double NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `id_venda` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `nfes_avulsa`
--

CREATE TABLE `nfes_avulsa` (
  `id_nfe` int(9) NOT NULL,
  `status` varchar(32) NOT NULL,
  `chave` varchar(128) NOT NULL,
  `xml` text NOT NULL,
  `protocolo` text NOT NULL,
  `erro` text NOT NULL,
  `numero_da_nota` int(11) NOT NULL,
  `valor_da_nota` double NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `nfe_avulsa_produtos`
--

CREATE TABLE `nfe_avulsa_produtos` (
  `id_produto_nfe_avulsa` int(9) NOT NULL,
  `nome` varchar(512) NOT NULL,
  `unidade` varchar(16) NOT NULL,
  `codigo_de_barras` varchar(13) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor_unitario` double NOT NULL,
  `desconto` double NOT NULL,
  `NCM` varchar(8) NOT NULL,
  `CSOSN` varchar(3) NOT NULL,
  `CFOP_NFe` varchar(4) NOT NULL,
  `CFOP_NFCe` varchar(4) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `orcamentos`
--

CREATE TABLE `orcamentos` (
  `id_orcamento` int(9) NOT NULL,
  `status` varchar(16) NOT NULL,
  `valor_a_pagar` double NOT NULL,
  `desconto` double NOT NULL,
  `valor_recebido` double NOT NULL,
  `troco` double NOT NULL,
  `forma_de_pagamento` varchar(64) NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `id_caixa` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ordens_de_servicos`
--

CREATE TABLE `ordens_de_servicos` (
  `id_ordem` int(9) NOT NULL,
  `frete` double NOT NULL,
  `outros` double NOT NULL,
  `desconto` double NOT NULL,
  `situacao` varchar(128) NOT NULL,
  `data_de_entrada` date NOT NULL,
  `hora_de_entrada` time NOT NULL,
  `data_de_saida` date NOT NULL,
  `hora_de_saida` time NOT NULL,
  `canal_de_venda` varchar(128) NOT NULL,
  `forma_de_pagamento` varchar(128) NOT NULL,
  `endereco_de_entrega` varchar(128) NOT NULL,
  `observacoes` varchar(512) NOT NULL,
  `observacoes_internas` varchar(512) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `id_tecnico` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamentos_da_empresa`
--

CREATE TABLE `pagamentos_da_empresa` (
  `id_pagamento` int(9) NOT NULL,
  `valor` double NOT NULL,
  `observacoes` varchar(128) NOT NULL,
  `data` date NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamentos_do_cliente`
--

CREATE TABLE `pagamentos_do_cliente` (
  `id_pagamento` int(9) NOT NULL,
  `descricao` varchar(128) NOT NULL,
  `valor` double NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `observacoes` varchar(512) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamentos_food`
--

CREATE TABLE `pagamentos_food` (
  `id_pagamento` int(9) NOT NULL,
  `valor` double NOT NULL,
  `forma_de_pagamento` varchar(128) NOT NULL,
  `observacoes` varchar(512) NOT NULL,
  `id_mesa` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `painel`
--

CREATE TABLE `painel` (
  `id_painel` int(9) NOT NULL,
  `senha` varchar(128) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(9) NOT NULL,
  `valor_a_pagar` double NOT NULL,
  `desconto` double NOT NULL,
  `valor_recebido` double NOT NULL,
  `troco` double NOT NULL,
  `forma_de_pagamento` varchar(64) NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `situacao` varchar(128) NOT NULL,
  `prazo_de_entrega` date NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `id_caixa` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id_produto` int(9) NOT NULL,
  `nome` varchar(512) NOT NULL,
  `unidade` varchar(16) NOT NULL,
  `codigo_de_barras` varchar(13) NOT NULL,
  `localizacao` varchar(128) NOT NULL,
  `quantidade` double NOT NULL,
  `quantidade_minima` double NOT NULL,
  `valor_de_custo` double NOT NULL,
  `margem_de_lucro` double NOT NULL,
  `valor_de_venda` double NOT NULL,
  `lucro` double NOT NULL,
  `NCM` varchar(8) NOT NULL,
  `CSOSN` varchar(3) NOT NULL,
  `CFOP_NFe` varchar(4) NOT NULL,
  `CFOP_NFCe` varchar(4) NOT NULL,
  `CFOP_Externo` varchar(4) NOT NULL,
  `arquivo` varchar(128) NOT NULL,
  `tipo_da_comissao` int(11) NOT NULL,
  `porcentagem_comissao` double NOT NULL,
  `valor_comissao` double NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_fornecedor` int(11) NOT NULL,
  `validade` date NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos_da_venda`
--

CREATE TABLE `produtos_da_venda` (
  `id_produto_da_venda` int(9) NOT NULL,
  `nome` varchar(512) NOT NULL,
  `unidade` varchar(16) NOT NULL,
  `codigo_de_barras` varchar(13) NOT NULL,
  `quantidade` double NOT NULL,
  `valor_unitario` double NOT NULL,
  `subtotal` double NOT NULL,
  `desconto` double NOT NULL,
  `valor_final` double NOT NULL,
  `tipo_da_comissao` int(11) NOT NULL,
  `porcentagem_comissao` double NOT NULL,
  `valor_comissao` double NOT NULL,
  `NCM` varchar(8) NOT NULL,
  `CSOSN` varchar(3) NOT NULL,
  `CFOP_NFe` varchar(4) NOT NULL,
  `CFOP_NFCe` varchar(4) NOT NULL,
  `CFOP_Externo` varchar(4) NOT NULL,
  `id_venda` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos_da_venda_rapida`
--

CREATE TABLE `produtos_da_venda_rapida` (
  `id_produto_da_venda_rapida` int(9) NOT NULL,
  `nome` varchar(512) NOT NULL,
  `unidade` varchar(16) NOT NULL,
  `codigo_de_barras` varchar(13) NOT NULL,
  `quantidade` double NOT NULL,
  `valor_unitario` double NOT NULL,
  `subtotal` double NOT NULL,
  `desconto` double NOT NULL,
  `valor_final` double NOT NULL,
  `tipo_da_comissao` int(11) NOT NULL,
  `porcentagem_comissao` double NOT NULL,
  `valor_comissao` double NOT NULL,
  `NCM` varchar(8) NOT NULL,
  `CSOSN` varchar(3) NOT NULL,
  `CFOP_NFe` varchar(4) NOT NULL,
  `CFOP_NFCe` varchar(4) NOT NULL,
  `CFOP_Externo` varchar(4) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos_do_inventario_do_estoque`
--

CREATE TABLE `produtos_do_inventario_do_estoque` (
  `id_produto_do_inventario` int(9) NOT NULL,
  `discriminacao` varchar(512) NOT NULL,
  `unidade` varchar(16) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor_unitario` double NOT NULL,
  `id_inventario` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos_do_orcamento`
--

CREATE TABLE `produtos_do_orcamento` (
  `id_produto_do_orcamento` int(9) NOT NULL,
  `nome` varchar(512) NOT NULL,
  `unidade` varchar(16) NOT NULL,
  `codigo_de_barras` varchar(13) NOT NULL,
  `quantidade` double NOT NULL,
  `valor_unitario` double NOT NULL,
  `subtotal` double NOT NULL,
  `desconto` double NOT NULL,
  `valor_final` double NOT NULL,
  `tipo_da_comissao` int(11) NOT NULL,
  `porcentagem_comissao` double NOT NULL,
  `valor_comissao` double NOT NULL,
  `NCM` varchar(8) NOT NULL,
  `CSOSN` varchar(3) NOT NULL,
  `CFOP` varchar(4) NOT NULL,
  `id_orcamento` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos_do_pdv`
--

CREATE TABLE `produtos_do_pdv` (
  `id_produto_pdv` int(9) NOT NULL,
  `nome` varchar(512) NOT NULL,
  `unidade` varchar(16) NOT NULL,
  `codigo_de_barras` varchar(13) NOT NULL,
  `quantidade` double NOT NULL,
  `valor_unitario` double NOT NULL,
  `subtotal` double NOT NULL,
  `desconto` double NOT NULL,
  `valor_final` double NOT NULL,
  `NCM` varchar(8) NOT NULL,
  `CSOSN` varchar(3) NOT NULL,
  `CFOP_NFe` varchar(4) NOT NULL,
  `CFOP_NFCe` varchar(4) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos_do_pedido`
--

CREATE TABLE `produtos_do_pedido` (
  `id_produto_do_pedido` int(9) NOT NULL,
  `nome` varchar(512) NOT NULL,
  `unidade` varchar(16) NOT NULL,
  `codigo_de_barras` varchar(13) NOT NULL,
  `quantidade` double NOT NULL,
  `valor_unitario` double NOT NULL,
  `subtotal` double NOT NULL,
  `desconto` double NOT NULL,
  `valor_final` double NOT NULL,
  `tipo_da_comissao` int(11) NOT NULL,
  `porcentagem_comissao` double NOT NULL,
  `valor_comissao` double NOT NULL,
  `NCM` varchar(8) NOT NULL,
  `CSOSN` varchar(3) NOT NULL,
  `CFOP` varchar(4) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos_pecas_os`
--

CREATE TABLE `produtos_pecas_os` (
  `id_produto` int(9) NOT NULL,
  `nome` varchar(128) NOT NULL,
  `detalhes` varchar(512) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor` double NOT NULL,
  `desconto` double NOT NULL,
  `id_ordem` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos_pecas_os_provisorio`
--

CREATE TABLE `produtos_pecas_os_provisorio` (
  `id_produto` int(9) NOT NULL,
  `nome` varchar(128) NOT NULL,
  `detalhes` varchar(512) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor` double NOT NULL,
  `desconto` double NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `provisorio_add_produto_por_xml`
--

CREATE TABLE `provisorio_add_produto_por_xml` (
  `id_produto_provisorio` int(9) NOT NULL,
  `nome` varchar(512) NOT NULL,
  `unidade` varchar(16) NOT NULL,
  `codigo_de_barras` varchar(13) NOT NULL,
  `localizacao` varchar(128) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `quantidade_minima` int(11) NOT NULL,
  `valor_de_custo` double NOT NULL,
  `margem_de_lucro` double NOT NULL,
  `valor_de_venda` double NOT NULL,
  `lucro` double NOT NULL,
  `NCM` varchar(8) NOT NULL,
  `CSOSN` varchar(3) NOT NULL,
  `CFOP_NFe` varchar(4) NOT NULL,
  `CFOP_NFCe` varchar(4) NOT NULL,
  `CFOP_Externo` varchar(4) NOT NULL,
  `arquivo` varchar(128) NOT NULL,
  `tipo_da_comissao` int(11) NOT NULL,
  `porcentagem_comissao` double NOT NULL,
  `valor_comissao` double NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_fornecedor` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `validade` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `provisorio_produtos_da_mesa_food`
--

CREATE TABLE `provisorio_produtos_da_mesa_food` (
  `id_produto_provisorio` int(9) NOT NULL,
  `nome` varchar(512) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor` double NOT NULL,
  `status` varchar(128) NOT NULL,
  `id_mesa` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `provisorio_produtos_food`
--

CREATE TABLE `provisorio_produtos_food` (
  `id_produto_provisorio` int(9) NOT NULL,
  `nome` varchar(512) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor` double NOT NULL,
  `id_mesa` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `provisorio_reposicao_produtos_por_xml`
--

CREATE TABLE `provisorio_reposicao_produtos_por_xml` (
  `id_produto_provisorio` int(9) NOT NULL,
  `nome` varchar(512) NOT NULL,
  `quantidade_da_reposicao` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `reposicoes`
--

CREATE TABLE `reposicoes` (
  `id_reposicao` int(9) NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `quantidade` int(11) NOT NULL,
  `observacoes` varchar(512) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `id_contador` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `retiradas`
--

CREATE TABLE `retiradas` (
  `id_retirada` int(9) NOT NULL,
  `tipo` varchar(64) NOT NULL,
  `descricao` varchar(128) NOT NULL,
  `valor` double NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `observacoes` varchar(512) NOT NULL,
  `id_caixa` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `saida_de_mercadorias`
--

CREATE TABLE `saida_de_mercadorias` (
  `id_saida` int(9) NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `quantidade` int(11) NOT NULL,
  `observacoes` varchar(512) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `servicos`
--

CREATE TABLE `servicos` (
  `id_servico` int(9) NOT NULL,
  `nome` varchar(128) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `servicos_mao_de_obra`
--

CREATE TABLE `servicos_mao_de_obra` (
  `id_servico` int(9) NOT NULL,
  `nome` varchar(128) NOT NULL,
  `descricao` varchar(1024) NOT NULL,
  `valor` double NOT NULL,
  `observacoes` varchar(2048) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `servicos_mao_de_obra_da_os`
--

CREATE TABLE `servicos_mao_de_obra_da_os` (
  `id_servico` int(9) NOT NULL,
  `nome` varchar(128) NOT NULL,
  `detalhes` varchar(1024) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor` double NOT NULL,
  `desconto` double NOT NULL,
  `id_ordem` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `servicos_mao_de_obra_provisorio`
--

CREATE TABLE `servicos_mao_de_obra_provisorio` (
  `id_servico` int(9) NOT NULL,
  `nome` varchar(128) NOT NULL,
  `detalhes` varchar(1024) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor` double NOT NULL,
  `desconto` double NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tecnicos`
--

CREATE TABLE `tecnicos` (
  `id_tecnico` int(9) NOT NULL,
  `nome` varchar(129) NOT NULL,
  `data_de_nascimento` date NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `cep` varchar(12) NOT NULL,
  `logradouro` varchar(128) NOT NULL,
  `numero` varchar(9) NOT NULL,
  `complemento` varchar(128) NOT NULL,
  `bairro` varchar(128) NOT NULL,
  `fixo` varchar(16) NOT NULL,
  `celular_1` varchar(16) NOT NULL,
  `celular_2` varchar(16) NOT NULL,
  `email` varchar(128) NOT NULL,
  `id_uf` int(11) NOT NULL,
  `id_municipio` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `transportadoras`
--

CREATE TABLE `transportadoras` (
  `id_transportadora` int(9) NOT NULL,
  `CNPJ` varchar(14) NOT NULL,
  `xNome` varchar(128) NOT NULL,
  `isento` int(11) NOT NULL,
  `IE` varchar(128) NOT NULL,
  `xEnder` varchar(512) NOT NULL,
  `id_uf` int(11) NOT NULL,
  `id_municipio` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ufs`
--

CREATE TABLE `ufs` (
  `id_uf` int(9) NOT NULL,
  `codigo_uf` int(11) NOT NULL,
  `estado` varchar(512) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `ufs`
--

INSERT INTO `ufs` (`id_uf`, `codigo_uf`, `estado`, `uf`, `created_at`, `updated_at`, `deleted_at`) VALUES
(11, 11, 'Rondônia', 'RO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 12, 'Acre', 'AC', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 13, 'Amazonas', 'AM', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 14, 'Roraima', 'RR', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 15, 'Pará', 'PA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 16, 'Amapá', 'AP', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 17, 'Tocantins', 'TO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 21, 'Maranhão', 'MA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 22, 'Piauí', 'PI', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 23, 'Ceará', 'CE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 24, 'Rio Grande do Norte', 'RN', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 25, 'Paraíba', 'PB', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 26, 'Pernambuco', 'PE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 27, 'Alagoas', 'AL', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 28, 'Sergipe', 'SE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 29, 'Bahia', 'BA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 31, 'Minas Gerais', 'MG', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 32, 'Espírito Santo', 'ES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 33, 'Rio de Janeiro', 'RJ', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 35, 'São Paulo', 'SP', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 41, 'Paraná', 'PR', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 42, 'Santa Catarina', 'SC', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 43, 'Rio Grande do Sul', 'RS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 50, 'Mato Grosso do Sul', 'MS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 51, 'Mato Grosso', 'MT', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 52, 'Goiás', 'GO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 53, 'Distrito Federal', 'DF', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `unidades`
--

CREATE TABLE `unidades` (
  `id_unidade` int(9) NOT NULL,
  `unidade` varchar(128) NOT NULL,
  `descricao` varchar(128) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendas`
--

CREATE TABLE `vendas` (
  `id_venda` int(9) NOT NULL,
  `valor_a_pagar` double NOT NULL,
  `desconto` double NOT NULL,
  `valor_recebido` double NOT NULL,
  `troco` double NOT NULL,
  `forma_de_pagamento` varchar(64) NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `id_caixa` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `venda_rapida`
--

CREATE TABLE `venda_rapida` (
  `id_venda` int(9) NOT NULL,
  `valor_a_pagar` double NOT NULL,
  `desconto` double NOT NULL,
  `valor_recebido` double NOT NULL,
  `troco` double NOT NULL,
  `forma_de_pagamento` varchar(64) NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_caixa` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendedores`
--

CREATE TABLE `vendedores` (
  `id_vendedor` int(9) NOT NULL,
  `status` varchar(32) NOT NULL,
  `nome` varchar(128) NOT NULL,
  `data_inicio_das_atividades` date NOT NULL,
  `anotacoes` varchar(512) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `boletos`
--
ALTER TABLE `boletos`
  ADD PRIMARY KEY (`id_boleto`);

--
-- Índices de tabela `caixas`
--
ALTER TABLE `caixas`
  ADD PRIMARY KEY (`id_caixa`),
  ADD KEY `caixas_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `categorias_dos_produtos`
--
ALTER TABLE `categorias_dos_produtos`
  ADD PRIMARY KEY (`id_categoria`),
  ADD KEY `categorias_dos_produtos_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `clientes_id_uf_foreign` (`id_uf`),
  ADD KEY `clientes_id_municipio_foreign` (`id_municipio`),
  ADD KEY `clientes_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `compromissos`
--
ALTER TABLE `compromissos`
  ADD PRIMARY KEY (`id_compromisso`),
  ADD KEY `compromissos_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `configuracoes`
--
ALTER TABLE `configuracoes`
  ADD PRIMARY KEY (`id_config`);

--
-- Índices de tabela `configuracoes_api_boletos`
--
ALTER TABLE `configuracoes_api_boletos`
  ADD PRIMARY KEY (`id_config`);

--
-- Índices de tabela `configuracoes_do_painel`
--
ALTER TABLE `configuracoes_do_painel`
  ADD PRIMARY KEY (`id_configuracao`),
  ADD KEY `configuracoes_do_painel_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `contas_a_pagar`
--
ALTER TABLE `contas_a_pagar`
  ADD PRIMARY KEY (`id_conta`),
  ADD KEY `contas_a_pagar_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `contas_a_receber`
--
ALTER TABLE `contas_a_receber`
  ADD PRIMARY KEY (`id_conta`),
  ADD KEY `contas_a_receber_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `controle_de_acesso`
--
ALTER TABLE `controle_de_acesso`
  ADD PRIMARY KEY (`id_controle_de_acesso`),
  ADD KEY `controle_de_acesso_id_empresa_foreign` (`id_empresa`),
  ADD KEY `controle_de_acesso_id_login_foreign` (`id_login`);

--
-- Índices de tabela `despesas`
--
ALTER TABLE `despesas`
  ADD PRIMARY KEY (`id_despesa`),
  ADD KEY `despesas_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id_empresa`),
  ADD KEY `empresas_id_uf_foreign` (`id_uf`),
  ADD KEY `empresas_id_municipio_foreign` (`id_municipio`);

--
-- Índices de tabela `entregadores`
--
ALTER TABLE `entregadores`
  ADD PRIMARY KEY (`id_entregador`),
  ADD KEY `entregadores_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `entregas`
--
ALTER TABLE `entregas`
  ADD PRIMARY KEY (`id_entrega`),
  ADD KEY `entregas_id_entregador_foreign` (`id_entregador`),
  ADD KEY `entregas_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `equipamentos_os`
--
ALTER TABLE `equipamentos_os`
  ADD PRIMARY KEY (`id_equipamento`),
  ADD KEY `equipamentos_os_id_ordem_foreign` (`id_ordem`),
  ADD KEY `equipamentos_os_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `equipamentos_os_provisorio`
--
ALTER TABLE `equipamentos_os_provisorio`
  ADD PRIMARY KEY (`id_equipamento`),
  ADD KEY `equipamentos_os_provisorio_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `formas_de_pagamento`
--
ALTER TABLE `formas_de_pagamento`
  ADD PRIMARY KEY (`id_forma`);

--
-- Índices de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`id_fornecedor`),
  ADD KEY `fornecedores_id_uf_foreign` (`id_uf`),
  ADD KEY `fornecedores_id_municipio_foreign` (`id_municipio`),
  ADD KEY `fornecedores_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id_funcionario`),
  ADD KEY `funcionarios_id_uf_foreign` (`id_uf`),
  ADD KEY `funcionarios_id_municipio_foreign` (`id_municipio`),
  ADD KEY `funcionarios_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `historico_de_senhas`
--
ALTER TABLE `historico_de_senhas`
  ADD PRIMARY KEY (`id_historico`),
  ADD KEY `historico_de_senhas_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `inventarios_do_estoque`
--
ALTER TABLE `inventarios_do_estoque`
  ADD PRIMARY KEY (`id_inventario`),
  ADD KEY `inventarios_do_estoque_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `lancamentos`
--
ALTER TABLE `lancamentos`
  ADD PRIMARY KEY (`id_lancamento`),
  ADD KEY `lancamentos_id_caixa_foreign` (`id_caixa`),
  ADD KEY `lancamentos_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_login`);

--
-- Índices de tabela `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`id_mesa`),
  ADD KEY `mesas_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `municipios`
--
ALTER TABLE `municipios`
  ADD PRIMARY KEY (`id_municipio`),
  ADD KEY `municipios_id_uf_foreign` (`id_uf`);

--
-- Índices de tabela `nfces`
--
ALTER TABLE `nfces`
  ADD PRIMARY KEY (`id_nfce`),
  ADD KEY `nfces_id_venda_foreign` (`id_venda`),
  ADD KEY `nfces_id_cliente_foreign` (`id_cliente`),
  ADD KEY `nfces_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `nfes`
--
ALTER TABLE `nfes`
  ADD PRIMARY KEY (`id_nfe`),
  ADD KEY `nfes_id_venda_foreign` (`id_venda`),
  ADD KEY `nfes_id_cliente_foreign` (`id_cliente`),
  ADD KEY `nfes_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `nfes_avulsa`
--
ALTER TABLE `nfes_avulsa`
  ADD PRIMARY KEY (`id_nfe`),
  ADD KEY `nfes_avulsa_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `nfe_avulsa_produtos`
--
ALTER TABLE `nfe_avulsa_produtos`
  ADD PRIMARY KEY (`id_produto_nfe_avulsa`),
  ADD KEY `nfe_avulsa_produtos_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `orcamentos`
--
ALTER TABLE `orcamentos`
  ADD PRIMARY KEY (`id_orcamento`),
  ADD KEY `orcamentos_id_cliente_foreign` (`id_cliente`),
  ADD KEY `orcamentos_id_vendedor_foreign` (`id_vendedor`),
  ADD KEY `orcamentos_id_caixa_foreign` (`id_caixa`),
  ADD KEY `orcamentos_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `ordens_de_servicos`
--
ALTER TABLE `ordens_de_servicos`
  ADD PRIMARY KEY (`id_ordem`),
  ADD KEY `ordens_de_servicos_id_cliente_foreign` (`id_cliente`),
  ADD KEY `ordens_de_servicos_id_vendedor_foreign` (`id_vendedor`),
  ADD KEY `ordens_de_servicos_id_tecnico_foreign` (`id_tecnico`),
  ADD KEY `ordens_de_servicos_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `pagamentos_da_empresa`
--
ALTER TABLE `pagamentos_da_empresa`
  ADD PRIMARY KEY (`id_pagamento`),
  ADD KEY `pagamentos_da_empresa_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `pagamentos_do_cliente`
--
ALTER TABLE `pagamentos_do_cliente`
  ADD PRIMARY KEY (`id_pagamento`),
  ADD KEY `pagamentos_do_cliente_id_cliente_foreign` (`id_cliente`);

--
-- Índices de tabela `pagamentos_food`
--
ALTER TABLE `pagamentos_food`
  ADD PRIMARY KEY (`id_pagamento`),
  ADD KEY `pagamentos_food_id_mesa_foreign` (`id_mesa`),
  ADD KEY `pagamentos_food_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `painel`
--
ALTER TABLE `painel`
  ADD PRIMARY KEY (`id_painel`),
  ADD KEY `painel_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `pedidos_id_cliente_foreign` (`id_cliente`),
  ADD KEY `pedidos_id_vendedor_foreign` (`id_vendedor`),
  ADD KEY `pedidos_id_caixa_foreign` (`id_caixa`),
  ADD KEY `pedidos_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id_produto`),
  ADD KEY `produtos_id_categoria_foreign` (`id_categoria`),
  ADD KEY `produtos_id_fornecedor_foreign` (`id_fornecedor`),
  ADD KEY `produtos_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `produtos_da_venda`
--
ALTER TABLE `produtos_da_venda`
  ADD PRIMARY KEY (`id_produto_da_venda`),
  ADD KEY `produtos_da_venda_id_venda_foreign` (`id_venda`),
  ADD KEY `produtos_da_venda_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `produtos_da_venda_rapida`
--
ALTER TABLE `produtos_da_venda_rapida`
  ADD PRIMARY KEY (`id_produto_da_venda_rapida`),
  ADD KEY `produtos_da_venda_rapida_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `produtos_do_inventario_do_estoque`
--
ALTER TABLE `produtos_do_inventario_do_estoque`
  ADD PRIMARY KEY (`id_produto_do_inventario`),
  ADD KEY `produtos_do_inventario_do_estoque_id_inventario_foreign` (`id_inventario`),
  ADD KEY `produtos_do_inventario_do_estoque_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `produtos_do_orcamento`
--
ALTER TABLE `produtos_do_orcamento`
  ADD PRIMARY KEY (`id_produto_do_orcamento`),
  ADD KEY `produtos_do_orcamento_id_orcamento_foreign` (`id_orcamento`),
  ADD KEY `produtos_do_orcamento_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `produtos_do_pdv`
--
ALTER TABLE `produtos_do_pdv`
  ADD PRIMARY KEY (`id_produto_pdv`),
  ADD KEY `produtos_do_pdv_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `produtos_do_pedido`
--
ALTER TABLE `produtos_do_pedido`
  ADD PRIMARY KEY (`id_produto_do_pedido`),
  ADD KEY `produtos_do_pedido_id_pedido_foreign` (`id_pedido`),
  ADD KEY `produtos_do_pedido_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `produtos_pecas_os`
--
ALTER TABLE `produtos_pecas_os`
  ADD PRIMARY KEY (`id_produto`),
  ADD KEY `produtos_pecas_os_id_ordem_foreign` (`id_ordem`),
  ADD KEY `produtos_pecas_os_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `produtos_pecas_os_provisorio`
--
ALTER TABLE `produtos_pecas_os_provisorio`
  ADD PRIMARY KEY (`id_produto`),
  ADD KEY `produtos_pecas_os_provisorio_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `provisorio_add_produto_por_xml`
--
ALTER TABLE `provisorio_add_produto_por_xml`
  ADD PRIMARY KEY (`id_produto_provisorio`),
  ADD KEY `provisorio_add_produto_por_xml_id_categoria_foreign` (`id_categoria`),
  ADD KEY `provisorio_add_produto_por_xml_id_fornecedor_foreign` (`id_fornecedor`),
  ADD KEY `provisorio_add_produto_por_xml_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `provisorio_produtos_da_mesa_food`
--
ALTER TABLE `provisorio_produtos_da_mesa_food`
  ADD PRIMARY KEY (`id_produto_provisorio`),
  ADD KEY `provisorio_produtos_da_mesa_food_id_mesa_foreign` (`id_mesa`),
  ADD KEY `provisorio_produtos_da_mesa_food_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `provisorio_produtos_food`
--
ALTER TABLE `provisorio_produtos_food`
  ADD PRIMARY KEY (`id_produto_provisorio`),
  ADD KEY `provisorio_produtos_food_id_mesa_foreign` (`id_mesa`),
  ADD KEY `provisorio_produtos_food_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `provisorio_reposicao_produtos_por_xml`
--
ALTER TABLE `provisorio_reposicao_produtos_por_xml`
  ADD PRIMARY KEY (`id_produto_provisorio`),
  ADD KEY `provisorio_reposicao_produtos_por_xml_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `reposicoes`
--
ALTER TABLE `reposicoes`
  ADD PRIMARY KEY (`id_reposicao`),
  ADD KEY `reposicoes_id_produto_foreign` (`id_produto`),
  ADD KEY `reposicoes_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `retiradas`
--
ALTER TABLE `retiradas`
  ADD PRIMARY KEY (`id_retirada`),
  ADD KEY `retiradas_id_caixa_foreign` (`id_caixa`),
  ADD KEY `retiradas_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `saida_de_mercadorias`
--
ALTER TABLE `saida_de_mercadorias`
  ADD PRIMARY KEY (`id_saida`),
  ADD KEY `saida_de_mercadorias_id_produto_foreign` (`id_produto`),
  ADD KEY `saida_de_mercadorias_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`id_servico`),
  ADD KEY `servicos_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `servicos_mao_de_obra`
--
ALTER TABLE `servicos_mao_de_obra`
  ADD PRIMARY KEY (`id_servico`),
  ADD KEY `servicos_mao_de_obra_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `servicos_mao_de_obra_da_os`
--
ALTER TABLE `servicos_mao_de_obra_da_os`
  ADD PRIMARY KEY (`id_servico`),
  ADD KEY `servicos_mao_de_obra_da_os_id_ordem_foreign` (`id_ordem`),
  ADD KEY `servicos_mao_de_obra_da_os_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `servicos_mao_de_obra_provisorio`
--
ALTER TABLE `servicos_mao_de_obra_provisorio`
  ADD PRIMARY KEY (`id_servico`),
  ADD KEY `servicos_mao_de_obra_provisorio_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `tecnicos`
--
ALTER TABLE `tecnicos`
  ADD PRIMARY KEY (`id_tecnico`),
  ADD KEY `tecnicos_id_uf_foreign` (`id_uf`),
  ADD KEY `tecnicos_id_municipio_foreign` (`id_municipio`),
  ADD KEY `tecnicos_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `transportadoras`
--
ALTER TABLE `transportadoras`
  ADD PRIMARY KEY (`id_transportadora`),
  ADD KEY `transportadoras_id_uf_foreign` (`id_uf`),
  ADD KEY `transportadoras_id_municipio_foreign` (`id_municipio`),
  ADD KEY `transportadoras_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `ufs`
--
ALTER TABLE `ufs`
  ADD PRIMARY KEY (`id_uf`);

--
-- Índices de tabela `unidades`
--
ALTER TABLE `unidades`
  ADD PRIMARY KEY (`id_unidade`);

--
-- Índices de tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`id_venda`),
  ADD KEY `vendas_id_cliente_foreign` (`id_cliente`),
  ADD KEY `vendas_id_vendedor_foreign` (`id_vendedor`),
  ADD KEY `vendas_id_caixa_foreign` (`id_caixa`),
  ADD KEY `vendas_id_empresa_foreign` (`id_empresa`);

--
-- Índices de tabela `venda_rapida`
--
ALTER TABLE `venda_rapida`
  ADD PRIMARY KEY (`id_venda`),
  ADD KEY `venda_rapida_id_cliente_foreign` (`id_cliente`),
  ADD KEY `venda_rapida_id_caixa_foreign` (`id_caixa`),
  ADD KEY `venda_rapida_id_vendedor_foreign` (`id_vendedor`);

--
-- Índices de tabela `vendedores`
--
ALTER TABLE `vendedores`
  ADD PRIMARY KEY (`id_vendedor`),
  ADD KEY `vendedores_id_empresa_foreign` (`id_empresa`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `boletos`
--
ALTER TABLE `boletos`
  MODIFY `id_boleto` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `caixas`
--
ALTER TABLE `caixas`
  MODIFY `id_caixa` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `categorias_dos_produtos`
--
ALTER TABLE `categorias_dos_produtos`
  MODIFY `id_categoria` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `compromissos`
--
ALTER TABLE `compromissos`
  MODIFY `id_compromisso` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `configuracoes`
--
ALTER TABLE `configuracoes`
  MODIFY `id_config` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `configuracoes_api_boletos`
--
ALTER TABLE `configuracoes_api_boletos`
  MODIFY `id_config` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `configuracoes_do_painel`
--
ALTER TABLE `configuracoes_do_painel`
  MODIFY `id_configuracao` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `contas_a_pagar`
--
ALTER TABLE `contas_a_pagar`
  MODIFY `id_conta` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `contas_a_receber`
--
ALTER TABLE `contas_a_receber`
  MODIFY `id_conta` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `controle_de_acesso`
--
ALTER TABLE `controle_de_acesso`
  MODIFY `id_controle_de_acesso` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `despesas`
--
ALTER TABLE `despesas`
  MODIFY `id_despesa` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id_empresa` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `entregadores`
--
ALTER TABLE `entregadores`
  MODIFY `id_entregador` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `entregas`
--
ALTER TABLE `entregas`
  MODIFY `id_entrega` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `equipamentos_os`
--
ALTER TABLE `equipamentos_os`
  MODIFY `id_equipamento` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `equipamentos_os_provisorio`
--
ALTER TABLE `equipamentos_os_provisorio`
  MODIFY `id_equipamento` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `formas_de_pagamento`
--
ALTER TABLE `formas_de_pagamento`
  MODIFY `id_forma` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  MODIFY `id_fornecedor` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id_funcionario` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `historico_de_senhas`
--
ALTER TABLE `historico_de_senhas`
  MODIFY `id_historico` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `inventarios_do_estoque`
--
ALTER TABLE `inventarios_do_estoque`
  MODIFY `id_inventario` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `lancamentos`
--
ALTER TABLE `lancamentos`
  MODIFY `id_lancamento` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `login`
--
ALTER TABLE `login`
  MODIFY `id_login` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `mesas`
--
ALTER TABLE `mesas`
  MODIFY `id_mesa` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de tabela `municipios`
--
ALTER TABLE `municipios`
  MODIFY `id_municipio` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5571;

--
-- AUTO_INCREMENT de tabela `nfces`
--
ALTER TABLE `nfces`
  MODIFY `id_nfce` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `nfes`
--
ALTER TABLE `nfes`
  MODIFY `id_nfe` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `nfes_avulsa`
--
ALTER TABLE `nfes_avulsa`
  MODIFY `id_nfe` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `nfe_avulsa_produtos`
--
ALTER TABLE `nfe_avulsa_produtos`
  MODIFY `id_produto_nfe_avulsa` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `orcamentos`
--
ALTER TABLE `orcamentos`
  MODIFY `id_orcamento` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ordens_de_servicos`
--
ALTER TABLE `ordens_de_servicos`
  MODIFY `id_ordem` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pagamentos_da_empresa`
--
ALTER TABLE `pagamentos_da_empresa`
  MODIFY `id_pagamento` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pagamentos_do_cliente`
--
ALTER TABLE `pagamentos_do_cliente`
  MODIFY `id_pagamento` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pagamentos_food`
--
ALTER TABLE `pagamentos_food`
  MODIFY `id_pagamento` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `painel`
--
ALTER TABLE `painel`
  MODIFY `id_painel` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id_produto` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `produtos_da_venda`
--
ALTER TABLE `produtos_da_venda`
  MODIFY `id_produto_da_venda` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `produtos_da_venda_rapida`
--
ALTER TABLE `produtos_da_venda_rapida`
  MODIFY `id_produto_da_venda_rapida` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `produtos_do_inventario_do_estoque`
--
ALTER TABLE `produtos_do_inventario_do_estoque`
  MODIFY `id_produto_do_inventario` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produtos_do_orcamento`
--
ALTER TABLE `produtos_do_orcamento`
  MODIFY `id_produto_do_orcamento` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produtos_do_pdv`
--
ALTER TABLE `produtos_do_pdv`
  MODIFY `id_produto_pdv` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `produtos_do_pedido`
--
ALTER TABLE `produtos_do_pedido`
  MODIFY `id_produto_do_pedido` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produtos_pecas_os`
--
ALTER TABLE `produtos_pecas_os`
  MODIFY `id_produto` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produtos_pecas_os_provisorio`
--
ALTER TABLE `produtos_pecas_os_provisorio`
  MODIFY `id_produto` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `provisorio_add_produto_por_xml`
--
ALTER TABLE `provisorio_add_produto_por_xml`
  MODIFY `id_produto_provisorio` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `provisorio_produtos_da_mesa_food`
--
ALTER TABLE `provisorio_produtos_da_mesa_food`
  MODIFY `id_produto_provisorio` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `provisorio_produtos_food`
--
ALTER TABLE `provisorio_produtos_food`
  MODIFY `id_produto_provisorio` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `provisorio_reposicao_produtos_por_xml`
--
ALTER TABLE `provisorio_reposicao_produtos_por_xml`
  MODIFY `id_produto_provisorio` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `reposicoes`
--
ALTER TABLE `reposicoes`
  MODIFY `id_reposicao` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `retiradas`
--
ALTER TABLE `retiradas`
  MODIFY `id_retirada` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `saida_de_mercadorias`
--
ALTER TABLE `saida_de_mercadorias`
  MODIFY `id_saida` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `servicos`
--
ALTER TABLE `servicos`
  MODIFY `id_servico` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `servicos_mao_de_obra`
--
ALTER TABLE `servicos_mao_de_obra`
  MODIFY `id_servico` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `servicos_mao_de_obra_da_os`
--
ALTER TABLE `servicos_mao_de_obra_da_os`
  MODIFY `id_servico` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `servicos_mao_de_obra_provisorio`
--
ALTER TABLE `servicos_mao_de_obra_provisorio`
  MODIFY `id_servico` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tecnicos`
--
ALTER TABLE `tecnicos`
  MODIFY `id_tecnico` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `transportadoras`
--
ALTER TABLE `transportadoras`
  MODIFY `id_transportadora` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ufs`
--
ALTER TABLE `ufs`
  MODIFY `id_uf` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de tabela `unidades`
--
ALTER TABLE `unidades`
  MODIFY `id_unidade` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `id_venda` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `venda_rapida`
--
ALTER TABLE `venda_rapida`
  MODIFY `id_venda` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `vendedores`
--
ALTER TABLE `vendedores`
  MODIFY `id_vendedor` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `caixas`
--
ALTER TABLE `caixas`
  ADD CONSTRAINT `caixas_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `categorias_dos_produtos`
--
ALTER TABLE `categorias_dos_produtos`
  ADD CONSTRAINT `categorias_dos_produtos_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_id_municipio_foreign` FOREIGN KEY (`id_municipio`) REFERENCES `municipios` (`id_municipio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_id_uf_foreign` FOREIGN KEY (`id_uf`) REFERENCES `ufs` (`id_uf`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `compromissos`
--
ALTER TABLE `compromissos`
  ADD CONSTRAINT `compromissos_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `configuracoes_do_painel`
--
ALTER TABLE `configuracoes_do_painel`
  ADD CONSTRAINT `configuracoes_do_painel_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `contas_a_pagar`
--
ALTER TABLE `contas_a_pagar`
  ADD CONSTRAINT `contas_a_pagar_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `contas_a_receber`
--
ALTER TABLE `contas_a_receber`
  ADD CONSTRAINT `contas_a_receber_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `controle_de_acesso`
--
ALTER TABLE `controle_de_acesso`
  ADD CONSTRAINT `controle_de_acesso_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `controle_de_acesso_id_login_foreign` FOREIGN KEY (`id_login`) REFERENCES `login` (`id_login`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `despesas`
--
ALTER TABLE `despesas`
  ADD CONSTRAINT `despesas_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `empresas`
--
ALTER TABLE `empresas`
  ADD CONSTRAINT `empresas_id_municipio_foreign` FOREIGN KEY (`id_municipio`) REFERENCES `municipios` (`id_municipio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_id_uf_foreign` FOREIGN KEY (`id_uf`) REFERENCES `ufs` (`id_uf`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `entregadores`
--
ALTER TABLE `entregadores`
  ADD CONSTRAINT `entregadores_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `entregas`
--
ALTER TABLE `entregas`
  ADD CONSTRAINT `entregas_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `entregas_id_entregador_foreign` FOREIGN KEY (`id_entregador`) REFERENCES `entregadores` (`id_entregador`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `equipamentos_os`
--
ALTER TABLE `equipamentos_os`
  ADD CONSTRAINT `equipamentos_os_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `equipamentos_os_id_ordem_foreign` FOREIGN KEY (`id_ordem`) REFERENCES `ordens_de_servicos` (`id_ordem`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `equipamentos_os_provisorio`
--
ALTER TABLE `equipamentos_os_provisorio`
  ADD CONSTRAINT `equipamentos_os_provisorio_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD CONSTRAINT `fornecedores_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fornecedores_id_municipio_foreign` FOREIGN KEY (`id_municipio`) REFERENCES `municipios` (`id_municipio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fornecedores_id_uf_foreign` FOREIGN KEY (`id_uf`) REFERENCES `ufs` (`id_uf`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD CONSTRAINT `funcionarios_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `funcionarios_id_municipio_foreign` FOREIGN KEY (`id_municipio`) REFERENCES `municipios` (`id_municipio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `funcionarios_id_uf_foreign` FOREIGN KEY (`id_uf`) REFERENCES `ufs` (`id_uf`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `historico_de_senhas`
--
ALTER TABLE `historico_de_senhas`
  ADD CONSTRAINT `historico_de_senhas_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `inventarios_do_estoque`
--
ALTER TABLE `inventarios_do_estoque`
  ADD CONSTRAINT `inventarios_do_estoque_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `lancamentos`
--
ALTER TABLE `lancamentos`
  ADD CONSTRAINT `lancamentos_id_caixa_foreign` FOREIGN KEY (`id_caixa`) REFERENCES `caixas` (`id_caixa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lancamentos_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `mesas`
--
ALTER TABLE `mesas`
  ADD CONSTRAINT `mesas_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `municipios`
--
ALTER TABLE `municipios`
  ADD CONSTRAINT `municipios_id_uf_foreign` FOREIGN KEY (`id_uf`) REFERENCES `ufs` (`id_uf`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `nfces`
--
ALTER TABLE `nfces`
  ADD CONSTRAINT `nfces_id_cliente_foreign` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nfces_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nfces_id_venda_foreign` FOREIGN KEY (`id_venda`) REFERENCES `vendas` (`id_venda`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `nfes`
--
ALTER TABLE `nfes`
  ADD CONSTRAINT `nfes_id_cliente_foreign` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nfes_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nfes_id_venda_foreign` FOREIGN KEY (`id_venda`) REFERENCES `vendas` (`id_venda`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `nfes_avulsa`
--
ALTER TABLE `nfes_avulsa`
  ADD CONSTRAINT `nfes_avulsa_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `nfe_avulsa_produtos`
--
ALTER TABLE `nfe_avulsa_produtos`
  ADD CONSTRAINT `nfe_avulsa_produtos_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `orcamentos`
--
ALTER TABLE `orcamentos`
  ADD CONSTRAINT `orcamentos_id_caixa_foreign` FOREIGN KEY (`id_caixa`) REFERENCES `caixas` (`id_caixa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orcamentos_id_cliente_foreign` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orcamentos_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orcamentos_id_vendedor_foreign` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedores` (`id_vendedor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `ordens_de_servicos`
--
ALTER TABLE `ordens_de_servicos`
  ADD CONSTRAINT `ordens_de_servicos_id_cliente_foreign` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ordens_de_servicos_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ordens_de_servicos_id_tecnico_foreign` FOREIGN KEY (`id_tecnico`) REFERENCES `tecnicos` (`id_tecnico`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ordens_de_servicos_id_vendedor_foreign` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedores` (`id_vendedor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `pagamentos_da_empresa`
--
ALTER TABLE `pagamentos_da_empresa`
  ADD CONSTRAINT `pagamentos_da_empresa_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `pagamentos_do_cliente`
--
ALTER TABLE `pagamentos_do_cliente`
  ADD CONSTRAINT `pagamentos_do_cliente_id_cliente_foreign` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `pagamentos_food`
--
ALTER TABLE `pagamentos_food`
  ADD CONSTRAINT `pagamentos_food_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pagamentos_food_id_mesa_foreign` FOREIGN KEY (`id_mesa`) REFERENCES `mesas` (`id_mesa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `painel`
--
ALTER TABLE `painel`
  ADD CONSTRAINT `painel_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_id_caixa_foreign` FOREIGN KEY (`id_caixa`) REFERENCES `caixas` (`id_caixa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedidos_id_cliente_foreign` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedidos_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedidos_id_vendedor_foreign` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedores` (`id_vendedor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_id_categoria_foreign` FOREIGN KEY (`id_categoria`) REFERENCES `categorias_dos_produtos` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `produtos_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `produtos_id_fornecedor_foreign` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedores` (`id_fornecedor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `produtos_da_venda`
--
ALTER TABLE `produtos_da_venda`
  ADD CONSTRAINT `produtos_da_venda_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `produtos_da_venda_id_venda_foreign` FOREIGN KEY (`id_venda`) REFERENCES `vendas` (`id_venda`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `produtos_da_venda_rapida`
--
ALTER TABLE `produtos_da_venda_rapida`
  ADD CONSTRAINT `produtos_da_venda_rapida_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `produtos_do_inventario_do_estoque`
--
ALTER TABLE `produtos_do_inventario_do_estoque`
  ADD CONSTRAINT `produtos_do_inventario_do_estoque_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `produtos_do_inventario_do_estoque_id_inventario_foreign` FOREIGN KEY (`id_inventario`) REFERENCES `inventarios_do_estoque` (`id_inventario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `produtos_do_orcamento`
--
ALTER TABLE `produtos_do_orcamento`
  ADD CONSTRAINT `produtos_do_orcamento_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `produtos_do_orcamento_id_orcamento_foreign` FOREIGN KEY (`id_orcamento`) REFERENCES `orcamentos` (`id_orcamento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `produtos_do_pdv`
--
ALTER TABLE `produtos_do_pdv`
  ADD CONSTRAINT `produtos_do_pdv_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `produtos_do_pedido`
--
ALTER TABLE `produtos_do_pedido`
  ADD CONSTRAINT `produtos_do_pedido_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `produtos_do_pedido_id_pedido_foreign` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `produtos_pecas_os`
--
ALTER TABLE `produtos_pecas_os`
  ADD CONSTRAINT `produtos_pecas_os_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `produtos_pecas_os_id_ordem_foreign` FOREIGN KEY (`id_ordem`) REFERENCES `ordens_de_servicos` (`id_ordem`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `produtos_pecas_os_provisorio`
--
ALTER TABLE `produtos_pecas_os_provisorio`
  ADD CONSTRAINT `produtos_pecas_os_provisorio_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `provisorio_add_produto_por_xml`
--
ALTER TABLE `provisorio_add_produto_por_xml`
  ADD CONSTRAINT `provisorio_add_produto_por_xml_id_categoria_foreign` FOREIGN KEY (`id_categoria`) REFERENCES `categorias_dos_produtos` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `provisorio_add_produto_por_xml_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `provisorio_add_produto_por_xml_id_fornecedor_foreign` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedores` (`id_fornecedor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `provisorio_produtos_da_mesa_food`
--
ALTER TABLE `provisorio_produtos_da_mesa_food`
  ADD CONSTRAINT `provisorio_produtos_da_mesa_food_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `provisorio_produtos_da_mesa_food_id_mesa_foreign` FOREIGN KEY (`id_mesa`) REFERENCES `mesas` (`id_mesa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `provisorio_produtos_food`
--
ALTER TABLE `provisorio_produtos_food`
  ADD CONSTRAINT `provisorio_produtos_food_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `provisorio_produtos_food_id_mesa_foreign` FOREIGN KEY (`id_mesa`) REFERENCES `mesas` (`id_mesa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `provisorio_reposicao_produtos_por_xml`
--
ALTER TABLE `provisorio_reposicao_produtos_por_xml`
  ADD CONSTRAINT `provisorio_reposicao_produtos_por_xml_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `reposicoes`
--
ALTER TABLE `reposicoes`
  ADD CONSTRAINT `reposicoes_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reposicoes_id_produto_foreign` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `retiradas`
--
ALTER TABLE `retiradas`
  ADD CONSTRAINT `retiradas_id_caixa_foreign` FOREIGN KEY (`id_caixa`) REFERENCES `caixas` (`id_caixa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `retiradas_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `saida_de_mercadorias`
--
ALTER TABLE `saida_de_mercadorias`
  ADD CONSTRAINT `saida_de_mercadorias_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `saida_de_mercadorias_id_produto_foreign` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `servicos`
--
ALTER TABLE `servicos`
  ADD CONSTRAINT `servicos_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `servicos_mao_de_obra`
--
ALTER TABLE `servicos_mao_de_obra`
  ADD CONSTRAINT `servicos_mao_de_obra_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `servicos_mao_de_obra_da_os`
--
ALTER TABLE `servicos_mao_de_obra_da_os`
  ADD CONSTRAINT `servicos_mao_de_obra_da_os_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `servicos_mao_de_obra_da_os_id_ordem_foreign` FOREIGN KEY (`id_ordem`) REFERENCES `ordens_de_servicos` (`id_ordem`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `servicos_mao_de_obra_provisorio`
--
ALTER TABLE `servicos_mao_de_obra_provisorio`
  ADD CONSTRAINT `servicos_mao_de_obra_provisorio_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tecnicos`
--
ALTER TABLE `tecnicos`
  ADD CONSTRAINT `tecnicos_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tecnicos_id_municipio_foreign` FOREIGN KEY (`id_municipio`) REFERENCES `municipios` (`id_municipio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tecnicos_id_uf_foreign` FOREIGN KEY (`id_uf`) REFERENCES `ufs` (`id_uf`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `transportadoras`
--
ALTER TABLE `transportadoras`
  ADD CONSTRAINT `transportadoras_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transportadoras_id_municipio_foreign` FOREIGN KEY (`id_municipio`) REFERENCES `municipios` (`id_municipio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transportadoras_id_uf_foreign` FOREIGN KEY (`id_uf`) REFERENCES `ufs` (`id_uf`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `vendas_id_caixa_foreign` FOREIGN KEY (`id_caixa`) REFERENCES `caixas` (`id_caixa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vendas_id_cliente_foreign` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vendas_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vendas_id_vendedor_foreign` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedores` (`id_vendedor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `venda_rapida`
--
ALTER TABLE `venda_rapida`
  ADD CONSTRAINT `venda_rapida_id_caixa_foreign` FOREIGN KEY (`id_caixa`) REFERENCES `caixas` (`id_caixa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `venda_rapida_id_cliente_foreign` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `venda_rapida_id_vendedor_foreign` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedores` (`id_vendedor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `vendedores`
--
ALTER TABLE `vendedores`
  ADD CONSTRAINT `vendedores_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
