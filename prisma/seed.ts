import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()
async function main() {
  
  await prisma.user.upsert({
    where: { email: 'alice@prisma.io' },
    update: {},
    create: {
      email: 'alice@prisma.io',
      name: 'Alice'
    },
  });
  
  await prisma.user.upsert({
    where: { email: 'bob@prisma.io' },
    update: {},
    create: {
      email: 'bob@prisma.io',
      name: 'Bob'
    },
  });

  await prisma.workMemExperiment.upsert({
    where: { id: '' },
    update: {},
    create: {
      trials: {
        create: {
          trial: 1,
          modality: 'DIGITS',
          sound: false,
          pace: 1000,
          length: 5,
          correct: true,
          original: '1234',
          entered: '1234'
        },
      }
    }
  });

}

main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
    process.exit(1)
  })