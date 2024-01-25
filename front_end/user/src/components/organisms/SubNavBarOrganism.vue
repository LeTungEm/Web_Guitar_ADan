<template>
  <div v-if="hiddenNavBar()" class="hidden text-sm py-1 bg-gray-300 text-black lg:flex lg:justify-between lg:px-20 lg:items-center">
    <!-- <SubNavInfoMolecule /> -->
    <span>&nbsp;</span>
    <SocialMolecule :socialData="socialData" class="text-gray-600"/>
    <span>&nbsp;</span>
  </div>
</template>

<script>
import SocialMolecule from "../molecules/SocialMolecule.vue";
// import SubNavInfoMolecule from "../molecules/SubNavInfoMolecule.vue";

export default {
  components: { SocialMolecule },
  name: "SubNavBarOrganism",
  props:{
    socialData: Object
  },
  methods: {
    hiddenNavBar() {
      let result = true;
      let routerName = this.$route.name;
      if (routerName == "login" || routerName == 'checkout' || this.$route.matched.some(route => route.name == 'admin')) {
        result = false;
      }
      return result;
    },
  },
};
</script>

<style>
</style>