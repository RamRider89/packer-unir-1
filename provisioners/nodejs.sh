#!/bin/bash
apt-get update -y
apt-get upgrade -y
apt-get install -y curl
echo "Adding Node.js 18 repository..."
curl -sL https://deb.nodesource.com/setup_18.x | bash -
echo "Instalando Node.js 18..."
apt-get install -y nodejs=18*
echo "Verificando Node.js version..."
node -v

echo "Actualizando npm..."
echo "Instalando pm2..."
npm install pm2@latest -g

#pm2 startup systemd
#pm2 save