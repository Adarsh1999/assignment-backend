import express from 'express';
import { createUser } from '../controllers/userController.js';

const router = express.Router();

// Route for creating a new user
router.post('/create', createUser);

export default router;
