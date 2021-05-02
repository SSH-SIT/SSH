const express = require("express");
const dotenv = require("dotenv");
const cors = require("cors");

const routes = require("./src/routes");

if (process.env.NODE_ENV !== "production") dotenv.config();

const app = express();

app.use(
  cors({
    credentials: true,
    origin: [process.env.DEV_ENTRYPOINT_URL, process.env.ENTRYPOINT_URL],
    methods: ["GET", "PUT", "POST", "PATCH", "DELETE"],
  })
);
app.options(
  "*",
  cors({
    credentials: true,
    origin: [process.env.DEV_ENTRYPOINT_URL, process.env.ENTRYPOINT_URL],
    methods: ["GET", "PUT", "POST", "PATCH", "DELETE"],
  })
);

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(routes);

module.exports = app;
