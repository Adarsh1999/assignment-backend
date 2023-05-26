import express from "express";
import answerController from "../controllers/answerController.js";

const router = express.Router();

router.post("/save", answerController.saveAnswer);


export default router;
