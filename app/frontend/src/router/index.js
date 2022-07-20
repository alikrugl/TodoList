import { createWebHistory, createRouter } from "vue-router";
import Signin from "@/components/SignIn";
import Signup from "@/components/SignUp";
import TodoItems from "@/components/TodoItems";
import UsersList from "@/components/admin/users/UsersList";
import UserTodoItems from "@/components/admin/users/todos/UserTodoItems";
import ForgotPassword from "@/components/ForgotPassword";
import ResetPassword from "@/components/ResetPassword";
import UserEdit from "@/components/admin/users/Edit";

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
  {
    path: "/admin/users",
    name: "UsersList",
    component: UsersList,
  },
  {
    path: "/admin/users/:id/todos",
    name: "UserTodoItems",
    component: UserTodoItems,
  },
  {
    path: "/forgot_password",
    name: "ForgotPassword",
    component: ForgotPassword,
  },
  {
    path: "/password_resets/:token",
    name: "ResetPassword",
    component: ResetPassword,
  },
  {
    path: "/admin/users/:id",
    name: "UserEdit",
    component: UserEdit,
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
