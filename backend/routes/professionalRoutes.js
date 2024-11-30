/**
 * File: professionalRoutes.js
 * Description: Routes for handling professional-related functionality.
 */

const express = require('express');
const { getProfessionals } = require('../controllers/professionalController'); // Import the professional controller

const router = express.Router();

// Route to list professionals
router.get('/', getProfessionals); // GET /api/professionals

module.exports = router; // Export the router
