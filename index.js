const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

async function createUser() {
  const user = await prisma.user.create({
    data: {
      name: 'John Doe',
      email: 'john@example.com',
    },
  });
  console.log('Created user:', user);
}

async function getUsers() {
  const users = await prisma.user.findMany();
  console.log('All users:', users);
}

async function main() {
  try {
    await createUser();
    await getUsers();
  } catch (error) {
    console.error(error);
  } finally {
    await prisma.$disconnect();
  }
}

main();
