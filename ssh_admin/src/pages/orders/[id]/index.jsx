import { Grid, Typography, TextField } from "@material-ui/core";
import NavBar from "../../../components/NavBar";
import OrderCard from "../../../components/OrderCard";

import API from "../../../api/path";
import { useRouter } from "next/router";
import { useLoaded } from "../../../utils/Loader";
import { useEffect, useState } from "react";

export default function Order({}) {
  const loaded = useLoaded();
  const router = useRouter();
  const [products, setProducts] = useState([]);
  const [totalAmount, setTotalAmount] = useState(0);
  const id = router.query.id;

  async function showOrdersDetails() {
    const res = await API.orders.getOneOrder(id);
    if (res.status == 200) {
      var tempArr = [];
      var tempTotal = 0;
      res.data.forEach((product) => {
        tempTotal = product.amount;
        tempArr.push({
          pname: product.pname,
          amount: product.amount / product.price,
          price: product.price,
          picture: product.picture,
        });
      });
      setProducts(tempArr);
    
      setTotalAmount(tempTotal);
    }
  }

  useEffect(() => showOrdersDetails(), [id, loaded]);

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
            <Grid
              style={{
                display: "flex",
                flexDirection: "column",
              }}
            >
              {products.map((pd) => {
                return (
                  <OrderCard
                    title={pd.pname}
                    value={pd.price}
                    picture={pd.picture}
                    amount={pd.amount}
                  />
                );
              })}
            </Grid>
            <Grid style={{ padding: "50px", textAlign: "end" }}>
              <Typography variant="h2">Total {totalAmount} ฿</Typography>
            </Grid>
          </Grid>
        </NavBar>
      </>
    )
  );
}
