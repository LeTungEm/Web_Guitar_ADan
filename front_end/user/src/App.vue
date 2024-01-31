<template>
  <div class="background-image" :style="`background-image: url(${doman}/back_end/api/Controllers/GetFileController.php?imgURL=/background/background.jpg&width=1700);`">
    <div>
      <SubNavBarOrganism :socialData="social" />
      <NavBarOrganism :socialData="social" />
      <router-view />
      <footer-molecule :socialData="social" />
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
import NotificationAtom from "./components/atoms/NotificationAtom.vue";
import { mapActions, mapGetters } from "vuex";
import FooterMolecule from "./components/molecules/FooterMolecule.vue";
import SettingService from "./service/SettingService";
import { DOMAN } from "./assets/js/config";
export default {
  name: "App",
  data() {
    return {
      social: {},
      doman: DOMAN
    };
  },
  components: {
    NavBarOrganism,
    SubNavBarOrganism,
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
    // isAdmin() {
    //   if (this.$route.matched.some((route) => route.name == "admin")) {
    //     return true;
    //   }
    //   return false;
    // },

    setSocial() {},
  },
  async created() {
    // this.setSocial();
    await SettingService.getAll().then(async (res) => {
      let social = {
        facebook: res.data.facebook,
        tiktok: res.data.tiktok,
        instagram: res.data.instagram,
        youtube: res.data.youtube,
        phone: "0" + res.data.phone,
        zalo: res.data.zalo,
        messenger: res.data.messenger,
        client_respons: res.data.client_respons,
        footer_content: res.data.footer_content,
      };
      await this.changeSocial(social);
      this.social = social;
    });
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
p{
  background-color: transparent !important;
  color: white !important;
}
.animation-ring {
  animation: shake 0.5s infinite;
}

.background-image{
  background-repeat: no-repeat;
  background-size: cover;
  background-attachment: fixed;
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




