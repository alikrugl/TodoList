<template>
  <form class="form-app form-forgot-password" @submit.prevent="submit">
    <div class="alert info" v-if="notice">
      <input type="checkbox" id="alert1" />
      <label class="close" title="close" for="alert1">
        <i style="color: black" class="fa-solid fa-xmark"></i>
      </label>
      <p class="inner">
        <strong>{{ notice }}</strong>
      </p>
    </div>
    <div class="alert error" v-if="error">
      <input type="checkbox" id="alert1" />
      <label class="close" title="close" for="alert1">
        <i style="color: black" class="fa-solid fa-xmark"></i>
      </label>
      <p class="inner">
        <strong>{{ error }}</strong>
      </p>
    </div>
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
    <button type="submit" class="btn btn-primary mb-3">Reset Password</button>
  </form>
</template>

<script>
export default {
  name: "ForgotPassword",
  data() {
    return {
      email: "",
      error: "",
      notice: "",
    };
  },
  methods: {
    submit() {
      this.plain
        .post("/password_resets", { email: this.email })
        .then(() => this.submitSuccessful())
        .catch((error) => this.submitFailed(error));
    },
    submitSuccessful() {
      this.notice = "Email with password reset instructions had been sent.";
      this.error = "";
      this.email = "";
    },
    submitFailed(error) {
      this.error =
        (error.response && error.response.data && error.response.data.error) ||
        "";
    },
  },
};
</script>
