# 01 - Modelo PostgreSQL

## Princípios

- PostgreSQL é a fonte de verdade.
- Integridade deve existir no banco, não só no TypeScript.
- `numeric` para dinheiro.
- timestamps com timezone.
- índices baseados em padrões reais de consulta.

## Modelo conceitual

```text
users
  ├── user_settings
  ├── sessions
  ├── categories
  ├── incomes
  ├── expenses
  ├── emergency_fund_settings
  ├── emergency_fund_entries
  ├── investments
  ├── goals
  └── audit_logs
```

## users

```text
id UUID PK
email CITEXT UNIQUE
password_hash TEXT
status TEXT
created_at TIMESTAMPTZ
updated_at TIMESTAMPTZ
```

## user_settings

```text
user_id UUID PK/FK
currency CHAR(3)
timezone TEXT
income_average_months SMALLINT
emergency_months SMALLINT
discretionary_limit_pct NUMERIC(5,2)
created_at TIMESTAMPTZ
updated_at TIMESTAMPTZ
```

## categories

```text
id UUID PK
user_id UUID FK
name TEXT
kind category_kind
is_system BOOLEAN
created_at TIMESTAMPTZ
```

`kind`:
```text
INCOME
EXPENSE
```

## incomes

```text
id UUID PK
user_id UUID FK
category_id UUID FK
amount NUMERIC(14,2)
description TEXT
periodicity periodicity
value_type value_type
competence DATE
received_at DATE NULL
created_at TIMESTAMPTZ
updated_at TIMESTAMPTZ
```

## expenses

```text
id UUID PK
user_id UUID FK
category_id UUID FK
amount NUMERIC(14,2)
description TEXT
classification expense_classification
periodicity periodicity
value_type value_type
competence DATE
due_date DATE NULL
paid_at DATE NULL
created_at TIMESTAMPTZ
updated_at TIMESTAMPTZ
```

## emergency_fund_settings

```text
user_id UUID PK/FK
target_months SMALLINT
strategy TEXT
updated_at TIMESTAMPTZ
```

## emergency_fund_entries

```text
id UUID PK
user_id UUID FK
amount NUMERIC(14,2)
entry_type fund_entry_type
occurred_at DATE
description TEXT
created_at TIMESTAMPTZ
```

## investments

```text
id UUID PK
user_id UUID FK
name TEXT
asset_type TEXT
current_value NUMERIC(14,2)
liquidity_type TEXT
is_emergency_fund BOOLEAN
benchmark TEXT NULL
created_at TIMESTAMPTZ
updated_at TIMESTAMPTZ
```

## goals

```text
id UUID PK
user_id UUID FK
name TEXT
target_amount NUMERIC(14,2)
current_amount NUMERIC(14,2)
target_date DATE NULL
created_at TIMESTAMPTZ
updated_at TIMESTAMPTZ
```

## audit_logs

```text
id UUID PK
user_id UUID NULL
actor_type TEXT
action TEXT
resource_type TEXT
resource_id UUID NULL
metadata JSONB
created_at TIMESTAMPTZ
```

## Enums sugeridos

```text
periodicity:
WEEKLY | MONTHLY | QUARTERLY | SEMIANNUAL | ANNUAL

value_type:
FIXED | VARIABLE

expense_classification:
ESSENTIAL | STRATEGIC | DISCRETIONARY

fund_entry_type:
CONTRIBUTION | WITHDRAWAL | ADJUSTMENT
```

## Constraints mínimas

```text
amount > 0
emergency_months BETWEEN 1 AND 36
discretionary_limit_pct BETWEEN 0 AND 100
```

## Competência

Representar competência como primeiro dia do mês:
```text
2026-09-01
```

Isso evita inventar um tipo textual quando o banco já consegue ordenar datas corretamente.
