<template>
  <swiper
  v-if="listGuitar.length > 0"
    :navigation="true"
    :breakpoints="{
      0: {
        slidesPerView: 2,
        spaceBetween: 10,
      },
      320: {
        slidesPerView: 3,
        spaceBetween: 10,
      },
      1000: {
        slidesPerView: 5,
        spaceBetween: 20,
      },
    }"
    :modules="modules"
    :autoplay="{
      delay: 2500,
      disableOnInteraction: false,
    }"
    class="mySwiper z-[0_!important]"
  >
    <swiper-slide v-for="guitar in listGuitar" :key="guitar">
      <ProductCardMolecule :product="guitar" />
    </swiper-slide>
  </swiper>
</template>
    <script>
// Import Swiper Vue.js components
import { Swiper, SwiperSlide } from "swiper/vue";

// Import Swiper styles
import "swiper/css";

import "swiper/css/navigation";

// import required modules
import { Navigation, Autoplay } from "swiper/modules";
import ProductCardMolecule from "../molecules/ProductCardMolecule.vue";

export default {
  name: "SwiperSliderOrganism",
  props:{
    listGuitar: Array,
  },
  components: {
    Swiper,
    SwiperSlide,
    ProductCardMolecule,
  },
  setup() {
    return {
      modules: [Navigation, Autoplay],
    };
  },
};
</script>
  <style scope>
.swiper-button-prev,
.swiper-button-next {
  color: black;
}
.mySwiper{
  display: grid !important;
}
</style>
    