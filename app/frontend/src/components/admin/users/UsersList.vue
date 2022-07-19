<template>
  <div class="users">
    <div class="alert alert-danger" v-if="error">{{ error }}</div>
    <h3>Users</h3>
    <br />
    <table class="table" id="users">
      <thead>
        <tr>
          <th>ID</th>
          <th>Email</th>
          <th>Role</th>
          <th>Signed Up</th>
          <th v-if="showTodosLink()">Todos link</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="user in users" :key="user.id" :user="user">
          <th>{{ user.id }}</th>
          <td>{{ user.email }}</td>
          <td>{{ user.role }}</td>
          <td>{{ user.created_at }}</td>
          <td v-if="showTodosLink()">
            <router-link :to="`/admin/users/${user.id}/todos`">
              <i class="fa-solid fa-list"></i>
            </router-link>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  name: "UsersList",
  data() {
    return {
      error: "",
      users: [],
    };
  },
  created() {
    if (
      this.$store.state.signedIn &&
      (this.$store.getters.isAdmin || this.$store.getters.isManager)
    ) {
      this.secured
        .get("/admin/users")
        .then((response) => {
          this.users = response.data;
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
    showTodosLink() {
      return this.$store.getters.isAdmin;
    },
  },
};
</script>
<style>
#users {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#users td,
#users th {
  border: 1px solid #ddd;
  padding: 8px;
}

#users tr:nth-child(even) {
  background-color: #f2f2f2;
}

#users tr:hover {
  background-color: #ddd;
}

#users th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #41b883;
  color: white;
}
</style>
