import express from "express";
import questionController from "../controllers/questionController.js";

const router = express.Router();

router.post("/create", questionController.createQuestion);

router.get("/get", questionController.getQuestions);

export default router;
