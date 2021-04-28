import { Grid, Typography } from "@material-ui/core";

import NavBar from "../../components/NavBar";
import { useLoaded } from "../../utils/Loader";

export default function DashBoard({}) {
  const loaded = useLoaded();

  return (
    loaded && (
      <>
        <NavBar>
          <Grid>
            <Typography>Sale Overview</Typography>
            <Typography>Top Seller Product</Typography>
            <Typography>Amount of Product</Typography>
          </Grid>
        </NavBar>
      </>
    )
  );
}
