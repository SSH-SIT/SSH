import API from "../api";

export default {
  saleOverviews: async () => {
    return await API.get("/sale-overviews")
      .then((res) => res)
      .catch((err) => err);
  },
  topSellers: async () => {
    return await API.get("/top-sellers")
      .then((res) => res)
      .catch((err) => err);
  },
  amountOfProducts: async () => {
    return await API.get("/amount-of-products")
      .then((res) => res)
      .catch((err) => err);
  },
};
