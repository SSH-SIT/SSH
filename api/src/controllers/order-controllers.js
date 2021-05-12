const Knex = require("../database/");

const getOrder = async (req, res) => {
  try {
    const users = await Knex("order")
      .innerJoin("order_details", {
        "order.order_id": "order_details.order_id",
      })
      .innerJoin("product", {
        "order_details.pid": "product.pid",
      })
      .innerJoin("user", {
        "order.uid": "user.uid",
      })
      .select(
        "order.*",
        "order_details.*",
        "product.pname",
        "user.firstName",
        "user.lastName",
        "user.email",
        "user.phone_num"
      );

    return res.status(200).send(users);
  } catch (err) {
    return res.status(400).send({
      msg: err.message,
    });
  }
};
const getOneOrder = async (req, res) => {
  try {
    const { id } = req.params;
    const order = await Knex("order")
      .innerJoin("order_details", {
        "order.order_id": "order_details.order_id",
      })
      .innerJoin("product", {
        "product.pid": "order_details.pid",
      })
      .innerJoin("product_picture", {
        "product.pid": "product_picture.pid",
      })
      .innerJoin("product_type", {
        "product.type_id": "product_type.type_id",
      })
      .where({ "order.order_id": id })
      .select("*");

    return res.status(200).send(order);
  } catch (err) {
    return res.status(400).send({
      msg: err.message,
    });
  }
};
const getOneOrderFromUserID = async (req, res) => {
  try {
    const { uid } = req.params;
    const orders = await Knex("order")
      .innerJoin("order_details", {
        "order.order_id": "order_details.order_id",
      })
      .innerJoin("product", {
        "product.pid": "order_details.pid",
      })
      .innerJoin("product_picture", {
        "product.pid": "product_picture.pid",
      })
      .where({
        "order.uid": uid,
      })
      .select("*");

    return res.status(200).send(orders);
  } catch (err) {
    return res.status(400).send({
      msg: err.message,
    });
  }
};

module.exports = {
  getOrder,
  getOneOrder,
  getOneOrderFromUserID,
  getOneOrderFromUserID,
};
