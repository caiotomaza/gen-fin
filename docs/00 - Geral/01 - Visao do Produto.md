# 01 - Visão do Produto

## 1. O que é o g$n-fin

O **g$n-fin** é uma ferramenta web de gerenciamento financeiro pessoal. O sistema recebe receitas, despesas, reservas e investimentos e transforma esses dados em métricas de planejamento financeiro com uma abordagem conservadora.

O sistema não deve se comportar como uma corretora, consultoria individual de investimentos ou mecanismo de execução de ordens. Ele é uma ferramenta de **organização, cálculo, acompanhamento e educação financeira**.

## 2. Problema que o produto resolve

Usuários normalmente possuem dados financeiros fragmentados e pouca clareza sobre:

- quanto realmente custa sua vida essencial;
- quanto deveria existir em reserva de emergência;
- quanto falta para completar essa reserva;
- quais despesas são recorrentes, sazonais ou eventuais;
- quanto sobra mensalmente para objetivos de médio e longo prazo;
- como preservar poder de compra sem assumir risco incompatível com um perfil conservador.

## 3. Proposta central

O sistema deve converter lançamentos financeiros em uma visão operacional simples:

1. **Quanto entrou?**
2. **Quanto saiu?**
3. **Quanto do gasto é essencial, estratégico ou discricionário?**
4. **Quanto custa um mês essencial?**
5. **Qual é a meta de reserva?**
6. **Qual é a cobertura atual da reserva?**
7. **Quanto pode ser destinado a objetivos e investimentos sem comprometer liquidez?**

## 4. Entidades funcionais

### Receita
Campos centrais:
- categoria;
- descrição;
- valor;
- periodicidade;
- tipo de valor;
- competência;
- data de recebimento.

Categorias iniciais:
- Salário
- Ganhos extras
- Serviços / PJ
- Rendimentos
- Outros

Periodicidades:
- Semanal
- Mensal
- Trimestral
- Semestral
- Anual

Tipos:
- Valor fixo / médio
- Valor variável

### Despesa
Campos centrais:
- categoria;
- subcategoria;
- descrição;
- valor;
- periodicidade;
- tipo;
- classificação financeira;
- competência;
- data de vencimento/pagamento.

Classificações:
- **Essencial:** manutenção básica da vida.
- **Estratégica:** educação, saúde preventiva, ferramentas de trabalho e itens que aumentam capacidade de geração de renda.
- **Discricionária:** lazer, conforto e consumo opcional.

### Reserva de emergência
A reserva deve ser tratada como **liquidez de proteção**, não como carteira de longo prazo.

Parâmetros recomendados devem ser configuráveis:
- fator de estabilidade profissional;
- meses-alvo de cobertura;
- custo essencial mensal calculado;
- valor atual da reserva.

### Investimentos
O sistema deve registrar posições e objetivos, mas não executar ordens.

Categorias funcionais iniciais:
- pós-fixados;
- inflação + juros reais;
- prefixados;
- outros instrumentos permitidos pelo usuário.

## 5. Princípios de domínio

### Liquidez antes de rentabilidade
Capital de emergência deve priorizar acesso rápido e baixo risco.

### Segurança real
O sistema deve distinguir crescimento nominal de preservação de poder de compra.

### Sustentabilidade orçamentária
O produto não deve recomendar zerar lazer ou despesas discricionárias. Deve permitir limites configuráveis.

### Regras configuráveis
Exemplos como "6 meses de reserva" ou "10% a 15% para lazer" devem existir como **presets ou sugestões**, nunca como regras imutáveis no código.

## 6. Fora do escopo do MVP

- Open Finance automático;
- execução de ordens;
- recomendação individual de ativos específicos;
- contabilidade empresarial;
- imposto de renda completo;
- conciliação bancária automática;
- multiempresa;
- motor de IA para aconselhamento autônomo.
