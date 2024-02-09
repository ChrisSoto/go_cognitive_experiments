import prisma from '../../lib/prisma'

export default async function Home() {

  // const experiment = await prisma.workMemExperiment.findFirst();
  // const trials = await prisma.workMemTrial.findMany({
  //   where: {
  //     experimentId: experiment?.id
  //   }
  // });

  const users = await prisma.user.findFirst({
    where: {
      name: 'Chris'
    }
  });

  console.log(users)

  // const feed = await prisma.post.findMany({
  //   where: { published: true },
  //   include: {
  //     author: {
  //       select: { name: true },
  //     }
  //   }
  // });
  
  return (
    <main className="flex min-h-screen flex-col items-center justify-between p-24">
      {/* { feed.map(post => (
        <div key={post.id}>
          <h2>{ post.title }</h2>
          <p>{ post.content }</p>
        </div>
      ) ) } */}
    </main>
  );
}
