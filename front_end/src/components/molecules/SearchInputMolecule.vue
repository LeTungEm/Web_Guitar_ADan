<template>
  <div class="w-full lg:w-1/2 relative">
    <div class="flex items-center h-9 relative">
      <InputAtom
        class="pr-8 pl-2 text-base border rounded-2xl focus:outline-2 focus:border-0 focus:outline-black"
        :status="status"
        @change="change"
        :type="'search'"
        :placeholder="'Tìm kiếm...'"
      />
      <div
        class="flex justify-center items-center absolute top-0 right-0 bottom-0"
      >
        <FontAwesomeIcon
          :onclick="searchCat"
          class="mr-3 text-sm duration-300 cursor-pointer hover:text-base hover:text-white"
          :icon="['fas', 'magnifying-glass']"
        />
      </div>
    </div>

    <div
      :onclick="closeTabStatus"
      v-bind:class="tabStatus ? '' : 'hidden'"
      class="inset-0 fixed z-[-1]"
    >
      &nbsp;
    </div>
    <div
      v-bind:class="tabStatus ? '' : 'hidden'"
      class="lg:absolute border-2 top-[110%] lg:bg-white w-full lg:w-[200%] px-1 pt-1 rounded-sm z-[1] h-[80vh] overflow-y-auto"
    >
      <div class="flex flex-col gap-5" v-for="cat in listCat" :key="cat.cat_id">
        <div :onclick="() => toDetailPage(cat)" class="flex gap-5 border-b">
          <img
            class="w-[80px] lg:w-[100px] object-contain mb-1 hover:p-1 hover:border duration-300"
            src="data:image/jpeg;base64,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"
            alt=""
          />
          <div class="flex items-center">
            <div>
              <span class="text-sm lg:text-lg">Guitar cổ</span>
              <price-text-atom :maxPrice="2000000" :minPrice="2000000" />
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import InputAtom from "../atoms/input/InputAtom.vue";
import CatService from "@/service/CatService";
import { DOMAN } from "@/assets/js/config";
import { mapActions } from "vuex";
import PriceTextAtom from "../atoms/text/PriceTextAtom.vue";

export default {
  name: "SearchInputMolecule",
  data() {
    return {
      doman: DOMAN,
      search: "",
      listCat: [],
      tabStatus: false,
    };
  },
  watch: {
    search: function () {
      if (this.search == "") {
        this.listCat = [];
      }
    },
  },
  props: {
    status: Boolean,
  },
  components: {
    FontAwesomeIcon,
    InputAtom,
    PriceTextAtom,
  },
  methods: {
    ...mapActions(["showNotification"]),

    change(value) {
      this.search = value;
    },

    searchCat() {
      if (this.search.trim() != "") {
        CatService.searchCat(this.search).then((res) => {
          this.listCat = res.data;
          this.tabStatus = true;
        });
      } else {
        this.showNotification(["hãy nhập thông tin tìm kiếm !!!", false]);
      }
    },

    closeTabStatus() {
      this.tabStatus = false;
    },

    getImage(jsonString) {
      if (jsonString) {
        let arrImage = JSON.parse(jsonString);
        if (arrImage.length > 0) {
          return arrImage[0];
        } else {
          return "default.jpg";
        }
      }
    },

    toDetailPage(cat) {
      this.$router.push(`/meo-canh/${cat.category_slug}/${cat.slug}`);
      this.tabStatus = false;
      this.$emit("closeTabMobie");
    },
  },
  emits: ["change", "closeTabMobie"],
};
</script>

<style>
</style>