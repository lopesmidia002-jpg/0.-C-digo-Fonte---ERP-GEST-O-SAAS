# Diretrizes de Desenvolvimento do Projeto (PROMPT.md)

Este documento contém as premissas e padrões de atuação para o desenvolvimento e evolução contínua do ERP Gestão SaaS.

---

## 1. Princípios de Arquitetura
1. **Segurança em Primeiro Lugar:**
   - Senhas sempre armazenadas e manipuladas com `password_hash()` e `password_verify()`.
   - Rotas privadas protegidas por filtros nativos do CodeIgniter 4 (`AuthFilter`, `AdminFilter`).
   - Todos os inputs validados e higienizados.
2. **Isolamento Estrito de Tenants (Multi-Tenancy):**
   - Nenhuma consulta ou operação de banco pode misturar registros entre empresas diferentes. Sempre usar o filtro de `id_empresa` da sessão.
3. **Padrão CodeIgniter 4:**
   - Uso idiomático do framework: models tipados, controllers enxutos, views estendidas via layouts e filtros de requisição.

---

## 2. Padrões de Entrega e Commits
Ao final de cada funcionalidade (`feat`), correção (`fix`) ou refatoração (`refactor`):
1. **Atualizar os arquivos de governança:**
   - [`PASSOS.md`](file:///c:/Users/Nilto/OneDrive/Documentos/projeto%20Saas/0.%20C%C3%B3digo%20Fonte%20-%20ERP%20GEST%C3%83O%20SAAS/PASSOS.md): Marcar com `[x]` as etapas finalizadas.
   - [`DOCUMENTACAO.md`](file:///c:/Users/Nilto/OneDrive/Documentos/projeto%20Saas/0.%20C%C3%B3digo%20Fonte%20-%20ERP%20GEST%C3%83O%20SAAS/DOCUMENTACAO.md): Documentar novos métodos, models, tabelas ou fluxos.
   - [`CONTEXTO.md`](file:///c:/Users/Nilto/OneDrive/Documentos/projeto%20Saas/0.%20C%C3%B3digo%20Fonte%20-%20ERP%20GEST%C3%83O%20SAAS/CONTEXTO.md): Atualizar regras de negócio ou stack conforme necessário.
2. **Gerar mensagem de commit estruturada:**
   - Formato [Conventional Commits](https://www.conventionalcommits.org/): `tipo(escopo): descrição concisa`.
3. **Aguardar autorização:**
   - Não avançar para o próximo passo sem a solicitação expressa do usuário.
