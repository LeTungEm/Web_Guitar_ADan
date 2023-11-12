<template>
  <div
    :onclick="toDetail"
    class="relative flex flex-col w-full h-full shadow-md rounded-sm border-2 hover:border-black duration-300"
  >
    <div class="relative">
      <img
        class="rounded-sm object-center object-cover bg-white w-full"
        src="https://danpianohoangphuc.com/images/pro/yamaha-fg-202d-like-new-made-in-japan-9097.jpg"
        :alt="product"
      />
    </div>
    <div class="flex flex-col flex-1 justify-between p-3 text-center">
      <div>
        <h1 class="block text-[12px] md:text-xl font-bold capitalize">
          Đàn guitar cổ điển
        </h1>
        <div class="text-gray-500 text-[12px] md:text-lg lowercase">
          Guitar classic
        </div>
      </div>
      <div class="flex flex-wrap justify-center gap-x-2 italic">
        <PriceTextAtom class="text-[12px] lg:text-2xl" :minPrice="10000000" :maxPrice="10000000" />
        <PriceTextWLineThroughAtom
          v-if="true"
          class="text-[10px] lg:text-lg"
          :minPrice="11000000"
          :maxPrice="11000000"
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
      setTimeout(function () {
        self.$router.push(`/dan-co/dan-guitar-day`);
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
    // this.getCurrentPrice();
    // this.getImage();
  },
};
</script>

<style>
</style>