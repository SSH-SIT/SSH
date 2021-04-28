import { useRouter } from "next/router";
import { useEffect } from "react";

import { useStoreState } from "../store";

export default function Index() {
  const admin = useStoreState((s) => s.adminState.admin);

  function Redirect({ to }) {
    const router = useRouter();

    useEffect(() => {
      router.push(to);
    }, []);

    return null;
  }

  if (admin) {
    return <Redirect to={`/dashboard`} />;
  }

  if (!admin) return <Redirect to={`/login`} />;
}