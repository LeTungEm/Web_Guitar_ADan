<template>
  <div
    class="shadow-lg sticky top-0 bg-white z-[10] py-2 px-5 md:py-3 lg:px-20"
  >
    <div
      v-if="hiddenNavBar()"
      class="grid grid-cols-3 md:grid-cols-5 lg:border-b lg:pb-2"
    >
      <!-- left navbar -->
      <div
        class="mr-5 md:col-span-2 md:mr-10 lg:hidden h-full flex items-center"
      >
        <font-awesome-icon
          :onclick="changeMainMenuStatus"
          class="cursor-pointer text-black text-2xl"
          :icon="['fas', 'bars']"
        />
      </div>
      <div class="hidden lg:flex justify-center md:col-span-2">
        <a
          :href="`tel:${socialData.phone}`"
          class="bg-white hidden mr-5 px-2 lg:flex text-red-600 font-bold items-center justify-center h-9 w-1/2 text-base border border-black rounded-2xl"
        >
          <font-awesome-icon class="mr-2" :icon="['fas', 'phone']" />
          <span class="text-lg">{{ socialData.phone }}</span>
        </a>
      </div>
      <LogoAtom class="flex justify-center items-center" />
      <!-- right navbar -->
      <div
        class="flex flex-wrap justify-end lg:flex-nowrap lg:justify-around items-center text-base pl-2 lg:px-10 md:text-2xl md:col-span-2"
      >
        <font-awesome-icon
          :onclick="changeSearchBarStatus"
          class="lg:hidden cursor-pointer mr-5 md:mr-10 text-2xl"
          :icon="['fas', 'magnifying-glass']"
        />
        <!-- Search mobie -->
        <div
          v-bind:class="searchBarStatus ? '' : 'hidden'"
          class="fixed inset-0 lg:hidden bg-black opacity-90 flex justify-center items-center"
        >
          <div :onclick="changeSearchBarStatus" class="absolute inset-0">
            &nbsp;
          </div>
          <SearchInputMolecule
            @closeTabMobie="changeSearchBarStatus"
            class="text-white"
          />
        </div>
        <SearchInputMolecule class="mr-5 hidden lg:block" />
      </div>
      <div
        v-bind:class="
          mainMenuStatus || cartBarStatus || accountUserBarStatus
            ? ''
            : 'hidden'
        "
        :onclick="closeAllTab"
        class="fixed bg-black bg-opacity-70 inset-0 w-full h-full z-[1]"
      >
        &nbsp;
      </div>
    </div>
    <MainMenuMolecule
      class="lg:flex lg:justify-center lg:items-center"
      @closeMenu="closeAllTab"
      :status="mainMenuStatus"
    />
  </div>
</template>

<script>
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import { mapGetters } from "vuex";
import MainMenuMolecule from "../molecules/MainMenuMolecule.vue";
import LogoAtom from "../atoms/LogoAtom.vue";
import SearchInputMolecule from "../molecules/SearchInputMolecule.vue";

export default {
  name: "NavBarOrganism",
  data() {
    return {
      checkoutFormStatus: false,
      searchBarStatus: false,
      mainMenuStatus: false,
      cartBarStatus: false,
      accountUserBarStatus: false,
      totalQuantityOfCart: 0,
      cartObject: {},
    };
  },
  props: {
    socialData: Object,
  },
  watch: {
    getCartChangeNumber() {
      this.cartBarStatus = true;
    },
  },
  components: {
    FontAwesomeIcon,
    MainMenuMolecule,
    LogoAtom,
    SearchInputMolecule,
  },
  computed: {
    ...mapGetters(["getCartChangeNumber"]),
    // ...mapGetters(["getUserLoginStatus"]),
  },
  methods: {
    changeCheckoutForm(cartObject) {
      this.checkoutFormStatus = !this.checkoutFormStatus;
      this.cartObject = cartObject;
    },
    changeMainMenuStatus() {
      this.mainMenuStatus = !this.mainMenuStatus;
    },
    changeSearchBarStatus() {
      this.searchBarStatus = !this.searchBarStatus;
    },
    changeCartBarStatus() {
      this.cartBarStatus = !this.cartBarStatus;
    },
    changeAccountUserBarStatus() {
      this.accountUserBarStatus = !this.accountUserBarStatus;
    },
    changeToTalQuantity(totalQuantity) {
      this.totalQuantityOfCart = totalQuantity;
    },
    closeAllTab() {
      this.mainMenuStatus = false;
      this.searchBarStatus = false;
      this.cartBarStatus = false;
      this.accountUserBarStatus = false;
    },
    hiddenNavBar() {
      let result = true;
      let routerName = this.$route.name;
      if (routerName == "login" || routerName == "checkout") {
        result = false;
      }
      return result;
    },
    // toLoginView() {
    //   let userSession = sessionStorage.getItem("EMUR");
    //   let userLocal = localStorage.getItem("CEMURK");
    //   if (userSession || userLocal) {
    //     this.changeAccountUserBarStatus();
    //   } else {
    //     this.$router.push("/nguoi-dung/dang-nhap");
    //   }
    // },
  },
};
</script>

<style>
</style>