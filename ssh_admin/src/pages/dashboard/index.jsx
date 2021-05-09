import { Grid, Typography } from "@material-ui/core";

import NavBar from "../../components/NavBar";

import { Bar } from "react-chartjs-2";

import { useState, useEffect } from "react";
import { useRouter } from "next/router";
import { useLoaded } from "../../utils/Loader";
import API from "../../api/path";
import DashboardCard from "../../components/DashboardCard";

export default function DashBoard({}) {
  const loaded = useLoaded();
  const router = useRouter();
  const [saleOverviewDataSets, setSaleOverviewDataSets] = useState([]);
  const [topSellersProducts, setTopSellersProducts] = useState([]);
  const [amountOfProducts, setAmountOfProducts] = useState([]);

  useEffect(() => {
    showSaleOverview();
    showTopSellerProduct();
    showAmountOfProducts();
  }, [loaded]);

  async function showSaleOverview() {
    const res = await API.util.saleOverviews();
    if (res.status === 200) {
      var tempArr = [];
      for (let i = 0; i < 12; i++) {
        tempArr.push(res.data[i]);
      }
      setSaleOverviewDataSets(tempArr);
    }
  }

  async function showTopSellerProduct() {
    const res = await API.util.topSellers();
    if (res.status === 200) {
      setTopSellersProducts(res.data);
    }
  }

  async function showAmountOfProducts() {
    const res = await API.util.amountOfProducts();
    if (res.status === 200) {
      setAmountOfProducts(res.data);
    }
  }

  return (
    loaded && (
      <>
        <NavBar>
          <Grid
            container
            alignItems="center"
            direction="row"
            style={{ padding: "40px" }}
          >
            <Grid
              item
              style={{
                flexDirection: "column",
                display: "flex",
                justifyContent: "center",
              }}
            >
              <Typography variant="h4">Sale Overview</Typography>
              <Grid style={{ width: "1100px" }}>
                <Bar
                  data={{
                    labels: [
                      "January",
                      "February",
                      "March",
                      "April",
                      "May",
                      "June",
                      "July",
                      "August",
                      "September",
                      "October",
                      "November",
                      "December",
                    ],
                    datasets: [
                      {
                        label: "Sale Overview",
                        backgroundColor: "#F6D796",
                        data: saleOverviewDataSets,
                      },
                    ],
                  }}
                  options={{
                    title: {
                      display: true,
                      text: "Sale Overview",
                      fontSize: 20,
                    },
                  }}
                />
              </Grid>
            </Grid>
            <Grid
              container
              justify="space-between"
              style={{ paddingTop: "30px" }}
              spacing={7}
            >
              <Grid item style={{ width: "50%" }}>
                <Typography variant="h4">Top Seller Product</Typography>
                <div
                  style={{
                    marginTop: "40px",
                    width: "100%",
                    height: "600px",
                    backgroundColor: "#F6D796",
                    borderRadius: "20px",
                    boxShadow: "0 4px 8px 0 rgba(0, 0, 0, 0.2)",
                    display: "flex",
                    flexDirection: "column",
                  }}
                >
                  {topSellersProducts.map((top) => {
                    return (
                      <DashboardCard
                        key={top.pid}
                        type="top-seller"
                        title={top.pname}
                        value={top.total_amount}
                        picture={top.picture}
                      />
                    );
                  })}
                </div>
              </Grid>
              <Grid item style={{ width: "50%" }}>
                <Typography variant="h4">Amount of Product</Typography>
                <div
                  style={{
                    marginTop: "40px",
                    width: "100%",
                    height: "600px",
                    backgroundColor: "#F6D796",
                    borderRadius: "20px",
                    boxShadow: "0 4px 8px 0 rgba(0, 0, 0, 0.2)",
                    display: "flex",
                    flexDirection: "column",
                  }}
                >
                  {amountOfProducts.map((prod) => {
                    return (
                      <DashboardCard
                        key={prod.pid}
                        type="amount-of-prod"
                        title={prod.type_name}
                        value={prod.amount}
                      />
                    );
                  })}
                </div>
              </Grid>
            </Grid>
          </Grid>
        </NavBar>
      </>
    )
  );
}
