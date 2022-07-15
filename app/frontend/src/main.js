import { createApp } from "vue";
import App from "./App.vue";
import store from "./store";
import router from "./router";
import VueAxios from "vue-axios";
import { securedAxiosInstance, plainAxiosInstance } from "./backend/axios";

createApp(App)
  .use(store)
  .use(router)
  .use(VueAxios, { secured: securedAxiosInstance, plain: plainAxiosInstance })
  .mount("#app");
