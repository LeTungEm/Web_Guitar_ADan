<template>
  <div class="text-lg mb-5 whitespace-nowrap">
    <div class="font-bold uppercase">{{ name }}</div>
    <ul>
      <li
        class="capitalize border py-1 px-2 [&>*]:cursor-pointer hover:bg-gray-100 hover:text-black"
        v-for="item in list"
        :key="item"
      >
        <input
          v-model="pickedList"
          class="mr-2"
          :id="item.key"
          type="checkbox"
          :value="item.key"
        /><label :for="item.key">{{ item.name }}</label>
      </li>
    </ul>
  </div>
</template>
  
  <script>
import { mapGetters } from "vuex";
export default {
  name: "CategoryBoxMolecule",
  data() {
    return {
      pickedList: [],
    };
  },
  emit: ["changOption"],
  watch: {
    pickedList: function () {
      this.$emit("changOption", this.pickedList);
    },
    getSelectedCategory() {
      this.$emit("changOption", []);
      this.pickedList = [];
    },
  },
  computed: {
    ...mapGetters(["getSelectedCategory"]),
  },
  props: {
    name: String,
    list: Array,
  },
};
</script>
  
  <style>
</style>