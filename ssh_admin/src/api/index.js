import API_CONFIG from "../configuration/api";
import Axios from "axios";

import store from "../store";
const admin = store.getState().adminState.admin;

const Instance = Axios.create({
  baseURL: API_CONFIG.API_BASE_ENDPOINT,
  headers: { Authorization: `Bearer ${admin ? admin.token : ""}` },
});

export default Instance;
