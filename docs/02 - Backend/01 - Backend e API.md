# 01 - Backend e API

## Stack

- Node.js
- TypeScript
- NestJS
- Prisma
- PostgreSQL
- class-validator / validação equivalente
- OpenAPI / Swagger

## Estrutura sugerida

```text
apps/api/
  src/
    main.ts
    app.module.ts
    auth/
    users/
    incomes/
    expenses/
    emergency-fund/
    investments/
    analytics/
    audit/
    common/
  prisma/
    schema.prisma
    migrations/
  test/
```

## Padrão de resposta

Sucesso:
```json
{
  "data": {
    "id": "..."
  }
}
```

Erro:
```json
{
  "error": {
    "code": "EXPENSE_NOT_FOUND",
    "message": "Despesa não encontrada.",
    "requestId": "..."
  }
}
```

## Endpoints principais

### Auth
```http
POST /api/v1/auth/register
POST /api/v1/auth/login
POST /api/v1/auth/refresh
POST /api/v1/auth/logout
POST /api/v1/auth/forgot-password
POST /api/v1/auth/reset-password
```

### Usuário
```http
GET    /api/v1/me
PATCH  /api/v1/me
DELETE /api/v1/me
```

### Receitas
```http
GET    /api/v1/incomes
POST   /api/v1/incomes
GET    /api/v1/incomes/:id
PATCH  /api/v1/incomes/:id
DELETE /api/v1/incomes/:id
```

### Despesas
```http
GET    /api/v1/expenses
POST   /api/v1/expenses
GET    /api/v1/expenses/:id
PATCH  /api/v1/expenses/:id
DELETE /api/v1/expenses/:id
```

### Categorias
```http
GET  /api/v1/categories
POST /api/v1/categories
```

### Reserva
```http
GET   /api/v1/emergency-fund
PATCH /api/v1/emergency-fund/settings
POST  /api/v1/emergency-fund/contributions
```

### Investimentos
```http
GET    /api/v1/investments
POST   /api/v1/investments
PATCH  /api/v1/investments/:id
DELETE /api/v1/investments/:id
```

### Analytics
```http
GET /api/v1/analytics/monthly-summary?month=2026-09
GET /api/v1/analytics/cash-flow?from=2026-01&to=2026-12
GET /api/v1/analytics/expense-distribution?month=2026-09
GET /api/v1/analytics/emergency-fund
```

## Exemplo: criar despesa

```http
POST /api/v1/expenses
Content-Type: application/json
Authorization: Bearer <token>
```

```json
{
  "description": "Internet",
  "amount": "119.90",
  "categoryId": "uuid",
  "classification": "ESSENTIAL",
  "periodicity": "MONTHLY",
  "valueType": "FIXED",
  "competence": "2026-09",
  "dueDate": "2026-09-10"
}
```

## Paginação

Usar cursor quando houver ganho claro; no MVP, `page + pageSize` é suficiente.

Resposta:
```json
{
  "data": [],
  "meta": {
    "page": 1,
    "pageSize": 20,
    "total": 84
  }
}
```

## Idempotência

Para endpoints futuros de importação ou integração bancária, adotar `Idempotency-Key`.

## OpenAPI

A API deve publicar documentação Swagger somente em ambientes autorizados ou protegidos.
