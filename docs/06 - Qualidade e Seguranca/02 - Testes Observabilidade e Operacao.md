# 02 - Testes, Observabilidade e Operação

## Pirâmide de testes

### Unitários
Prioridade alta para regras matemáticas:
- normalização de periodicidade;
- custo essencial;
- reserva-alvo;
- cobertura;
- gap;
- taxa de poupança.

### Integração
Testar:
- repositories;
- PostgreSQL real em container;
- migrations;
- autenticação;
- ownership.

### E2E
Fluxos críticos:
1. criar conta;
2. login;
3. cadastrar receita;
4. cadastrar despesa;
5. visualizar dashboard;
6. configurar reserva;
7. logout.

## Casos numéricos mínimos

### Reserva
```text
Custo essencial = 2.000
Meses-alvo = 6
Reserva-alvo = 12.000
Saldo atual = 3.000
Cobertura = 1,5 mês
Gap = 9.000
```

### Despesa anual
```text
Seguro anual = 1.200
Equivalente mensal = 100
```

### Sem receita
Taxa de poupança não deve gerar divisão por zero.

## Observabilidade

### Logs
Formato JSON:
```json
{
  "level": "info",
  "requestId": "...",
  "route": "/api/v1/expenses",
  "status": 201,
  "durationMs": 24
}
```

### Métricas
Mínimo:
- latência p50/p95;
- taxa de erro 5xx;
- uso de CPU/memória;
- conexões PostgreSQL;
- tamanho do banco;
- falha de backup;
- falha de healthcheck.

### Tracing
Opcional no MVP. Adotar quando houver complexidade suficiente.

## SLO inicial

Não inventar SLA comercial cedo.

Como meta interna:
- API disponível e saudável;
- backups diários;
- erros críticos alertados.

## Runbook básico

### API indisponível
1. verificar proxy;
2. verificar container;
3. verificar logs;
4. verificar PostgreSQL;
5. validar migrations recentes;
6. rollback de imagem se necessário.

### Banco indisponível
1. bloquear deploys;
2. verificar disco/memória;
3. verificar logs do PostgreSQL;
4. evitar restart repetitivo sem diagnóstico;
5. usar restore somente com causa entendida.
