<template>
  <div class="overflow-hidden">
    <div class="grid grid-cols-2 lg:grid-cols-3 gap-[5%] lg:gap-[10%]">
      <NewsItemMolecule
        v-for="product in listNew"
        :key="product"
        :newsData="product"
      />
    </div>
    <NewsPanigationMolecule
      class="my-5"
      @changePage="changePage"
      :length="listLength"
    />
  </div>
</template>
  
  <script>
import NewsPanigationMolecule from "../molecules/NewsPanigationMolecule.vue";
import NewsItemMolecule from "../molecules/NewsItemMolecule.vue";
export default {
  name: "GridProductOrganisms",
  props: {
    listNew: Array,
    listLength: Number,
  },
  methods: {
    changePage(currentPage) {
      this.$emit("changePage", currentPage);
    },
  },
  components: { NewsPanigationMolecule, NewsItemMolecule },
};
</script>
  
  <style>
</style>