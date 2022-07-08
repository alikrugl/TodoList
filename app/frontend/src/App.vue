<template>
  <div id="app">
    <div class="container">
      <h1>Todo List Manager</h1>
      <h6>Powered by: Vue 3 | Vuex 4 | Axios | Ruby on Rails 7 | PostgreSQL</h6>
      <AddTodoItem />
      <FilterTodoItems />
      <TodoItems />
    </div>
  </div>
</template>

<script>
import TodoItems from "@/components/TodoItems.vue";
import AddTodoItem from "@/components/AddTodoItem.vue";
import FilterTodoItems from "@/components/FilterTodoItems.vue";

export default {
  name: "App",
  components: {
    TodoItems,
    AddTodoItem,
    FilterTodoItems,
  },
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
