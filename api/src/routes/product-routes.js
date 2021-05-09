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
  searchProduct,
} = require("../controllers/product-controllers");

Router.get("/", getProduct);
Router.get("/:pid", getOneProduct);
Router.post("/product", upload.single("product_picture"), createProduct);
Router.patch("/:pid", upload.single("product_picture"), updateProduct);
Router.delete("/:pid", deleteProduct);
Router.post("/search", searchProduct);

module.exports = Router;
