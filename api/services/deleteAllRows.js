import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();

async function deleteAllRows() {
    try {
      // Delete all rows from each table using Prisma's query builder methods
      await prisma.answer.deleteMany();
      await prisma.field.deleteMany();
      await prisma.optionQuestionLink.deleteMany();
      await prisma.option.deleteMany();
      await prisma.question.deleteMany();
      await prisma.user.deleteMany();
  
      console.log('All rows deleted successfully!');
    } catch (error) {
      console.error('Error deleting all rows:', error);
    } finally {
      await prisma.$disconnect();
    }
  }
  
  deleteAllRows();