const Knex = require("../database/");

const getOrder = async (req, res) => {
  try {
    const { id } = req.params;
    const users = await Knex("order")
      .innerJoin("order_details", {
        "order.order_id": "order_details.order_id",
      })
      .where({
        "order.uid": id,
      })
      .select("*");

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
    const { id, order_id } = req.params;
    const users = await Knex("order")
      .innerJoin("order_details", {
        "order.order_id": "order_details.order_id",
      })
      .where({
        "order.uid": id,
        "order.order_id": order_id,
      })
      .select("*");

    return res.status(200).send(users);
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
};
