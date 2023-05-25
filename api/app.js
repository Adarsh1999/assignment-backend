import cors from 'cors';

import express from 'express';
import userRoutes from './routes/userRoutes.js';
import questionRoutes from './routes/questionRoutes.js';


const app = express();
app.use(cors());

// Middleware to parse JSON bodies
app.use(express.json());

// Route for creating a new user
app.use('/users', userRoutes);
app.use('/quesions', questionRoutes);

// Start the server
try {
    // Start server
    app.listen(3000, () => console.log('Server started at port 3000'));
} catch (err) {
    // Handle errors
    console.log(err);
    res.status(500).send({ message: 'Internal server error' });
}
