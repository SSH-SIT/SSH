const express = require("express");
const Router = express.Router();

const UserRoutes = require("./user-routes");
const AdminRoutes = require("./admin-routes");
const ProductRoutes = require("./product-routes");

Router.use(UserRoutes);

Router.use(ProductRoutes);

Router.use("/admin", AdminRoutes);

module.exports = Router;
