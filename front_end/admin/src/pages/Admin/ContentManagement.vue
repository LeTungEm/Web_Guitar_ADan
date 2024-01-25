<template>
  <div
    class="relative overflow-x-auto overflow-y-scroll h-[80vh] shadow-md sm:rounded-lg z-10 p-5"
  >
    <div>
      <div class="mb-5 flex flex-col lg:flex-row gap-5">
        <div class="w-full shadow-lg p-5">
          <div class="text-xl border-b-2 border-black font-bold pb-2 mb-5">
            Số điện thoại
          </div>
          <input
            type="text"
            class="border w-full rounded-md p-1 focus:outline-gray-500"
            placeholder="Nhập văn bản"
            v-model="phone"
          />
        </div>
        <div class="w-full shadow-lg p-5">
          <div class="text-xl border-b-2 border-black font-bold pb-2 mb-5">
            PassWord
          </div>
          <input
            type="text"
            class="border w-full rounded-md p-1 focus:outline-gray-500"
            placeholder="Nhập văn bản"
            v-model="pass"
          />
        </div>
      </div>
      <div class="mb-5 flex flex-col lg:flex-row gap-5">
        <div class="w-full shadow-lg p-5">
          <div class="text-xl border-b-2 border-black font-bold pb-2 mb-5">
            link facebook
          </div>
          <input
            type="text"
            class="border w-full rounded-md p-1 focus:outline-gray-500"
            placeholder="Nhập văn bản"
            v-model="facebook"
          />
        </div>
        <div class="w-full shadow-lg p-5">
          <div class="text-xl border-b-2 border-black font-bold pb-2 mb-5">
            link tiktok
          </div>
          <input
            type="text"
            class="border w-full rounded-md p-1 focus:outline-gray-500"
            placeholder="Nhập văn bản"
            v-model="tiktok"
          />
        </div>
      </div>
      <div class="mb-5 flex flex-col lg:flex-row gap-5">
        <div class="w-full shadow-lg p-5">
          <div class="text-xl border-b-2 border-black font-bold pb-2 mb-5">
            link instagram
          </div>
          <input
            type="text"
            class="border w-full rounded-md p-1 focus:outline-gray-500"
            placeholder="Nhập văn bản"
            v-model="instagram"
          />
        </div>
        <div class="w-full shadow-lg p-5">
          <div class="text-xl border-b-2 border-black font-bold pb-2 mb-5">
            link youtube
          </div>
          <input
            type="text"
            class="border w-full rounded-md p-1 focus:outline-gray-500"
            placeholder="Nhập văn bản"
            v-model="youtube"
          />
        </div>
      </div>
      <div class="mb-5 flex flex-col lg:flex-row gap-5">
        <div class="w-full shadow-lg p-5">
          <div class="text-xl border-b-2 border-black font-bold pb-2 mb-5">
            link messenger
          </div>
          <input
            type="text"
            class="border w-full rounded-md p-1 focus:outline-gray-500"
            placeholder="Nhập văn bản"
            v-model="messenger"
          />
        </div>
        <div class="w-full shadow-lg p-5">
          <div class="text-xl border-b-2 border-black font-bold pb-2 mb-5">
            link zalo
          </div>
          <input
            type="text"
            class="border w-full rounded-md p-1 focus:outline-gray-500"
            placeholder="Nhập văn bản"
            v-model="zalo"
          />
        </div>
      </div>
      <div class="shadow-lg p-5">
        <div class="text-xl border-b-2 border-black font-bold mb-5">
          Giới thiệu về Bờm Guitar (footer)
        </div>
        <textarea
          class="border w-full rounded-md p-1 focus:outline-gray-500"
          rows="5"
          placeholder="Nhập văn bản"
          v-model="footerContent"
        ></textarea>
      </div>
      <div
        :onclick="saveData"
        class="p-1 text-center bg-gray-500 hover:bg-green-700 duration-300 rounded-md mt-5 text-white font-bold"
      >
        Lưu chỉnh sửa
      </div>
    </div>
  </div>
</template>

<script>
import { decodeEmail } from "@/assets/js/quickFunction";
import AccountsService from "@/service/AccountsService";
import SettingService from "@/service/SettingService";
import { mapActions } from "vuex";

export default {
  name: "ContentManagement",
  data() {
    return {
      footerContent: "",
      oldPass: "",
      pass: "",
      facebook: "",
      tiktok: "",
      instagram: "",
      youtube: "",
      oldPhone: "",
      phone: "",
      zalo: "",
      messenger: "",
    };
  },
  methods: {
    ...mapActions(["showNotification"]),
    ...mapActions(["setUserLoginStatus"]),

    saveData() {
      SettingService.updateSetting(
        this.footerContent,
        this.facebook,
        this.tiktok,
        this.instagram,
        this.youtube,
        this.phone,
        this.zalo,
        this.messenger
      ).then((res) => {
        if (res.data) {
          this.showNotification(["Sửa thành công", false]);
        }
      });
      if (this.oldPass != this.pass || this.oldPhone != this.phone) {
        AccountsService.update(this.phone, this.pass);
        localStorage.removeItem("URT");
        this.setUserLoginStatus(false);
        this.$router.push("/quan-ly");
      }
    },
    getSetting() {
      SettingService.getAll().then((res) => {
        if (res.data) {
          this.footerContent = res.data.footer_content;
          this.facebook = res.data.facebook;
          this.tiktok = res.data.tiktok;
          this.instagram = res.data.instagram;
          this.youtube = res.data.youtube;
          this.phone = "0" + res.data.phone;
          this.oldPhone = "0" + res.data.phone;
          this.zalo = res.data.zalo;
          this.messenger = res.data.messenger;
        }
      });
    },
    getPass() {
      AccountsService.getAcount().then((res) => {
        if (res.data != null) {
          this.pass = decodeEmail(res.data.pass);
          this.oldPass = decodeEmail(res.data.pass);
        }
      });
    },
  },
  created() {
    this.getSetting();
    this.getPass();
  },
};
</script>

<style>
</style>