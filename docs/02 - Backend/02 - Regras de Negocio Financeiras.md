# 02 - Regras de Negócio Financeiras

## RN-001 — Normalização de periodicidade

Para comparar receitas e despesas de diferentes periodicidades, converter para equivalente mensal.

Fatores recomendados:

| Periodicidade | Conversão mensal aproximada |
|---|---:|
| Semanal | valor × 52 / 12 |
| Mensal | valor |
| Trimestral | valor / 3 |
| Semestral | valor / 6 |
| Anual | valor / 12 |

A periodicidade original deve continuar armazenada.

## RN-002 — Receita média

Para renda variável:

```text
receita_media = soma(receitas do período) / quantidade de períodos válidos
```

O período de média deve ser configurável, com sugestão inicial de 3, 6 ou 12 meses.

## RN-003 — Custo essencial mensal

```text
custo_essencial = soma(despesas essenciais normalizadas)
```

Itens eventuais devem ser avaliados pelo comportamento definido pelo usuário: excluir, ratear ou considerar em janela histórica.

## RN-004 — Reserva-alvo

```text
reserva_alvo = custo_essencial_mensal × meses_cobertura
```

Presets iniciais podem sugerir:
- 6 meses para alta estabilidade;
- 9 a 12 meses para maior volatilidade de renda.

Esses números são **configuração**, não constante de código.

## RN-005 — Cobertura atual

```text
cobertura_meses = saldo_reserva / custo_essencial_mensal
```

Se `custo_essencial_mensal = 0`, retornar estado indeterminado, não infinito.

## RN-006 — Gap da reserva

```text
gap = max(reserva_alvo - saldo_reserva, 0)
```

## RN-007 — Taxa de poupança

```text
taxa_poupanca = (receita_liquida - despesas_totais) / receita_liquida
```

Evitar cálculo quando receita líquida <= 0.

## RN-008 — Classificação de despesa

Enum inicial:
```text
ESSENTIAL
STRATEGIC
DISCRETIONARY
```

O usuário pode reclassificar. O sistema deve manter histórico se a alteração impactar relatórios passados de forma relevante.

## RN-009 — Limite discricionário

Pode haver um parâmetro recomendado, por exemplo 10% ou 15% da renda líquida, porém configurável.

O sistema deve informar:
- limite definido;
- gasto discricionário atual;
- percentual consumido.

## RN-010 — Reserva não é investimento de longo prazo

Ativos marcados como reserva precisam possuir atributo de liquidez e disponibilidade compatíveis com a política definida pelo usuário.

## RN-011 — Metas de curto prazo

Metas de até 2 anos devem ser tratadas separadamente de objetivos de longo prazo na experiência do produto.

## RN-012 — Preservação de poder de compra

O sistema pode registrar benchmarks e indexadores, mas não deve prometer rentabilidade futura.

## RN-013 — Poupança

O sistema pode registrar saldo em poupança, mas a camada de recomendação conservadora pode sinalizar que há alternativas de liquidez comparável e maior eficiência histórica. A aplicação não deve impedir o cadastro.

## RN-014 — Histórico

Relatórios mensais fechados devem poder ser reproduzidos mesmo se parâmetros futuros forem alterados. Para isso, snapshots de parâmetros podem ser salvos por competência quando necessário.
