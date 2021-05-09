import NavBar from "../../components/NavBar";

import { useLoaded } from "../../utils/Loader";
import { useEffect, useState } from "react";

export default function Products({}) {
  const loaded = useLoaded();

  return (
    <>
      <NavBar></NavBar>
    </>
  );
}
