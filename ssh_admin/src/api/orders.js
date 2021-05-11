import API from "../api";

export default {
  getAllOrders: async () => {
    return await API.get("/orders")
      .then((res) => res)
      .catch((err) => err);
  },
  getOneOrder: async (order_id) => {
    return await API.get(`/orders/${order_id}`)
      .then((res) => res)
      .catch((err) => err);
  },
};
