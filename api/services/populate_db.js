import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

async function populateDatabase() {
    try {
      // Create a question
      const question = await prisma.question.create({
        data: {
          title: 'What is the capital of USA',
          description: 'something',
          modalsDescription: 'something',
        },
      });
  
      // Create a field
      const field = await prisma.field.create({
        data: {
          questionId: question.id,
          fieldTypeName: 'string',
          stringValue: 'new field value',
        },
      });

      const updatedQuestion = await prisma.question.update({
        where: { id: question.id },
        data: { fields: { connect: [{ id: field.id }] } },
        include: { fields: true }, // Include the updated fields
      });
      

      
  
      console.log('Database populated successfully!');
    } catch (error) {
      console.error('Error populating the database:', error);
    } finally {
      await prisma.$disconnect();
    }
  }
  
  populateDatabase();