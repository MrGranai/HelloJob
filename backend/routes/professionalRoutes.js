
const express = require('express');
const { listProfessionals } = require('../controllers/professionalController');

const router = express.Router();

// Rota para listar profissionais
router.get('/', listProfessionals);

module.exports = router;
