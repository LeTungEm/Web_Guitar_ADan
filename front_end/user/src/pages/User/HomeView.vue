<template>
  <div>
    <BannerOrganism />
    <PageTemplate class="relative">
      <div class="p-5 mb-5">
        <div class="text-white text-lg mb-5 lg:text-3xl font-bold capitalize">
          Sản phẩm bán chạy
        </div>
        <SwiperSliderOrganism :listGuitar="listBestSeller" />
      </div>
      <div class="p-5 mb-5">
        <div class="text-white text-lg mb-5 lg:text-3xl font-bold capitalize">Sản phẩm mới</div>
        <SwiperSliderOrganism :listGuitar="listNewProduct" />
      </div>
      <div class="p-5 mb-5">
        <div class="text-white text-lg mb-5 lg:text-3xl font-bold capitalize">
          Guitar Classic
        </div>
        <SwiperSliderOrganism :listGuitar="listClassic" />
      </div>
      <div class="p-5 mb-5">
        <div class="text-white text-lg mb-5 lg:text-3xl font-bold capitalize">Guitar Acoustic</div>
        <SwiperSliderOrganism :listGuitar="listOld" />
      </div>
    </PageTemplate>
  </div>
</template>

<script>
import BannerOrganism from "@/components/organisms/BannerOrganism.vue";
import PageTemplate from "@/components/templates/PageTemplate.vue";
import SwiperSliderOrganism from "../../components/organisms/SwiperSliderOrganism.vue";
import CatService from "@/service/CatService";

export default {
  name: "HomeView",
  data() {
    return {
      listCategory: [
        "Sản phẩm bán chạy",
        "Sản phẩm mới",
        "Guitar Classic",
        "Guitar cổ",
      ],
      listBestSeller: [],
      listNewProduct: [],
      listClassic: [],
      listOld: [],
    };
  },
  components: { BannerOrganism, PageTemplate, SwiperSliderOrganism },
  methods: {
    getBestSeller() {
      CatService.getBestSeller().then((res) => {
        this.listBestSeller = res.data;
      });
    },
    getNewProduct() {
      CatService.getNewProduct().then((res) => {
        this.listNewProduct = res.data;
      });
    },
    getClassic() {
      CatService.getAllParentChildByCategorySlug("guitar-classic").then(
        (res) => {
          this.listClassic = res.data;
        }
      );
    },
    getOld() {
      CatService.getAllParentChildByCategorySlug("guitar-acoustic").then((res) => {
        this.listOld = res.data;
      });
    },
  },
  created() {
    this.getBestSeller();
    this.getNewProduct();
    this.getClassic();
    this.getOld();
  },
};
</script>

<style>
</style>