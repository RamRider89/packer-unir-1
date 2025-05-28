echo "Verifying Node.js version..."
node -v

echo "Creating simple HTTP server script..."
mkdir -p /app
cat <<EOF > /app/server.js
const http = require('http');

const hostname = '0.0.0.0';
const port = 3000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Hello from Node.js on Packer!');
});

server.listen(port, hostname, () => {
  console.log(\`Server running at http://\${hostname}:\${port}/\`);
});
EOF

echo "Provisioning complete."