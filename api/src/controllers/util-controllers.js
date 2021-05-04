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
    const datas = await knex("order")
      .select(knex.raw(`order_id, uid, date_part('month', date) as month`))
      .groupByRaw("month")
      .groupBy("order_id");

    return res.status(200).send(datas);
  } catch (err) {
    return res.status(400).send({ msg: err.message });
  }
};

module.exports = {
  getSaleOverview,
  topSellerProduct,
};
