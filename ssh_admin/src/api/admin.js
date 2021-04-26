import API from "../api";

export default {
  login: async (username, password) => {
    return API.post("/login")
      .then((res) => res)
      .catch((err) => err);
  },
  logout: async (username) => {
    return API.post("/logout")
      .then((res) => res)
      .catch((err) => err);
  },
};
