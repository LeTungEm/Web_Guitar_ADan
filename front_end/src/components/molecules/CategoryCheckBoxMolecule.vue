<template>
  <div class="text-lg mb-5 whitespace-nowrap">
    <div class="font-bold uppercase">{{ name }}</div>
    <ul>
      <li class="capitalize border py-1 px-2 [&>*]:cursor-pointer hover:bg-gray-100" v-for="item in list" :key="item">
        <input class="mr-2" :id="item" type="checkbox" /><label :for="item">{{ item }}</label>
      </li>
    </ul>
  </div>
</template>
  
  <script>
export default {
  name: "CategoryBoxMolecule",
  props: {
    name: String,
    list: Array,
  },
};
</script>
  
  <style>
</style>