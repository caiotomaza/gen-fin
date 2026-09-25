CREATE EXTENSION IF NOT EXISTS citext;
CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TYPE periodicity AS ENUM (
  'WEEKLY', 'MONTHLY', 'QUARTERLY', 'SEMIANNUAL', 'ANNUAL'
);

CREATE TYPE value_type AS ENUM ('FIXED', 'VARIABLE');
CREATE TYPE expense_classification AS ENUM ('ESSENTIAL', 'STRATEGIC', 'DISCRETIONARY');
CREATE TYPE category_kind AS ENUM ('INCOME', 'EXPENSE');
CREATE TYPE fund_entry_type AS ENUM ('CONTRIBUTION', 'WITHDRAWAL', 'ADJUSTMENT');

CREATE TABLE users (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  email citext NOT NULL UNIQUE,
  password_hash text NOT NULL,
  status text NOT NULL DEFAULT 'ACTIVE',
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE user_settings (
  user_id uuid PRIMARY KEY REFERENCES users(id) ON DELETE CASCADE,
  currency char(3) NOT NULL DEFAULT 'BRL',
  timezone text NOT NULL DEFAULT 'America/Fortaleza',
  income_average_months smallint NOT NULL DEFAULT 6 CHECK (income_average_months BETWEEN 1 AND 24),
  emergency_months smallint NOT NULL DEFAULT 6 CHECK (emergency_months BETWEEN 1 AND 36),
  discretionary_limit_pct numeric(5,2) NOT NULL DEFAULT 15 CHECK (discretionary_limit_pct BETWEEN 0 AND 100),
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE categories (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  name text NOT NULL,
  kind category_kind NOT NULL,
  is_system boolean NOT NULL DEFAULT false,
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE(user_id, kind, name)
);

CREATE TABLE incomes (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  category_id uuid REFERENCES categories(id) ON DELETE SET NULL,
  amount numeric(14,2) NOT NULL CHECK (amount > 0),
  description text,
  periodicity periodicity NOT NULL,
  value_type value_type NOT NULL,
  competence date NOT NULL,
  received_at date,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE expenses (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  category_id uuid REFERENCES categories(id) ON DELETE SET NULL,
  amount numeric(14,2) NOT NULL CHECK (amount > 0),
  description text,
  classification expense_classification NOT NULL,
  periodicity periodicity NOT NULL,
  value_type value_type NOT NULL,
  competence date NOT NULL,
  due_date date,
  paid_at date,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE emergency_fund_entries (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  amount numeric(14,2) NOT NULL CHECK (amount > 0),
  entry_type fund_entry_type NOT NULL,
  occurred_at date NOT NULL,
  description text,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_incomes_user_competence ON incomes(user_id, competence);
CREATE INDEX idx_expenses_user_competence ON expenses(user_id, competence);
CREATE INDEX idx_expenses_user_classification_competence ON expenses(user_id, classification, competence);
CREATE INDEX idx_fund_entries_user_date ON emergency_fund_entries(user_id, occurred_at);
