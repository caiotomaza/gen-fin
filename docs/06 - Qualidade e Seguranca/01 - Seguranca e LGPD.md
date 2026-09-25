# 01 - Segurança e LGPD

## Classificação dos dados

O sistema armazena dados financeiros pessoais. Mesmo quando não são dados pessoais sensíveis na definição legal estrita, possuem alta criticidade para o usuário.

## Princípios

- minimização de dados;
- menor privilégio;
- defesa em profundidade;
- criptografia em trânsito;
- logs sem conteúdo financeiro desnecessário;
- exclusão controlada;
- transparência.

## Controles técnicos

### Transporte
- HTTPS obrigatório em produção;
- HSTS após domínio estabilizado.

### Senhas
- Argon2id preferencial;
- nunca armazenar senha reversível;
- política contra senhas obviamente comprometidas quando possível.

### Banco
- PostgreSQL não exposto externamente;
- usuário da aplicação sem privilégios administrativos;
- backup criptografado;
- credenciais rotacionáveis.

### Aplicação
- validação server-side;
- queries parametrizadas via ORM;
- rate limiting;
- CORS restritivo;
- CSRF quando autenticação baseada em cookie exigir;
- CSP;
- headers de segurança;
- proteção contra IDOR via ownership.

## LGPD — capacidades de produto

O usuário deve conseguir:
- acessar seus dados;
- corrigir cadastro;
- exportar dados relevantes;
- solicitar exclusão;
- entender finalidade do tratamento.

## Privacy by design

Não coletar:
- CPF, endereço, documentos ou localização precisa se o produto não precisar deles.

## Auditoria

Registrar eventos como:
- login bem-sucedido/falho em nível controlado;
- alteração de senha;
- alteração de e-mail;
- exportação;
- exclusão;
- revogação de sessões.

Não colocar em log:
- senha;
- JWT completo;
- refresh token;
- connection string;
- valores financeiros completos sem necessidade.

## Ameaças principais

| Ameaça | Controle |
|---|---|
| Credential stuffing | rate limit + MFA futuro |
| IDOR | ownership server-side |
| SQL injection | ORM + validação + queries parametrizadas |
| XSS | escaping + CSP |
| Vazamento de segredo | secret management + scan |
| Perda de banco | backup + restore testado |
| Sessão roubada | cookies seguros/rotação/revogação |
