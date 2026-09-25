# 02 - CI/CD e Deploy

## Pipeline mínimo de Pull Request

```text
checkout
→ instalar dependências
→ lint
→ typecheck
→ testes unitários
→ testes de integração
→ build web
→ build api
→ validar migrations
```

## Pipeline de produção

```text
merge em main
→ testes
→ build imagens Docker
→ scan básico de dependências/imagens
→ push para registry
→ backup pré-deploy
→ aplicar migrations
→ atualizar containers
→ healthcheck
→ smoke test
```

## Versionamento

Recomendação:
- SemVer quando houver releases explícitos;
- imagens Docker tagueadas por commit SHA;
- `latest` nunca deve ser a única referência operacional.

Exemplo:
```text
gsn-fin-api:git-a1b2c3d
gsn-fin-web:git-a1b2c3d
```

## Rollback

Aplicação:
- manter imagem anterior;
- rollback de container simples.

Banco:
- migrations devem preferir compatibilidade reversa;
- rollback destrutivo de schema é arriscado;
- em incidente grave, restaurar backup apenas com procedimento controlado.

## Deploy simples

Para fase inicial, uma VPS com:
- Docker Engine;
- Compose;
- Caddy;
- firewall;
- backup externo;
- monitoramento;

é suficiente para o produto.

Kubernetes não é requisito do MVP.
