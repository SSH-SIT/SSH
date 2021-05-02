import { AppBar, Toolbar, Grid, Typography, Button } from "@material-ui/core";
import { ExitToApp } from "@material-ui/icons";
import { makeStyles } from "@material-ui/core/styles";
import SideBar from "./SideBar";

import { useRouter } from "next/router";
import { useLoaded } from "../utils/Loader";

import { useStoreActions, useStoreState } from "../store";

const useStyles = makeStyles((theme) => ({
  appBar: {
    zIndex: theme.zIndex.drawer + 5,
    padding: "10px",
  },
}));

export default function NavBar({ children }) {
  const loaded = useLoaded();
  const classes = useStyles();
  const router = useRouter();
  const admin = useStoreState((s) => s.adminState.admin);
  const setAdmin = useStoreActions((a) => a.adminState.set);

  function onLogOut() {
    setAdmin(null);
  }

  if (!admin) router.push("/login");

  return (
    loaded && (
      <>
        <AppBar position="sticky" className={classes.appBar}>
          <Toolbar style={{ display: "flex", justifyContent: "space-between" }}>
            <Grid
              style={{
                display: "flex",
                flexDirection: "row",
                alignItems: "center",
              }}
            >
              <img src={"/SSHicon.png"} width="95" height="75" />
              <Typography variant="h5" style={{ fontWeight: "bold" }}>
                SafeSex Harajuku
              </Typography>
            </Grid>
            <Button
              size="large"
              variant="outlined"
              startIcon={<ExitToApp />}
              onClick={onLogOut}
            >
              LogOut
            </Button>
          </Toolbar>
        </AppBar>
        <SideBar>{children}</SideBar>
      </>
    )
  );
}
