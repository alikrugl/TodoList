<template>
  <div>
    <AddTodoItem />
    <FilterTodoItems />
    <h3>Todos</h3>
    <div class="legend">
      <span>Double click to mark as complete.</span>
      <span> <span class="incomplete-box"></span> = Incomplete </span>
      <span> <span class="complete-box"></span> = Complete </span>
    </div>
    <div class="todoItems">
      <div
        v-for="todo in allTodos"
        :key="todo.id"
        @dblclick="onDoubleClick(todo)"
        class="todoItem"
        v-bind:class="{ 'is-complete': todo.completed }"
      >
        <i
          v-if="todo.completed"
          @click="checkMarkSelect(todo)"
          class="fa fa-solid fa-check-double"
        ></i>
        {{ todo.title }}
        <i @click="deleteTodo(todo.id)" class="fas fa-trash-alt"></i>
      </div>
    </div>
  </div>
</template>
<script>
import { mapGetters, mapActions } from "vuex";
import AddTodoItem from "@/components/AddTodoItem";
import FilterTodoItems from "@/components/FilterTodoItems";

export default {
  name: "TodoItems",
  components: { AddTodoItem, FilterTodoItems },
  methods: {
    ...mapActions(["fetchTodos", "deleteTodo", "updateTodo"]),
    onDoubleClick(currentTodo) {
      const updatedTodo = {
        id: currentTodo.id,
        title: currentTodo.title,
        completed: !currentTodo.completed,
      };
      this.updateTodo(updatedTodo);
      event.preventDefault();
    },
    checkMarkSelect(currentTodo) {
      const updatedTodo = {
        id: currentTodo.id,
        title: currentTodo.title,
        completed: !currentTodo.completed,
      };
      this.updateTodo(updatedTodo);
      event.preventDefault();
    },
  },
  computed: {
    ...mapGetters(["allTodos"]),
  },
  created() {
    if (!localStorage.signedIn) {
      this.$router.replace("/signin");
    } else {
      this.fetchTodos();
    }
  },
};
</script>
<style>
.todoItems {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-gap: 1rem;
}

.todoItem {
  border: 1px solid #ccc;
  background: #41b883;
  padding: 1rem;
  border-radius: 5px;
  text-align: center;
  position: relative;
  cursor: pointer;
}
i {
  position: absolute;
  color: #fff;
  cursor: pointer;
}
i.fa {
  top: 10px;
  left: 10px;
}
i.fas {
  bottom: 10px;
  right: 10px;
}
.legend {
  display: flex;
  justify-content: space-around;
  margin-bottom: 1rem;
}
.complete-box {
  display: inline-block;
  width: 10px;
  height: 10px;
  background: #545b63;
}
.incomplete-box {
  display: inline-block;
  width: 10px;
  height: 10px;
  background: #41b882;
}
.is-complete {
  background: #545b63;
  color: #fff;
  text-decoration: line-through;
}
@media (max-width: 500px) {
  .todoItems {
    grid-template-columns: 1fr;
  }
}
</style>
