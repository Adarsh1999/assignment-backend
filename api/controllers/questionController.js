import questionModel from '../models/questionModel.js';

export async function getAllQuestions(req, res) {
  try {
    const questions = await questionModel.getAllQuestions();
    res.json(questions);
  } catch (error) {
    console.error('Error retrieving questions:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
}
