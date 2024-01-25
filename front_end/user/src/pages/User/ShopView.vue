<template>
  <div>
    <PageTemplate class="relative">
      <div class="lg:flex gap-5">
        <FilterOrganism
          @changeOrigin="changeOrigin"
          @changeStatusOfProduct="changeStatusOfProduct"
          @changeIsPro="changeIsPro"
          @changeBrand="changeBrand"
          @changePrice="changePrice"
          class="w-full mb-5 lg:mb-0 lg:w-fit"
        />
        <div class="w-full">
          <div
            id="mainDiv"
            v-html="showLink()"
            class="text-lg lg:text-2xl text-gray-500 mb-5 inline-block font-bold capitalize"
          ></div>
          <GridProductOrganisms
            class="w-full"
            :listProduct="listFiltered"
            :categorySlug="categorySlug"
          />
          <div
            class="w-full sticky top-[300px]"
            v-if="listFiltered.length == 0"
          >
            <div
              class="text-lg text-center text-gray-500 lg:text-2xl mb-5 font-bold capitalize"
            >
              Sản phẩm với các tiêu chí đã chọn đang cập nhật
            </div>
            <div
              :onclick="toShop"
              class="text-base text-center lg:text-lg text-orange-700 font-bold capitalize underline"
            >
              Tiếp tục mua tại đây
            </div>
          </div>
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
import { mapActions, mapGetters } from "vuex";
import { scrollToTop } from "@/assets/js/quickFunction.js";

export default {
  name: "ShopView",
  data() {
    return {
      listProduct: [],
      listFiltered: [],
      priceOfRange: null,
      selectedOption: 0,
      selectedCategory: null,
      categorySlug: "",
      origin: null,
      statusOfProduct: null,
      isProId: null,
      priceId: null,
      pickedBrand: [],
    };
  },
  watch: {
    "$route.params.categorySlug": {
      immediate: true,
      handler(newParam, oldParam) {
        if (newParam !== oldParam && oldParam != undefined) {
          this.getAllCat();
          scrollToTop();
        }
      },
    },
    origin: function (newValue) {
      if (newValue != null) {
        this.filterProduct();
      }
    },
    statusOfProduct: function (newValue) {
      if (newValue != null) {
        this.filterProduct();
      }
    },
    isProId: function (newValue) {
      if (newValue != null) {
        this.filterProduct();
      }
    },
    priceId: function (newValue) {
      if (newValue != null) {
        this.filterProduct();
      }
    },
    pickedBrand: function () {
      this.filterProduct();
    },
  },
  computed: {
    ...mapGetters(["getSelectedCategory"]),
  },
  methods: {
    ...mapActions(["changeSelectedCategory"]),

    toShop() {
      let currentCate = this.getSelectedCategory;
      let newCate = { parent: currentCate.parent, child: null };
      console.log(newCate);
      this.changeSelectedCategory(newCate);
    },

    async getAllCat() {
      let category = this.$route.params.categorySlug;
      let products = [];
      // if (category != null) {
      //   if (category.child != null) {
      //     let currenSlug = category.child.slug;
      //     products = await this.getAllByChildCategory(currenSlug);
      //   } else {
      //     let currenSlug = category.parent.slug;
      //   }
      // }
      products = await this.getAllParentChild(category);
      // if (products.length == 0) this.$router.push("/");
      this.listProduct = products;
      this.listFiltered = products;
    },
    changeOrigin(origin) {
      this.origin = origin;
    },
    changeStatusOfProduct(statusOfProduct) {
      this.statusOfProduct = statusOfProduct;
    },
    changeIsPro(isProId) {
      this.isProId = isProId;
    },
    changeBrand(list) {
      this.pickedBrand = list;
    },
    changePrice(priceId) {
      this.priceId = priceId;
    },
    async getAllByChildCategory(slug) {
      let result = await CatService.getAllCatByCategorySlug(slug);
      return result.data;
    },
    async getAllParentChild(slug) {
      let result = await CatService.getAllParentChildByCategorySlug(slug);
      return result.data;
    },
    showLink() {
      let category = this.getSelectedCategory;
      let htmlText = "";
      if (category != null) {
        if (category.child != null) {
          this.categorySlug = category.child.slug;
          htmlText += `<span>${category.parent.name}&nbsp;/&nbsp;</span><span class='text-black'>${category.child.name}</span>`;
        } else {
          this.categorySlug = category.parent.slug;
          htmlText += `<span class='text-black'>${category.parent.name}</span>`;
        }
      }
      return htmlText;
    },
    filterProduct() {
      let result = this.listProduct;

      if (this.origin != null) {
        result = result.filter((product) => product.origin == this.origin);
      }
      if (this.statusOfProduct != null) {
        result = result.filter(
          (product) => product.status == this.statusOfProduct
        );
      }
      if (this.isProId != null) {
        result = result.filter((product) => product.isProfes == this.isProId);
      }

      if (this.priceId != null) {
        result = this.filterByPrice(result);
      }

      if (this.pickedBrand.length > 0) {
        result = result.filter(
          (product) => this.isIncludeBrand(product.brand) == true
        );
      }
      // this.sortListCat(this.listFiltered);
      this.listFiltered = result;
    },

    filterByPrice(list) {
      console.log("filter by price");
      let result = list;
      switch (this.priceId) {
        case 0:
          console.log("case 0");
          result = result.filter(
            (product) =>
              (product.new_price > 0 ? product.new_price : product.price) <
              2000000
          );
          break;
        case 1:
          console.log("case 1");

          result = result.filter(
            (product) =>
              (product.new_price > 0 ? product.new_price : product.price) >=
                2000000 &&
              (product.new_price > 0 ? product.new_price : product.price) <=
                5000000
          );
          break;
        case 2:
          console.log("case 2");

          result = result.filter(
            (product) =>
              (product.new_price > 0 ? product.new_price : product.price) >
              5000000
          );
          break;
        default:
          break;
      }
      return result;
    },

    isIncludeBrand(brandId) {
      let result = false;
      this.pickedBrand.map((item) => {
        // console.log(item.toString() == brandId.toString());
        if (item.toString() == brandId.toString()) result = true;
      });
      // console.log("chay");
      return result;
    },
  },
  components: {
    PageTemplate,
    GridProductOrganisms,
    FilterOrganism,
  },
  async created() {
    scrollToTop();

    await this.getAllCat();
  },
};
</script>
