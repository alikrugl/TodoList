<template>
  <SessionManager />
</template>

<script>
import SessionManager from "@/components/SessionManager.vue";

export default {
  name: "App",
  components: {
    SessionManager,
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
