/*
  Warnings:

  - You are about to drop the column `fields` on the `Question` table. All the data in the column will be lost.
  - Added the required column `questionId` to the `Field` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Field" ADD COLUMN     "questionId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Question" DROP COLUMN "fields";

-- AddForeignKey
ALTER TABLE "Field" ADD CONSTRAINT "Field_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES "Question"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
