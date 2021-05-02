const express = require("express");
const Router = express.Router();

const { Login, LogOut, SignUp } = require("../controllers/admin-controllers");

Router.post("/login", Login);
Router.post("/logout", LogOut);
Router.post("/signup", SignUp);

module.exports = Router;
