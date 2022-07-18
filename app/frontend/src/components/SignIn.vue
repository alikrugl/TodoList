<template>
  <form class="form-signin" @submit.prevent="signin">
    <div class="alert alert-danger" v-if="error">{{ error }}</div>
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
    <button type="submit" class="btn btn-primary mb-3">Sign in</button>
    <div>
      <p>
        Don't have an account?
        <router-link to="/signup">Sign up</router-link>
      </p>
    </div>
  </form>
</template>

<script>
export default {
  name: "SignIn",
  data() {
    return {
      email: "",
      password: "",
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
    signin() {
      this.plain
        .post("/signin", { email: this.email, password: this.password })
        .then((response) => this.signinSuccessful(response))
        .catch((error) => this.signinFailed(error));
    },
    signinSuccessful(response) {
      if (!response.data.csrf) {
        this.signinFailed(response);
        return;
      }
      localStorage.csrf = response.data.csrf;
      localStorage.signedIn = true;
      this.error = "";
      this.$router.replace("/");
    },
    signinFailed(error) {
      this.error =
        (error.response && error.response.data && error.response.data.error) ||
        "";
      delete localStorage.csrf;
      delete localStorage.signedIn;
    },
    checkSignedIn() {
      if (localStorage.signedIn) {
        this.$router.replace("/");
      }
    },
  },
};
</script>

<style lang="css">
.form-signin {
  width: 70%;
  max-width: 500px;
  padding: 10% 15px;
  margin: 0 auto;
}
p {
  line-height: 1rem;
}

.card {
  padding: 20px;
}

.form-group input {
  margin-bottom: 20px;
}

.login-page {
  align-items: center;
  display: flex;
  height: 100vh;

  h1 {
    margin-bottom: 1.5rem;
  }
}

.error {
  animation-name: errorShake;
  animation-duration: 0.3s;
}

@keyframes errorShake {
  0% {
    transform: translateX(-25px);
  }
  25% {
    transform: translateX(25px);
  }
  50% {
    transform: translateX(-25px);
  }
  75% {
    transform: translateX(25px);
  }
  100% {
    transform: translateX(0);
  }
}
</style>
