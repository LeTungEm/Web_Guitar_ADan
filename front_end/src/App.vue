<template>
  <div>
    <!-- Admin -->
    <AdminTemplete v-if="isAdmin()">
      <router-view />
    </AdminTemplete>

    <!-- User -->
    <div v-else>
      <SubNavBarOrganism />
      <NavBarOrganism />
      <router-view />
      <footer-molecule />
    </div>
    <NotificationAtom
      :isWarning="getIsNotificationWarning"
      :status="getNotificationStatus"
      :text="getNotificationMessage"
    />
  </div>
</template>

<script>
import SubNavBarOrganism from "./components/organisms/SubNavBarOrganism.vue";
import NavBarOrganism from "./components/organisms/NavBarOrganism.vue";
import AdminTemplete from "./components/templates/AdminTemplete.vue";
import NotificationAtom from "./components/atoms/NotificationAtom.vue";
import { mapActions, mapGetters } from "vuex";
import FooterMolecule from "./components/molecules/FooterMolecule.vue";
export default {
  name: "App",
  components: {
    NavBarOrganism,
    SubNavBarOrganism,
    AdminTemplete,
    NotificationAtom,
    FooterMolecule,
  },
  computed: {
    ...mapGetters(["getNotificationStatus"]),
    ...mapGetters(["getNotificationMessage"]),
    ...mapGetters(["getIsNotificationWarning"]),
  },
  methods: {
    ...mapActions(["changeSocial"]),
    isAdmin() {
      if (this.$route.matched.some((route) => route.name == "admin")) {
        return true;
      }
      return false;
    },

    setSocial() {
      this.changeSocial({
        facebook: "https://www.facebook.com/bomguitar",
        tiktok: "",
        instagram: "",
        youtube: "",
        phone: "0898026487",
        zalo: "https://zalo.me/84898026487",
        messenger: "",
      });
    },
  },
  created() {
    this.setSocial();
  },
};
</script>

<style>
@tailwind base;
@tailwind components;
@tailwind utilities;

* {
  font-family: Playfair Display, serif;
}
.animation-ring {
  animation: shake 0.5s infinite;
}

@keyframes shake {
  0% {
    transform: rotate(0deg);
  }
  25% {
    transform: rotate(15deg);
  }
  50% {
    transform: rotate(0deg);
  }
  75% {
    transform: rotate(-15deg);
  }
  100% {
    transform: rotate(0deg);
  }
}
</style>




