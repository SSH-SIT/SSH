import {
  Grid,
  Typography,
  TextField,
  Card,
  CardMedia,
} from "@material-ui/core";
import NavBar from "../../../components/NavBar";
import BinaryToBase64 from "../../../utils/BinaryToBase64";

import API from "../../../api/path";
import { useRouter } from "next/router";
import { useLoaded } from "../../../utils/Loader";
import { useEffect, useState } from "react";

export default function Product({}) {
  const loaded = useLoaded();
  const router = useRouter();
  const id = router.query.id;
  const [product, setProduct] = useState({
    pid: null,
    type_id: null,
    pname: null,
    price: null,
    description: null,
    color: null,
    pic_id: null,
    picture: null,
    type_name: null,
    gender: null,
  });

  async function getOneProduct() {
    const res = await API.products.getOneProduct(id);
    if (res.status === 200) {
      setProduct(res.data[0]);
    }
  }

  useEffect(() => getOneProduct(), [loaded, id]);

  return (
    loaded && (
      <>
        <NavBar>
          <Grid
            container
            alignItems="center"
            direction="column"
            style={{ padding: "30px" }}
          >
            <Grid>
              <Typography variant="h2" style={{ fontWeight: "bold" }}>
                {product.pname}
              </Typography>
            </Grid>
            <Card style={{ margin: "50px auto" }}>
              <CardMedia
                component="img"
                image={
                  product.picture
                    ? `data:image/png;base64,${BinaryToBase64(
                        product.picture.data
                      )}`
                    : null
                }
              />
            </Card>
            <Grid>
              <Typography variant="h5">{product.description}</Typography>
            </Grid>
            <Grid style={{ margin: "15px auto" }}>
              <Typography variant="h5" style={{ fontWeight: "bold" }}>
                {product.price} ฿
              </Typography>
            </Grid>
          </Grid>
        </NavBar>
      </>
    )
  );
}
