<template>
  <div class="users">
    <form class="form-app form-edit" @submit.prevent="update">
      <div class="alert error" v-if="error">
        <input type="checkbox" id="alert1" />
        <label class="close" title="close" for="alert1">
          <i style="color: black" class="fa-solid fa-xmark"></i>
        </label>
        <p class="inner">
          <strong>{{ error }}</strong>
        </p>
      </div>
      <div class="alert info" v-if="notice">
        <input type="checkbox" id="alert1" />
        <label class="close" title="close" for="alert1">
          <i style="color: black" class="fa-solid fa-xmark"></i>
        </label>
        <p class="inner">
          <strong>{{ notice }}</strong>
        </p>
      </div>
      <div class="form-group">
        <label>Email address - {{ user.email }}</label>
      </div>
      <div class="form-group">
        <select v-model="user.role" class="form-control" id="role">
          <option value="admin">Admin</option>
          <option value="manager">Manager</option>
          <option value="user">User</option>
        </select>
      </div>
      <button type="submit" class="btn btn-primary mb-3">Update</button>
      <div>
        <router-link to="/admin/users">Users</router-link>
      </div>
    </form>
  </div>
</template>

<script>
export default {
  name: "UserEdit",
  data() {
    return {
      error: "",
      notice: "",
      user: {},
    };
  },
  created() {
    this.checkSignedIn();
  },
  methods: {
    update() {
      this.secured
        .patch(`/admin/users/${this.$route.params.id}`, {
          user: { role: this.user.role },
        })
        .then((response) => this.updateSuccessful(response))
        .catch((error) => this.updateFailed(error));
    },
    updateSuccessful() {
      this.notice = "User updated";
      this.error = "";
    },
    updateFailed(error) {
      this.error =
        (error.response && error.response.data && error.response.data.error) ||
        "";
      this.notice = "";
    },
    setError(error, text) {
      this.error =
        (error.response && error.response.data && error.response.data.error) ||
        text;
      this.notice = "";
    },
    checkSignedIn() {
      if (this.$store.state.signedIn && this.$store.getters.isAdmin) {
        this.secured
          .get(`/admin/users/${this.$route.params.id}`)
          .then((response) => {
            if (this.$store.getters.currentUserId === response.data.id) {
              this.$router.replace("/");
              return;
            }
            this.user = response.data;
          })
          .catch((error) => {
            this.setError(error, "Something went wrong");
          });
      } else {
        this.$router.replace("/");
      }
    },
  },
};
</script>
<style>
select {
  width: 30%;
  padding: 16px 20px;
  border: none;
  border-radius: 4px;
  background-color: #f1f1f1;
}
</style>
