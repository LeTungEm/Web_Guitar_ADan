<template>
  <div
    class="flex justify-between flex-wrap lg:[&>*]:w-[30%] gap-5 px-[5%] py-[10%] lg:py-[3%] bg-black text-white"
  >
    <div class="flex justify-center">
      <div>
        <div class="text-xl font-bold uppercase">Sơ lược về Bờm Guitar</div>
        <hr class="w-[5vw] border-b-4 my-5" />
        <p class="text-lg">{{ socialData.footer_content }}</p>
      </div>
    </div>
    <div class="flex justify-center">
      <div>
        <div class="text-xl font-bold uppercase">Địa chỉ</div>
        <hr class="w-[5vw] border-b-4 my-5" />
        <map-molecule/>
      </div>
    </div>
    <div class="flex justify-center">
      <div>
        <div class="text-xl font-bold uppercase">Thông tin liên hệ</div>
        <hr class="w-[5vw] border-b-4 my-5" />
        <SocialMolecule :socialData="socialData" class="float-left" />
        <br />
        <br />
        <div class="w-full">
          <a
            :href="`tel:${socialData.phone}`"
            class="bg-white w-fit flex text-red-600 font-bold items-center justify-center h-9 text-lg border rounded-2xl px-5 py-1"
          >
            {{ socialData.phone }}
          </a>
        </div>
      </div>
    </div>
    <div class="fixed bottom-0 right-0 left-0">
      <div class="block z-10 mb-[10%] ml-[10%]">
        <a
          class="flex gap-5 text-2xl lg:text-5xl text-red-500"
          :href="`tel:${socialData.phone}`"
        >
          <font-awesome-icon class="animation-ring" :icon="['fas', 'phone']" />
          <span>{{ socialData.phone }}</span>
        </a>
      </div>
      <div
        class="flex justify-around items-center lg:hidden bg-black lg:bg-transparent bg-opacity-80 lg:bg-opacity-100 h-[8vh]"
      >
        <a class="animation-ring" :href="socialData.messenger">
          <font-awesome-icon
            class="text-xl p-2 rounded-full bg-blue-500"
            :icon="['fab', 'facebook-messenger']"
          />
        </a>
        <a
          :href="socialData.zalo"
          class="bg-blue-600 animation-ring flex justify-center items-center font-bold w-9 h-9 text-[10px] border rounded-md"
          >ZALO</a
        >
        <a :href="`tel:${socialData.phone}`">
          <font-awesome-icon
            class="animation-ring text-2xl text-red-500"
            :icon="['fas', 'phone']"
          />
        </a>
      </div>
    </div>
  </div>
</template>

<script>
import SocialMolecule from "./SocialMolecule.vue";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import MapMolecule from './MapMolecule.vue';

export default {
  name: "FooterMolecule",
  props: {
    socialData: Object,
  },
  components: {
    SocialMolecule,
    FontAwesomeIcon,
    MapMolecule,
  },
};
</script>

<style>
</style>