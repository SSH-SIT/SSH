import {
  Typography,
  Card,
  CardMedia,
  CardContent,
  Grid,
} from "@material-ui/core";
import BinaryToBase64 from "../utils/BinaryToBase64";

export default function OrderCard({ title, value, picture, amount }) {
  return (
    <Card
      style={{
        padding: "20px",
        backgroundColor: "transparent",
        borderWidth: "0",
        borderRadius: "20px",
        boxShadow: "0 4px 8px 0 rgba(0, 0, 0, 0.2)",
        marginTop: "40px",
      }}
    >
      <CardContent
        style={{
          display: "flex",
          flexDirection: "row",
          alignItems: "center",
          justifyContent: 'space-around',
          textAlign: "center",
          width: "100%",
          backgroundColor: "transparent",
          borderWidth: "0",
        }}
      >
        <CardMedia
          style={{ width: "20%" }}
          component="img"
          image={`data:image/png;base64,${BinaryToBase64(picture.data)}`}
        />

        <Grid>
          <Typography>{title}</Typography>
        </Grid>
        <Grid>
          <Typography variant="h6">x {amount}</Typography>
        </Grid>
        <Grid>
          <Typography variant="h5" style={{ fontWeight: "bold" }}>
            ฿ {value}
          </Typography>
        </Grid>
      </CardContent>
    </Card>
  );
}
