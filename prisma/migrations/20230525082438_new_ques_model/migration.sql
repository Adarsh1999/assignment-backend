/*
  Warnings:

  - You are about to drop the column `boolean` on the `Answer` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `Answer` table. All the data in the column will be lost.
  - You are about to drop the column `number` on the `Answer` table. All the data in the column will be lost.
  - You are about to drop the column `text` on the `Answer` table. All the data in the column will be lost.
  - You are about to drop the column `type` on the `Question` table. All the data in the column will be lost.
  - You are about to drop the column `email` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `firstName` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `lastName` on the `User` table. All the data in the column will be lost.
  - You are about to drop the `Choice` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `password` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Choice" DROP CONSTRAINT "Choice_questionId_fkey";

-- DropIndex
DROP INDEX "User_email_key";

-- AlterTable
ALTER TABLE "Answer" DROP COLUMN "boolean",
DROP COLUMN "createdAt",
DROP COLUMN "number",
DROP COLUMN "text",
ADD COLUMN     "fieldId" INTEGER,
ADD COLUMN     "optionId" INTEGER;

-- AlterTable
ALTER TABLE "Question" DROP COLUMN "type",
ADD COLUMN     "modalsDescription" TEXT;

-- AlterTable
ALTER TABLE "User" DROP COLUMN "email",
DROP COLUMN "firstName",
DROP COLUMN "lastName",
ADD COLUMN     "password" TEXT NOT NULL;

-- DropTable
DROP TABLE "Choice";

-- DropEnum
DROP TYPE "QuestionType";

-- CreateTable
CREATE TABLE "Field" (
    "id" SERIAL NOT NULL,
    "questionId" INTEGER NOT NULL,
    "fieldTypeName" TEXT NOT NULL,
    "stringValue" TEXT,
    "intValue" INTEGER,
    "booleanValue" BOOLEAN,
    "answerId" INTEGER,

    CONSTRAINT "Field_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Option" (
    "id" SERIAL NOT NULL,
    "value" TEXT NOT NULL,

    CONSTRAINT "Option_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OptionQuestionLink" (
    "id" SERIAL NOT NULL,
    "optionId" INTEGER NOT NULL,
    "questionId" INTEGER NOT NULL,
    "fieldId" INTEGER,

    CONSTRAINT "OptionQuestionLink_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_FieldOptions" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "OptionQuestionLink_fieldId_key" ON "OptionQuestionLink"("fieldId");

-- CreateIndex
CREATE UNIQUE INDEX "_FieldOptions_AB_unique" ON "_FieldOptions"("A", "B");

-- CreateIndex
CREATE INDEX "_FieldOptions_B_index" ON "_FieldOptions"("B");

-- AddForeignKey
ALTER TABLE "Field" ADD CONSTRAINT "Field_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES "Question"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OptionQuestionLink" ADD CONSTRAINT "OptionQuestionLink_optionId_fkey" FOREIGN KEY ("optionId") REFERENCES "Option"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OptionQuestionLink" ADD CONSTRAINT "OptionQuestionLink_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES "Question"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OptionQuestionLink" ADD CONSTRAINT "OptionQuestionLink_fieldId_fkey" FOREIGN KEY ("fieldId") REFERENCES "Field"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Answer" ADD CONSTRAINT "Answer_fieldId_fkey" FOREIGN KEY ("fieldId") REFERENCES "Field"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Answer" ADD CONSTRAINT "Answer_optionId_fkey" FOREIGN KEY ("optionId") REFERENCES "Option"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FieldOptions" ADD CONSTRAINT "_FieldOptions_A_fkey" FOREIGN KEY ("A") REFERENCES "Field"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FieldOptions" ADD CONSTRAINT "_FieldOptions_B_fkey" FOREIGN KEY ("B") REFERENCES "Option"("id") ON DELETE CASCADE ON UPDATE CASCADE;
