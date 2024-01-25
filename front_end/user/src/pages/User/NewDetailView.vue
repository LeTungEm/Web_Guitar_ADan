<template>
  <div class="flex justify-center">
    <div
      class="flex flex-col gap-5 lg:gap-10 max-w-[1000px] p-[5%] w-full border"
    >
      <h1 class="capitalize text-3xl font-bold">{{ newData.name }}</h1>
      <h5 class="text-xl">{{ newData.short_description }}</h5>
      <div v-html="newData.description"></div>
    </div>
  </div>
</template>

<script>
import { scrollToTop } from "@/assets/js/quickFunction";
import BlogService from "@/service/BlogService";

export default {
  name: "NewDetailView",
  data() {
    return {
      newData: {},
    };
  },
  watch: {
    "$route.params.slug": {
      immediate: true,
      handler(newParam, oldParam) {
        if (newParam !== oldParam && oldParam != undefined) {
          this.getNewDetail();
          scrollToTop();
        }
      },
    },
  },
  methods: {
    getNewDetail() {
      BlogService.getBySlug(this.$route.params.slug).then((res) => {
        this.newData = res.data;
      });
    },
  },
  created() {
    this.getNewDetail();
  },
};
</script>

<style>
</style>