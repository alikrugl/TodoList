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
          <td>
            {{ formatTime(user.created_at) }}
          </td>
          <td id="centered" v-if="showTodosLink()">
            <router-link :to="`/admin/users/${user.id}/todos`">
              <i style="color: black" class="fa-solid fa-list-ul"></i>
            </router-link>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import moment from "moment";
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
    formatTime(time_string) {
      return moment(String(time_string)).format(`DD/MM/YYYY hh:mm:ss`);
    },
  },
};
</script>
<style>
#centered {
  text-align: center;
  vertical-align: middle;
}

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

.alert .inner {
  display: block;
  padding: 6px;
  margin: 6px;
  border-radius: 3px;
  border: 1px solid rgb(180, 180, 180);
  background-color: rgb(212, 212, 212);
}

.alert .close {
  float: right;
  margin: 6px 20px 0px 0px;
  cursor: pointer;
}

.alert .inner,
.alert .close {
  color: rgb(88, 88, 88);
}

.alert input {
  display: none;
}

.alert input:checked ~ * {
  animation-name: dismiss, hide;
  animation-duration: 300ms;
  animation-iteration-count: 1;
  animation-timing-function: ease;
  animation-fill-mode: forwards;
  animation-delay: 0s, 100ms;
}

.alert.error .inner {
  border: 1px solid rgb(238, 211, 215);
  background-color: rgb(242, 222, 222);
}
.alert.error .inner,
.alert.error .close {
  color: rgb(185, 74, 72);
}
@keyframes dismiss {
  0% {
    opacity: 1;
  }
  90%,
  100% {
    opacity: 0;
    font-size: 0.1px;
    transform: scale(0);
  }
}

@keyframes hide {
  100% {
    height: 0px;
    width: 0px;
    overflow: hidden;
    margin: 0px;
    padding: 0px;
    border: 0px;
  }
}
</style>
