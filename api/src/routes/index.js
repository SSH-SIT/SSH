const express = require("express");
const Router = express.Router();

const UserRoutes = require("./user-routes");
const AdminRoutes = require("./admin-routes");
const ProductRoutes = require("./product-routes");
const UtilRoutes = require("./util-routes");

Router.use('/users', UserRoutes);

Router.use(ProductRoutes);

Router.use(UtilRoutes);

Router.use("/admin", AdminRoutes);

module.exports = Router;
