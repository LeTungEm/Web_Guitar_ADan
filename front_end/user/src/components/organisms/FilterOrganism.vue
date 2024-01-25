<template>
  <div class="text-white backdrop-blur-sm">
    <div
      :onclick="changeStatus"
      class="lg:hidden px-5 py-2 border uppercase text-center"
    >
      Tìm kiếm nâng cao
    </div>
    <div
      v-bind:class="status ? '' : 'hidden lg:block'"
      class="border-2 shadow-md p-5"
    >
      <category-box-molecule
        @changOption="changeCategory"
        :name="'danh mục'"
        :list="listCategory"
      />
      <category-check-box-molecule @changOption="changeBrand" :name="'hãng'" :list="listBrand" />
      <category-box-molecule
        @changOption="changeOrigin"
        :name="'xuất sứ'"
        :list="listOrigin"
      />
      <category-box-molecule
        @changOption="changeStatusOfProduct"
        :name="'tình trạng'"
        :list="statusOfPro"
      />
      <category-box-molecule @changOption="changePrice" :name="'giá'" :list="listRangePrice" />
      <category-box-molecule
        @changOption="changeIsPro"
        :name="'danh cho'"
        :list="customerType"
      />
    </div>
  </div>
</template>

<script>
import { mapActions, mapGetters } from "vuex";
import CategoryBoxMolecule from "../molecules/CategoryBoxMolecule.vue";
import CategoryCheckBoxMolecule from "../molecules/CategoryCheckBoxMolecule.vue";
import CategoryService from "@/service/CategoryService";
import BrandService from "@/service/BrandService";
import OriginService from "@/service/OriginService";
// import PriceTextAtom from "../atoms/text/PriceTextAtom.vue";
export default {
  name: "FilterOrganism",
  data() {
    return {
      status: false,
      listCategory: [],
      statusOfPro: [
        {
          key: 0,
          name: "đã qua sử dụng",
        },
        {
          key: 1,
          name: "mới",
        },
      ],
      listRangePrice: [
        { key: 0, name: "dưới 2 triệu" },
        { key: 1, name: "từ 2 - 5 triệu" },
        { key: 2, name: "trên 5 triệu" },
      ],
      customerType: [
        { key: 0, name: "người mới" },
        { key: 1, name: "chuyên nghiệp" },
      ],
      listBrand: [],
      listOrigin: [],
      selectedCategory: null,
    };
  },
  watch: {
    getSelectedCategory() {
      this.getListCategory();
    },
  },
  computed: {
    ...mapGetters(["getSelectedCategory"]),
  },
  // emits: ["changePriceOfRange", "changeOption"],
  methods: {
    ...mapActions(["changeSelectedCategory"]),
    changeStatus() {
      this.status = !this.status;
    },
    changeOrigin(origin) {
      let originId = origin.key;
      this.$emit("changeOrigin", originId);
    },
    changeStatusOfProduct(status) {
      let statusId = status.key;
      this.$emit("changeStatusOfProduct", statusId);
    },
    changeIsPro(isPro) {
      let isProId = isPro.key;
      this.$emit("changeIsPro", isProId);
    },
    changeBrand(list) {
      this.$emit("changeBrand", list);
    },
    changePrice(price) {
      let priceId = price.key;
      this.$emit("changePrice", priceId);
    },
    changeCategory(category) {
      let globalCategory = this.getSelectedCategory;
      let newCategoryObject = {
        parent: {
          name: globalCategory.parent.name,
          slug: globalCategory.parent.slug,
        },
        child: { name: category.name, slug: category.key },
      };
      this.changeSelectedCategory(newCategoryObject);
      this.status = false;
    },
    getListCategory() {
      let category = this.getSelectedCategory;
      if (category != null) {
        CategoryService.getChildBySlug(category.parent.slug).then((res) => {
          this.listCategory = res.data;
        });
      }
    },
    getAllBrand() {
      BrandService.getAll().then((res) => {
        this.listBrand = res.data;
      });
    },
    getAllOrigin() {
      OriginService.getAll().then((res) => {
        this.listOrigin = res.data;
      });
    },
  },
  components: { CategoryBoxMolecule, CategoryCheckBoxMolecule },
  created() {
    this.getListCategory();
    this.getAllBrand();
    this.getAllOrigin();
  },
};
</script>

<style>
</style>