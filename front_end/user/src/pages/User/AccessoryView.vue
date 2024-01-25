<template>
  <div>
    <PageTemplate class="relative">
      <div>
        <div
          id="mainDiv"
          class="text-lg lg:text-2xl text-gray-500 mb-5 inline-block font-bold capitalize"
        >
          <span class="text-white">Phụ kiện</span>
        </div>
        <GridProductOrganisms
          class="w-full"
          :listProduct="listFiltered"
          :categorySlug="'categorySlug'"
        />
      </div>
    </PageTemplate>
  </div>
</template>
  
  <script>
import PageTemplate from "@/components/templates/PageTemplate.vue";
import GridProductOrganisms from "@/components/organisms/GridProductOrganisms.vue";
import CatService from "@/service/CatService";
import { scrollToTop } from "@/assets/js/quickFunction.js";

export default {
  name: "AccessorieView",
  data() {
    return {
      listProduct: [],
      listFiltered: [],
    };
  },
  methods: {
    async getAllCat() {
      CatService.getAllAccessory().then((res) => {
        if (res.data.length == 0) this.$router.push("/");
        this.listProduct = res.data;
        this.listFiltered = res.data;
      });
    },
  },
  components: {
    PageTemplate,
    GridProductOrganisms,
  },
  async created() {
    scrollToTop();

    await this.getAllCat();
    // this.selectedCategory = this.getSelectedCategory;
    // this.filterCat();
  },
};
</script>
  