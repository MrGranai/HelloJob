const jwt = require('jsonwebtoken');

// Controller for user login
exports.loginUser = (req, res) => {
    const { username, password } = req.body;
    if (!username || !password) {
        return res.status(400).json({ error: 'Username and password are required.' });
    }
    if (username === 'test' && password === 'password123') {
        const token = jwt.sign({ username }, process.env.JWT_SECRET, { expiresIn: '1h' });
        return res.json({ token });
    }
    res.status(401).json({ error: 'Invalid credentials.' });
};

// Controller for user registration
exports.registerUser = (req, res) => {
    const { username, email, password } = req.body;
    if (!username || !email || !password) {
        return res.status(400).json({ error: 'All fields are required.' });
    }
    const newUser = { id: Date.now(), username, email };
    res.status(201).json({ message: 'User registered successfully.', user: newUser });
};

// Controller for fetching user profile
exports.getProfile = (req, res) => {
    const userProfile = { id: 1, username: 'testUser', email: 'test@example.com' };
    res.json(userProfile);
};

// Controller for updating user profile
exports.updateProfile = (req, res) => {
    const { username, email } = req.body;
    if (!username || !email) {
        return res.status(400).json({ error: 'Username and email are required.' });
    }
    res.json({ message: 'Profile updated successfully.', updatedProfile: { username, email } });
};

// Controller for creating a service request
exports.requestService = (req, res) => {
    const { serviceId, details } = req.body;
    if (!serviceId || !details) {
        return res.status(400).json({ error: 'Service ID and details are required.' });
    }
    const request = { id: Date.now(), serviceId, details, status: 'Pending' };
    res.status(201).json({ message: 'Service request created.', request });
};

// Controller for fetching service request status
exports.getServiceStatus = (req, res) => {
    const { id } = req.params;
    const serviceStatus = { id, status: 'Pending' };
    res.json(serviceStatus);
};
