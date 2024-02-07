<template>
  <div class="flex justify-center">
    <div
      class="flex flex-col gap-5 lg:gap-10 max-w-[1000px] p-[5%] w-full border"
    >
      <h1 class="capitalize text-3xl text-white font-bold">
        Hướng dẫn mua sản phẩm tại Bờm Guitar
      </h1>
      <div class="text-white" v-html="content"></div>
    </div>
  </div>
</template>

<script>
import SettingService from "../../service/SettingService";
export default {
  name: "RecomemtView",
  data() {
    return {
      content: "",
    };
  },
  methods: {
    getData() {
      SettingService.getAll().then((res) => {
        this.content = res.data.recomment;
      });
    },
  },
  created() {
    this.getData();
  },
};
</script>

<style>
</style>