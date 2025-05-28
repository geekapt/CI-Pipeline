// app.js
const http = require('http');

const PORT = process.env.PORT || 3000;

const server = http.createServer((req, res) => {
  res.end('Hello from GitHub CI/CD Demo Project!, with versioning');
});

server.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}/`);
});

