
const express = require('express');
const { listUsers, createUser } = require('../controllers/userController');

const router = express.Router();

// Rota para listar usuários
router.get('/', listUsers);

// Rota para criar um novo usuário
router.post('/', createUser);

module.exports = router;
