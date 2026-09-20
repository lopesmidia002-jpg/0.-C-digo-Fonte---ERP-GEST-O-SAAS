# Regras de Atuação do Assistente (Memória Local e Global)

## Regras Obrigatórias de Governança

1. **Atualização Contínua de Arquivos de Documentação:**
   - Ao final de cada implementação de funcionalidade (`feat`), correção de bug (`fix`), refatoração (`refactor`) ou alteração estrutural, você DEVE atualizar obrigatoriamente os seguintes arquivos:
     - `PASSOS.md`: Marcar com `[x]` as tarefas concluídas e manter o roadmap atualizado.
     - `DOCUMENTACAO.md`: Incluir novos detalhes técnicos, endpoints, models, regras de segurança ou parâmetros alterados.
     - `CONTEXTO.md`: Manter o contexto do ERP SaaS em sincronia com o estado real do projeto.

2. **Geração de Texto para Commit Git:**
   - Ao final de toda e qualquer resposta contendo alterações de código, você DEVE fornecer um bloco com a sugestão de comando e mensagem de commit no formato convencional (`feat: ...`, `fix: ...`, `refactor: ...`, `docs: ...`, `chore: ...`).

3. **Execução Estritamente Sequencial sob Demanda:**
   - Respeite fielmente a ordem de prioridade definida no arquivo `PASSOS.md`.
   - **NUNCA** inicie o próximo passo automaticamente por iniciativa própria. Conclua o passo atual e aguarde a solicitação explícita do usuário para avançar para o próximo passo.

4. **Isolamento Multi-Tenancy e Segurança:**
   - Todas as operações em tabelas pertencentes a empresas clientes devem conter a cláusula `where('id_empresa', $id_empresa)`.
   - Senhas sempre devem ser tratadas com hashing seguro (`password_hash` / `password_verify`).
