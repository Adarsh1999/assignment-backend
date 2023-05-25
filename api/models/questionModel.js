import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

export async function getAllQuestions() {
  return prisma.question.findMany();
}
