/*
  Warnings:

  - You are about to drop the `Experiment` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ExperimentLab` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Experiment" DROP CONSTRAINT "Experiment_labId_fkey";

-- DropTable
DROP TABLE "Experiment";

-- DropTable
DROP TABLE "ExperimentLab";

-- CreateTable
CREATE TABLE "experiment_labs" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "experiment_labs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "experiments" (
    "id" TEXT NOT NULL,
    "labId" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "experiments_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "experiments" ADD CONSTRAINT "experiments_labId_fkey" FOREIGN KEY ("labId") REFERENCES "experiment_labs"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
