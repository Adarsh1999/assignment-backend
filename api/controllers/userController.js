const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

async function createUser(req, res) {
  try {
    const { name, email } = req.body;

    const user = await prisma.user.create({
      data: {
        name,
        email,
      },
    });

    res.json(user);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Failed to create user' });
  }
}

module.exports = {
  createUser,
};
