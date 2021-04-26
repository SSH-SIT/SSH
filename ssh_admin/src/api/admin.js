import API from "../api";

export default {
  login: async (username, password) => {
    return API.post("login")
      .then((res) => res)
      .catch((err) => err);
  },
};
