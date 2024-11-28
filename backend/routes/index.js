
const express = require('express');
const userRoutes = require('./userRoutes'); // Rotas relacionadas a usuários
const professionalRoutes = require('./professionalRoutes'); // Rotas relacionadas a profissionais

const router = express.Router();

// Configurar rotas principais
router.use('/users', userRoutes);
router.use('/professionals', professionalRoutes);

module.exports = router;
