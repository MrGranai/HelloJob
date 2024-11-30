/**
 * File: adminRoutes.js
 * Description: Routes for handling admin-related functionality.
 */

const express = require('express');
const { getAdminDashboard } = require('../controllers/adminController'); // Import the admin controller

const router = express.Router();

// Route to get admin dashboard
router.get('/dashboard', getAdminDashboard); // GET /api/admin/dashboard

module.exports = router; // Export the router
