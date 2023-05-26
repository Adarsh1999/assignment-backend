import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

const saveAnswer = async (req, res) => {
    try {
        const { answer, questionId, fieldId } = req.body;
    
        const savedAnswer = await prisma.answer.create({
          data: {
            answer,
            questionId,
            fieldId,
          },
        });
    
        res.json(savedAnswer);
      }  catch (error) {
      console.error("Error creating question:", error);
      res.status(500).json({ error: "Internal server error" });
    }
  };

  export default { saveAnswer };
