# Nodejs Prisma Assessment Backend


## Description

This project is a Node.js application with a Prisma ORM implementation. It follows an MVC file structure, and the entry point of the application is `api/app.js`.

The application has two routes:

- `/questions`: Handles question-related operations.
- `/answer`: Handles answer-related operations.

The `/questions` route has the following APIs:

- `POST /create`: Creates a new question.
- `GET /get`: Retrieves all questions.

The `/answer` route has the following API:

- `POST /save`: Saves an answer.

## Routes and APIs

- `/answer/save`:
  - Method: POST
  - URL: `http://localhost:3001/answer/save`
  - Parameters:
    ```json
    {
      "answer": {
        "3": "Executive",
        "5": "234"
      },
      "questionId": 4,
      "fieldId": ["3", "5"]
    }
    ```

- `/questions/get`:
  - Method: GET
  - URL: `http://localhost:3001/questions/get`

- `/questions/create`:
  - Method: POST
  - URL: `http://localhost:3001/questions/create`
  - Data Parameters:
    ```json
    {
      "title": "What is the capital of the United States?",
      "description": "Lorem ipsum dolor sit amet consectetur adipisicing elit. Nesciunt sint ex odio et consectetur ullam placeat ea in alias corporis quam, facilis fugiat ipsum, adipisci veritatis, quas natus ipsam nam repellat aliquid expedita. Accusamus non provident perspiciatis nostrum!",
      "fields": [1, 2],
      "modals": {
        "description": "Lorem ipsum dolor sit amet consectetur adipisicing elit. Nesciunt sint ex odio et consectetur ullam placeat ea in alias corporis quam, facilis fugiat ipsum, adipisci veritatis, quas natus ipsam nam repellat aliquid expedita. Accusamus non provident perspiciatis nostrum!"
      },
      "options": [
        "Executive",
        "Legislative",
        "Judicial",
        "Military"
      ]
    }
    ```

## Project Structure

The project follows an MVC file structure. It includes the following components:

- `api/app.js`: Entry point of the application.
- `routes/questionRoutes.js`: Handles question-related routes.
- `routes/answerRoutes.js`: Handles answer-related routes.
- `controllers/questionController.js`: Contains logic for question-related APIs.
- `controllers/answerController.js`: Contains logic for answer-related APIs.
- `models/Question.js`: Schema and model for the Question entity.
- `models/Answer.js`: Schema and model for the Answer entity.
- `models/Field.js`: Schema and model for the Field entity.
- `services/populateDatabase.js`: Node file to populate the PostgreSQL database with questions from `questions.json`.

## Installation and Setup

```bash
$ git https://github.com/Adarsh1999/assignment-backend.git
$ cd assignment-backend
$ npm i
$ cd api
$ node app.js
```



