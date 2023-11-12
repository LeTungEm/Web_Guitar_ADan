<template>
  <form
    @submit.prevent="register"
    v-bind:class="
      isLogin ? 'translate-x-[100%] absolute z-[1]' : 'relative z-[2]'
    "
    class="w-full duration-300 p-3 md:p-5"
  >
    <div class="flex mb-5">
      <input
        @click="() => (nameErr = false)"
        v-bind:class="nameErr ? 'border border-red-700' : ''"
        v-model="name"
        placeholder="Tên*"
        class="border rounded-md w-full outline-0 focus:outline-2 focus:outline-green-700 py-1 lg:py-2 px-2 lg:px-4"
        type="text"
      />
    </div>
    <div class="flex mb-5">
      <select
        v-model="gender"
        class="border rounded-md w-full outline-0 focus:outline-2 focus:outline-green-700 py-1 lg:py-2 px-2 lg:px-4"
      >
        <option value="1">Nam</option>
        <option value="0">Nữ</option>
      </select>
    </div>
    <div class="flex mb-5">
      <input
        @click="() => (emailErr = false)"
        v-bind:class="emailErr ? 'border border-red-700' : ''"
        v-model="email"
        placeholder="Email*"
        class="border rounded-md w-full outline-0 focus:outline-2 focus:outline-green-700 py-1 lg:py-2 px-2 lg:px-4"
        type="email"
      />
    </div>
    <div class="flex mb-5">
      <input
        ref="date"
        @click="() => (dateErr = false)"
        v-bind:class="dateErr ? 'border border-red-700' : ''"
        v-model="date"
        placeholder="Ngày sinh*"
        class="border rounded-md w-full outline-0 focus:outline-2 focus:outline-green-700 py-1 lg:py-2 px-2 lg:px-4"
        type="date"
      />
    </div>
    <div class="flex mb-5 relative">
      <input
        @click="() => (passWErr = false)"
        v-bind:class="passWErr ? 'border border-red-700' : ''"
        v-model="passW"
        autocomplete
        placeholder="Mật khẩu*"
        class="border rounded-md w-full outline-0 focus:outline-2 focus:outline-green-700 py-1 lg:py-2 px-2 lg:px-4"
        :type="hiddenPassW ? 'password' : 'text'"
      />
      <span
        class="flex justify-center items-center absolute top-0 right-0 bottom-0 mr-4"
      >
        <font-awesome-icon
          @click="changePassWStatus"
          :icon="['fas', `${hiddenPassW ? 'eye-slash' : 'eye'}`]"
        />
      </span>
    </div>
    <div class="flex mb-5 relative">
      <input
        autocomplete
        @click="() => (rePassWErr = false)"
        v-bind:class="rePassWErr ? 'border border-red-700' : ''"
        v-model="rePassW"
        placeholder="Nhập lại mật khẩu*"
        class="border rounded-md w-full outline-0 focus:outline-2 focus:outline-green-700 py-1 lg:py-2 px-2 lg:px-4"
        :type="hiddenPassW ? 'password' : 'text'"
      />
      <span
        class="flex justify-center items-center absolute top-0 right-0 bottom-0 mr-4"
      >
        <font-awesome-icon
          @click="changePassWStatus"
          :icon="['fas', `${hiddenPassW ? 'eye-slash' : 'eye'}`]"
        />
      </span>
    </div>
    <GreenButtonAtom class="w-full py-3" :text="'Đăng ký'" />
  </form>
</template>

<script>
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import GreenButtonAtom from "../atoms/button/GreenButtonAtom.vue";
import AccountsService from "@/service/AccountsService";
import { getCurrentTime } from "@/assets/js/quickFunction";
import { mapActions } from "vuex";

export default {
  name: "RegisterFormMolecule",
  data() {
    return {
      hiddenPassW: true,
      name: "",
      nameErr: false,
      gender: 1,
      genderErr: false,
      email: "",
      emailErr: false,
      date: "",
      dateErr: false,
      passW: "",
      passWErr: false,
      rePassW: "",
      rePassWErr: false,
    };
  },
  props: {
    isLogin: Boolean,
  },
  methods: {
    ...mapActions(["showNotification"]),
    changePassWStatus() {
      this.hiddenPassW = !this.hiddenPassW;
    },
    isFullData() {
      let result = false;
      if (
        this.name.trim() &&
        this.gender &&
        this.email.trim() &&
        this.date &&
        this.passW.trim() &&
        this.rePassW.trim()
      ) {
        result = true;
      }
      if (this.name.trim() == "") this.nameErr = true;
      if (this.gender == "") this.genderErr = true;
      if (this.email.trim() == "") this.emailErr = true;
      if (this.date == "") this.dateErr = true;
      if (this.passW.trim() == "") this.passWErr = true;
      if (this.rePassW.trim() == "") this.rePassWErr = true;
      return result;
    },
    isPassWCorrect() {
      let result = true;
      let passWLength = this.passW.length;
      let rePassLength = this.rePassW.length;
      if (passWLength < 8 && rePassLength < 8) {
        this.showNotification([
          "Mật khẩu phải lớn hơn hoặc bằng 8 ký tự !!!",
          true,
        ]);
        return false;
      } else if (this.passW !== this.rePassW) {
        this.showNotification(["Mật khẩu hiện không giống nhau !!!", true]);
        return false;
      } else if (
        this.passW.match(/[a-zA-Z]/) == null ||
        this.rePassW.match(/[a-zA-Z]/) == null ||
        this.passW.match(/\d/) == null ||
        this.rePassW.match(/\d/) == null
      ) {
        this.showNotification(["Mật khẩu nên chứa cả chữ và số !!!", true]);
        return false;
      }
      return result;
    },
    validateForm() {
      let result = true;
      if (this.isFullData()) {
        if (this.isPassWCorrect() == false) {
          return false;
        }
      } else {
        this.showNotification(["Vui lòng điền đủ thông tin !!!", true]);
        return false;
      }
      return result;
    },
    async isEmailExists(email) {
      let result = await AccountsService.isEmailExists(email);
      if (result) return result.data.message;
      return false;
    },
    insertAccount() {
      AccountsService.insert(
        "",
        this.gender,
        this.date,
        "",
        this.passW,
        this.name,
        this.email,
        2
      ).then((res) => {
        if (res.data) {
          if (res.data.message == true) {
            this.$emit("isRegisterd", this.email);
          } else {
            this.showNotification(["Đăng ký không thành công !!!", true]);
          }
        }
      });
    },
    register() {
      if (this.validateForm()) {
        let isExist = this.isEmailExists(this.email);
        isExist.then((res) => {
          if (res) {
            this.showNotification(["Email đã tồn tại !!!", true]);
          } else {
            this.insertAccount();
          }
        });
      }
    },
  },
  components: { FontAwesomeIcon, GreenButtonAtom },
  created() {
    this.date = getCurrentTime();
  },
};
</script>

<style>
</style>