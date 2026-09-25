# 02 - Glossário e Convenções

## Glossário de domínio

| Termo | Definição |
|---|---|
| Competência | Período ao qual a receita ou despesa pertence. |
| Fluxo de caixa | Entradas menos saídas efetivamente realizadas. |
| Custo essencial mensal | Soma normalizada das despesas classificadas como essenciais. |
| Reserva-alvo | Custo essencial mensal multiplicado pelos meses de cobertura definidos. |
| Cobertura da reserva | Quantos meses essenciais o saldo atual da reserva consegue financiar. |
| Receita variável | Receita cujo valor muda em cada período. |
| Despesa sazonal | Gasto previsível, mas não necessariamente mensal. |
| Gasto discricionário | Gasto de qualidade de vida ou consumo opcional. |
| Ganho real | Retorno acima da inflação. |

## Convenções de código

### Linguagem
- Código, variáveis e nomes técnicos: inglês.
- UI e mensagens ao usuário: pt-BR no primeiro release.
- Documentação de produto: português.

### Datas
- Persistir timestamps em UTC.
- Exibir no timezone do usuário.
- Competências devem usar formato lógico `YYYY-MM`.

### Dinheiro
Nunca usar `float` para valores monetários.

No PostgreSQL:
```sql
numeric(14,2)
```

No TypeScript:
- tratar valor monetário via `Decimal` do ORM ou biblioteca decimal;
- nunca converter dinheiro para ponto flutuante sem necessidade explícita.

### IDs
Preferência: UUID v7 ou UUID v4.

### Nomenclatura da API
- recursos no plural;
- URLs em kebab-case;
- JSON em camelCase.

Exemplo:
```http
GET /api/v1/financial-summary
```

### Git
Branches:
- `main`: produção
- `develop`: opcional, somente se o fluxo de equipe justificar
- `feat/*`
- `fix/*`
- `chore/*`

Commits recomendados:
```text
feat(expenses): add recurring expense normalization
fix(auth): rotate refresh token on renewal
chore(db): add index to transaction date
```
