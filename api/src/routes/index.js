const express = require("express");
const Router = express.Router();

const UserRoutes = require("./user-routes");
const AdminRoutes = require("./admin-routes");
const ProductRoutes = require("./product-routes");
const UtilRoutes = require("./util-routes");
const OrderRoutes = require("./order-routes");

Router.use("/admin", AdminRoutes);

Router.use("/users", UserRoutes);

Router.use("/product", ProductRoutes);

Router.use("/orders", OrderRoutes);

Router.use(UtilRoutes);

module.exports = Router;
