# 01 - MVP e Roadmap

## MVP — objetivo

Permitir que uma pessoa cadastre sua vida financeira manualmente e obtenha métricas coerentes sobre orçamento e reserva de emergência.

## Fase 1 — Fundação

- monorepo ou repositório organizado;
- Docker Compose;
- PostgreSQL;
- backend NestJS;
- frontend Next.js;
- autenticação;
- migrations;
- CI básico.

## Fase 2 — Núcleo financeiro

- receitas;
- despesas;
- categorias;
- classificação essencial/estratégica/discricionária;
- periodicidades;
- valores fixos e variáveis;
- competências.

## Fase 3 — Dashboard

- receita mensal;
- despesa mensal;
- saldo;
- custo essencial;
- taxa de poupança;
- distribuição por classificação.

## Fase 4 — Reserva

- meses-alvo;
- reserva-alvo;
- saldo atual;
- cobertura;
- gap;
- histórico de aportes.

## Fase 5 — Investimentos e metas

- posições manuais;
- objetivos;
- liquidez;
- separação entre reserva e patrimônio de longo prazo.

## Fase 6 — Operação

- exportação de dados;
- auditoria;
- backup automatizado;
- restore testado;
- observabilidade;
- staging.

## Depois do MVP

Avaliar por valor real:
- PWA;
- importação CSV;
- Open Finance;
- notificações;
- metas avançadas;
- benchmarking inflacionário;
- multi-moeda;
- passkeys/MFA;
- relatórios anuais.

## Não priorizar cedo

- Kubernetes;
- microserviços;
- event sourcing;
- Kafka;
- Redis sem necessidade;
- arquitetura serverless fragmentada;
- IA generativa no caminho crítico.

## Definition of Done

Uma feature só está concluída quando:
- regras implementadas;
- validação backend;
- autorização testada;
- testes adequados;
- migration revisada se houver;
- observabilidade mínima;
- documentação atualizada.
