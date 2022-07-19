<template>
  <div class="alert error" v-if="error">
    <input type="checkbox" id="alert1" />
    <label class="close" title="close" for="alert1">
      <i style="color: black" class="fa-solid fa-xmark"></i>
    </label>
    <p class="inner">
      <strong>{{ error }}</strong>
    </p>
  </div>
  <h3>Sign Up</h3>
  <p>Please fill in this form to create an account.</p>
  <form class="form-signup" @submit.prevent="signup">
    <div class="form-group">
      <label for="email">Email address</label>
      <input
        v-model="email"
        type="email"
        class="form-control"
        id="email"
        placeholder="email@example.com"
      />
    </div>
    <div class="form-group">
      <label for="password">Password</label>
      <input
        v-model="password"
        type="password"
        class="form-control"
        id="password"
        placeholder="Password"
      />
    </div>
    <div class="form-group">
      <label for="password">Password Confirmation</label>
      <input
        v-model="password_confirmation"
        type="password"
        class="form-control"
        id="password_confirmation"
        placeholder="Password Confirmation"
      />
    </div>
    <button type="submit" class="signupbtn">Sign up</button>
    <div>
      <p>
        Already have an account?
        <router-link to="/signin">Sign in</router-link>
      </p>
    </div>
  </form>
</template>

<script>
export default {
  name: "SignUp",
  data() {
    return {
      email: "",
      password: "",
      password_confirmation: "",
      error: "",
    };
  },
  created() {
    this.checkSignedIn();
  },
  updated() {
    this.checkSignedIn();
  },
  methods: {
    signup() {
      this.plain
        .post("/signup", {
          email: this.email,
          password: this.password,
          password_confirmation: this.password_confirmation,
        })
        .then((response) => this.signupSuccessful(response))
        .catch((error) => this.signupFailed(error));
    },
    signupSuccessful(response) {
      if (!response.data.csrf) {
        this.signupFailed(response);
        return;
      }
      this.plain
        .get("/user_info")
        .then((infoResponse) => {
          this.$store.commit("setCurrentUser", {
            currentUser: infoResponse.data,
            csrf: response.data.csrf,
          });
          this.error = "";
          this.$router.replace("/");
        })
        .catch((error) => this.signinFailed(error));
    },
    signupFailed(error) {
      this.error =
        (error.response && error.response.data && error.response.data.error) ||
        "Something went wrong";
      this.$store.commit("unsetCurrentUser");
    },
    checkSignedIn() {
      if (this.$store.state.signedIn) {
        this.$router.replace("/");
      }
    },
  },
};
</script>

<style lang="css">
.form-signup {
  width: 70%;
  max-width: 500px;
  padding: 5% 15px;
  margin: 0 auto;
}

/* Full-width input fields */
input[type="email"],
input[type="password"] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type="email"]:focus,
input[type="password"]:focus {
  background-color: #ddd;
  outline: none;
}

button {
  background-color: #04aa6d;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

button:hover {
  opacity: 1;
}
</style>
