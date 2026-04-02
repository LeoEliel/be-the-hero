# Be The Hero

<div align="center">

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![Node.js](https://img.shields.io/badge/Node.js-v18.x-green)
![React](https://img.shields.io/badge/React-v17.0.2-blue)
![Express](https://img.shields.io/badge/Express-v4.19.0-black)

**Conectando ONGs a heróis que querem fazer a diferença** 🦸

</div>

---

## 📋 Sobre o Projeto

**Be The Hero** é uma aplicação full-stack desenvolvida inicialmente em 2020 como parte da **Semana Omnistack** da Rocketseat. O objetivo é aproximar **Organizações Não-Governamentais (ONGs)** de pessoas dispostas a ajudar, facilitando o contato direto entre elas.

> **Nota**: Este projeto foi modernizado em 2026 com atualizações de dependências, correções de breaking changes e melhorias na arquitetura.

### Funcionalidades Principais

- ✅ **Cadastro de ONGs** com informações de contato
- ✅ **Registro de Casos** (incidents) que precisam de auxílio
- ✅ **Autenticação** simples baseada em ID único
- ✅ **Listagem Paginada** de casos disponíveis
- ✅ **Interface Web Responsiva** para gerenciar casos
- ✅ **Exclusão de Casos** por ONGs autorizadas

---w

## 🛠️ Stack Tecnológico

### Backend

| Tecnologia | Versão | Propósito |
|-----------|--------|----------|
| **Node.js** | 18.x | Runtime JavaScript |
| **Express** | 4.19.0 | Framework HTTP |
| **Knex.js** | 3.1.0+ | Query Builder SQL |
| **SQLite3** | 5.1.6 | Banco de Dados |
| **CORS** | 2.8.5 | Controle de Origem |
| **Nodemon** | 3.0.1 | Auto-restart em desenvolvimento |

### Frontend

| Tecnologia | Versão | Propósito |
|-----------|--------|----------|
| **React** | 17.0.2 | Biblioteca UI |
| **React Router** | 6.8.2 | Roteamento |
| **Axios** | 1.4.0 | Cliente HTTP |
| **React Icons** | 4.10.1 | Ícones SVG |
| **react-scripts** | 5.0.1 | Tooling Create React App |

### Mobile (Documentação Placeholder)

- React Native com Expo (planejado para futuro)

---

## 📦 Pré-requisitos

Antes de começar, certifique-se de ter instalado:

- **Node.js** 18.x ou superior ([Download](https://nodejs.org/))
- **npm** 9.x ou superior (vem com Node.js)
- **Git** ([Download](https://git-scm.com/))

Verifique suas versões:

```bash
node --version      # v18.x.x
npm --version       # 9.x.x
git --version       # 2.x.x
```

---

## 🚀 Instalação e Execução

### 1️⃣ Clone o Repositório

```bash
git clone https://github.com/seu-usuario/be-the-hero.git
cd be-the-hero
```

### 2️⃣ Backend Setup

```bash
cd backend

# Instale as dependências
npm install

# Execute as migrations do banco de dados
npx knex migrate:latest

# Inicie o servidor (porta 3333)
npm start
```

O backend estará disponível em: `http://localhost:3333`

### 3️⃣ Frontend Setup

```bash
cd ../frontend

# Instale as dependências
npm install

# Inicie o servidor de desenvolvimento (porta 3000)
npm start
```

O frontend abrirá automaticamente em: `http://localhost:3000`

### 4️⃣ (Opcional) Mobile Setup

O setup do React Native/Expo será documentado em versões futuras.

---

## 📚 Endpoints da API

### Sessions
- **POST** `/sessions` - Autenticar ONG
  ```json
  {
    "id": "id_da_ong"
  }
  ```

### ONGs
- **GET** `/ongs` - Listar todas as ONGs
- **POST** `/ongs` - Registrar nova ONG
  ```json
  {
    "name": "Nome da ONG",
    "email": "email@ong.com",
    "whatsapp": "1199999999",
    "city": "São Paulo",
    "uf": "SP"
  }
  ```

### Profile
- **GET** `/profile` - Listar casos da ONG autenticada
  - Header: `Authorization: id_da_ong`

### Incidents
- **GET** `/incidents?page=1` - Listar casos com paginação
- **POST** `/incidents` - Registrar novo caso (requer autenticação)
  - Header: `Authorization: id_da_ong`
  ```json
  {
    "title": "Título do Caso",
    "description": "Descrição detalhada",
    "value": 1000.00
  }
  ```
- **DELETE** `/incidents/:id` - Deletar caso (apenas ONG proprietária)
  - Header: `Authorization: id_da_ong`

---

## 🔧 Scripts Disponíveis

### Backend

```bash
npm start       # Inicia servidor com auto-reload (nodemon)
npm test        # Executa testes (quando disponíveis)
```

### Frontend

```bash
npm start       # Inicia dev server
npm run build   # Cria build otimizado para produção
npm test        # Executa testes
npm run eject   # Expõe configurações (irreversível, use com cuidado)
```

---

## 🐛 Troubleshooting

### "Port 3000/3333 already in use"

**Solução**: Mude a porta ou encerre o processo existente

```bash
# Frontend em porta diferente
PORT=3001 npm start

# Backend em porta diferente (altere em backend/src/index.js)
# const PORT = 3334;
```

### "Module not found: Can't resolve 'react-router-dom'"

**Solução**: Reinstale as dependências

```bash
rm -rf node_modules package-lock.json
npm install
```

### SQLite database lock error

**Solução**: Remova o arquivo de banco de dados e execute as migrations novamente

```bash
cd backend
rm src/database/db.sqlite
npx knex migrate:latest
```

### "NODE_ENV is not recognized" (Windows)

**Solução**: Use `cross-env` ou configure via PowerShell

```bash
# Instale cross-env globalmente
npm install -g cross-env

# Use nos scripts
cross-env NODE_ENV=development nodemon src/index.js
```

---

## 📝 Atualizações de 2026

Este projeto foi modernizado com foco em:

✅ **Atualização de Dependências**
- React 16 → 17 (backward compatible)
- react-router-dom 5 → 6 (APIs atualizadas)
- Knex 0.20 → 3.1 (query builder modernizado)
- Express 4.17 → 4.19 (melhorias de segurança)

✅ **Refatoração de Código**
- Migração de `useHistory` → `useNavigate` (react-router v6)
- Atualização de `<Switch>` → `<Routes>` (react-router v6)
- Compatibilidade com SQLite3 v5.1

✅ **Documentação Melhorada**
- README.md completo com exemplos
- Troubleshooting integrado
- Badges de status

---

## 🤝 Como Contribuir

Contribuições são bem-vindas! Para contribuir:

1. **Faça um Fork** deste repositório
2. **Crie uma Branch** para sua feature (`git checkout -b feature/AmazingFeature`)
3. **Commit suas mudanças** (`git commit -m 'Add some AmazingFeature'`)
4. **Push para a Branch** (`git push origin feature/AmazingFeature`)
5. **Abra um Pull Request**

### Guidelines

- Mantenha a consistência de código
- Adicione testes para novas funcionalidades
- Atualize a documentação conforme necessário
- Respeite as convenções de commit

---

## 📄 Licença

Este projeto está licenciado sob a **MIT License** - veja o arquivo `LICENSE` para detalhes.

---

## 👏 Créditos

- **Conceito Original**: Semana Omnistack 2020 - [Rocketseat](https://rocketseat.com.br)
- **Modernização**: 2026

---

## 📞 Suporte

Se encontrar problemas ou tiver dúvidas:

- Abra uma [Issue](https://github.com/seu-usuario/be-the-hero/issues)
- Consulte a seção Troubleshooting acima
- Entre em contato via email (adicione quando disponível)

---

<div align="center">

**Made with ❤️ during Omnistack Week**

</div>
