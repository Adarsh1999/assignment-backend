import express from "express";
import answerController from "../controllers/answerController.js";

const router = express.Router();

router.post("/save", answerController.saveAnswer);
router.get("/get", answerController.getAnswer);
router.get("/all", answerController.getAllAnswers);



export default router;
