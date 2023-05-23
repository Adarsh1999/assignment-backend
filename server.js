import express from 'express';
import bodyParser from 'body-parser';
import apiRoutes from './api/app.js';
import cors from 'cors';
const { PrismaClient } = require('@prisma/client');
const app = express();
const prisma = new PrismaClient();


// enable CORS
app.use(cors());

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }));

// mount the API routes at the /api path
app.use('/api', apiRoutes);



try {
    // Start server
    app.listen(3001, () => console.log('Server started'));
} catch (err) {
    // Handle errors
    console.log(err);
    res.status(500).send({ message: 'Internal server error' });
}
