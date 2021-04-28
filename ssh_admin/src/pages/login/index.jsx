import React from "react";
import Avatar from "@material-ui/core/Avatar";
import Button from "@material-ui/core/Button";
import TextField from "@material-ui/core/TextField";
import Checkbox from "@material-ui/core/Checkbox";
import Grid from "@material-ui/core/Grid";
import Typography from "@material-ui/core/Typography";
import Image from "next/image";

import { useRouter } from "next/router";
import { useLoaded } from "../../utils/Loader";

export default function Login() {
  const router = useRouter();
  const loaded = useLoaded();

  return (
    loaded && (
      <Grid container direction="row">
        <Grid
          item
          style={{
            backgroundImage: "url(background.png)",
            height: "100vh",
            width: "60vw",
            backgroundRepeat: "no-repeat",
            backgroundSize: "cover",
          }}
        ></Grid>
        <Grid
          container
          item
          style={{
            boxShadow: "0 4px 8px 0 rgba(0, 0, 0, 0.2)",
            height: "100vh",
            width: "40vw",
            padding: "50px",
          }}
        >
          <Grid
            style={{ width: "100%", flexDirection: "column", display: "flex" }}
          >
            <Grid
              container
              style={{
                textAlign: "center",
                margin: "20px auto",
                width: "100%",
              }}
              direction="column"
              justify="center"
              alignItems="center"
            >
              <Image src={"/SSHicon.png"} width="200" height="150" />
              <Typography component="h1" variant="h5">
                Sign in to SSH
              </Typography>
            </Grid>

            <TextField
              style={{ margin: "20px auto", width: "100%" }}
              variant="filled"
              label="Email Address"
              name="email"
            />

            <TextField
              style={{ margin: "20px auto", width: "100%" }}
              variant="filled"
              name="password"
              label="Password"
              type="password"
            />
            <Grid
              container
              justify="flex-start"
              direction="row"
              alignItems="center"
            >
              <Checkbox defaultChecked color="primary" />
              <Typography>Remember Me</Typography>
            </Grid>
            <Button
              onClick={() => router.push("/dashboard")}
              style={{ width: "40%", margin: "20px auto" }}
              variant="contained"
              color="primary"
            >
              Sign In
            </Button>
            <Grid container direction="row" justify="space-between">
              <Grid item>
                <Typography color="primary">Forgot password?</Typography>
              </Grid>
              <Grid item>
                <Typography color="primary">
                  Don't have an account? Sign Up
                </Typography>
              </Grid>
            </Grid>
          </Grid>
        </Grid>
      </Grid>
    )
  );
}
