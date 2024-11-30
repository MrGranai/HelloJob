const express = require('express');
const {
    loginUser,
    registerUser,
    getProfile,
    updateProfile,
    requestService,
    getServiceStatus
} = require('../controllers/userController');

const router = express.Router();

router.post('/login', loginUser);
router.post('/register', registerUser);
router.get('/profile', getProfile);
router.put('/profile', updateProfile);
router.post('/services/request', requestService);
router.get('/services/request/:id', getServiceStatus);

module.exports = router;
