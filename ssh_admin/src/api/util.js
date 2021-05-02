import API from "../api";

export default {
  saleOverviews: async (req, res) => {
    return await API.get("/sale-overviews")
      .then((res) => res)
      .catch((err) => err);
  },
  topSellers: async (req, res) => {
    return await API.get("/top-sellers")
      .then((res) => res)
      .catch((err) => err);
  },
};
