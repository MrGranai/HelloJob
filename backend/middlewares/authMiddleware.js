/**
 * File: middlewares/authMiddleware.js
 * Description: Middleware for authenticating requests using JWT.
 * Purpose: Verify the token sent in the request header.
 */

const jwt = require('jsonwebtoken'); // Import JSON Web Token library

// Middleware function to authenticate JWT
function authenticateToken(req, res, next) {
    const authHeader = req.headers['authorization']; // Get token from 'Authorization' header
    const token = authHeader && authHeader.split(' ')[1]; // Extract token after 'Bearer'

    if (!token) {
        return res.status(401).json({ error: 'Access Denied. Token is required.' }); // Token missing
    }

    // Verify the token
    jwt.verify(token, process.env.JWT_SECRET, (err, user) => {
        if (err) {
            return res.status(403).json({ error: 'Invalid or expired token.' }); // Token invalid
        }
        req.user = user; // Attach user data to request object
        next(); // Pass control to the next middleware or route
    });
}

// Export the middleware for use in protected routes
module.exports = authenticateToken;
