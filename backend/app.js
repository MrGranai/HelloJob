/**
 * File: app.js
 * Description: Main application configuration, middleware, and route handling.
 */

const express = require('express'); // Express framework
const cors = require('cors'); // Middleware for handling CORS
const routes = require('./routes'); // Import the main router file
const logger = require('./config/logger'); // Import the centralized logger

const app = express();

// Middleware setup
app.use(cors()); // Enable cross-origin requests
app.use(express.json()); // Parse incoming JSON requests

// Log incoming requests
app.use((req, res, next) => {
    logger.info(`Incoming Request: ${req.method} ${req.url}`);
    next();
});

// Connect routes
app.use('/api', routes); // Use routes with the '/api' prefix

// Handle 404 errors for undefined routes
app.use((req, res) => {
    logger.warn(`404 Not Found: ${req.method} ${req.url}`);
    res.status(404).json({ error: 'Not Found' });
});

// Global error-handling middleware
app.use((err, req, res, next) => {
    logger.error(`Server Error: ${err.message}`, { stack: err.stack });
    res.status(500).json({ error: 'Internal Server Error' });
});

module.exports = app; // Export the app for use in server.js
