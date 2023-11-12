<template>
  <div>
    <div :onclick="changeStatus" class="lg:hidden px-5 py-2 border uppercase text-center">
      Tìm kiếm nâng cao
    </div>
    <div
      v-bind:class="status ? '' : 'hidden lg:block'"
      class="border-2 shadow-md p-5"
    >
      <category-box-molecule
        :name="'danh mục'"
        :list="['dan loai 1', 'dan loai', 'dan loai moi', 'dan loai moi moi']"
      />
      <category-check-box-molecule
        :name="'hãng'"
        :list="['dan loai 1', 'dan loai', 'dan loai moi', 'dan loai moi moi']"
      />
      <category-box-molecule
        :name="'xuất sứ'"
        :list="['dan loai 1', 'dan loai', 'dan loai moi', 'dan loai moi moi']"
      />
      <category-box-molecule
        :name="'tình trạng'"
        :list="['dan loai 1', 'dan loai', 'dan loai moi', 'dan loai moi moi']"
      />
      <category-check-box-molecule
        :name="'giá'"
        :list="['dan loai 1', 'dan loai', 'dan loai moi', 'dan loai moi moi']"
      />
      <category-box-molecule
        :name="'danh cho'"
        :list="['chuyen nghiep', 'moi choi']"
      />
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import CategoryBoxMolecule from "../molecules/CategoryBoxMolecule.vue";
import CategoryCheckBoxMolecule from "../molecules/CategoryCheckBoxMolecule.vue";
// import PriceTextAtom from "../atoms/text/PriceTextAtom.vue";
export default {
  name: "FilterOrganism",
  data() {
    return {
      status: false,
    };
  },
  watch: {
    getSelectedCategory() {
      this.price = 1000000;
      this.selectedOption = 0;
    },
  },
  computed: {
    ...mapGetters(["getSelectedCategory"]),
  },
  // emits: ["changePriceOfRange", "changeOption"],
  methods: {
    changeStatus() {
      this.status = !this.status;
    },
  },
  components: { CategoryBoxMolecule, CategoryCheckBoxMolecule },
};
</script>

<style>
</style>