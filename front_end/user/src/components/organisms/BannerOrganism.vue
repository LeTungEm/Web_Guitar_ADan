<template>
  <div class="flex overflow-hidden">
    <img class="object-fill w-full" :src="`${doman}/back_end/api/Controllers/GetFileController.php?imgURL=/banner/banner.jpg&width=1700`" alt="meo">
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