import cors from 'cors';

import express from 'express';
import questionRoutes from './routes/questionRoutes.js';
import answerRoutes from './routes/answerRoutes.js';



const app = express();
app.use(cors());

// Middleware to parse JSON bodies
app.use(express.json());

// Route for creating a new question or save answer
app.use("/questions", questionRoutes);
app.use("/answer", answerRoutes);

// Start the server
try {
    // Start server
    app.listen(80, () => console.log('Server started at port 80'));
} catch (err) {
    // Handle errors
    console.log(err);
    res.status(500).send({ message: 'Internal server error' });
}
