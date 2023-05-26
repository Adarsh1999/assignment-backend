/*
  Warnings:

  - You are about to drop the `Options` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Options" DROP CONSTRAINT "Options_questionId_fkey";

-- AlterTable
ALTER TABLE "Question" ADD COLUMN     "options" TEXT[];

-- DropTable
DROP TABLE "Options";
