/*
  Warnings:

  - You are about to drop the column `updated_at` on the `working_memory_experiments` table. All the data in the column will be lost.
  - You are about to drop the column `experimentId` on the `working_memory_trials` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `working_memory_trials` table. All the data in the column will be lost.
  - Added the required column `experiment_id` to the `working_memory_trials` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "working_memory_trials" DROP CONSTRAINT "working_memory_trials_experimentId_fkey";

-- AlterTable
ALTER TABLE "working_memory_experiments" DROP COLUMN "updated_at";

-- AlterTable
ALTER TABLE "working_memory_trials" DROP COLUMN "experimentId",
DROP COLUMN "updated_at",
ADD COLUMN     "experiment_id" TEXT NOT NULL;

-- CreateIndex
CREATE INDEX "working_memory_experiments_created_at_idx" ON "working_memory_experiments"("created_at");

-- CreateIndex
CREATE INDEX "working_memory_trials_created_at_idx" ON "working_memory_trials"("created_at");

-- AddForeignKey
ALTER TABLE "working_memory_trials" ADD CONSTRAINT "working_memory_trials_experiment_id_fkey" FOREIGN KEY ("experiment_id") REFERENCES "working_memory_experiments"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
