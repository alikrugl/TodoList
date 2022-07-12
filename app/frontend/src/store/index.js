import { createStore } from "vuex";
import todos from "@/store/modules/todos";
import sessionManager from "@/store/modules/session_manager";
export default createStore({
  modules: {
    todos,
    sessionManager,
  },
});
