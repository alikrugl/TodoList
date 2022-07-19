import { createWebHistory, createRouter } from "vue-router";
import Signin from "@/components/SignIn";
import Signup from "@/components/SignUp";
import TodoItems from "@/components/TodoItems";
import UsersList from "@/components/admin/users/UsersList";
import UserTodoItems from "@/components/admin/users/todos/UserTodoItems";

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
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
