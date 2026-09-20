# Documentação Técnica: ERP Gestão SaaS

## 1. Estrutura de Diretórios

```
projeto/
├── .env                  # Variáveis de ambiente (DB, baseURL, environment)
├── banco_de_dados.sql    # Dump do banco de dados MySQL
├── composer.json         # Dependências do projeto
├── spark                 # CLI do CodeIgniter 4
├── app/
│   ├── Config/           # Arquivos de configuração (Routes, Filters, Database, etc.)
│   ├── Controllers/      # Controladores da aplicação (Admin, Clientes, Vendas, etc.)
│   ├── Filters/          # Middlewares/Filtros de requisição (AuthFilter, AdminFilter)
│   ├── Models/           # Modelos de dados com suporte a timestamps e callbacks
│   ├── Views/            # Templates, layouts e telas do sistema
│   └── ThirdParty/       # Bibliotecas de terceiros (ex: sped-da para NFe)
├── public/
│   ├── index.php         # Ponto de entrada (Front Controller)
│   ├── assets/           # Arquivos estáticos (CSS, JS, Imagens, Plugins)
│   └── theme/            # Tema visual do painel
├── system/               # Núcleo do framework CodeIgniter 4
└── writable/             # Logs, cache, sessões e arquivos temporários
```

---

## 2. Configuração do Ambiente Local

### Arquivo `.env`
```ini
CI_ENVIRONMENT = development
app.baseURL = 'http://localhost:8080/'

database.default.hostname = localhost
database.default.database = erp
database.default.username = root
database.default.password = 
database.default.DBDriver = MySQLi
database.default.port = 3306
```

### Inicialização do Servidor
```powershell
php spark serve
```
Acesse em: `http://localhost:8080`

---

## 3. Fluxo de Autenticação e Segurança

### Tabela de Usuários (`login`)
* `id_login` (PK)
* `usuario` (VARCHAR 128)
* `senha` (VARCHAR 255 - Hash bcrypt)
* `tipo` (1 = Administrador Geral SaaS / 2 = Empresa Cliente)
* `id_empresa` (FK para a empresa ativa)

