import {
  Typography,
  Card,
  CardMedia,
  CardContent,
  Grid,
} from "@material-ui/core";
import BinaryToBase64 from "../utils/BinaryToBase64";
import { useRouter } from "next/router";

export default function ProductCard({ pid, title, picture, price }) {
  const router = useRouter();

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
      onClick={() => router.push(`/products/${pid}`)}
    >
      <CardContent
        style={{
          display: "flex",
          flexDirection: "column",
          alignItems: "center",
          justifyContent: "center",
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
          <Typography variant="h5" style={{ fontWeight: "bold" }}>
            {price} ฿
          </Typography>
        </Grid>
      </CardContent>
    </Card>
  );
}
