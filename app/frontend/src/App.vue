<template>
  <div id="app">
    <div class="container">
      <div class="container" style="display: inline-block; float: right">
        <router-link
          class="routerButton"
          v-if="showAdminLink()"
          to="/admin/users"
          >Admin</router-link
        >
        <router-link class="routerButton" v-if="!signedIn()" to="/signin"
          >Sign In</router-link
        >
        <router-link class="routerButton" v-if="!signedIn()" to="/signup"
          >Sign Up</router-link
        >
        <label class="routerButton" v-if="signedIn()" @click="signOut"
          >Sign out</label
        >
      </div>
      <h1><a href="/">Todo List Manager</a></h1>
      <h6>Powered by: Vue 3 | Vuex 4 | Axios | Ruby on Rails 7 | PostgreSQL</h6>
      <router-view />
    </div>
  </div>
</template>

<script>
export default {
  name: "App",
  methods: {
    signedIn() {
      return this.$store.state.signedIn;
    },
    setError(error, text) {
      this.error =
        (error.response && error.response.data && error.response.data.error) ||
        text;
    },
    signOut() {
      this.secured
        .get("/logout")
        .then(() => {
          this.$store.commit("unsetCurrentUser");
          this.$router.replace("/signin");
        })
        .catch((error) => this.setError(error, "Cannot sign out"));
    },
    showAdminLink() {
      return this.$store.getters.isAdmin || this.$store.getters.isManager;
    },
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
h1 {
  text-decoration: none;
  font-style: italic;
  text-decoration-color: black;
}

a {
  text-decoration: none;
}

h1 a {
  color: black;
}

.routerButton {
  background-color: #41b883;
  border: 1px solid #ccc;
  color: black;
  border-radius: 8px;
  padding: 5px 10px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  cursor: pointer;
  position: relative;
}
</style>
