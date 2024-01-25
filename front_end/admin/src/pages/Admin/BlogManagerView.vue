<template>
  <div>
    <div class="flex flex-wrap justify-between text-2xl">
      <WhiteButtonAtom
        :onclick="toCreateBlogForm"
        class="py-2 px-5 text-lg mb-1"
        :text="'Thêm mới'"
      />
      <div>
        <input
          v-model="isNew"
          hidden
          class="peer/guitar"
          type="radio"
          id="guitarOption"
          name="isNew"
          value="bc"
        />
        <label
          class="peer-checked/guitar:bg-green-700 peer-checked/guitar:text-white py-2 px-5 text-lg"
          for="guitarOption"
          >Báo Chí</label
        >
        <input
          v-model="isNew"
          hidden
          class="peer/acc"
          type="radio"
          id="accessoryOption"
          name="isNew"
          value="tn"
        />
        <label
          class="peer-checked/acc:bg-green-700 peer-checked/acc:text-white py-2 px-5 text-lg"
          for="accessoryOption"
          >Thiện Nguyện</label
        >
      </div>
    </div>
    <BlogTableOrganism :type="isNew" />
  </div>
</template>

<script>
import WhiteButtonAtom from "@/components/atoms/button/WhiteButtonAtom.vue";
import BlogTableOrganism from "@/components/organisms/BlogTableOrganism.vue";

export default {
  name: "BlogManagerView",
  data() {
    return {
      isNew: "bc",
    };
  },
  components: { WhiteButtonAtom, BlogTableOrganism },
  methods: {
    toCreateBlogForm() {
      this.$router.push("/quan-ly/quan-ly-bai-viet/0");
    },
  },
};
</script>

<style>
</style>