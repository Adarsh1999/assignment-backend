import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

const saveAnswer = async (req, res) => {
  try {
    const { answer, questionId, fieldId } = req.body;

    // Loop over the answer object and fieldId array to create/update answers
    for (let i = 0; i < fieldId.length; i++) {
      const currentFieldId = parseInt(fieldId[i]);
      let currentAnswer = answer[currentFieldId];

      // Convert boolean answer to string
      if (typeof currentAnswer === "boolean") {
        currentAnswer = String(currentAnswer);
      }

      // Check if an answer with the same questionId and fieldId exists
      const existingAnswer = await prisma.answer.findFirst({
        where: {
          questionId,
          fieldId: currentFieldId,
        },
      });

      if (existingAnswer) {
        // Update the existing answer
        await prisma.answer.update({
          where: {
            id: existingAnswer.id,
          },
          data: {
            answer: currentAnswer,
          },
        });
      } else {
        // Create a new answer
        await prisma.answer.create({
          data: {
            answer: currentAnswer,
            questionId,
            fieldId: currentFieldId,
          },
        });
      }
    }

    res.status(200).json({ message: "Answers saved successfully" });
  } catch (error) {
    // Handle the error appropriately
    console.error(error);
    res.status(500).json({ error: "Internal server error" });
  }
};

export default { saveAnswer };
