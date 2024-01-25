<template>
  <div class="flex overflow-hidden h-[30vh] md:h-[50vh] lg:h-[90vh]">
    <img class="object-fill w-full" :src="`${doman}/back_end/api/Controllers/GetFileController.php?imgURL=/banner/banner.jpg`" alt="meo">
  </div>
</template>

<script>
import { DOMAN } from '@/assets/js/config';

export default {
  name: "BannerOrganism",
  data() {
    return {
      doman: DOMAN,
    };
  },
};
</script>

<style>
</style>