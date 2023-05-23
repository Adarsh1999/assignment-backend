const express = require('express');
const userRoutes = require('./routes/userRoutes');

const app = express();

// Middleware to parse JSON bodies
app.use(express.json());

// Route for creating a new user
app.use('/users', userRoutes);

// Start the server
app.listen(3000, () => {
  console.log('Server is running on port 3000');
});
