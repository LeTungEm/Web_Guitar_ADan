<template>
  <div>
    <PageTemplate class="relative">
      <div class="lg:flex gap-5">
        <FilterOrganism class="w-full mb-5 lg:mb-0 lg:w-fit" />
        <div>
          <div
            id="mainDiv"
            v-html="showLink()"
            class="text-lg lg:text-2xl text-gray-500 mb-5 inline-block font-bold capitalize"
          ></div>
          <GridProductOrganisms
            class="w-full"
            :listProduct="listFiltered"
            :productType="'meo'"
          />
        </div>
      </div>
    </PageTemplate>
  </div>
</template>

<script>
import PageTemplate from "@/components/templates/PageTemplate.vue";
import GridProductOrganisms from "@/components/organisms/GridProductOrganisms.vue";
import FilterOrganism from "@/components/organisms/FilterOrganism.vue";
import CatService from "@/service/CatService";
import { mapGetters } from "vuex";
import { scrollToTop } from "@/assets/js/quickFunction.js";

export default {
  name: "ShopView",
  data() {
    return {
      listProduct: [],
      listFiltered: [1, 1, 1, 1, 1, 1, 1],
      priceOfRange: null,
      selectedOption: 0,
      selectedCategory: null,
    };
  },
  watch: {
    getSelectedCategory(newValue) {
      this.selectedCategory = newValue;
      // this.priceOfRange = null;
      // this.selectedOption = 0;
      // this.filterCat();
      scrollToTop();
    },
  },
  computed: {
    ...mapGetters(["getSelectedCategory"]),
  },
  methods: {
    async getAllCat() {
      await CatService.getAll().then((res) => {
        this.listProduct = res.data;
        this.listFiltered = res.data;
      });
    },
    showLink() {
      let category = this.getSelectedCategory;
      let htmlText = "";
      if (category != null) {
        if (category.child != null) {
          htmlText += `<span>${category.parent.name}&nbsp;/&nbsp;</span><span class='text-black'>${category.child.name}</span>`;
        } else {
          htmlText += `<span class='text-black'>${category.parent.name}</span>`;
        }
      }
      return htmlText;
    },
    // filterCat() {
    //   this.listFiltered = this.listProduct;

    //   if (this.selectedCategory != null) {
    //     this.listFiltered = this.listFiltered.filter(
    //       (cat) => cat.category_id == this.selectedCategory.category_id
    //     );
    //   }

    //   if (this.priceOfRange != null) {
    //     this.listFiltered = this.listFiltered.filter(
    //       (cat) => this.filterByPrice(cat) == true
    //     );
    //   }

    //   this.sortListCat(this.listFiltered);
    // },

    // sortListCat(listCat) {
    //   let self = this;
    //   if (this.selectedOption == 0) {
    //     listCat.sort(function (a, b) {
    //       return self.getCurrentPrice(a) - self.getCurrentPrice(b);
    //     });
    //   } else if (this.selectedOption == 1) {
    //     listCat.sort(function (a, b) {
    //       return self.getCurrentPrice(b) - self.getCurrentPrice(a);
    //     });
    //   } else if (this.selectedOption == 2) {
    //     this.listFiltered = listCat.filter(
    //       (cat) => cat.gender == 1 || cat.gender == 2
    //     );
    //   } else if (this.selectedOption == 3) {
    //     this.listFiltered = listCat.filter(
    //       (cat) => cat.gender == 0 || cat.gender == 2
    //     );
    //   }
    // },

    // filterByPrice(cat) {
    //   if (
    //     this.getCurrentPrice(cat) >= parseInt(this.priceOfRange) &&
    //     this.getCurrentPrice(cat) <= parseInt(this.priceOfRange) + 20000000
    //   ) {
    //     return true;
    //   } else {
    //     return false;
    //   }
    // },

    // getCurrentPrice(cat) {
    //   if (cat.new_price > 0) return cat.new_price;
    //   else return cat.price;
    // },

    // changePriceOfRange(priceOfRange) {
    //   this.priceOfRange = priceOfRange;
    //   this.filterCat();
    // },

    // changeOption(selectedOption) {
    //   this.selectedOption = selectedOption;
    //   this.filterCat();
    // },
  },
  components: {
    PageTemplate,
    GridProductOrganisms,
    FilterOrganism,
  },
  async created() {
    // await this.getAllCat();
    // this.selectedCategory = this.getSelectedCategory;
    // this.filterCat();
  },
};
</script>
