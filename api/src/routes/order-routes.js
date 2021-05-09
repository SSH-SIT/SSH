const express = require("express");
const Router = express.Router();

const { getOneOrder, getOrder } = require("../controllers/order-controllers");

Router.get("/", getOrder);
Router.get("/:id", getOneOrder);

module.exports = Router;
