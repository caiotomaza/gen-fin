# g$n-fin — Vault Técnico

> Documentação técnica central do projeto **g$n-fin**, uma aplicação web de gestão financeira pessoal orientada por princípios conservadores de liquidez, preservação de capital e planejamento de longo prazo.

## Objetivo do vault

Este vault foi pensado para servir como **fonte única de verdade técnica** durante o desenvolvimento. Ele reúne arquitetura, modelo de dados, contratos de API, regras de negócio, infraestrutura, segurança, testes, ambientes e roadmap.

## Stack-base

- **Frontend:** Next.js + TypeScript
- **Backend:** NestJS + TypeScript
- **Banco:** PostgreSQL
- **ORM:** Prisma
- **Autenticação:** JWT de curta duração + refresh token rotacionado
- **Infra local:** Docker + Docker Compose
- **Proxy/TLS em produção:** Caddy ou Nginx
- **Observabilidade:** logs estruturados + métricas básicas + health checks
- **Testes:** unitários, integração e E2E

## Princípio arquitetural

O MVP deve começar como **monólito modular**: um backend único, dividido por domínios internos claros. Microserviços não fazem parte do MVP.

## Índice

### 00 - Geral
- [[00 - Geral/01 - Visao do Produto]]
- [[00 - Geral/02 - Glossario e Convencoes]]
- [[00 - Geral/03 - Decisoes Arquiteturais]]

### 01 - Arquitetura
- [[01 - Arquitetura/01 - Arquitetura Fullstack]]
- [[01 - Arquitetura/02 - Modulos e Fluxos]]

### 02 - Backend
- [[02 - Backend/01 - Backend e API]]
- [[02 - Backend/02 - Regras de Negocio Financeiras]]
- [[02 - Backend/03 - Autenticacao e Autorizacao]]

### 03 - Frontend
- [[03 - Frontend/01 - Frontend e UX]]

### 04 - Banco de Dados
- [[04 - Banco de Dados/01 - Modelo PostgreSQL]]
- [[04 - Banco de Dados/02 - Migrations Indices e Backup]]

### 05 - Infraestrutura
- [[05 - Infraestrutura/01 - Docker e Ambientes]]
- [[05 - Infraestrutura/02 - CI CD e Deploy]]

### 06 - Qualidade e Segurança
- [[06 - Qualidade e Seguranca/01 - Seguranca e LGPD]]
- [[06 - Qualidade e Seguranca/02 - Testes Observabilidade e Operacao]]

### 07 - Produto e Roadmap
- [[07 - Produto e Roadmap/01 - MVP e Roadmap]]

### Templates de implementação
- `Templates/docker-compose.example.yml`
- `Templates/.env.example`
- `Templates/schema-inicial.sql`
- `Templates/api-examples.http`

---

## Regra de manutenção

Quando uma decisão técnica mudar, atualize primeiro o documento correspondente e registre a alteração em [[00 - Geral/03 - Decisoes Arquiteturais]].
