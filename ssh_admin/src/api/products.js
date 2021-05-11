import API from "../api";

export default {
  getAllProducts: async () => {
    return await API.get("/product")
      .then((res) => res)
      .catch((err) => err);
  },
  getOneProduct: async (id) => {
    return await API.get(`/product/${id}`)
      .then((res) => res)
      .catch((err) => err);
  },
};
