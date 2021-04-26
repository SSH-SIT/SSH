import storeModel from "./models";

import { createStore, createTypedHooks } from "easy-peasy";

const { useStoreActions, useStoreDispatch, useStoreState } = createTypedHooks();
export { useStoreActions, useStoreDispatch, useStoreState };

export default createStore(storeModel, { name: "ssh-admin-store" });
