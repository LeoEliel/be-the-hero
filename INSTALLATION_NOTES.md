# 🚀 Instruções Pós-Modernização - Próximas Etapas

Este arquivo contém as instruções para testar e validar que todo o projeto foi modernizado corretamente.

## ✅ O que foi feito

### Dependências Atualizadas ✓

**Backend:**
- ✅ Express: 4.17.1 → 4.19.0
- ✅ Knex: 0.20.13 → 3.1.0 (com correções de breaking changes)
- ✅ SQLite3: 4.1.1 → 5.1.6
- ✅ Nodemon: 2.0.2 → 3.0.1

**Frontend:**
- ✅ React: 16.13.1 → 17.0.2
- ✅ React Router: 5.1.2 → 6.8.2 (com migrações completas)
- ✅ React Scripts: 3.4.1 → 5.0.1
- ✅ Axios: 0.19.2 → 1.4.0
- ✅ Testing Libraries: Todas atualizadas
- ✅ React Icons: 3.9.0 → 4.10.1

### Código Refatorado ✓

**Backend:**
- ✅ IncidentController.js: `.count()` ajustado para Knex 3.x

**Frontend:**
- ✅ routes.js: Migrado de `<Switch>` para `<Routes>` (react-router v6)
- ✅ Logon/index.js: `useHistory` → `useNavigate`
- ✅ Register/index.js: `useHistory` → `useNavigate`
- ✅ NewIncident/index.js: `useHistory` → `useNavigate`
- ✅ Profile/index.js: `useHistory` → `useNavigate`

### Documentação Criada ✓

- ✅ **README.md**: Reescrito com documentação completa, exemplos, troubleshooting
- ✅ **MOBILE_SETUP.md**: Guia para setup futuro de React Native + Expo
- ✅ **CHANGELOG.md**: Histórico detalhado de todas as mudanças
- ✅ **.gitignore**: Atualizado para Node.js, React e React Native
- ✅ **INSTALLATION_NOTES.md**: Este arquivo

---

## 📋 Próximas Etapas (Pós Node.js Installation)

### 1️⃣ Instale Node.js

Você precisa instalar Node.js 18.x ou superior. Execute um destes comandos:

**Fedora (com sudo):**
```bash
sudo dnf install -y nodejs npm
```

**nvm (sem sudo):**
```bash
curl -s https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
source ~/.bashrc
nvm install 18
```

**Verifique a instalação:**
```bash
node --version      # Deve ser v18.x.x
npm --version       # Deve ser 9.x.x
```

---

### 2️⃣ Backend - Instalação e Teste

```bash
cd backend

# Instale as dependências
npm install

# Execute as migrations do banco de dados
npx knex migrate:latest

# Inicie o servidor
npm start
```

**Esperado:**
- Servidor iniciando na porta 3333
- Sem erros de módulos não encontrados
- Mensagem algo como: "Server running on port 3333"

**Teste manual (em outro terminal):**
```bash
curl http://localhost:3333/ongs
# Deve retornar um array JSON (vazio ou com ONGs)
```

---

### 3️⃣ Frontend - Instalação e Teste

```bash
cd ../frontend

# Instale as dependências
npm install

# Inicie o dev server
npm start
```

**Esperado:**
- Dev server inicia sem erros críticos
- Browser abre automaticamente em http://localhost:3000
- Você vê a página de Login

**Teste manual:**
1. Navegue até http://localhost:3000/
2. Veja a página "Faça seu Logon"
3. Clique em "Não tenho cadastro"
4. Veja a página "Cadastro"
5. Navegue de volta (browser back button)
6. Tente fazer login com um ID qualquer
   - Deve aparecer erro "No ONG found with this ID" (esperado)
   - Isso prova que a API está sendo chamada corretamente

---

### 4️⃣ Testar Fluxo Completo (Opcional)

Se tudo estiver funcionando, teste o fluxo completo:

**Terminal 1 - Backend:**
```bash
cd backend
npm start
```

**Terminal 2 - Frontend:**
```bash
cd frontend
npm start
```

**Em seu browser:**
1. Acesse http://localhost:3000
2. Clique em "Não tenho cadastro"
3. Preencha o formulário de registro:
   - Nome: "Test ONG"
   - Email: "test@ong.com"
   - WhatsApp: "11999999999"
   - Cidade: "São Paulo"
   - UF: "SP"
