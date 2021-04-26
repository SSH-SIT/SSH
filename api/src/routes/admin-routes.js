const express = require("express");
const Router = express.Router();

const { Login, LogOut, SignUp } = require("../controllers/admin-controllers");

Router.post("/login", Login);
Router.post("/logout", Login);
Router.post("/logsignup", Login);

module.exports = Router
