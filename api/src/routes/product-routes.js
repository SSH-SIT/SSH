const express = require("express");
const Router = express.Router();
const multer = require("multer");

const upload = multer({
  fileFilter(req, file, cb) {
    if (!file.originalname.match(/\.(jpg|jpeg|png)$/))
      return cb(new Error("Please upload picture"));

    cb(undefined, true);
  },
});
const {
  getProduct,
  getOneProduct,
  createProduct,
  updateProduct,
  deleteProduct,
} = require("../controllers/product-controllers");

Router.get("/product", getProduct);
Router.get("/product/:pid", getOneProduct);
Router.post("/product", upload.single("product_picture"), createProduct);
Router.patch("/product/:pid", upload.single("product_picture"), updateProduct);
Router.delete("/product/:pid", deleteProduct);

module.exports = Router;
