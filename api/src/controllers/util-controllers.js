const knex = require("../database");

const getSaleOverview = async (req, res) => {
  try {
    const orders = await knex("order").select();
    var groupByMonth = {
      0: 0,
      1: 0,
      2: 0,
      3: 0,
      4: 0,
      5: 0,
      6: 0,
      7: 0,
      8: 0,
      9: 0,
      10: 0,
      11: 0,
    };

    orders.map((order) => {
      const tempMonth = new Date(order.date);
      const oldVal = groupByMonth[tempMonth.getMonth()];
      groupByMonth[tempMonth.getMonth()] = oldVal + 1;
    });

    return res.status(200).send(groupByMonth);
  } catch (err) {
    return res.status(400).send({ msg: err.message });
  }
};

const topSellerProduct = async (req, res) => {
  try {
    const products_id = await knex("order_details")
      .groupBy("pid")
      .orderBy(knex.sum({ total_amount: "amount" }), "desc")
      .limit(3)
      .select(knex.raw("pid, sum(amount) as total_amount"));

    var products_id_arr = [];
    var products_amount = [];
    products_id.map((id) => {
      products_id_arr.push(id.pid);
      products_amount.push(id.total_amount);
    });

    var products = await knex("product")
      .whereIn("product.pid", products_id_arr)
      .fullOuterJoin("product_picture", {
        "product.pid": "product_picture.pid",
      })
      .select("product.*", "product_picture.picture");

    products_amount.map((amount, index) => {
      products[index]["total_amount"] = amount;
    });

    return res.status(200).send(products);
  } catch (err) {
    return res.status(400).send({ msg: err.message });
  }
};

const amountOfProducts_alongwithCategories = async (req, res) => {
  try {
    const amount = await knex("product")
      .groupBy("type_id")
      .orderBy(knex.count("type_id"), "desc")
      .limit(3)
      .select(knex.raw("type_id, count(type_id) as amount"));

    const type_id = amount.map((val) => val.type_id);

    const amount_typeName = await knex("product_type")
      .whereIn("type_id", type_id)
      .select("type_name");

    amount_typeName.map(
      (val, index) => (amount[index]["type_name"] = val.type_name)
    );

    return res.status(200).send(amount);
  } catch (err) {
    return res.status(400).send({ msg: err.message });
  }
};

module.exports = {
  getSaleOverview,
  topSellerProduct,
  amountOfProducts_alongwithCategories,
};
