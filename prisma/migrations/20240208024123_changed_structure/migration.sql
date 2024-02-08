/*
  Warnings:

  - You are about to drop the `experiment_labs` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `experiments` table. If the table is not empty, all the data it contains will be lost.

*/
-- CreateEnum
CREATE TYPE "Modality" AS ENUM ('DIGITS', 'SHAPES', 'MATH');

-- DropForeignKey
ALTER TABLE "experiments" DROP CONSTRAINT "experiments_labId_fkey";

-- DropTable
DROP TABLE "experiment_labs";

-- DropTable
DROP TABLE "experiments";

-- CreateTable
CREATE TABLE "working_memory_labs" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "working_memory_labs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "working_memory_experiments" (
    "id" TEXT NOT NULL,
    "labId" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "working_memory_experiments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "working_memory_trials" (
    "id" TEXT NOT NULL,
    "experimentId" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "trial" INTEGER NOT NULL,
    "modality" "Modality",
    "sound" BOOLEAN,
    "pace" INTEGER,
    "length" INTEGER,
    "correct" BOOLEAN,
    "original" TEXT,
    "entered" TEXT,

    CONSTRAINT "working_memory_trials_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "working_memory_experiments" ADD CONSTRAINT "working_memory_experiments_labId_fkey" FOREIGN KEY ("labId") REFERENCES "working_memory_labs"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "working_memory_trials" ADD CONSTRAINT "working_memory_trials_experimentId_fkey" FOREIGN KEY ("experimentId") REFERENCES "working_memory_experiments"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
