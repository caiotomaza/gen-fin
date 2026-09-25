# 01 - Arquitetura Fullstack

## 1. Visão geral

```text
[ Navegador ]
      |
      v
[ Next.js Web ]
      |
      | HTTPS / REST
      v
[ NestJS API ]
      |
      | Prisma
      v
[ PostgreSQL ]
```

Em produção:

```text
Internet
   |
   v
[ Caddy / Nginx ]
   |             \
   v              v
[ Frontend ]   [ Backend ]
                    |
                    v
               [ PostgreSQL ]
```

## 2. Responsabilidades

### Frontend
Responsável por:
- autenticação do usuário;
- telas e formulários;
- dashboards;
- validação de experiência;
- visualização de métricas;
- internacionalização futura.

Não deve ser a fonte de verdade para cálculos críticos.

### Backend
Responsável por:
- autorização;
- regras financeiras;
- normalização de periodicidades;
- consolidação mensal;
- cálculo de reserva;
- persistência;
- auditoria;
- exportação;
- integrações futuras.

### PostgreSQL
Responsável por:
- integridade referencial;
- consistência transacional;
- constraints;
- armazenamento histórico;
- agregações persistentes quando necessário.

## 3. Modularização do backend

```text
src/
  auth/
  users/
  incomes/
  expenses/
  categories/
  emergency-fund/
  investments/
  goals/
  analytics/
  audit/
  common/
```

Cada módulo deve conter, quando aplicável:
- controller;
- service/use cases;
- DTOs;
- repository abstraction se houver benefício;
- tests.

## 4. Camadas recomendadas

```text
Controller
   ↓
Application Service / Use Case
   ↓
Domain Rules
   ↓
Repository / Prisma
   ↓
PostgreSQL
```

Não transformar o projeto em Clean Architecture cerimonial. O objetivo é separar regras relevantes sem multiplicar arquivos sem necessidade.

## 5. Escalabilidade

Primeiros mecanismos:
- paginação;
- índices;
- queries agregadas eficientes;
- cache apenas se medido;
- jobs assíncronos apenas para tarefas pesadas.

Escalar verticalmente antes de fragmentar domínio sem necessidade.

## 6. Comunicação

Padrão inicial: REST JSON.

Razões:
- simples;
- fácil de depurar;
- boa aderência a CRUD + relatórios;
- ampla compatibilidade.

GraphQL não agrega benefício suficiente no MVP.
