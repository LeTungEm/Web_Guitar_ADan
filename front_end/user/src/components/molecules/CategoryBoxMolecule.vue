<template>
  <div class="text-lg mb-5 whitespace-nowrap">
    <div class="font-bold uppercase">{{ name }}</div>
    <ul>
      <li
        v-bind:class="selectedOption == item.key ? 'underline italic' : ''"
        :onclick="() => changeOption(item)"
        class="capitalize border py-1 px-2 cursor-pointer hover:bg-gray-100 hover:text-black"
        v-for="item in list"
        :key="item"
      >
        {{ item.name }}
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
      selectedOption: null,
    };
  },
  props: {
    name: String,
    list: Array,
  },
  watch: {
    getSelectedCategory() {
      const regex = /[a-zA-Z]/;
      if(regex.test(this.list[0].key) == false){
        this.$emit("changOption", { key: null });
        this.selectedOption = null;
      }
    },
  },
  computed: {
    ...mapGetters(["getSelectedCategory"]),
  },
  emits: ["changOption"],
  methods: {
    changeOption(value) {
      this.$emit("changOption", value);
      this.selectedOption = value.key;
    },
  },
};
</script>

<style>
</style>