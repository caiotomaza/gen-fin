# 01 - Docker e Ambientes

## Serviços

```text
web       → Next.js
api       → NestJS
postgres  → PostgreSQL
proxy     → Caddy/Nginx em produção
```

Redis não entra por padrão.

## Dockerfile

Usar multi-stage build.

Objetivos:
- imagem pequena;
- usuário não-root;
- build reprodutível;
- dependências de produção separadas.

## Desenvolvimento

```text
Docker Compose
  ├── postgres
  ├── api
  └── web
```

Pode-se executar frontend/backend no host e somente PostgreSQL no Docker para melhorar DX.

## Produção

Recomendações:
- não expor PostgreSQL à internet;
- rede interna do Compose;
- healthchecks;
- volumes nomeados;
- secrets fora do Git;
- proxy reverso com TLS;
- política de restart;
- logs com rotação.

## Ambientes

### Local
- dados descartáveis;
- seed;
- debug habilitado.

### Staging
- configuração semelhante à produção;
- dados fictícios;
- migrations testadas.

### Produção
- debug desligado;
- TLS;
- backup;
- observabilidade;
- secrets fortes;
- imagem imutável.

## Variáveis sensíveis

Nunca versionar:
- `DATABASE_URL` real;
- JWT secrets;
- credenciais SMTP;
- tokens de serviços.

Versionar apenas `.env.example`.

## Healthchecks

Backend:
```http
GET /health/live
GET /health/ready
```

`live`: processo está vivo.

`ready`: dependências essenciais estão disponíveis.

## Ordem de startup

Não confiar apenas em `depends_on` como garantia de prontidão. Usar healthcheck/retry no backend.
