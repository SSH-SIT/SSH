import { Grid, Typography, TextField } from "@material-ui/core";
import { SearchOutlined } from "@material-ui/icons";
import NavBar from "../../components/NavBar";
import { DataGrid } from "@material-ui/data-grid";

import { useLoaded } from "../../utils/Loader";
import { useEffect, useState } from "react";

export default function Orders({}) {
  const [orderAmount, setOrderAmount] = useState(0);
  const loaded = useLoaded();

  const columns = [
    {
      field: "id",
      headerName: "Order ID",
      flex: 0.8,
      headerAlign: "center",
      align: "center",
      renderCell: (params) => {
        return (
          <Grid
            className="text-center w-full"
            onClick={() => {
              router.push(`/orders/${params.row.id}`);
            }}
          >
            {params.value}
          </Grid>
        );
      },
    },
    {
      field: "name",
      headerName: "Product Name",
      flex: 1.2,
      headerAlign: "center",
      align: "center",
      renderCell: (params) => {
        return (
          <Tooltip placement="bottom" title={params.value}>
            <Grid
              className="text-center w-full"
              onClick={() => {
                router.push(`/patient-history/${params.row.id}`);
              }}
            >
              {params.value}
            </Grid>
          </Tooltip>
        );
      },
    },
    {
      field: "phone_number",
      headerName: "Phone Number",
      flex: 1.2,
      headerAlign: "center",
      align: "center",
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
              router.push(`/patient-history/${params.row.id}`);
            }}
          >
            {telStr}
          </Grid>
        );
      },
    },
    {
      field: "actions",
      flex: 0.8,
      headerAlign: "center",
      align: "center",
      renderCell: (params) => {
        return (
          <Grid container direction="row" justify="center">
            <Grid item>
              <Typography
                onClick={() => router.push(`/orders/${params.row.id}`)}
              >
                See More
              </Typography>
            </Grid>
          </Grid>
        );
      },
    },
  ];

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
                  onChange={() => {}}
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
                rows={[]}
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
