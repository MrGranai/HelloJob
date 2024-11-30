/**
 * File: server.js
 * Description: Entry point of the backend application. Initializes the server,
 *              loads environment variables, and delegates app configuration to app.js.
 */

const dotenv = require('dotenv'); // Loads environment variables
const app = require('./app'); // Import the app configuration
const logger = require('./config/logger'); // Import the centralized logger

// Initialize dotenv to access .env variables
dotenv.config();

// Define the port from the environment or use a default value
const PORT = process.env.PORT || 3000;

// Log environment details
logger.info('Environment Variables Loaded:', {
    PORT: process.env.PORT,
    NODE_ENV: process.env.NODE_ENV,
});

// Start the server and handle any startup errors
try {
    app.listen(PORT, () => {
        logger.info(`✅ Server is running on port ${PORT}`);
    });
} catch (error) {
    logger.error(`❌ Failed to start the server: ${error.message}`, { error });
    process.exit(1); // Exit on a critical error
}

// Gracefully handle termination signals (e.g., Ctrl+C)
process.on('SIGINT', () => {
    logger.warn('❗ SIGINT received. Shutting down gracefully...');
    process.exit(0);
});

process.on('SIGTERM', () => {
    logger.warn('❗ SIGTERM received. Shutting down gracefully...');
    process.exit(0);
});
