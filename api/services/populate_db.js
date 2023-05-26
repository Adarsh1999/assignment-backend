import { PrismaClient } from '@prisma/client';
import fs from 'fs';
import path from 'path';
import dotenv from 'dotenv';
import { fileURLToPath } from 'url';


dotenv.config();

const prisma = new PrismaClient();

async function populateDatabase() {
  try {
    // Read the questions data from the JSON file
    const currentFilePath = fileURLToPath(import.meta.url);
    const currentDirPath = path.dirname(currentFilePath);
    const questionsData = fs.readFileSync(path.join(currentDirPath, '../../questions.json'), 'utf-8');
    const questions = JSON.parse(questionsData);

    // Create the questions in the database
    for (const questionData of questions) {
      const output = await prisma.field.findMany({
        where: {
          type: {
            in: questionData['fields'],
          },
        },
      });
      console.log(output)
      const fieldIds = output.map((field) => field.id); // Extract the IDs of the fields from the output

      // Create the question and fields using Prisma client
      const createdQuestion = await prisma.question.create({
        data: {
          ...questionData,
          modals: questionData.modals && questionData.modals.description ? questionData.modals.description : null, // Assigning modals['description'] value to modals field, or null if it doesn't exist
      
          fields: {
            connect: fieldIds.map((fieldId) => ({ id: fieldId })),
          },
      
          options: questionData.options ? questionData.options : [],
        },
      });
      
      console.log(`Created question with ID ${createdQuestion.id}`);
    }

    console.log('Database population completed successfully.');
  } catch (error) {
    console.error('Error populating the database:', error);
  } finally {
    await prisma.$disconnect();
  }
}

// Run the population script
populateDatabase();
