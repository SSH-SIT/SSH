import { Grid, Typography, TextField } from "@material-ui/core";
import NavBar from "../../components/NavBar";
import { SearchOutlined } from "@material-ui/icons";
import ProductCard from "../../components/ProductCard";

import API from "../../api/path";
import { useLoaded } from "../../utils/Loader";
import { useEffect, useState } from "react";
import { useRouter } from "next/router";

export default function Products({}) {
  const loaded = useLoaded();
  const router = useRouter();
  const [products, setProducts] = useState([]);
  const [productsData, setProductsData] = useState([]);
  const [productsAmount, setProductsAmount] = useState(0);

  function onSearch(e) {
    const { value } = e.target;

    const searchedName = productsData.filter((pd) =>
      pd.pname.toLowerCase().includes(value.toLowerCase())
    );
    const searchedCategories = productsData.filter((pd) =>
      pd.type_name.toLowerCase().includes(value.toLowerCase())
    );
    const searchedDescription = productsData.filter((pd) =>
      pd.description.toLowerCase().includes(value.toLowerCase())
    );

    const mergedSearched = [
      ...searchedName,
      ...searchedCategories,
      ...searchedDescription,
    ];

    const searchedResults = [];
    mergedSearched.forEach((data) => {
      const find = searchedResults.find((item) => item.pid === data.pid);
      if (!find) searchedResults.push(data);
    });
    setProducts(searchedResults);
  }

  async function getAllProducts() {
    const res = await API.products.getAllProducts();
    if (res.status === 200) {
      setProducts(res.data);
      setProductsData(res.data);
      setProductsAmount(res.data.length);
    }
  }

  useEffect(() => getAllProducts(), []);

  return (
    loaded && (
      <>
        <NavBar>
          <Grid container alignItems="center" direction="row">
            <Grid
              container
              alignContent="center"
              justify="space-between"
              direction="row"
              style={{
                height: "100px",
                backgroundColor: "#F4F4F4",
                padding: "50px",
              }}
            >
              <Grid>
                <Typography variant="h4">Products</Typography>

                <Typography>({productsAmount} result)</Typography>
              </Grid>
              <Grid style={{ display: "flex", alignItems: "center" }}>
                <TextField
                  fullWidth
                  size="small"
                  placeholder="Search"
                  label=""
                  variant="outlined"
                  onChange={(e) => onSearch(e)}
                  InputProps={{
                    startAdornment: (
                      <SearchOutlined style={{ color: "rgba(0,0,0,0.54)" }} />
                    ),
                  }}
                />
              </Grid>
            </Grid>
            {products.length !== 0 ? (
              <Grid
                style={{
                  display: "grid",
                  gridTemplateColumns: "repeat(2, 1fr)",
                  justifyContent: "center",
                  alignItems: "center",
                  width: "100%",
                  paddingLeft: "80px",
                  paddingBottom: "80px",
                  paddingRight: "80px",
                  columnGap: "50px",
                  overflow: "auto",
                  margin: "0 auto",
                }}
              >
                {products.length !== 0 ? (
                  products.map((pd) => {
                    return (
                      <ProductCard
                        title={pd.pname}
                        picture={pd.picture}
                        price={pd.price}
                        pid={pd.pid}
                      />
                    );
                  })
                ) : (
                  <Grid style={{ columnSpan: "4", backgroundColor: "red" }}>
                    <Typography>Loading Products..</Typography>
                  </Grid>
                )}
              </Grid>
            ) : (
              <Grid
                style={{
                  columnSpan: "4",
                  width: "100%",
                  textAlign: "center",
                  margin: "0 auto",
                  marginTop: "150px",
                }}
              >
                <Typography variant="h3">Loading Products...</Typography>
              </Grid>
            )}
          </Grid>
        </NavBar>
      </>
    )
  );
}
