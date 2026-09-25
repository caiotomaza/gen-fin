# 03 - Autenticação e Autorização

## Modelo inicial

- e-mail + senha;
- senha armazenada com **Argon2id** ou bcrypt com custo adequado;
- access token curto;
- refresh token rotacionado;
- refresh token persistido como hash;
- logout revoga sessão.

## Entidades

### User
- id
- email
- passwordHash
- status
- createdAt
- updatedAt

### Session
- id
- userId
- refreshTokenHash
- userAgent
- ipHash opcional
- expiresAt
- revokedAt

## Autorização

O MVP possui apenas usuário comum.

A regra principal é **ownership**:

```text
resource.userId === authenticatedUser.id
```

Nunca aceitar `userId` do body como autoridade para recursos financeiros.

## Cookies ou Authorization header?

Para frontend web first-party, preferência por cookies `HttpOnly`, `Secure` e `SameSite` apropriado.

Se usar bearer token em memória:
- não persistir access token em localStorage;
- proteger refresh flow;
- implementar CSP.

## Reautenticação

Exigir reautenticação para:
- trocar senha;
- trocar e-mail;
- exportar pacote completo de dados;
- excluir conta;
- revogar todas as sessões.

## Rate limiting

Aplicar pelo menos em:
- login;
- forgot password;
- reset password;
- registro;
- refresh.

## MFA

Fora do MVP, mas arquitetura deve permitir TOTP ou passkeys no futuro.
