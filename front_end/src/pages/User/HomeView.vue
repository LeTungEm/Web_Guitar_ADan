<template>
  <div>
    <BannerOrganism />
    <PageTemplate class="relative">
      <div v-for="category in listCategory" :key="category" class="bg-white p-5 mb-5 shadow-md">
        <div class="text-lg lg:text-3xl font-bold capitalize">{{ category }}</div>
        <SwiperSliderOrganism />
      </div>
    </PageTemplate>
  </div>
</template>

<script>
import BannerOrganism from "@/components/organisms/BannerOrganism.vue";
import PageTemplate from "@/components/templates/PageTemplate.vue";
import SwiperSliderOrganism from '../../components/organisms/SwiperSliderOrganism.vue';

export default {
  name: "HomeView",
  data(){
    return {
      listCategory: ['Sản phẩm bán chạy','Sản phẩm mới','Guitar Classic','Guitar cổ'],
    };
  },
  components: { BannerOrganism, PageTemplate, SwiperSliderOrganism },
};
</script>

<style>
</style>