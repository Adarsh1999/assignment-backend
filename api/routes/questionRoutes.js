import express from 'express';
import { Router } from 'express';
import { getAllQuestions } from '../controllers/questionController';

const router = Router();

router.get('/', getAllQuestions);

export default router;
