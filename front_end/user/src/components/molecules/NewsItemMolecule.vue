<template>
  <div
    class="relative backdrop-blur-sm flex flex-col w-full h-full shadow-md rounded-sm border-2 hover:border-black duration-300"
  >
    <div v-html="newsData.short_description" class="relative [&>*]:max-w-[100%_!important]"></div>
    <div class="flex flex-col flex-1 justify-between p-3 text-center">
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