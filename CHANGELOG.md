# Changelog - Be The Hero

Todas as mudanças significativas neste projeto serão documentadas neste arquivo.

O formato é baseado em [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
e este projeto segue [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [2.0.0] - 2026-04-02

### 🎉 Modernização Completa - Atualização de Dependências

#### ✨ Adicionado

- ✅ **README.md Melhorado**: Documentação completa com badges, setup guide, endpoints, troubleshooting
- ✅ **MOBILE_SETUP.md**: Guia completo para setup futuro do React Native + Expo
- ✅ **CHANGELOG.md**: Este arquivo para rastrear mudanças
- ✅ **.gitignore Atualizado**: Configuração moderna para Node.js, React e React Native

#### 🔄 Alterado

##### Backend
- `express`: **4.17.1** → **4.19.0** *(minor update, backward compatible)*
- `knex`: **0.20.13** → **3.1.0** *(major update, breaking changes tratado)*
- `sqlite3`: **4.1.1** → **5.1.6** *(minor update)*
- `cors`: **2.8.5** → **2.8.5** *(sem mudanças)*
- `nodemon`: **2.0.2** → **3.0.1** *(dev dependency)*

##### Frontend
- `react`: **16.13.1** → **17.0.2** *(major update)*
- `react-dom`: **16.13.1** → **17.0.2** *(major update)*
- `react-router-dom`: **5.1.2** → **6.8.2** *(major update, breaking changes tratado)*
- `react-scripts`: **3.4.1** → **5.0.1** *(major update)*
- `axios`: **0.19.2** → **1.4.0** *(minor update)*
- `react-icons`: **3.9.0** → **4.10.1** *(minor update)*
- Testing Libraries:
  - `@testing-library/react`: **9.5.0** → **13.4.0**
  - `@testing-library/jest-dom`: **4.2.4** → **5.16.5**
  - `@testing-library/user-event`: **7.2.1** → **13.5.0**

#### 🔧 Corrigido

##### Backend - Code Changes
- **IncidentController.js**: Ajustado `.count()` para compatibilidade com Knex 3.x
  - `await connection('incidents').count()` → `await connection('incidents').count('* as cnt').first()`
  - `count['count(*)']` → `count.cnt`

##### Frontend - Code Changes
- **src/routes.js**: Migração de react-router-dom v5 → v6
  - Removido `<Switch>` e substituído por `<Routes>`
  - Atualizado `<Route component={} />` para `<Route element={<Component />} />`
  - Removido atributo `exact` (não necessário em v6)
  - Função renomeada: `Routes` → `AppRoutes` (para evitar conflito com `<Routes>`)

- **src/pages/Logon/index.js**: Migração de useHistory → useNavigate
  - `const history = useHistory()` → `const navigate = useNavigate()`
  - `history.push('/path')` → `navigate('/path')`

- **src/pages/Register/index.js**: Migração de useHistory → useNavigate
  - Mesmo padrão acima

- **src/pages/NewIncident/index.js**: Migração de useHistory → useNavigate
  - Mesmo padrão acima

- **src/pages/Profile/index.js**: Migração de useHistory → useNavigate
  - `const history = useHistory()` → `const navigate = useNavigate()`
  - `history.push('/')` → `navigate('/')`

#### ⚠️ Breaking Changes Tratados

1. **Knex 0.20 → 3.1**
   - `.count()` API mudou
   - Solução: Usar `.count('* as cnt').first()` para consistência

2. **React 16 → 17**
   - JSX transform (sem import React necessário, mas mantido para compatibilidade)
   - Hooks agora totalmente suportados
   - Components já usavam hooks, sem alterações necessárias

3. **react-router-dom 5 → 6**
   - `<Switch>` removido e substituído por `<Routes>`
   - Props de `<Route>` mudaram: `component` → `element`
   - `useHistory` removido e substituído por `useNavigate`
   - Rotas são exatas por padrão, `exact` não é necessário

#### 📚 Documentação

- README.md reescrito com:
  - Badges de versão e status
  - Tabelas de stack tecnológico
  - Instruções de setup passo-a-passo
  - Documentação de endpoints da API
  - Troubleshooting integrado
  - Seção de contribuição

- MOBILE_SETUP.md criado com:
  - Guia completo de setup React Native + Expo
  - Estrutura de pastas recomendada
  - Exemplos de código base
  - Telas recomendadas
  - Build para produção

#### 🧪 Testes

- Estrutura de testes atualizada (versões modernas)
- Recomendações de testes implementadas em MOBILE_SETUP.md
- *(Testes funcionais ainda em desenvolvimento)*

---

## [1.0.0] - 2020-03-29

### 🎉 Release Inicial - Omnistack 2020

#### ✨ Adicionado

- Setup inicial do projeto
- Backend com Express, Knex e SQLite3
- Frontend com React e React Router v5
- Estrutura de pastas
- Migrations de banco de dados
- Controllers para ONGs, Incidents, Profile, Sessions
- Páginas: Logon, Register, Profile, NewIncident

---

## Guia de Migração para Usuários

### Se você está atualizando de v1.0.0 → v2.0.0

**Backend:**
```bash
cd backend
rm -rf node_modules package-lock.json
npm install
npx knex migrate:latest
npm start
```

**Frontend:**
```bash
cd frontend
rm -rf node_modules package-lock.json
npm install
npm start
```

> ⚠️ **Importante**: Todas as páginas foram atualizadas. Se você tiver features personalizadas, verifique os arquivos em `frontend/src/pages/` para possíveis conflitos.

---

## Próximas Versões Planejadas

### v2.1.0 (Roadmap)
- [ ] Implementação completa de React Native + Expo (mobile/)
- [ ] Testes unitários e de integração
- [ ] CI/CD pipeline (GitHub Actions)
- [ ] Autenticação melhorada (JWT)
- [ ] Validação de formulários avançada

### v3.0.0 (Futuro)
- [ ] TypeScript integration
- [ ] PostgreSQL support
- [ ] Sistema de permissões mais robusto
- [ ] Dashboard de administrador
- [ ] Notificações em tempo real (WebSockets)

---

## Contribuindo

Para contribuir com melhorias, abra um [Pull Request](https://github.com/seu-usuario/be-the-hero/pulls).

---

## Licença

MIT License - veja [LICENSE](LICENSE) para detalhes.
