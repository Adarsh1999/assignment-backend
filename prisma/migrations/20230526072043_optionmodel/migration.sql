/*
  Warnings:

  - You are about to drop the column `options` on the `Field` table. All the data in the column will be lost.
  - You are about to drop the column `questionId` on the `Field` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Field" DROP CONSTRAINT "Field_questionId_fkey";

-- AlterTable
ALTER TABLE "Field" DROP COLUMN "options",
DROP COLUMN "questionId";

-- CreateTable
CREATE TABLE "Options" (
    "id" INTEGER NOT NULL,
    "option" TEXT NOT NULL,
    "questionId" INTEGER NOT NULL,

    CONSTRAINT "Options_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_FieldToQuestion" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_FieldToQuestion_AB_unique" ON "_FieldToQuestion"("A", "B");

-- CreateIndex
CREATE INDEX "_FieldToQuestion_B_index" ON "_FieldToQuestion"("B");

-- AddForeignKey
ALTER TABLE "Options" ADD CONSTRAINT "Options_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES "Question"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FieldToQuestion" ADD CONSTRAINT "_FieldToQuestion_A_fkey" FOREIGN KEY ("A") REFERENCES "Field"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FieldToQuestion" ADD CONSTRAINT "_FieldToQuestion_B_fkey" FOREIGN KEY ("B") REFERENCES "Question"("id") ON DELETE CASCADE ON UPDATE CASCADE;
