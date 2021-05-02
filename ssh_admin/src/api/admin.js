import API from "../api";

export default {
  login: async (username, password) => {
    return API.post("/admin/login", { username, password })
      .then((res) => res)
      .catch((err) => err);
  },
  logout: async (username) => {
    return API.post("/admin/logout", { username })
      .then((res) => res)
      .catch((err) => err);
  },
};
