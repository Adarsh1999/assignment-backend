const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

// Model functions can be defined here, if needed

module.exports = {
  // Export the Prisma client instance for use in the controller
  prisma,
};
