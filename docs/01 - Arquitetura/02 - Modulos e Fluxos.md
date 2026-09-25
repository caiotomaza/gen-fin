# 02 - Módulos e Fluxos

## Módulos funcionais

### Usuário
- conta;
- preferências;
- moeda padrão;
- timezone;
- parâmetros financeiros.

### Receitas
- cadastro;
- recorrência;
- receitas variáveis;
- normalização mensal.

### Despesas
- cadastro;
- categoria;
- classificação financeira;
- recorrência;
- despesas sazonais;
- baixa/pagamento.

### Reserva de emergência
- meta;
- saldo atual;
- cobertura;
- déficit/superávit.

### Investimentos
- registro manual de posição;
- categoria de ativo;
- liquidez;
- objetivo;
- marcação como parte ou não da reserva.

### Metas
- nome;
- valor-alvo;
- data-alvo;
- valor acumulado.

### Analytics
- resumo mensal;
- média de receitas;
- custo essencial;
- taxa de poupança;
- distribuição por categoria;
- evolução da reserva.

## Fluxo: cadastrar receita variável

```text
Usuário informa valor e competência
        ↓
API valida DTO
        ↓
Regra verifica ownership do recurso
        ↓
Persistência no PostgreSQL
        ↓
Dashboard recalcula métricas do período
```

## Fluxo: calcular reserva

```text
Buscar despesas essenciais válidas
        ↓
Normalizar periodicidade para mês
        ↓
Calcular custo essencial mensal
        ↓
Obter meses-alvo configurados
        ↓
Reserva-alvo = custo mensal × meses-alvo
        ↓
Cobertura = saldo da reserva / custo mensal
```

## Fluxo: despesa anual

Exemplo: seguro anual de R$ 1.200.

Para análise de orçamento:
```text
R$ 1.200 / 12 = R$ 100 por mês
```

O lançamento real continua anual. A normalização mensal é apenas analítica.

## Fluxo: exclusão de conta

1. exigir reautenticação;
2. registrar solicitação;
3. invalidar sessões;
4. executar retenções legais necessárias;
5. excluir ou anonimizar dados conforme política;
6. registrar auditoria sem manter conteúdo financeiro indevido.
