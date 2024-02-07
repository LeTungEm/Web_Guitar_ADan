<template>
  <div
    class="backdrop-blur-sm m-[5%] lg:m-[10%] shadow-md rounded-sm border-2 hover:border-black duration-300"
  >
    <div v-html="newsData.short_description" class="relative [&>*]:max-w-[100%_!important] [&>*]:h-[unset_!important]"></div>
    <div class="p-3 text-center">
      <h1 class="block text-white text-[12px] md:text-xl font-bold capitalize">
        {{ newsData.name }}
      </h1>
    </div>
  </div>
</template>
  
  <script>
import { DOMAN } from "@/assets/js/config";

export default {
  name: "NewsItemMolecule",
  data() {
    return {
      doman: DOMAN,
    };
  },
  props: { newsData: Object },
};
</script>
  
  <style>
</style>