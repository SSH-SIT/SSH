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

export default function SignUp({}) {
  const paperStyle = { padding: "40px 30px", width: 600, margin: "40px auto" };
  const headerStyle = { margin: 0 };
  const avatarStyle = { backgroundColor: "#FDA50F" };
  return (
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
        <form>
          <TextField
            fullWidth
            label="Name"
            placeholder="Enter your name"
            style={{ margin: "5px 0" }}
          />
          <TextField
            fullWidth
            label="Email"
            placeholder="Enter your email"
            style={{ margin: "5px 0" }}
          />
          <FormControl component="fieldset" style={{ margin: "5px 0" }}>
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
            label="Password"
            placeholder="Enter your password"
            style={{ margin: "5px 0" }}
          />
          <TextField
            fullWidth
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
            <Button type="submit" variant="contained" color="primary">
              Sign up
            </Button>
          </Grid>
        </form>
      </Paper>
    </Grid>
  );
}
