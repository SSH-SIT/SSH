const Knex = require("../database/");
const sharp = require("sharp");

const getProduct = async (req, res) => {
  try {
    const product = await Knex("product")
      .fullOuterJoin("product_picture", {
        "product.pid": "product_picture.pid",
      })
      .innerJoin("product_type", {
        "product_type.type_id": "product.type_id",
      })
      .select("*", "product_type.type_name", "product.pid")
      .orderBy("product.pid", "asc");

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

    const product = await Knex("product")
      .fullOuterJoin("product_picture", {
        "product.pid": "product_picture.pid",
      })
      .innerJoin("product_type", {
        "product_type.type_id": "product.type_id",
      })
      .where({
        "product.pid": pid,
      })
      .select("*", "product_type.type_name", "product.pid")
      .orderBy("product.pid", "asc");
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
    const product_picture = req.file !== undefined ? req.file.buffer : null;
    var productPicBuffer;

    const {
      type_id = null,
      pname = null,
      price = null,
      description = null,
      color = null,
    } = productInfo;

    if (product_picture) {
      productPicBuffer = await sharp(product_picture)
        .resize({ width: 250, height: 250 })
        .png()
        .toBuffer();
    }

    const returnedID = await Knex("product")
      .insert({
        type_id,
        pname,
        price,
        description,
        color,
      })
      .returning("pid");
    const pid = returnedID[0];

    await Knex("product_picture").insert({
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
    const productInfo =
      req.body.productInfo !== undefined
        ? JSON.parse(req.body.productInfo)
        : {
            type_id: null,
            pname: null,
            price: null,
            description: null,
            color: null,
          };
    const product_picture = req.file !== undefined ? req.file.buffer : null;
    var productPicBuffer;

    const {
      type_id = null,
      pname = null,
      price = null,
      description = null,
      color = null,
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
    color ? (updatedProductTable["color"] = color) : null;

    if (
      type_id !== null ||
      pname !== null ||
      price !== null ||
      description !== null ||
      color !== null
    ) {
      var merge = ["pid"];

      type_id ? merge.push("type_id") : null;
      pname ? merge.push("pname") : null;
      price ? merge.push("price") : null;
      description ? merge.push("description") : null;
      color ? merge.push("color") : null;

      await Knex("product")
        .insert(updatedProductTable)
        .onConflict("pid")
        .merge(merge);
    }

    if (product_picture) {
      await Knex("product_picture")
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

    await Knex("product_picture").where({ pid }).delete();
    await Knex("product").where({ pid }).delete();

    return res.status(200).send({ msg: "Delete Product Successful." });
  } catch (err) {
    return res.status(400).send({ msg: err.message });
  }
};

const searchProduct = async (req, res) => {
  try {
    const { evidence } = req.body;

    const productFromName = await Knex("product")
      .fullOuterJoin("product_picture", {
        "product.pid": "product_picture.pid",
      })
      .where(Knex.raw(`LOWER(product.pname) LIKE LOWER('%${evidence}%')`));

    const productFromCategories = await Knex("product_type")
      .innerJoin("product", {
        "product.type_id": "product_type.type_id",
      })
      .fullOuterJoin("product_picture", {
        "product.pid": "product_picture.pid",
      })
      .select("*")
      .where(
        Knex.raw(`LOWER(product_type.type_name) LIKE LOWER('%${evidence}%')`)
      );

    const results = [...productFromName, ...productFromCategories];

    return res.status(200).send(results);
  } catch (err) {
    return res.status(400).send({ msg: err.message });
  }
};

const getProductFromFiltered = async (req, res) => {
  try {
    const {} = req.body;
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
  searchProduct,
  getProductFromFiltered,
};
