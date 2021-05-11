import API from "../api";

export default {
  getAllOrders: async () => {
    return await API.get("/orders")
      .then((res) => res)
      .catch((err) => err);
  },
};
