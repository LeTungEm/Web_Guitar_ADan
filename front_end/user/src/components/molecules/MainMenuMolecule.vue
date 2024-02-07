<template>
  <ul
    v-bind:class="
      status ? 'translate-x-0 shadow-lg z-[10]' : '-translate-x-full'
    "
    class="pt-2 overflow-y-scroll scrollbar-hide lg:overflow-visible text-lg h-full w-2/3 [&>*]:mr-10 hover:[&>li]:text-black hover:[&>li]:underline [&>li]:duration-300 fixed top-0 left-0 bg-white text-black lg:text-black duration-500 lg:w-auto lg:h-auto lg:top-[unset] lg:translate-x-0 lg:left-[unset] lg:flex lg:flex-wrap lg:relative"
  >
    <div class="py-1 ml-5 mt-1 flex justify-between items-center lg:hidden">
      <h1 class="text-xl text-black font-bold lg:text-3xl">Menu</h1>
      <font-awesome-icon
        class="hover:text-green-700 text-black translate-x-7"
        :onclick="closeMenu"
        :icon="['fas', 'xmark']"
      />
    </div>
    <li class="py-1 ml-5 border-b lg:border-0 group text-black group relative">
      <router-link to="/" class="flex justify-between cursor-pointer uppercase">
        <span :onclick="() => changeCategory(null)">Trang chủ </span>
      </router-link>
    </li>
    <li
      :onclick="closeMenu"
      class="py-1 ml-5 border-b lg:border-0 group text-black group relative uppercase"
    >
      <router-link to="/cua-hang/guitar-classic">
        Guitar Classic
        <!-- <font-awesome-icon class="lg:hidden" :icon="['fas', 'caret-down']" /> -->
      </router-link>
      <!-- <ul
        v-bind:style="catMenuStatus ? 'display: block !important' : ''"
        class="hidden text-black lg:text-black whitespace-nowrap lg:group-hover:block lg:absolute top-full lg:bg-gray-300 rounded-sm [&>*]:mb-2 lg:hover:[&>*]:bg-white [&>*]:py-1 [&>*]:px-3 [&>*]:cursor-pointer capitalize"
      >
        <li
          :onclick="
            () =>
              changeCategory({
                parent: { name: 'guitar classic', slug: 'guitar-classic' },
                child: null,
              })
          "
        >
          <router-link to="/cua-hang/guitar-classic">
            Tất cả guitar classic
          </router-link>
        </li>
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
      </ul> -->
    </li>
    <li
      :onclick="closeMenu"
      class="py-1 ml-5 border-b lg:border-0 group text-black group relative uppercase"
    >
      <router-link to="/cua-hang/guitar-acoustic">
        Guitar Acoustic
      </router-link>
    </li>
    <li
      :onclick="closeMenu"
      class="py-1 ml-5 border-b lg:border-0 group text-black uppercase"
    >
      <router-link class="block" to="/phu-kien"> Phụ kiện </router-link>
    </li>
    <li
      :onclick="closeMenu"
      class="py-1 ml-5 border-b lg:border-0 group text-black uppercase"
    >
      <router-link class="block" to="/hoat-dong"> Hoạt Động </router-link>
    </li>
    <li
      :onclick="closeMenu"
      class="py-1 ml-5 border-b lg:border-0 group text-black uppercase"
    >
      <router-link class="block" to="/huong-dan-mua-hang"> Hướng Dẫn Mua Đàn </router-link>
    </li>
    <li>
      <map-molecule class="ml-5 lg:hidden" />
    </li>
  </ul>
</template>

<script>
import CategoryService from "@/service/CategoryService";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import { mapActions } from "vuex";
import MapMolecule from './MapMolecule.vue';

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
      if (window.innerWidth < 1030) {
        this.menuStatus = !this.menuStatus;
      } else {
        this.$router.push("/cua-hang/guitar-co");
        this.changeSelectedCategory({
          parent: { name: "guitar cổ", slug: "guitar-co" },
          child: null,
        });
      }
    },
    changeCatMenuStatus() {
      if (window.innerWidth < 1030) {
        this.catMenuStatus = !this.catMenuStatus;
      } else {
        this.$router.push("/cua-hang/guitar-classic");
        this.changeSelectedCategory({
          parent: { name: "guitar classic", slug: "guitar-classic" },
          child: null,
        });
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
    MapMolecule,
  },
  created() {
    // this.getClassicCategory();
    // this.getOldCategory();
  },
};
</script>

<style>
.router-link-exact-active,
.router-link-active {
  font-style: italic;
  font-weight: bolder;
  position: relative;
}
</style>