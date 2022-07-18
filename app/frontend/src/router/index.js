import { createWebHistory, createRouter } from "vue-router";
import Signin from "@/components/SignIn";
import Signup from "@/components/SignUp";
import TodoItems from "@/components/TodoItems";

const routes = [
  {
    path: "/",
    name: "Todo Items",
    component: TodoItems,
  },
  {
    path: "/signin",
    name: "Signin",
    component: Signin,
  },
  {
    path: "/signup",
    name: "Signup",
    component: Signup,
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
