# 02 - Migrations, Índices e Backup

## Migrations

Nunca alterar schema de produção manualmente.

Fluxo:
```text
alterar schema Prisma
→ gerar migration
→ revisar SQL
→ testar local
→ aplicar em staging
→ backup
→ aplicar em produção
```

## Estratégia de compatibilidade

Mudanças destrutivas devem usar expansão e contração:

1. adicionar nova coluna/tabela;
2. escrever nos formatos antigo e novo se necessário;
3. migrar dados;
4. atualizar consumidores;
5. remover estrutura antiga em release posterior.

## Índices iniciais

```sql
CREATE INDEX idx_incomes_user_competence
ON incomes(user_id, competence);

CREATE INDEX idx_expenses_user_competence
ON expenses(user_id, competence);

CREATE INDEX idx_expenses_user_classification_competence
ON expenses(user_id, classification, competence);

CREATE INDEX idx_fund_entries_user_date
ON emergency_fund_entries(user_id, occurred_at);

CREATE INDEX idx_audit_user_date
ON audit_logs(user_id, created_at DESC);
```

Não adicionar dezenas de índices preventivamente. Cada índice aumenta custo de escrita.

## Backup

### Objetivo mínimo
- backup diário;
- retenção configurável;
- armazenamento fora do host principal;
- criptografia;
- testes periódicos de restauração.

### Backup lógico

```bash
pg_dump -Fc -d gsnfin > gsnfin.dump
```

### Restore

```bash
createdb gsnfin_restore
pg_restore -d gsnfin_restore gsnfin.dump
```

## Produção

Para produção séria:
- backup automático;
- cópia externa/offsite;
- monitorar falha de backup;
- testar restore em calendário definido.

Backup que nunca foi restaurado é apenas uma suposição.

## Retenção

Exemplo inicial:
- diários: 7;
- semanais: 4;
- mensais: 6.

Adequar ao ambiente e política de dados.
