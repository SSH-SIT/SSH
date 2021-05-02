import React from "react";
import Avatar from "@material-ui/core/Avatar";
import Button from "@material-ui/core/Button";
import TextField from "@material-ui/core/TextField";
import Checkbox from "@material-ui/core/Checkbox";
import Grid from "@material-ui/core/Grid";
import Typography from "@material-ui/core/Typography";
import Image from "next/image";

import API from "../../api/path";

import { useStoreActions, useStoreState } from "../../store";
import { useRouter } from "next/router";
import { useState } from "react";
import { useLoaded } from "../../utils/Loader";

export default function Login({}) {
  const router = useRouter();
  const loaded = useLoaded();
  const admin = useStoreState((s) => s.adminState.admin);
  const setAdmin = useStoreActions((a) => a.adminState.set);
  const [user, setUser] = useState({
    email: "",
    password: "",
  });
  const [errMsg, setErrMsg] = useState("");

  function onChange(e) {
    setUser({ ...user, [e.target.name]: e.target.value });
  }

  async function onLogin() {
    if (user.email === "" || user.password === "")
      setErrMsg("Please fill email or password.");
    else {
      const res = await API.admin.login(user.email, user.password);
      if (res) {
        if (res.status === 200) setAdmin(res.data);
        else if (res.response.status === 400)
          setErrMsg("Email or Password is incorrect.");
      }
    }
  }

  if (admin) router.push("/dashboard");

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
            style={{
              width: "100%",
              flexDirection: "column",
              display: "flex",
            }}
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
              value={user.email}
              onChange={onChange}
            />

            <TextField
              style={{ margin: "20px auto", width: "100%" }}
              variant="filled"
              name="password"
              label="Password"
              type="password"
              value={user.password}
              onChange={onChange}
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
            <Grid
              container
              justify="flex-start"
              direction="row"
              alignItems="center"
            >
              <Typography>{errMsg}</Typography>
            </Grid>
            <Button
              onClick={onLogin}
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
                <Typography
                  color="primary"
                  style={{ cursor: "pointer" }}
                  onClick={() => router.push("/signup")}
                >
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
