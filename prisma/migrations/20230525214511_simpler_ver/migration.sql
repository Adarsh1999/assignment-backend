/*
  Warnings:

  - You are about to drop the column `optionId` on the `Answer` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `Answer` table. All the data in the column will be lost.
  - You are about to drop the column `answerId` on the `Field` table. All the data in the column will be lost.
  - You are about to drop the column `booleanValue` on the `Field` table. All the data in the column will be lost.
  - You are about to drop the column `fieldTypeName` on the `Field` table. All the data in the column will be lost.
  - You are about to drop the column `intValue` on the `Field` table. All the data in the column will be lost.
  - You are about to drop the column `questionId` on the `Field` table. All the data in the column will be lost.
  - You are about to drop the column `stringValue` on the `Field` table. All the data in the column will be lost.
  - You are about to drop the column `modalsDescription` on the `Question` table. All the data in the column will be lost.
  - You are about to drop the `Option` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `OptionQuestionLink` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_FieldOptions` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `answer` to the `Answer` table without a default value. This is not possible if the table is not empty.
  - Made the column `fieldId` on table `Answer` required. This step will fail if there are existing NULL values in that column.
  - Added the required column `type` to the `Field` table without a default value. This is not possible if the table is not empty.
  - Added the required column `fields` to the `Question` table without a default value. This is not possible if the table is not empty.
  - Made the column `description` on table `Question` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "Answer" DROP CONSTRAINT "Answer_fieldId_fkey";

-- DropForeignKey
ALTER TABLE "Answer" DROP CONSTRAINT "Answer_optionId_fkey";

-- DropForeignKey
ALTER TABLE "Answer" DROP CONSTRAINT "Answer_userId_fkey";

-- DropForeignKey
ALTER TABLE "Field" DROP CONSTRAINT "Field_questionId_fkey";

-- DropForeignKey
ALTER TABLE "OptionQuestionLink" DROP CONSTRAINT "OptionQuestionLink_fieldId_fkey";

-- DropForeignKey
ALTER TABLE "OptionQuestionLink" DROP CONSTRAINT "OptionQuestionLink_optionId_fkey";

-- DropForeignKey
ALTER TABLE "OptionQuestionLink" DROP CONSTRAINT "OptionQuestionLink_questionId_fkey";

-- DropForeignKey
ALTER TABLE "_FieldOptions" DROP CONSTRAINT "_FieldOptions_A_fkey";

-- DropForeignKey
ALTER TABLE "_FieldOptions" DROP CONSTRAINT "_FieldOptions_B_fkey";

-- AlterTable
ALTER TABLE "Answer" DROP COLUMN "optionId",
DROP COLUMN "userId",
ADD COLUMN     "answer" TEXT NOT NULL,
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "fieldId" SET NOT NULL;
DROP SEQUENCE "Answer_id_seq";

-- AlterTable
ALTER TABLE "Field" DROP COLUMN "answerId",
DROP COLUMN "booleanValue",
DROP COLUMN "fieldTypeName",
DROP COLUMN "intValue",
DROP COLUMN "questionId",
DROP COLUMN "stringValue",
ADD COLUMN     "options" TEXT[],
ADD COLUMN     "type" TEXT NOT NULL,
ALTER COLUMN "id" DROP DEFAULT;
DROP SEQUENCE "Field_id_seq";

-- AlterTable
ALTER TABLE "Question" DROP COLUMN "modalsDescription",
ADD COLUMN     "fields" JSONB NOT NULL,
ADD COLUMN     "modals" TEXT,
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "description" SET NOT NULL;
DROP SEQUENCE "Question_id_seq";

-- DropTable
DROP TABLE "Option";

-- DropTable
DROP TABLE "OptionQuestionLink";

-- DropTable
DROP TABLE "User";

-- DropTable
DROP TABLE "_FieldOptions";

-- AddForeignKey
ALTER TABLE "Answer" ADD CONSTRAINT "Answer_fieldId_fkey" FOREIGN KEY ("fieldId") REFERENCES "Field"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