### Login e Hashing de Senhas
* **Model:** [`LoginModel.php`](file:///c:/Users/Nilto/OneDrive/Documentos/projeto%20Saas/0.%20C%C3%B3digo%20Fonte%20-%20ERP%20GEST%C3%83O%20SAAS/app/Models/LoginModel.php) utiliza `beforeInsert` e `beforeUpdate` para transformar senhas em hash via `password_hash($senha, PASSWORD_DEFAULT)`.
* **Controller:** [`Login.php`](file:///c:/Users/Nilto/OneDrive/Documentos/projeto%20Saas/0.%20C%C3%B3digo%20Fonte%20-%20ERP%20GEST%C3%83O%20SAAS/app/Controllers/Login.php) método `autenticar()` valida com `password_verify()`. Senhas legadas em texto plano são migradas automaticamente no login.

---

## 4. Middlewares e Filtros Registrados

Registrados em [`app/Config/Filters.php`](file:///c:/Users/Nilto/OneDrive/Documentos/projeto%20Saas/0.%20C%C3%B3digo%20Fonte%20-%20ERP%20GEST%C3%83O%20SAAS/app/Config/Filters.php):
* **`auth` (`App\Filters\AuthFilter`):** Valida a existência de sessão (`id_login` e `tipo`). Se inválido, redireciona para `/login`.
* **`admin` (`App\Filters\AdminFilter`):** Garante que o usuário possua nível `tipo == 1` para acessar `/admin/*`.

---

## 5. Padrão de Consultas Multi-Tenancy

Para qualquer Model que contenha dados específicos de empresa:
```php
// Listagem segura por empresa
$dados = $this->model
    ->where('id_empresa', $this->id_empresa)
    ->findAll();

// Inserção segura
$this->model->insert([
    'campo'      => $valor,
    'id_empresa' => $this->id_empresa,
]);

// Exclusão segura
$this->model
    ->where('id_empresa', $this->id_empresa)
    ->where('id_registro', $id)
    ->delete();
```

### Tabelas Auditadas com Isolamento Estrito:
* `clientes`, `fornecedores`, `funcionarios`, `vendedores`, `tecnicos`, `entregadores`, `transportadoras`
* `produtos`, `categorias_dos_produtos`, `reposicoes`, `saida_de_mercadorias`, `inventarios_do_estoque`
* `vendas`, `produtos_da_venda`, `venda_rapida`, `orcamentos`, `pedidos`, `ordens_de_servicos`
* `caixas`, `lancamentos`, `despesas`, `contas_a_pagar`, `contas_a_receber`, `boletos`
* `mesas`, `entregas`, `pagamentos_food`, `pagamentos_do_cliente`, `painel`
* `nfes`, `nfces`, `nfes_avulsa`, `controle_de_acesso`, `login`

---

## 6. Módulo Fiscal e Impressão de DANFE/DANFCE

### Biblioteca Sped-DA / NFePHP
* **Pacote:** `nfephp-org/sped-da` declarado no [`composer.json`](file:///c:/Users/Nilto/OneDrive/Documentos/projeto%20Saas/0.%20C%C3%B3digo%20Fonte%20-%20ERP%20GEST%C3%83O%20SAAS/composer.json).
* **Controller:** [`ImpressaoDANFe.php`](file:///c:/Users/Nilto/OneDrive/Documentos/projeto%20Saas/0.%20C%C3%B3digo%20Fonte%20-%20ERP%20GEST%C3%83O%20SAAS/app/Controllers/ImpressaoDANFe.php) suporta autoload tanto da pasta `app/ThirdParty/sped-da` quanto da raiz `vendor/`.
* **Tratamento de Exceções:** Valida a existência da classe antes da renderização e emite resposta HTTP com cabeçalhos `application/pdf` e renderização inline.

---

## 7. Sistema de Layouts e Renderização de Views

### Layout Mestre (`app/Views/templates/layout.php`)
Suporta extensão nativa do CodeIgniter 4:
```php
<?= $this->extend('templates/layout') ?>

<?= $this->section('conteudo') ?>
    <!-- Conteúdo da página -->
<?= $this->endSection() ?>
```

### Método Helper no BaseController (`renderTemplate`)
Permite aos controllers retornarem strings/respostas completas sem necessidade de `echo`:
```php
return $this->renderTemplate('clientes/index', $data);
```

---

## 8. Arquitetura do BaseController

O [`BaseController.php`](file:///c:/Users/Nilto/OneDrive/Documentos/projeto%20Saas/0.%20C%C3%B3digo%20Fonte%20-%20ERP%20GEST%C3%83O%20SAAS/app/Controllers/BaseController.php) centraliza a lógica compartilhada do ERP:

### Propriedades Disponíveis
* `$this->session`: Instância ativa da sessão.
* `$this->id_empresa`: ID da empresa ativa do tenant logado.
* `$this->id_login`: ID do usuário logado.
* `$this->tipo_usuario`: Nível de acesso (1 = Super Admin, 2 = Empresa).
* `$this->controle_de_acesso_model`: Model para verificação de permissões.

### Métodos Utilitários
* `verificaPermissao(string $modulo)`: Retorna `false` se permitido ou URL de redirecionamento caso negado.
* `preparaDadosBase(array $link, array $titulo, array $caminhos)`: Monta a estrutura de dados base com breadcrumbs e permissões para as views.
* `renderTemplate(string $view, array $data)`: Renderiza a view encapsulada no layout padrão.
* `alertSuccess(string $msg)` / `alertError(string $msg)`: Emite toasts SweetAlert2 via flashdata.

---

## 9. Migrations e Seeders do Banco de Dados

A estrutura e dados iniciais do banco podem ser gerenciados via CodeIgniter CLI (`spark`):

### Executar Migrations
Cria todas as tabelas com integridade relacional e campos de multi-tenancy:
```powershell
php spark migrate
```

### Executar Seeders
Popula o banco com UFs, tabela de municípios do IBGE, configurações do sistema e usuário admin inicial com senha criptografada:
```powershell
php spark db:seed DatabaseSeeder
```

---

## 10. Frontend, Estilização e UI/UX

* **CSS Customizado ([`public/assets/css/style.css`](file:///c:/Users/Nilto/OneDrive/Documentos/projeto%20Saas/0.%20C%C3%B3digo%20Fonte%20-%20ERP%20GEST%C3%83O%20SAAS/public/assets/css/style.css)):**
  - Paleta com variáveis CSS (`--erp-primary`, `--erp-success`, `--erp-danger`, `--erp-card-shadow`).
  - Cards com efeito de elevação no hover, bordas arredondadas e sombras suaves.
  - Tabelas e DataTables com cabeçalho refinado e linhas zebradas.
  - Scrollbar personalizada e estilização otimizada para os módulos Food Service (cards de mesa livre/ocupada) e PDV.
* **Interações e Feedback ([`public/assets/js/funcoes.js`](file:///c:/Users/Nilto/OneDrive/Documentos/projeto%20Saas/0.%20C%C3%B3digo%20Fonte%20-%20ERP%20GEST%C3%83O%20SAAS/public/assets/js/funcoes.js)):**
  - Diálogos de confirmação de exclusão com SweetAlert2 (`confirmaAcaoExcluir`).
  - Consulta assíncrona da ReceitaWS com tela de loading e toasts de sucesso/erro.
  - Validação assíncrona de duplicidade de nome de usuário.

---

## 11. Execução com Docker e Docker Compose

O projeto está 100% configurado para execução isolada em containers Docker:

### Arquitetura de Containers
| Serviço | Container | Imagem | Porta Host | Descrição |
| :--- | :--- | :--- | :--- | :--- |
| **App** | `erp_app` | `php:8.1-apache` customizado | `8080` | Servidor web Apache com PHP 8.1 e extensões CodeIgniter |
| **Database** | `erp_db` | `mariadb:10.6` | `3306` | Banco de dados MySQL/MariaDB com carga automática do dump |
| **phpMyAdmin** | `erp_phpmyadmin` | `phpmyadmin:latest` | `8081` | Interface gráfica web para gerenciamento do banco |

### Comandos Úteis do Docker
* **Iniciar todos os serviços:**
  ```powershell
  docker compose up -d
  ```
* **Recompilar imagem do app:**
  ```powershell
  docker compose up -d --build
  ```
* **Parar serviços:**
  ```powershell
  docker compose down
  ```
* **Acessar o terminal do container do App:**
  ```powershell
  docker exec -it erp_app bash
  ```
* **Ver logs em tempo real:**
  ```powershell
  docker compose logs -f
  ```






