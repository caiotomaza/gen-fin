# 01 - Frontend e UX

## Stack

- Next.js
- TypeScript
- React
- biblioteca de componentes acessíveis
- React Hook Form ou equivalente
- Zod para validação no cliente
- cliente HTTP centralizado

## Estrutura sugerida

```text
apps/web/
  app/
    (auth)/
    dashboard/
    incomes/
    expenses/
    emergency-fund/
    investments/
    goals/
    settings/
  components/
  features/
  lib/
  hooks/
  types/
```

## Telas do MVP

### Login / Cadastro
- login;
- criação de conta;
- recuperação de senha.

### Dashboard
Cards:
- renda mensal normalizada;
- despesas do mês;
- saldo do mês;
- custo essencial;
- cobertura da reserva;
- gap da reserva;
- taxa de poupança.

Gráficos:
- despesas por classificação;
- evolução do saldo mensal;
- progresso da reserva.

### Receitas
- lista;
- filtro por competência;
- criação/edição;
- recorrência.

### Despesas
- lista;
- filtros;
- classificação;
- recorrência;
- indicação de pago/pendente.

### Reserva
- custo essencial calculado;
- meses-alvo;
- reserva-alvo;
- saldo atual;
- progresso;
- histórico de aportes.

### Investimentos
- cadastro manual;
- categoria;
- valor atual;
- liquidez;
- objetivo.

### Configurações
- moeda;
- timezone;
- janela de média de renda;
- meses-alvo de reserva;
- limite discricionário;
- exportar dados;
- excluir conta.

## UX financeira

### Não mascarar problema com cor
Cores podem apoiar leitura, mas a informação deve continuar compreensível por texto e ícones.

### Evitar julgamento moral
Não usar mensagens como "você gastou errado".

Preferir:
> O gasto discricionário consumiu 87% do limite definido para este mês.

### Explicar fórmulas
Toda métrica relevante deve ter tooltip ou link "Como calculamos?".

### Loading e erro
Cada tela deve prever:
- loading;
- empty state;
- erro de rede;
- erro de validação;
- dados parciais.

## Estado

Evitar store global para tudo.

Prioridade:
- server state via fetch/query library;
- estado local para UI;
- store global apenas para contexto realmente global.

## Segurança frontend

- escapar conteúdo;
- CSP;
- não logar tokens;
- não expor secrets em variáveis públicas;
- validar novamente no backend.
