const express = require("express");
const Router = express.Router();

const {
  getUsers,
  getOneUsers,
  Login,
  LogOut,
  SignUp,
  BuyProduct,
} = require("../controllers/user-controllers");

Router.get("/", getUsers);
Router.get("/:id", getOneUsers);
Router.post("/login", Login);
Router.post("/logout", LogOut);
Router.post("/signup", SignUp);
Router.post("/buy", BuyProduct);

module.exports = Router;
