<template>
  <LeftSideBarMolecule :status="status">
    <h1 class="text-xl font-bold xl:text-3xl mb-5 xl:mb-10 text-white">
      Bờm Guitar
    </h1>
    <ul
      class="[&>*]:text-white [&>*]:cursor-pointer [&>*]:text-lg xl:[&>*]:text-xl [&>*]:py-1 [&>*]:whitespace-nowrap"
    >
      <li>
        <router-link @click="closeNavBar" to="/quan-ly/quan-ly-hang"
          ><font-awesome-icon :icon="['fas', 'crown']" />
          &nbsp; Quản lý hãng
        </router-link>
      </li>
      <li>
        <router-link @click="closeNavBar" to="/quan-ly/quan-ly-xuat-su"
          ><font-awesome-icon :icon="['fas', 'map']" />
          &nbsp; Quản lý xuất xứ
        </router-link>
      </li>
      <li>
        <router-link @click="closeNavBar" to="/quan-ly/quan-ly-san-pham"
          ><font-awesome-icon :icon="['fas', 'guitar']" />
          &nbsp; Quản lý sản phẩm
        </router-link>
      </li>
      <li>
        <router-link @click="closeNavBar" to="/quan-ly/quan-ly-bai-viet">
          <font-awesome-icon :icon="['fas', 'blog']" />
          &nbsp; Quản lý bài viết
        </router-link>
      </li>
      <!-- <li>
        <router-link @click="closeNavBar" to="/quan-ly/quan-ly-dat-hang"
          ><font-awesome-icon :icon="['fas', 'book']" />
          &nbsp; Quản lý đặt hàng
        </router-link>
      </li> -->
      <li>
        <router-link @click="closeNavBar" to="/quan-ly/quan-ly-noi-dung">
          <font-awesome-icon :icon="['fas', 'circle-info']" />
          &nbsp; Thông tin
        </router-link>
      </li>
      <li>
        <router-link @click="closeNavBar" to="/quan-ly/cai-dat"
          ><font-awesome-icon :icon="['fas', 'image']" />
          &nbsp; Hình ảnh
        </router-link>
      </li>
    </ul>
  </LeftSideBarMolecule>
</template>

<script>
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import LeftSideBarMolecule from "../molecules/LeftSideBarMolecule.vue";

export default {
  name: "AdminNavBarOrganism",
  props: {
    status: Boolean,
  },
  emits: ["closeNavBar"],
  methods: {
    closeNavBar() {
      if (this.getScreenWidth() < 1280) this.$emit("closeNavBar");
    },
    getScreenWidth() {
      return window.innerWidth;
    },
  },
  components: { LeftSideBarMolecule, FontAwesomeIcon },
};
</script>

<style>
</style>