# Roadmap de Execução: ERP Gestão SaaS

> [!IMPORTANT]
> **Regra de Execução:** O agente só iniciará o próximo passo quando o usuário solicitar explicitamente.
> Ao finalizar qualquer passo, o checkbox correspondente será marcado com `[x]`, a documentação será atualizada e uma mensagem para commit será gerada.

---

## 📌 Status do Projeto

- [x] **Passo 1: Diagnóstico e Levantamento Inicial**
  - Análise completa da base de código, dependências e estrutura de pastas.
  - Identificação de pontos críticos de segurança, dependências ausentes e configuração de ambiente.

- [x] **Passo 2: Configuração de Ambiente e Base de Dados**
  - Ajuste do arquivo [`.env`](file:///c:/Users/Nilto/OneDrive/Documentos/projeto%20Saas/0.%20C%C3%B3digo%20Fonte%20-%20ERP%20GEST%C3%83O%20SAAS/.env) para desenvolvimento local (`http://localhost:8080/`, MySQL `erp`, user `root`).
  - Compatibilização do dump SQL [`banco_de_dados.sql`](file:///c:/Users/Nilto/OneDrive/Documentos/projeto%20Saas/0.%20C%C3%B3digo%20Fonte%20-%20ERP%20GEST%C3%83O%20SAAS/banco_de_dados.sql) com a coluna `id_empresa` para boletos.

- [x] **Passo 3: Blindagem de Segurança e Autenticação**
  - Implementação de hashing seguro de senhas com `password_hash()` no [`LoginModel.php`](file:///c:/Users/Nilto/OneDrive/Documentos/projeto%20Saas/0.%20C%C3%B3digo%20Fonte%20-%20ERP%20GEST%C3%83O%20SAAS/app/Models/LoginModel.php).
  - Verificação de senhas com `password_verify()` e migração automática de senhas antigas em texto puro no [`Login.php`](file:///c:/Users/Nilto/OneDrive/Documentos/projeto%20Saas/0.%20C%C3%B3digo%20Fonte%20-%20ERP%20GEST%C3%83O%20SAAS/app/Controllers/Login.php).
  - Criação dos Middlewares/Filters [`AuthFilter.php`](file:///c:/Users/Nilto/OneDrive/Documentos/projeto%20Saas/0.%20C%C3%B3digo%20Fonte%20-%20ERP%20GEST%C3%83O%20SAAS/app/Filters/AuthFilter.php) e [`AdminFilter.php`](file:///c:/Users/Nilto/OneDrive/Documentos/projeto%20Saas/0.%20C%C3%B3digo%20Fonte%20-%20ERP%20GEST%C3%83O%20SAAS/app/Filters/AdminFilter.php) com registro em [`Filters.php`](file:///c:/Users/Nilto/OneDrive/Documentos/projeto%20Saas/0.%20C%C3%B3digo%20Fonte%20-%20ERP%20GEST%C3%83O%20SAAS/app/Config/Filters.php).
  - Correção de vazamento de dados multi-empresa em [`Boletos.php`](file:///c:/Users/Nilto/OneDrive/Documentos/projeto%20Saas/0.%20C%C3%B3digo%20Fonte%20-%20ERP%20GEST%C3%83O%20SAAS/app/Controllers/Boletos.php) e proteção do [`ReceitaWS.php`](file:///c:/Users/Nilto/OneDrive/Documentos/projeto%20Saas/0.%20C%C3%B3digo%20Fonte%20-%20ERP%20GEST%C3%83O%20SAAS/app/Controllers/ReceitaWS.php).

- [x] **Passo 4: Estruturação dos Arquivos de Contexto e Governança**
  - Criação dos arquivos [`CONTEXTO.md`](file:///c:/Users/Nilto/OneDrive/Documentos/projeto%20Saas/0.%20C%C3%B3digo%20Fonte%20-%20ERP%20GEST%C3%83O%20SAAS/CONTEXTO.md), [`DOCUMENTACAO.md`](file:///c:/Users/Nilto/OneDrive/Documentos/projeto%20Saas/0.%20C%C3%B3digo%20Fonte%20-%20ERP%20GEST%C3%83O%20SAAS/DOCUMENTACAO.md), [`PASSOS.md`](file:///c:/Users/Nilto/OneDrive/Documentos/projeto%20Saas/0.%20C%C3%B3digo%20Fonte%20-%20ERP%20GEST%C3%83O%20SAAS/PASSOS.md), [`PROMPT.md`](file:///c:/Users/Nilto/OneDrive/Documentos/projeto%20Saas/0.%20C%C3%B3digo%20Fonte%20-%20ERP%20GEST%C3%83O%20SAAS/PROMPT.md) e regras em [`GEMINI.md`](file:///c:/Users/Nilto/OneDrive/Documentos/projeto%20Saas/0.%20C%C3%B3digo%20Fonte%20-%20ERP%20GEST%C3%83O%20SAAS/GEMINI.md).

- [x] **Passo 5: Instalação e Configuração da Biblioteca Sped-DA / NFePHP**
  - Configuração do pacote `nfephp-org/sped-da` no `composer.json` e carregamento flexível com proteção contra falhas em `ImpressaoDANFe.php`.

- [x] **Passo 6: Auditoria Completa de Multi-Tenancy em Todos os Controllers**
  - Auditoria completa dos 46 controllers, correção de escopo multi-tenant em `PagamentosDoCliente.php`, `Boletos.php` e concorrência em `Food.php`, além de sincronização nos models e banco de dados.

- [x] **Passo 7: Refatoração dos Retornos de Views e Layouts**
  - Criação do layout mestre `app/Views/templates/layout.php` e implementação do método nativo `renderTemplate()` em `BaseController.php` para retorno em conformidade com o padrão HTTP do CodeIgniter 4.

- [x] **Passo 8: Padronização do BaseController**
  - Enriquecimento do `BaseController.php` com propriedades protegidas (`$id_empresa`, `$id_login`, `$session`), métodos auxiliares (`verificaPermissao`, `preparaDadosBase`, `renderTemplate`, `alertSuccess`, `alertError`) para eliminar redundância de código em toda a camada de controladores.

- [x] **Passo 9: Criação de Migrations e Seeders**
  - Sincronização das migrations de banco com isolamento multi-tenancy (`boletos`, `pagamentos_do_cliente`), atualização de senhas seguras no `AutoInsert` e criação do `DatabaseSeeder.php` executável via `php spark db:seed DatabaseSeeder`.

- [x] **Passo 10: Modernização da Interface e Experiência do Usuário (UI/UX)**
  - Reestilização com design tokens, sombras sutis, botões e cards com elevação e hover effects em `public/assets/css/style.css`, além de integração de confirmações SweetAlert2 e carregamento assíncrono em `public/assets/js/funcoes.js`.

- [x] **Passo 11: Containerização e Execução 100% no Docker**
  - Criação do `Dockerfile` (PHP 8.1 Apache com todas as extensões necessárias), `docker-compose.yml` orquestrando App (`8080`), MariaDB 10.6 (`3306`) com importação automática do dump SQL e phpMyAdmin (`8081`), testado e em execução.
