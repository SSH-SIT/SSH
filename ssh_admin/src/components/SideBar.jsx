import { makeStyles } from "@material-ui/core/styles";
import {
  Drawer,
  Toolbar,
  List,
  ListItem,
  ListItemIcon,
  ListItemText,
  Grid,
} from "@material-ui/core";
import { Dashboard, ShoppingCart, Ballot, Face } from "@material-ui/icons";

import { useLoaded } from "../utils/Loader";

const drawerWidth = 240;

const useStyles = makeStyles((theme) => ({
  toolbar: theme.mixins.toolbar,
  drawer: {
    width: drawerWidth,
  },
  drawerPaper: {
    width: drawerWidth,
  }
}));

export default function SideBar({ children }) {
  const classes = useStyles();
  const loaded = useLoaded();

  return (
    loaded && (
      <>
        <Drawer
          className={classes.drawer}
          variant="permanent"
          classes={{
            paper: classes.drawerPaper,
          }}
        >
          <Toolbar />
          <div className={`${classes.toolbar} bg-navBarColor border-0`} />
          <List>
            <ListItem button key={"Kai son"}>
              <ListItemIcon>
                <Face />
              </ListItemIcon>
              <ListItemText primary={"Kai son"} />
            </ListItem>
            <ListItem button key={"Dashboard"}>
              <ListItemIcon>
                <Dashboard />
              </ListItemIcon>
              <ListItemText primary={"Dashboard"} />
            </ListItem>
            <ListItem button key={"Order"}>
              <ListItemIcon>
                <Ballot />
              </ListItemIcon>
              <ListItemText primary={"Order"} />
            </ListItem>
            <ListItem button key={"Product"}>
              <ListItemIcon>
                <ShoppingCart />
              </ListItemIcon>
              <ListItemText primary={"Product"} />
            </ListItem>
          </List>
        </Drawer>
        <Grid>{children}</Grid>
      </>
    )
  );
}
