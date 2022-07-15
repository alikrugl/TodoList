<template>
  <div id="app">
    <div id="nav">
      <router-link to="/">Todo App</router-link> |
      <router-link to="/signin">Sign In</router-link>
    </div>
    <div class="container">
      <h1>Todo List Manager</h1>
      <h6>Powered by: Vue 3 | Vuex 4 | Axios | Ruby on Rails 7 | PostgreSQL</h6>
      <router-view />
    </div>
  </div>
</template>

<script>
export default {
  name: "App",
};
</script>

<style>
body {
  font-family: "Franklin Gothic Medium", "Arial Narrow", "Arial", sans-serif;
  line-height: 1.9;
  background-color: #e8f7f0;
}

.container {
  max-width: 1100px;
  margin: auto;
  overflow: auto;
  padding: 0 2rem;
}
</style>
