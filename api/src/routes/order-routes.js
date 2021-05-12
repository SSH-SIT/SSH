const express = require("express");
const Router = express.Router();

const {
  getOneOrder,
  getOrder,
  getOneOrderFromUserID,
} = require("../controllers/order-controllers");

Router.get("/", getOrder);
Router.get("/:id", getOneOrder);
Router.get("/users/:uid", getOneOrderFromUserID);

module.exports = Router;
