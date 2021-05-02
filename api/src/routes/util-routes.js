const express = require("express");
const Router = express.Router();

const {
  getSaleOverview,
  topSellerProduct,
} = require("../controllers/util-controllers");

Router.get("/sale-overviews", getSaleOverview);

Router.get("/top-sellers", topSellerProduct);

module.exports = Router;
