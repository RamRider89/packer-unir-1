echo "Verificando version de Node.js..."
node -v
echo "Verificando version de npm..."
npm -v

echo "Instalando pm2..."
npm install pm2@latest -g

echo "Creando un script de HTTP server..."
mkdir -p /app

echo "Copiando node file.."
cp /tmp/hello.js /app/hello.js

echo "Server node complete."