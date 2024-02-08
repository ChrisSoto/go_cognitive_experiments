/*
  Warnings:

  - You are about to drop the column `labId` on the `working_memory_experiments` table. All the data in the column will be lost.
  - You are about to drop the `working_memory_labs` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "working_memory_experiments" DROP CONSTRAINT "working_memory_experiments_labId_fkey";

-- AlterTable
ALTER TABLE "working_memory_experiments" DROP COLUMN "labId";

-- DropTable
DROP TABLE "working_memory_labs";
