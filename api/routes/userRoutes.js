const express = require('express');
const { createUser } = require('../controllers/userController');

const router = express.Router();

// Route for creating a new user
router.post('/', createUser);

module.exports = router;
