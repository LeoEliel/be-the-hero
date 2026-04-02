# 📱 Mobile Setup Guide - Be The Hero

Este guia documenta como configurar o aplicativo mobile **Be The Hero** usando React Native e Expo.

> **Status**: Documentação preparada para futuro desenvolvimento. A pasta `mobile/` está vazia e pronta para implementação.

---

## 📋 Pré-requisitos

Antes de começar, certifique-se de ter:

- **Node.js** 18.x ou superior
- **npm** 9.x ou superior
- **Expo CLI** (será instalado durante setup)
- **Smartphone com Expo Go** ([iOS](https://apps.apple.com/app/expo-go/id982107779) | [Android](https://play.google.com/store/apps/details?id=host.exp.exponent))

---

## 🚀 Instalação

### 1️⃣ Instale Expo CLI Globalmente

```bash
npm install -g expo-cli
```

### 2️⃣ Crie um Novo Projeto React Native com Expo

```bash
# Navegue para a pasta mobile
cd mobile

# Inicialize um novo projeto Expo
expo init . --template
# Ou use Bare Workflow
npx create-expo-app .
```

### 3️⃣ Instale Dependências do Projeto

```bash
cd mobile

# Instale as dependências principais
npm install

# Instale dependências comuns para Be The Hero
npm install \
  axios \
  @react-navigation/native @react-navigation/bottom-tabs \
  react-native-screens react-native-safe-area-context \
  react-native-gesture-handler \
  react-native-vector-icons \
  expo-constants \
  expo-app-loading \
  expo-font
```

---

## 📱 Estrutura Recomendada do Projeto

```
mobile/
├── app.json                # Configuração do Expo
├── App.js                  # Componente raiz
├── package.json
├── src/
│   ├── screens/           # Telas da aplicação
│   │   ├── LoginScreen.js
│   │   ├── RegisterScreen.js
│   │   ├── ProfileScreen.js
│   │   └── IncidentsScreen.js
│   ├── components/        # Componentes reutilizáveis
│   │   ├── Header.js
│   │   ├── IncidentCard.js
│   │   └── ...
│   ├── services/          # Serviços (API, storage)
│   │   ├── api.js
│   │   └── auth.js
│   ├── navigation/        # Configuração de navegação
│   │   └── RootNavigator.js
│   ├── styles/            # Temas e estilos globais
│   │   └── theme.js
│   └── utils/             # Utilitários
│       └── constants.js
└── assets/                # Imagens, fontes, etc
```

---

## 🔑 Configuração Inicial

### Arquivo: `app.json`

```json
{
  "expo": {
    "name": "Be The Hero",
    "slug": "be-the-hero",
    "version": "1.0.0",
    "assetBundlePatterns": [
      "**/*"
    ],
    "ios": {
      "supportsTabletMode": true
    },
    "android": {
      "adaptiveIcon": {
        "foregroundImage": "./assets/adaptive-icon.png",
        "backgroundColor": "#FFFFFF"
      },
      "package": "com.bethehero.app"
    },
    "web": {
      "favicon": "./assets/favicon.png"
    }
  }
}
```

### Arquivo: `src/services/api.js`

```javascript
import axios from 'axios';

const API_URL = process.env.EXPO_PUBLIC_API_URL || 'http://localhost:3333';

const api = axios.create({
  baseURL: API_URL,
  timeout: 10000,
});

export default api;
```

### Arquivo: `src/services/auth.js`

```javascript
import AsyncStorage from '@react-native-async-storage/async-storage';

const STORAGE_KEYS = {
  ONG_ID: '@bethehero:ong_id',
  ONG_NAME: '@bethehero:ong_name',
};

export const authService = {
  async setOngInfo(id, name) {
    await AsyncStorage.multiSet([
      [STORAGE_KEYS.ONG_ID, id],
      [STORAGE_KEYS.ONG_NAME, name],
    ]);
  },

  async getOngId() {
    return await AsyncStorage.getItem(STORAGE_KEYS.ONG_ID);
  },

  async getOngName() {
    return await AsyncStorage.getItem(STORAGE_KEYS.ONG_NAME);
  },

  async logout() {
    await AsyncStorage.multiRemove([
      STORAGE_KEYS.ONG_ID,
      STORAGE_KEYS.ONG_NAME,
    ]);
  },

  async isAuthenticated() {
    const ongId = await this.getOngId();
    return !!ongId;
  },
};
```

---

## 🎨 Tema e Estilos

### Arquivo: `src/styles/theme.js`

```javascript
export const theme = {
  colors: {
    primary: '#e02041',
    secondary: '#f5f5f5',
    dark: '#13131d',
    lightGray: '#a8a8b3',
    white: '#ffffff',
    success: '#2ecc71',
    error: '#e74c3c',
  },
  
  spacing: {
    xs: 4,
    sm: 8,
    md: 16,
    lg: 24,
    xl: 32,
  },
  
  fontSize: {
    xs: 12,
    sm: 14,
    md: 16,
    lg: 18,
    xl: 24,
  },
};
```

---

## 🚀 Iniciando o Desenvolvimento

### Iniciar Expo Developer Tools

```bash
cd mobile
npm start
# ou
expo start
```

### Abrir no Simulador/Emulador

```bash
# iOS (macOS apenas)
i

# Android
a

# Web
w
```

### Abrir no Smartphone

1. Abra o **Expo Go** em seu smartphone
2. Escanear o QR Code exibido no terminal
3. O aplicativo carregará em alguns segundos

---

## 📱 Telas Recomendadas

### 1. **Login Screen**
- Campo de entrada para ID da ONG
- Botão de autenticação
- Link para "Não tenho cadastro"

### 2. **Register Screen**
- Formulário com campos: nome, email, whatsapp, cidade, UF
- Validação de formulário
- Exibição do ID gerado após registro

### 3. **Profile Screen** (Dashboard)
- Lista de casos cadastrados pela ONG
- Botão para cadastrar novo caso
- Botão de logout
- Pull-to-refresh

### 4. **Incidents Screen**
- Lista de todos os casos disponíveis
- Paginação ou infinite scroll
- Card com detalhes do caso (título, descrição, valor)
- Link para contato (WhatsApp)

### 5. **New Incident Screen**
- Formulário para cadastrar novo caso
- Campos: título, descrição, valor
- Validação e feedback de erro

---

## 🔒 Autenticação

```javascript
// Exemplo de fluxo de autenticação
import api from '../services/api';
import { authService } from '../services/auth';

async function handleLogin(ongId) {
  try {
    const response = await api.post('sessions', { id: ongId });
    await authService.setOngInfo(ongId, response.data.name);
    // Navegar para Profile
  } catch (error) {
    console.error('Login failed:', error);
  }
}
```

---

## 🌐 Conectar ao Backend

Certifique-se de que:

1. ✅ Backend está rodando em `http://localhost:3333` (ou sua URL)
2. ✅ CORS está habilitado no backend
3. ✅ URL da API está configurada corretamente em `src/services/api.js`

### Para testar localmente

Se executar no emulador/simulador do mesmo PC do backend:

```javascript
// Usar IP da máquina local (exemplo: 192.168.1.100)
const API_URL = 'http://192.168.1.100:3333';
```

---

## 📦 Build para Produção

### Gerar APK (Android)

```bash
cd mobile
eas build --platform android --local
```

### Gerar IPA (iOS)

```bash
cd mobile
eas build --platform ios --local
```

> Requer conta Expo e Apple Developer Account configurados.

---

## 🧪 Testes

```bash
# Instale dependências de teste
npm install --save-dev jest @testing-library/react-native

# Execute testes
npm test
```

---

## 🐛 Troubleshooting

### "Reload Error: Network request failed"

**Solução**: Configure a URL da API corretamente para seu ambiente local

```javascript
// src/services/api.js
const API_URL = process.env.EXPO_PUBLIC_API_URL || 'http://<seu-ip>:3333';
```

### "Module not found: AsyncStorage"

**Solução**: Instale o pacote

```bash
npm install @react-native-async-storage/async-storage
```

### "Connection refused" ao conectar no backend local

**Solução**: Verifique que o backend está rodando e use o IP correto:

```bash
# Terminal (backend)
cd backend && npm start

# Get seu IP local
ipconfig getifaddr en0  # macOS/Linux
ipconfig                 # Windows
```

---

## 📚 Recursos Úteis

- [React Native Docs](https://reactnative.dev/)
- [Expo Documentation](https://docs.expo.dev/)
- [React Navigation](https://reactnavigation.org/)
- [@react-native-async-storage/async-storage](https://react-native-async-storage.github.io/async-storage/)

---

## ✅ Próximos Passos

1. ✅ Criar estrutura de pastas
2. ✅ Configurar navegação
3. ✅ Implementar telas
4. ✅ Conectar ao backend
5. ✅ Adicionar autenticação
6. ✅ Publicar na App Store/Google Play

---

## 📝 Notas Finais

- Este é um `guide template` para começar o desenvolvimento mobile
- Adapte conforme necessário para o design/UX desejado
- Mantenha a consistência com o web version quando possível
- Adicione testes e CI/CD conforme o projeto crescer

---

<div align="center">

**Need Help?** Open an issue or check the main [README.md](README.md)

</div>
