import { securedAxiosInstance } from "@/backend/axios";
const api_url = "http://localhost:3000/api/v1/todos";

const state = {
  todos: [],
  error: "",
};

const getters = {
  allTodos: (state) => state.todos,
};
/*
            'fetchTodos',
            'deleteTodo',
            'updateTodo'
*/
const actions = {
  setError(error, text) {
    this.error =
      (error.response && error.response.data && error.response.data.error) ||
      text;
  },
  async fetchTodos({ commit }) {
    const response = await securedAxiosInstance.get(api_url);
    commit("setTodos", response.data);
  },
  async addTodo({ commit }, title) {
    const response = await securedAxiosInstance
      .post(api_url, {
        todo: {
          title,
          completed: false,
        },
      })
      .catch((error) => this.setError(error, "Cannot create ToDo"));
    commit("newTodo", response.data);
  },
  async deleteTodo({ commit }, id) {
    await securedAxiosInstance.delete(api_url + `/${id}`);
    commit("removeTodo", id);
  },
  async filterTodos({ commit }, event) {
    const limit = parseInt(
      event.target.options[event.target.options.selectedIndex].innerText
    );
    const response = await securedAxiosInstance.get(
      api_url + `?_limit=${limit}`
    );
    commit("setTodos", response.data);
  },
  async updateTodo({ commit }, updatedTodo) {
    const response = await securedAxiosInstance.put(
      api_url + `/${updatedTodo.id}`,
      updatedTodo
    );
    commit("setUpdatedTodo", response.data);
  },
};

const mutations = {
  setTodos: (state, todos) => (state.todos = todos),
  newTodo: (state, todo) => state.todos.unshift(todo),
  removeTodo: (state, id) =>
    (state.todos = state.todos.filter((todo) => todo.id !== id)),
  setUpdatedTodo: (state, updatedTodo) => {
    const index = state.todos.findIndex((todo) => todo.id === updatedTodo.id);
    if (index !== -1) {
      state.todos.splice(index, 1, updatedTodo);
    }
  },
};

export default {
  state,
  getters,
  actions,
  mutations,
};
