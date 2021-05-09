import React from "react";
import {
  Grid,
  Paper,
  Avatar,
  Typography,
  TextField,
  Button,
} from "@material-ui/core";
import AddCircleOutlineOutlinedIcon from "@material-ui/icons/AddCircleOutlineOutlined";
import Radio from "@material-ui/core/Radio";
import RadioGroup from "@material-ui/core/RadioGroup";
import FormControlLabel from "@material-ui/core/FormControlLabel";
import FormControl from "@material-ui/core/FormControl";
import FormLabel from "@material-ui/core/FormLabel";
import Checkbox from "@material-ui/core/Checkbox";

import API from "../../api/path";
import { useRouter } from "next/router";
import { useLoaded } from "../../utils/Loader";
import { useState } from "react";
import { useStoreActions, useStoreState } from "../../store";

export default function SignUp({}) {
  const paperStyle = { padding: "40px 30px", width: 600, margin: "40px auto" };
  const avatarStyle = { backgroundColor: "#FDA50F" };
  const [adminInfo, setAdminInfo] = useState({
    username: "",
    password: "",
  });
  const loaded = useLoaded();
  const router = useRouter();
  const admin = useStoreState((s) => s.adminState.admin);
  const setAdmin = useStoreActions((a) => a.adminState.set);

  function onTyping(e) {
    setAdminInfo({ ...adminInfo, [e.target.name]: e.target.value });
  }

  async function onSubmit() {
    const res = await API.admin.signup(adminInfo.username, adminInfo.password);
    if (res.status === 201) {
      setAdmin(res.data);
      router.push("/dashboard");
    }
  }

  if(admin !== null)
    router.push('/dashboard')

  return (
    loaded && (
      <Grid>
        <Paper elevation={20} style={paperStyle}>
          <Grid align="center">
            <Avatar style={avatarStyle}>
              <AddCircleOutlineOutlinedIcon />
            </Avatar>
            <h2>Sign Up to SSH</h2>
            <Typography variant="caption" gutterBottom>
              Please fill this form to create an account !
            </Typography>
          </Grid>

          <TextField
            fullWidth
            label="Name"
            placeholder="Enter your name"
            style={{ margin: "5px 0" }}
          />
          <TextField
            fullWidth
            value={adminInfo.username}
            onChange={(e) => onTyping(e)}
            name="username"
            label="Username"
            placeholder="Enter your username"
            style={{ margin: "5px 0" }}
          />
          <FormControl component="fieldset" style={{ margin: "30px 0" }}>
            <FormLabel component="legend">Gender</FormLabel>
            <RadioGroup aria-label="gender" name="gender1">
              <FormControlLabel
                value="female"
                control={<Radio />}
                label="Female"
              />
              <FormControlLabel value="male" control={<Radio />} label="Male" />
              <FormControlLabel
                value="other"
                control={<Radio />}
                label="Other"
              />
            </RadioGroup>
          </FormControl>
          <TextField
            fullWidth
            label="Phone Number"
            placeholder="Enter your phone number"
            style={{ margin: "5px 0" }}
          />
          <TextField
            fullWidth
            value={adminInfo.password}
            onChange={(e) => onTyping(e)}
            type="password"
            name="password"
            label="Password"
            placeholder="Enter your password"
            style={{ margin: "5px 0" }}
          />
          <TextField
            fullWidth
            type="password"
            label="Confirm Password"
            placeholder="Confirm your password"
            style={{ margin: "5px 0" }}
          />
          <Grid
            container
            alignItems="center"
            justify="space-between"
            style={{ margin: "5px 0" }}
          >
            <FormControlLabel
              control={<Checkbox name="checkedA" />}
              label="I accept the terms and conditions."
            />
            <Button variant="contained" color="primary" onClick={onSubmit}>
              Sign up
            </Button>
          </Grid>
        </Paper>
      </Grid>
    )
  );
}
