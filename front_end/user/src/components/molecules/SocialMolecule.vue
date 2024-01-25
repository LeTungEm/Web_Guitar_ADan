<template>
  <ul
    class="flex justify-center [&>*]:mr-2 text-md [&>*]:border [&>*]:border-white [&>*]:rounded-full [&>*]:w-5 [&>*]:h-5 [&>*]:flex [&>*]:justify-center [&>*]:items-center md:[&>*]:w-7 md:[&>*]:h-7"
  >
    <a :href="socialData.facebook" target="_blank" class="hover:bg-blue-700">
      <font-awesome-icon class="text-[10px] md:text-sm" :icon="['fab', 'facebook-f']" />
    </a>
    <a :href="socialData.tiktok" target="_blank" class="hover:bg-sky-500">
      <font-awesome-icon class="text-[10px] md:text-sm" :icon="['fab', 'tiktok']" />
    </a>
    <a :href="socialData.instagram" target="_blank" class="hover:bg-yellow-500">
      <font-awesome-icon class="text-[10px] md:text-sm" :icon="['fab', 'instagram']" />
    </a>
    <a :href="socialData.youtube" target="_blank" class="hover:bg-pink-500">
      <font-awesome-icon class="text-[10px] md:text-sm" :icon="['fab', 'youtube']" />
    </a>
  </ul>
</template>

<script>
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";

export default {
  name: "SocialMolecule",
  props:{
    socialData: Object,
  },
  components: {
    FontAwesomeIcon,
  },
};
</script>

<style>
</style>