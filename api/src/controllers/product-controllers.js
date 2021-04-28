const Knex = require("../database/");

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

module.exports = {
  getProduct,
  getOneProduct,
};
