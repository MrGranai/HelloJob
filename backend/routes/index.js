/**
 * File: routes/index.js
 * Description: Main router file that combines all specific route modules and logs access to each route.
 */

const express = require('express'); // Import Express framework
const logger = require('../config/logger'); // Import the centralized logger

// Import route files
const userRoutes = require('./userRoutes'); // Routes for users
const professionalRoutes = require('./professionalRoutes'); // Routes for professionals
const adminRoutes = require('./adminRoutes'); // Routes for administrators
const supportRoutes = require('./supportRoutes'); // Routes for support

const router = express.Router();

// Middleware to log each request that passes through this router
router.use((req, res, next) => {
    logger.info(`Incoming Request: ${req.method} ${req.originalUrl}`);
    next(); // Pass control to the next middleware or route handler
});

// Map routes to prefixes
router.use('/users', userRoutes); // Routes related to users
logger.info('User routes initialized at /api/users');

router.use('/professionals', professionalRoutes); // Routes related to professionals
logger.info('Professional routes initialized at /api/professionals');

router.use('/admin', adminRoutes); // Routes related to administrators
logger.info('Admin routes initialized at /api/admin');

router.use('/support', supportRoutes); // Routes related to support
logger.info('Support routes initialized at /api/support');

// Export the router to be used in the main app
module.exports = router;
