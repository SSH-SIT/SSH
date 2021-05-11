import NavBar from "../../components/NavBar";

import { useLoaded } from "../../utils/Loader";
import { useEffect, useState } from "react";

import { useRouter } from "next/router";

export default function Products({}) {
  const loaded = useLoaded();
  const router = useRouter();

  return (
    loaded && (
      <>
        <NavBar></NavBar>
      </>
    )
  );
}