4. Clique em "Cadastrar"
5. Copie o ID gerado
6. Faça login com esse ID
7. Será redirecionado para Profile (pode estar vazio, esperado)

**Se tudo funcionar, a modernização foi bem-sucedida! ✅**

---

## 🧪 Verificação de Compatibilidade

### Backend
```bash
cd backend
npm list | grep -E "(express|knex|sqlite3|nodemon)"
# Deve mostrar:
# express@4.19.0
# knex@3.x.x
# sqlite3@5.1.6
# nodemon@3.0.1 (devDep)
```

### Frontend
```bash
cd frontend
npm list | grep -E "(react|react-dom|react-router-dom|react-scripts|axios)"
# Deve mostrar:
# react@17.0.2
# react-dom@17.0.2
# react-router-dom@6.8.2
# react-scripts@5.0.1
# axios@1.4.0
```

---

## ⚠️ Possíveis Problemas e Soluções

### "Port 3000/3333 already in use"

```bash
# Encontre o processo
lsof -i :3000
lsof -i :3333

# Encerre-o (substituindo <PID> pelo valor)
kill <PID>

# Ou use porta diferente
PORT=3001 npm start  # Frontend
```

### "Module not found" ou dependências soltas

```bash
# Limpe cache e reinstale
rm -rf node_modules package-lock.json
npm install
```

### SQLite database lock error

```bash
cd backend
rm -f src/database/db.sqlite*
npx knex migrate:latest
npm start
```

### React Router errors na página

- Confirme que todos os imports foram migrados (useNavigate, Routes, etc)
- Limpe browser cache: Ctrl+Shift+Delete
- Reinicie o dev server

### Backend API não responde

1. Verifique que backend está rodando na porta 3333
2. Confirme URL da API em `frontend/src/services/api.js`
3. Verifique CORS está habilitado (deve estar no backend)

---

## 📚 Documentação de Referência

- **[README.md](README.md)** - Documentação geral do projeto
- **[CHANGELOG.md](CHANGELOG.md)** - Histórico de mudanças detalhado
- **[MOBILE_SETUP.md](MOBILE_SETUP.md)** - Guia para setup mobile futuro
- **[backend/package.json](backend/package.json)** - Dependências backend
- **[frontend/package.json](frontend/package.json)** - Dependências frontend

---

## 🎯 Checklist de Validação Final

- [ ] Node.js 18.x instalado
- [ ] `npm install` passou sem erros em backend
- [ ] `npx knex migrate:latest` passou sem erros
- [ ] `npm start` no backend inicia servidor na porta 3333
- [ ] `npm install` passou sem erros em frontend
- [ ] `npm start` no frontend inicia dev server na porta 3000
- [ ] Página de login carrega no browser
- [ ] Navegação entre páginas funciona (Logon → Register → Logon)
- [ ] Registered uma ONG com sucesso
- [ ] Fizemos login com o ID da ONG
- [ ] Backend e frontend se comunicam corretamente

Se tudo estiver marcado ✅, a modernização foi **100% bem-sucedida**!

---

## 🚀 Próximas Etapas (Futuro)

1. **Setup Mobile:** Siga [MOBILE_SETUP.md](MOBILE_SETUP.md) para configurar React Native + Expo
2. **Testes:** Adicione testes unitários e de integração
3. **TypeScript:** (Opcional) Migre para TypeScript para type safety
4. **CI/CD:** Configure GitHub Actions para build/deploy automático
5. **Autenticação JWT:** Melhore segurança com JWT tokens

---

## 📞 Suporte

Se algo não funcionar:

1. Consulte o [README.md](README.md) - seção Troubleshooting
2. Verifique o [CHANGELOG.md](CHANGELOG.md) para mudanças específicas
3. Verifique logs no terminal para mensagens de erro detalhadas
4. Abra uma issue no repositório com:
   - Seu comando (ex: `npm install`, `npm start`)
   - Mensagem de erro completa
   - Sua versão de Node/npm (`node --version`, `npm --version`)

---

<div align="center">

**Parabéns pela modernização! 🎉**

O projeto está atualizado e pronto para desenvolvimento contínuo.

</div>
