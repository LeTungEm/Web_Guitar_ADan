<template>
  <ul
    v-bind:class="
      status ? 'translate-x-0 shadow-lg z-[10]' : '-translate-x-full'
    "
    class="pt-2 overflow-y-scroll scrollbar-hide lg:overflow-visible text-lg h-full w-2/3 [&>*]:mr-10 hover:[&>li]:text-black hover:[&>li]:underline [&>li]:duration-300 fixed top-0 left-0 bg-white text-black xl:text-black duration-500 xl:w-auto xl:h-auto xl:top-[unset] xl:translate-x-0 xl:left-[unset] xl:flex xl:flex-wrap xl:relative"
  >
    <div class="py-1 ml-5 mt-1 flex justify-between items-center xl:hidden">
      <h1 class="text-xl text-black font-bold xl:text-3xl">Menu</h1>
      <font-awesome-icon
        class="hover:text-green-700 text-black translate-x-7"
        :onclick="closeMenu"
        :icon="['fas', 'xmark']"
      />
    </div>
    <li class="py-1 ml-5 border-b xl:border-0 group text-black group relative">
      <router-link to="/" class="flex justify-between cursor-pointer uppercase">
        <span :onclick="() => changeCategory(null)">Trang chủ </span>
      </router-link>
    </li>
    <li
      class="py-1 ml-5 border-b xl:border-0 group text-black group relative uppercase"
    >
      <router-link class="flex justify-between" to="/cua-hang/guitar-classic">
        <span
          :onclick="
            () =>
              changeCategory({
                parent: { name: 'guitar classic', slug: 'guitar-classic' },
                child: null,
              })
          "
        >
          Guitar Classic
        </span>
        <font-awesome-icon
          :onclick="changeCatMenuStatus"
          class="lg:hidden"
          :icon="['fas', 'caret-down']"
        />
      </router-link>
      <ul
        v-bind:style="catMenuStatus ? 'display: block !important' : ''"
        class="hidden text-black lg:text-black whitespace-nowrap lg:group-hover:block lg:absolute top-full lg:bg-gray-300 rounded-sm [&>*]:mb-2 lg:hover:[&>*]:bg-white [&>*]:py-1 [&>*]:px-3 [&>*]:cursor-pointer capitalize"
      >
        <li
          v-for="category in classicCategories"
          :onclick="
            () =>
              changeCategory({
                parent: { name: 'guitar classic', slug: 'guitar-classic' },
                child: { name: category.name, slug: category.slug },
              })
          "
          :key="category.slug"
        >
          <router-link :to="`/cua-hang/guitar-classic/${category.slug}`">
            {{ category.name }}
          </router-link>
        </li>
      </ul>
    </li>
    <li
      class="py-1 ml-5 border-b xl:border-0 group text-black group relative uppercase"
    >
      <router-link class="flex justify-between" to="/cua-hang/guitar-co">
        <span
          :onclick="
            () =>
              changeCategory({
                parent: { name: 'guitar cổ', slug: 'guitar-co' },
                child: null,
              })
          "
          >Guitar Cổ
        </span>
        <font-awesome-icon
          :onclick="changeMenuStatus"
          class="lg:hidden"
          :icon="['fas', 'caret-down']"
        />
      </router-link>
      <ul
        v-bind:style="menuStatus ? 'display: block !important' : ''"
        class="hidden text-black lg:text-black whitespace-nowrap lg:group-hover:block lg:absolute top-full lg:bg-gray-300 rounded-sm [&>*]:mb-2 lg:hover:[&>*]:bg-white [&>*]:py-1 [&>*]:px-3 [&>*]:cursor-pointer capitalize"
      >
        <li
          v-for="category in oldCategories"
          :onclick="
            () =>
              changeCategory({
                parent: { name: 'guitar cổ', slug: 'guitar-co' },
                child: { name: category.name, slug: category.slug },
              })
          "
          :key="category.slug"
        >
          <router-link :to="`/cua-hang/guitar-co/${category.slug}`">
            {{ category.name }}
          </router-link>
        </li>
      </ul>
    </li>
    <li
      :onclick="closeMenu"
      class="py-1 ml-5 border-b xl:border-0 group text-black uppercase"
    >
      <router-link class="block" to="/meo-canh">Phụ kiện </router-link>
    </li>
    <li
      :onclick="closeMenu"
      class="py-1 ml-5 border-b xl:border-0 group text-black uppercase"
    >
      <router-link class="block" to="/meo-canh">Hoạt Động </router-link>
    </li>
  </ul>
</template>

<script>
import CategoryService from "@/service/CategoryService";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import { mapActions } from "vuex";

export default {
  name: "MainMenuMolecule",
  data() {
    return {
      menuStatus: false,
      catMenuStatus: false,
      classicCategories: [],
      oldCategories: [],
    };
  },
  props: {
    status: Boolean,
  },
  emits: ["closeMenu"],
  methods: {
    ...mapActions(["changeSelectedCategory"]),
    closeMenu() {
      this.$emit("closeMenu");
    },
    changeMenuStatus() {
      if (window.outerWidth < 1280) {
        this.menuStatus = !this.menuStatus;
      }
    },
    changeCatMenuStatus() {
      if (window.outerWidth < 1280) {
        this.catMenuStatus = !this.catMenuStatus;
      }
    },
    getClassicCategory() {
      CategoryService.getClassicCategory().then((res) => {
        this.classicCategories = res.data;
      });
    },
    getOldCategory() {
      CategoryService.getOldCategory().then((res) => {
        this.oldCategories = res.data;
      });
    },

    changeCategory(category) {
      this.changeSelectedCategory(category);
      this.closeMenu();
    },
  },
  components: {
    FontAwesomeIcon,
  },
  created() {
    this.getClassicCategory();
    this.getOldCategory();
  },
};
</script>

<style>
.router-link-exact-active, .router-link-active {
  font-style: italic;
  font-weight: bolder;
  position: relative;
}
</style>