<template>
  <div class="flex-[6]">
    <div class="my-5">
      <h1 class="font-bold text-xl my-3">Thông tin giao hàng</h1>
      <div class="mb-3">
        <label class="text-gray-500" for="nameShipping">Tên người nhận</label>
        <input
          id="nameShipping"
          v-model="user.name"
          class="border rounded-md w-full outline-0 focus:outline-2 focus:outline-green-700 py-1 lg:py-2 px-2 lg:px-4"
          type="text"
        />
      </div>
      <div class="mb-3">
        <label class="text-gray-500" for="phoneShipping">Số điện thoại</label>
        <input
          id="phoneShipping"
          v-model="user.phone"
          class="border rounded-md w-full outline-0 focus:outline-2 focus:outline-green-700 py-1 lg:py-2 px-2 lg:px-4"
          type="text"
        />
      </div>
      <div class="mb-3">
        <label class="text-gray-500" for="addressShipping"
          >Địa chỉ nhận hàng</label
        >
        <SiteFormMolecule
          :defaultAddressData="user.address"
          @changeAddress="changeAddress"
          v-if="formAddresStatus"
        />
        <input
          v-else
          @click="openFormAddress"
          id="addressShipping"
          v-model="user.address"
          class="border rounded-md w-full outline-0 focus:outline-2 focus:outline-green-700 py-1 lg:py-2 px-2 lg:px-4"
          type="text"
        />
      </div>
      <div class="mb-3">
        <label class="text-gray-500" for="shippingMethod"
          >Đơn vị vận chuyển</label
        >
        <select
          v-model="shippingProviderId"
          id="shippingMethod"
          class="border rounded-md w-full outline-0 focus:outline-2 focus:outline-green-700 py-1 lg:py-2 px-2 lg:px-4"
        >
          <option
            v-for="shippingProvider in shippingProviders"
            :key="shippingProvider"
            :value="shippingProvider.shipping_provider_id"
          >
            {{ shippingProvider.name }}
          </option>
        </select>
      </div>
      <div class="mb-3">
        <label class="text-gray-500" for="paymentMethods"
          >Phương thức thanh toán</label
        >
        <select
          v-model="paymentMethodId"
          id="paymentMethods"
          class="border rounded-md w-full outline-0 focus:outline-2 focus:outline-green-700 py-1 lg:py-2 px-2 lg:px-4"
        >
          <option
            v-for="paymentMethod in paymentMethods"
            :key="paymentMethod"
            :value="paymentMethod.payment_method_id"
          >
            {{ paymentMethod.name }}
          </option>
        </select>
      </div>
      <GreenButtonAtom
        @click="createOrder"
        class="float-right py-4 px-6 rounded-lg my-5"
        :text="'Tạo đơn hàng'"
      />
    </div>
  </div>
</template>

<script>
import { decodeEmail } from "@/assets/js/quickFunction";
import PaymentMethodsService from "@/service/PaymentMethodsService";
import AccountsService from "@/service/AccountsService";
import SiteFormMolecule from "../molecules/SiteFormMolecule.vue";
import ShippingProvidersService from "@/service/ShippingProvidersService";
import GreenButtonAtom from "../atoms/button/GreenButtonAtom.vue";
import { mapActions } from "vuex";

export default {
  name: "CheckoutUserOrganism",
  data() {
    return {
      paymentMethods: [],
      paymentMethodId: "",
      shippingProviders: [],
      shippingProviderId: "",
      user: {},
      formAddresStatus: false,
      address: "",
    };
  },
  emits: ["createOrder"],
  methods: {
    ...mapActions(["showNotification"]),

    createOrder() {
      this.user.address = this.address;
      this.user.paymentMethodId = this.paymentMethodId;
      this.user.shippingProviderId = this.shippingProviderId;
      // kiem tra o day
      if (this.isFullData()) {
        this.$emit("createOrder", this.user);
      }
    },
    isFullData() {
      if (this.user.phone == "") {
        this.showNotification(["Hãy điền số điện thoại !!!", true]);
        return false;
      }
      return true;
    },
    openFormAddress() {
      this.formAddresStatus = true;
    },
    changeAddress(address) {
      this.address = address;
    },
    getShippingProviders() {
      ShippingProvidersService.getAll().then((res) => {
        if (res.data) {
          this.shippingProviders = res.data;
          if (res.data.length > 0)
            this.shippingProviderId = res.data[0].shipping_provider_id;
        }
      });
    },
    getPaymentMethods() {
      PaymentMethodsService.getAll().then((res) => {
        if (res.data) {
          this.paymentMethods = res.data;
          if (res.data.length > 0)
            this.paymentMethodId = res.data[0].payment_method_id;
        }
      });
    },
    getUserInfo() {
      let encodeEmail = sessionStorage.getItem("EMUR");
      let email = decodeEmail(encodeEmail);
      AccountsService.detailUser(email).then((res) => {
        if (res.data.message) {
          this.user = res.data.data;
          this.address = res.data.data.address;
        }
      });
    },
  },
  created() {
    this.getUserInfo();
    this.getPaymentMethods();
    this.getShippingProviders();
  },
  components: { SiteFormMolecule, GreenButtonAtom },
};
</script>

<style>
</style>