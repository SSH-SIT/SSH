const express = require("express");
const Router = express.Router();

const {
  getSaleOverview,
  topSellerProduct,
  amountOfProducts_alongwithCategories,
} = require("../controllers/util-controllers");

Router.get("/sale-overviews", getSaleOverview);

Router.get("/top-sellers", topSellerProduct);

Router.get("/amount-of-products", amountOfProducts_alongwithCategories);

module.exports = Router;
