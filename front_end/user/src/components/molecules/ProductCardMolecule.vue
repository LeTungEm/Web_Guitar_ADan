<template>
  <div
    :onclick="toDetail"
    class="relative flex flex-col w-full h-full shadow-md rounded-sm border-2 hover:border-black hover:shadow-lg duration-300"
  >
    <div class="relative">
      <img
        class="rounded-sm object-center object-cover bg-white w-full"
        :src="`${doman}/back_end/api/Controllers/GetFileController.php?imgURL=${image}&width=400`"
        :alt="product.name"
      />
    </div>
    <div class="flex flex-col flex-1 backdrop-blur-sm justify-between p-3 text-center">
      <div>
        <h1 class="text-white block text-[12px] md:text-xl font-bold capitalize">
          {{ product.name }}
        </h1>
        <div class="text-gray-400 text-[12px] md:text-lg lowercase">
          {{ product.category_name }}
        </div>
      </div>
      <div class="flex flex-wrap justify-center gap-x-2 italic">
        <PriceTextAtom
          class="text-[12px] lg:text-2xl text-white"
          :minPrice="product.new_price > 0 ? product.new_price : product.price"
          :maxPrice="product.new_price > 0 ? product.new_price : product.price"
        />
        <PriceTextWLineThroughAtom
          class="text-[10px] lg:text-lg"
          :minPrice="product.new_price > 0 ? product.price : 0"
          :maxPrice="product.new_price > 0 ? product.price : 0"
        />
      </div>
    </div>
  </div>
</template>

<script>
import { DOMAN } from "@/assets/js/config";
import PriceTextAtom from "../atoms/text/PriceTextAtom.vue";
import PriceTextWLineThroughAtom from "../atoms/text/PriceTextWLineThroughAtom.vue";

export default {
  name: "ProductCardMolecule",
  data() {
    return {
      doman: DOMAN,
      currentPrice: 0,
      oldPrice: 0,
      image: "",
    };
  },
  props: {
    product: Object,
    categorySlug: String,
  },
  methods: {
    getCurrentPrice() {
      if (this.product.new_price > 0) {
        this.oldPrice = this.product.price;
        this.currentPrice = this.product.new_price;
      } else {
        this.currentPrice = this.product.price;
      }
    },

    toDetail() {
      let self = this;
      let slug = this.product.slug;
      setTimeout(function () {
        self.$router.push(`/chi-tiet/${slug}`);
      }, 300);
    },
    getImage() {
      if (this.product.image) {
        let imageArr = JSON.parse(this.product.image);
        if (imageArr.length > 0) this.image = imageArr[0];
        else this.image = "default.jpg";
      }
    },
  },
  components: {
    PriceTextAtom,
    PriceTextWLineThroughAtom,
  },
  created() {
    this.getCurrentPrice();
    this.getImage();
  },
};
</script>

<style>
</style>