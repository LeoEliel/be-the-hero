#!/bin/bash
# Fix Frontend Dependencies - Be The Hero

echo "🔧 Reparando dependências do Frontend..."
echo ""

cd /home/leoeliel/Documents/www/be-the-hero/frontend

# Step 1: Clean completely
echo "1️⃣  Limpando instalação anterior..."
rm -rf node_modules package-lock.json
npm cache clean --force
echo "✓ Limpeza completa"
echo ""

# Step 2: Install with legacy peer deps
echo "2️⃣  Instalando dependências (isso leva alguns minutos)..."
npm install --legacy-peer-deps --silent --no-audit --no-fund

# Check if successful
if [ -f "node_modules/.bin/react-scripts" ]; then
    echo "✓ Dependências instaladas com sucesso!"
    echo ""
    echo "3️⃣  Frontend está pronto!"
    echo ""
    echo "Para iniciar os servidores, execute:"
    echo "  cd /home/leoeliel/Documents/www/be-the-hero"
    echo "  chmod +x start.sh"
    echo "  ./start.sh"
else
    echo "✗ Instalação falhou. Verifique node_modules"
    exit 1
fi
