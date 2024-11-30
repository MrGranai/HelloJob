/**
 * File: supportRoutes.js
 * Description: Routes for handling support-related functionality.
 */

const express = require('express');
const { contactSupport } = require('../controllers/supportController'); // Import the support controller

const router = express.Router();

// Route to contact support
router.post('/contact', contactSupport); // POST /api/support/contact

module.exports = router; // Export the router
