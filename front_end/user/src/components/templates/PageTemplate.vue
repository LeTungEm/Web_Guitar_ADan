<template>
  <div class="m-[5%] md:mx-[10%] md:my-[5%]">
    <slot></slot>
    <div
      v-bind:class="mapStatus ? '' : 'translate-x-[20vw]'"
      class="fixed flex bottom-[25vh] right-0 h-[30vw] lg:h-[10vw] duration-300"
    >
      <div
        :onclick="showMap"
        class="h-full px-2 bg-blue-700 text-white flex flex-col justify-center items-center"
      >
        <div>MAP</div><br/>
        <font-awesome-icon
          v-bind:class="mapStatus ? '' : 'rotate-180'"
          :icon="['fas', 'angles-right']"
        />
      </div>
      <map-molecule class="w-[20vw_!important]" />
    </div>
  </div>
</template>

<script>
import MapMolecule from "../molecules/MapMolecule.vue";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";

export default {
  name: "HomeTemplate",
  data() {
    return {
      mapStatus: false,
    };
  },
  methods: {
    showMap() {
      this.mapStatus = !this.mapStatus;
    },
  },
  components: { MapMolecule, FontAwesomeIcon },
};
</script>

<style>
</style>