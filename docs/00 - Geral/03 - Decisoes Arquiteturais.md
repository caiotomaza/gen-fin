# 03 - Decisões Arquiteturais

Este arquivo funciona como um ADR simplificado.

## ADR-001 — Monólito modular no MVP

**Decisão:** backend único NestJS dividido em módulos de domínio.

**Motivo:**
- reduz custo operacional;
- simplifica transações;
- facilita testes;
- evita microserviços prematuros.

**Revisar quando:** houver gargalos reais de escala, times independentes ou necessidade de isolamento operacional.

---

## ADR-002 — PostgreSQL como banco transacional principal

**Decisão:** usar PostgreSQL como fonte de verdade.

**Motivo:**
- ACID;
- excelente suporte a constraints;
- tipos monetários/decimais adequados;
- índices e agregações robustos;
- maturidade operacional.

---

## ADR-003 — Prisma no backend

**Decisão:** Prisma como ORM inicial.

**Motivo:** produtividade, migrations, tipagem e integração com TypeScript.

**Observação:** regras críticas devem continuar explícitas no domínio e não ficar escondidas no ORM.

---

## ADR-004 — Docker Compose para ambientes simples

**Decisão:** utilizar Docker Compose para dev, homologação simples e primeira produção.

**Motivo:** o sistema não justifica Kubernetes no MVP.

---

## ADR-005 — Regras financeiras parametrizadas

**Decisão:** meses de reserva, limites discricionários e presets conservadores devem ser configuráveis.

**Motivo:** impedir acoplamento entre regra de negócio mutável e código.

---

## ADR-006 — Auditoria de eventos sensíveis

Eventos como login, alteração de senha, troca de e-mail, exclusão de conta, exportação de dados e mudança de parâmetros financeiros devem gerar registros de auditoria.

---

## ADR-007 — Não usar Redis no MVP por padrão

Redis será introduzido apenas para necessidade concreta:
- cache com benefício mensurável;
- rate limiting distribuído;
- filas;
- sessões distribuídas.

Evitar adicionar infraestrutura sem caso de uso.
