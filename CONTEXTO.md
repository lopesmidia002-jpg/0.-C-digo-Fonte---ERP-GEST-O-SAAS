# Contexto do Projeto: ERP Gestão SaaS

## 1. Visão Geral do Sistema
O **ERP Gestão SaaS** é um sistema completo de gestão empresarial e comercial multi-empresa (multi-tenant), desenvolvido para atender micro, pequenas e médias empresas nos segmentos de comércio, varejo, food service (restaurantes, lanchonetes, bares) e prestação de serviços.

O sistema opera no modelo SaaS (Software as a Service), onde múltiplos clientes (empresas) compartilham a mesma infraestrutura de aplicação e banco de dados, com isolamento lógico estrito por `id_empresa`.

---

## 2. Stack Tecnológica
* **Linguagem Backend:** PHP 7.4 / 8.0+
* **Framework:** CodeIgniter 4 (Arquitetura MVC)
* **Banco de Dados:** MySQL / MariaDB com driver `MySQLi`
* **Frontend:** Bootstrap, jQuery, AdminLTE, FontAwesome, DataTables, Chart.js
* **Ambiente de Desenvolvimento & Execução:** Docker & Docker Compose (`php:8.1-apache`, `mariadb:10.6`, `phpmyadmin`) em `http://localhost:8080/` ou ambiente local standalone.

---

## 3. Módulos do Sistema
1. **Administração Geral (Super Admin - Tipo 1):**
   - Gestão global de empresas clientes.
   - Configurações da plataforma SaaS.
   - Planos e pagamentos das empresas.
   - Controle de acessos e permissões.

2. **Gestão Comercial & Vendas (Empresa - Tipo 2):**
   - **PDV (Frente de Caixa):** Venda rápida, abertura e fechamento de caixa, leitura de código de barras.
   - **Venda Rápida & Pedidos:** Emissão de orçamentos e pedidos de venda.
   - **Food Service:** Gestão de mesas, comandas, entregas e pedidos para restaurantes e delivery.
   - **Ordens de Serviço (OS):** Controle de serviços técnicos, peças, equipamentos e termos de garantia.

3. **Gestão Fiscal:**
   - Emissão e controle de NF-e (Nota Fiscal Eletrônica) e NFC-e (Nota Fiscal de Consumidor Eletrônica).
   - Impressão de DANFE e DANFCE em PDF com Sped-DA (`nfephp-org/sped-da`).
   - Entrada de NF-e avulsa e importação de produtos via XML.
   - Integração com API da Receita Federal / ReceitaWS para consulta de CNPJ.

4. **Gestão Financeira:**
   - Contas a Pagar e Contas a Receber.
   - Lançamentos e Despesas.
   - Sangrias e Suprimentos de Caixa.
   - Relatório DRE (Demonstrativo do Resultado do Exercício).
   - Emissão de Boletos Bancários via API.

5. **Cadastros Gerais:**
   - Clientes, Fornecedores, Funcionários, Vendedores, Técnicos, Entregadores, Transportadoras.
   - Produtos, Categorias, Unidades de Medida e Tabela IBGE de Municípios/UFs.

---

## 4. Arquitetura de Segurança e Multi-Tenancy
* **Isolamento de Dados:** Cada registro nas tabelas de negócio possui a coluna `id_empresa`. Nenhuma consulta de tenant deve ser executada sem o filtro `where('id_empresa', $id_empresa)`.
* **Autenticação:** Baseada em sessões do CodeIgniter (`id_login`, `id_empresa`, `tipo`).
* **Criptografia de Senhas:** Hashing nativo com `password_hash()` e verificação com `password_verify()`.
* **Middlewares / Filtros:**
  - `AuthFilter`: Impede acessos de usuários não autenticados.
  - `AdminFilter`: Restringe rotas administrativas apenas a usuários de nível Super Admin (`tipo == 1`).

---

## 5. Regras Operacionais de Desenvolvimento
1. **Atualização Contínua de Documentação:** Ao final de qualquer nova funcionalidade (`feat`), correção de bug (`fix`) ou refatoração, os arquivos `CONTEXTO.md`, `DOCUMENTACAO.md` e `PASSOS.md` devem ser revisados e atualizados.
2. **Execução Passo a Passo:** As tarefas do arquivo `PASSOS.md` devem ser executadas ordenadamente. Só iniciar o próximo passo quando o usuário solicitar.
3. **Sugestão de Commits:** Ao término de cada implementação, gerar o texto padronizado para commit Git.
