import {
  Typography,
  Card,
  CardMedia,
  CardContent,
  Grid,
} from "@material-ui/core";
import BinaryToBase64 from "../utils/BinaryToBase64";

export default function DashboardCard({ title, value, picture, type }) {
  return (
    <Card
      style={{
        padding: "20px",
        backgroundColor: "transparent",
        borderWidth: "0",
        borderRadius: "20px",
        boxShadow: "none",
        height: `${
          type === "top-seller" ? "150px" : "1000px"
        }`,
        marginTop: "40px",
      }}
    >
      <CardContent
        style={{
          display: "flex",
          flexDirection: "row",
          alignItems: `${
            type === "top-seller" ? "center" : "flex-end"
          }`,
          textAlign: "center",
          width: "100%",
          backgroundColor: "transparent",
          borderWidth: "0",
          justifyContent: `${
            type === "top-seller" ? "start" : "space-between"
          }`,
        }}
      >
        {type === "top-seller" ? (
          <CardMedia
            style={{ width: "20%" }}
            component="img"
            image={`data:image/png;base64,${BinaryToBase64(picture.data)}`}
          />
        ) : null}
        <Grid style={{ width: "55%" }}>
          <Typography>{title}</Typography>
        </Grid>
        <Grid>
          <Typography variant="h5" style={{ fontWeight: "bold" }}>
            {type === "top-seller" ? `฿ ${value}` : `${value} x`}
          </Typography>
        </Grid>
      </CardContent>
    </Card>
  );
}
