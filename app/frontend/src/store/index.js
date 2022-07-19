import { createStore } from "vuex";
import todos from "@/store/modules/todos";
import createPersistedState from "vuex-persistedstate";

export default createStore({
  state: {
    currentUser: {},
    signedIn: false,
    csrf: null,
  },
  modules: {
    todos,
  },
  mutations: {
    setCurrentUser(state, { currentUser, csrf }) {
      state.currentUser = currentUser;
      state.signedIn = true;
      state.csrf = csrf;
    },
    unsetCurrentUser(state) {
      state.currentUser = {};
      state.signedIn = false;
      state.csrf = null;
    },
    refresh(state, csrf) {
      state.signedIn = true;
      state.csrf = csrf;
    },
  },
  plugins: [createPersistedState()],
});
