/**
 * File: config/logger.js
 * Description: Centralized logger configuration for the backend application.
 *              Logs messages to the console and files (error, debug, combined).
 */

const winston = require('winston'); // Library for managing logs
const path = require('path'); // Node.js library for handling file paths

// Create and configure the logger instance
const logger = winston.createLogger({
    // Set the logging level based on the environment
    // 'debug' for development (more details) and 'info' for production
    level: process.env.NODE_ENV === 'production' ? 'info' : 'debug',

    // Configure the format of the logs
    format: winston.format.combine(
        winston.format.timestamp(), // Adds timestamp to each log entry
        winston.format.printf(({ level, message, timestamp, ...meta }) => {
            // Custom log format
            const metaDetails = Object.keys(meta).length ? ` | Meta: ${JSON.stringify(meta)}` : '';
            return `${timestamp} [${level.toUpperCase()}]: ${message}${metaDetails}`;
        })
    ),

    // Define transports (log destinations)
    transports: [
        new winston.transports.Console(), // Logs to the console (useful for development)

        // Logs errors to a separate file
        new winston.transports.File({
            filename: path.join(__dirname, '../logs/error.log'),
            level: 'error', // Only 'error' level logs or higher
        }),

        // Logs debug information to a separate file
        new winston.transports.File({
            filename: path.join(__dirname, '../logs/debug.log'),
            level: 'debug', // Only 'debug' level logs or higher
        }),

        // Logs all messages to a combined file
        new winston.transports.File({
            filename: path.join(__dirname, '../logs/combined.log'),
        }),
    ],
});

// Export the logger for use in the application
module.exports = logger;
