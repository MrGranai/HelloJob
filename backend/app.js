
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const routes = require('./routes'); // Importa as rotas principais

const app = express();

// Configurar middlewares globais
app.use(cors());
app.use(bodyParser.json());

// Roteador principal
app.use('/api', routes);

// Exportar o app
module.exports = app;
