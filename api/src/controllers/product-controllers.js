const Knex = require("../database/");
const sharp = require("sharp");

const getProduct = async (req, res) => {
  try {
    const product = await Knex("Product")
      .fullOuterJoin("Product_Picture", {
        "Product.pid": "Product_Picture.pid",
      })
      .fullOuterJoin("Product_Type", {
        "Product_Type.type_ID": "Product.type_id",
      })
      .select("*")
      .orderBy("Product.pid", "asc");

    return res.status(200).send(product);
  } catch (err) {
    return res.status(400).send({
      msg: err.message,
    });
  }
};

const getOneProduct = async (req, res) => {
  try {
    const { pid } = req.params;

    const product = await Knex("Prodcut")
      .fullOuterJoin("Product_picture", {
        "Product.pid": "Product_Picture.pid",
      })
      .fullOuterJoin("Product_Type", {
        "Product_Type.type_id": "Product.type_id",
      })
      .where({
        pid: pid,
      })
      .select("*")
      .orderBy("Product.pid", "asc");
    return res.status(200).send(product);
  } catch (err) {
    return res.status(400).send({
      msg: err.message,
    });
  }
};

const createProduct = async (req, res) => {
  try {
    const productInfo = JSON.parse(req.body.productInfo);
    const product_picture =
      req.files["product_pictures"] !== undefined
        ? req.files["product_pictures"]
        : null;
    var productPicBuffer;

    const {
      type_id = null,
      pname = null,
      price = null,
      description = null,
    } = productInfo;

    if (product_picture) {
      productPicBuffer = await sharp(product_picture)
        .resize({ width: 250, height: 250 })
        .png()
        .toBuffer();
    }

    const returnedID = await Knex("Product")
      .insert({
        type_id,
        pname,
        price,
        description,
      })
      .returning("PID");
    const pid = returnedID[0];

    await Knex("Product_Picture").insert({
      pid,
      picture: productPicBuffer,
    });

    return res.status(200).send({ msg: "Create Product Successful" });
  } catch (err) {
    return res.status(400).send({ msg: err.message });
  }
};

const updateProduct = async (req, res) => {
  try {
    const { pid } = req.params;
    const productInfo = JSON.parse(req.body.productInfo);
    const product_picture =
      req.files["product_pictures"] !== undefined
        ? req.files["product_pictures"]
        : null;
    var productPicBuffer;

    const {
      type_id = null,
      pname = null,
      price = null,
      description = null,
    } = productInfo;

    if (product_picture) {
      productPicBuffer = await sharp(product_picture)
        .resize({ width: 250, height: 250 })
        .png()
        .toBuffer();
    }

    const updatedProductTable = {
      pid,
    };

    type_id ? (updatedProductTable["type_id"] = type_id) : null;
    pname ? (updatedProductTable["pname"] = pname) : null;
    price ? (updatedProductTable["price"] = price) : null;
    description ? (updatedProductTable["description"] = description) : null;

    if (
      type_id !== null ||
      pname !== null ||
      price !== null ||
      description !== null
    ) {
      await Knex("Product")
        .insert(updatedProductTable)
        .onConflict("pid")
        .merge(["pid", "type_id", "p_name", "price", "description"]);
    }

    if (product_picture) {
      await Knex("Product_Picture")
        .insert({
          pid,
          picture: productPicBuffer,
        })
        .onConflict("pid")
        .merge(["pid", "picture"]);
    }

    return res.status(201).send({ msg: "Update Product Success." });
  } catch (err) {
    return res.status(400).send({ msg: err.message });
  }
};

const deleteProduct = async (req, res) => {
  try {
    const { pid } = req.params;

    await Knex("Product_Picture").where({ pid }).delete();
    await Knex("Product").where({ pid }).delete();

    return res.status(200).send({ msg: "Delete Product Successful." });
  } catch (err) {
    return res.status(400).send({ msg: err.message });
  }
};

module.exports = {
  getProduct,
  getOneProduct,
  createProduct,
  updateProduct,
  deleteProduct,
};
