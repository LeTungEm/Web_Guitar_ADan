<template>
  <div class="overflow-y-auto max-h-[85vh]">
    <div class="text-3xl font-bold text-center">Quản Lý Hãng</div>
    <div class="shadow-lg p-5 mb-5">
      <div
        v-for="brand in listBrand"
        :key="brand.key"
        class="w-full px-2 py-1 border rounded-md mb-5 shadow-md hover:bg-gray-200"
      >
        <div class="flex justify-end font-bold cursor-pointer">
          <svg
            :onclick="() => changeUpdateId(brand.key)"
            class="w-[20px] hover:fill-green-700"
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 512 512"
          >
            <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
            <path
              d="M471.6 21.7c-21.9-21.9-57.3-21.9-79.2 0L362.3 51.7l97.9 97.9 30.1-30.1c21.9-21.9 21.9-57.3 0-79.2L471.6 21.7zm-299.2 220c-6.1 6.1-10.8 13.6-13.5 21.9l-29.6 88.8c-2.9 8.6-.6 18.1 5.8 24.6s15.9 8.7 24.6 5.8l88.8-29.6c8.2-2.7 15.7-7.4 21.9-13.5L437.7 172.3 339.7 74.3 172.4 241.7zM96 64C43 64 0 107 0 160V416c0 53 43 96 96 96H352c53 0 96-43 96-96V320c0-17.7-14.3-32-32-32s-32 14.3-32 32v96c0 17.7-14.3 32-32 32H96c-17.7 0-32-14.3-32-32V160c0-17.7 14.3-32 32-32h96c17.7 0 32-14.3 32-32s-14.3-32-32-32H96z"
            />
          </svg>
        </div>
        <div>{{ brand.name }}</div>
        <div v-if="updateId == brand.key" class="flex">
          <input
            class="border rounded-md w-full outline-0 focus:outline-2 focus:outline-green-700 py-1 lg:py-2 px-2 lg:px-4"
            type="text"
            placeholder="Nhập tên mới để sửa..."
            v-model="updateName"
          />
          <button :onclick="updateBrand" class="bg-green-700 hover:bg-green-800 cursor-pointer py-1 lg:py-2 px-2 lg:px-4 text-white">Sửa</button>
        </div>
      </div>
    </div>
    <div class="mb-5 shadow-lg p-5">
      <label class="text-gray-500 font-bold" for="blogName">Tên*</label>
      <input
        id="blogName"
        class="border rounded-md w-full outline-0 focus:outline-2 focus:outline-green-700 py-1 lg:py-2 px-2 lg:px-4"
        type="text"
        placeholder="Nhập tên để thêm..."
        v-model="name"
      />
    </div>
    <button
      :onclick="insertBrand"
      class="border bg-gray-200 rounded-md w-full hover:bg-green-700 hover:text-white duration-300 py-1 lg:py-2 px-2 lg:px-4"
    >
      Thêm
    </button>
    <loading-atom :status="loadingStatus" />
  </div>
</template>

<script>
import BrandService from "@/service/BrandService";
import LoadingAtom from "../../components/atoms/LoadingAtom.vue";
import { mapActions } from "vuex";

export default {
  components: { LoadingAtom },
  name: "BrandManagerView",
  data() {
    return {
      listBrand: [],
      loadingStatus: false,
      updateId: null,
      updateName: "",
      name: "",
    };
  },
  created() {
    this.getBrand();
  },
  methods: {
    ...mapActions(["showNotification"]),

    async getBrand() {
      this.loadingStatus = true;
      await BrandService.getAll()
        .then((res) => {
          this.listBrand = res.data;
        })
        .finally(() => {
          this.loadingStatus = false;
        });
    },
    changeUpdateId(id) {
      this.updateId = id;
    },
    updateBrand() {
      if (this.updateName.trim() != "") {
        BrandService.updateBrand(this.updateName, this.updateId).then(() => {
          this.updateName = "";
          this.updateId = "";
          this.getBrand();
        });
      } else {
        this.showNotification(["Hãy nhập tên mới cho hãng!", false]);
      }
    },
    insertBrand() {
      if (this.name.trim() != "") {
        BrandService.insertBrand(this.name).then(() => {
          this.name = "";
          this.getBrand();
        });
      } else {
        this.showNotification(["Hãy nhập tên hãng!", false]);
      }
    },
  },
};
</script>

<style>
</style>