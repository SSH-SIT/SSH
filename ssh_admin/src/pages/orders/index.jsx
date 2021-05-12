import { Grid, Typography, TextField } from "@material-ui/core";
import { SearchOutlined } from "@material-ui/icons";
import NavBar from "../../components/NavBar";
import { DataGrid } from "@material-ui/data-grid";

import API from "../../api/path";
import { useRouter } from "next/router";
import { useLoaded } from "../../utils/Loader";
import { useEffect, useState } from "react";

export default function Orders({}) {
  const [order, setOrder] = useState([]);
  const [orderData, setOrderData] = useState([]);
  const [orderAmount, setOrderAmount] = useState(0);
  const loaded = useLoaded();
  const router = useRouter();

  const columns = [
    {
      field: "order_id",
      headerName: "Order ID",
      flex: 0.8,
      renderCell: (params) => {
        return (
          <Grid
            onClick={() => {
              router.push(`/orders/${orderData[params.row.id].order_id}`);
            }}
          >
            {params.value}
          </Grid>
        );
      },
    },
    {
      field: "pname",
      headerName: "Product Name",
      flex: 1.2,
      renderCell: (params) => {
        return (
          <Grid
            style={{ textAlign: "center" }}
            onClick={() => {
              router.push(`/orders/${orderData[params.row.id].order_id}`);
            }}
          >
            {params.value}
          </Grid>
        );
      },
    },
    {
      field: "phone_num",
      headerName: "Phone Number",
      flex: 1.2,
      renderCell: (params) => {
        const telStr =
          params.value.substring(0, 3) +
          "-" +
          params.value.substring(3, 6) +
          "-" +
          params.value.substring(6);
        return (
          <Grid
            className="text-center w-full"
            onClick={() => {
              router.push(`/orders/${orderData[params.row.id].order_id}`);
            }}
          >
            {telStr}
          </Grid>
        );
      },
    },
    {
      field: "actions",
      headerName: "Action",
      flex: 0.8,
      renderCell: (params) => {
        return (
          <Grid>
            <Typography
              style={{ color: "blue" }}
              onClick={() =>
                router.push(`/orders/${orderData[params.row.id].order_id}`)
              }
            >
              See More
            </Typography>
          </Grid>
        );
      },
    },
  ];

  async function getAllOrders() {
    const res = await API.orders.getAllOrders();
    if (res.status === 200) {
      var tempArr = [];
      res.data.map((data, index) => {
        const temp = {
          id: index,
          order_id: data.order_id,
          pname: data.pname,
          phone_num: data.phone_num,
        };
        tempArr.push(temp);
      });
      setOrder(tempArr);
      setOrderData(tempArr);
      setOrderAmount(tempArr.length);
    }
  }

  function onSearch(e) {
    const { value } = e.target;

    const searchedName = orderData.filter((data) =>
      data.pname.toLowerCase().includes(value.toLowerCase())
    );
    const searchedPhoneNum = orderData.filter((data) =>
      data.phone_num.includes(value)
    );

    const mergedSearched = [...searchedName, ...searchedPhoneNum];
    const searchedResults = [];
    mergedSearched.forEach((data, index) => {
      const find = searchedResults.find((item) => item.id === data.id);
      if (!find)
        searchedResults.push({
          id: index,
          order_id: data.order_id,
          pname: data.pname,
          phone_num: data.phone_num,
        });
    });

    setOrder(searchedResults);
  }

  useEffect(() => {
    getAllOrders();
  }, []);

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
                <Typography variant="h4">Order</Typography>

                <Typography>({orderAmount} order)</Typography>
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
            <Grid style={{ width: "100%", height: "500px", padding: "50px" }}>
              <DataGrid
                checkboxSelection
                rows={order}
                columns={columns}
                rowsPerPageOptions={[5, 10, 15, 20]}
                pageSize={10}
              />
            </Grid>
          </Grid>
        </NavBar>
      </>
    )
  );
}
