import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

const getQuestions = async (req, res) => {
  try {
    const questions = await prisma.question.findMany({
      include: {
        fields: true,
      },
    });

    const transformedQuestions = questions.map((question) => {
      const { id, title, description, fields, modals, options } = question;

      const fieldTypes = fields.map((field) => field.type);
      const fieldIds = fields.map((field) => field.id); // Add this line

      const transformedQuestion = {
        id,
        title,
        description,
        fields: fieldTypes,
        fields_id: fieldIds, // Add this line
      };

      if (modals) {
        transformedQuestion.modals = { description: modals };
      }

      if (fieldTypes.includes('mcq') && options) {
        transformedQuestion.options = options;
      }

      return transformedQuestion;
    });

    res.json(transformedQuestions);
    console.log(transformedQuestions);
  } catch (error) {
    console.error(error);
  } finally {
    await prisma.$disconnect();
  }
};



const createQuestion = async (req, res) => {
  try {
    const { title, description, fields, modals } = req.body;
    const question = await prisma.question.create({
      data: {
        title,
        description,
        fields,
        modals,
      },
    });
    res.json(question);
  } catch (error) {
    console.error("Error creating question:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};


export default { createQuestion,getQuestions };
