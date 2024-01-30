import Link from "next/link";
import Modal from "../ui/components/Modal";

type SearchParamProps = {
  searchParams: Record<string, string> | null | undefined;
}

export default function Page({ searchParams }: SearchParamProps) {

  const show = searchParams?.show;

  return (
    <>
      <h2>Page Title</h2>
      <section>dashboard</section>

      <Link href={"dashboard/?show=true"}>
        Summon Modal
      </Link>

      { show && <Modal returnRoute={"dashboard"}/> }
    </>
  );
}