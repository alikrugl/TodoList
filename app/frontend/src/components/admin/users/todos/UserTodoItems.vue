<template>
  <div class="users">
    <div class="alert error" v-if="error">
      <input type="checkbox" id="alert1" />
      <label class="close" title="close" for="alert1">
        <i style="color: black" class="fa-solid fa-xmark"></i>
      </label>
      <p class="inner">
        <strong>{{ error }}</strong>
      </p>
    </div>
    <h3>User Todos</h3>
    <br />
    <table class="table" id="user_todos">
      <thead>
        <tr>
          <th>ID</th>
          <th>User ID</th>
          <th>Title</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="todo in todos" :key="todo.id" :todo="todo">
          <th>{{ todo.id }}</th>
          <td>{{ todo.user_id }}</td>
          <td>{{ todo.title }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  name: "UserTodosList",
  data() {
    return {
      error: "",
      todos: [],
    };
  },
  created() {
    if (this.$store.state.signedIn && this.$store.getters.isAdmin) {
      this.secured
        .get(`/admin/users/${this.$route.params.id}/todos`)
        .then((response) => {
          this.todos = response.data;
        })
        .catch((error) => {
          this.setError(error, "Something went wrong");
        });
    } else {
      this.$router.replace("/");
    }
  },
  methods: {
    setError(error, text) {
      this.error =
        (error.response && error.response.data && error.response.data.error) ||
        text;
    },
  },
};
</script>
<style>
#user_todos {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}
#user_todos td,
#user_todos th {
  border: 1px solid #ddd;
  padding: 8px;
}
#user_todos tr:nth-child(even) {
  background-color: #f2f2f2;
}

#user_todos tr:hover {
  background-color: #ddd;
}

#user_todos th {
  padding-top: 12px;
  padding-bottom: 12px;
  background-color: #41b883;
  color: white;
}
</style>
