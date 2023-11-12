<template>
  <div class="lg:w-1/2 flex flex-col-reverse lg:flex-row gap-5 mb-5 lg:mb-0">
    <div
      class="flex h-[80px] w-full overflow-auto lg:h-auto gap-5 lg:flex-col lg:w-[10vw]"
    >
      <img
        v-for="img in listImg"
        class="h-full lg:h-auto hover:scale-105 duration-300 border p-1 shadow-md"
        v-bind:class="img == showedImg ? '' : 'opacity-50'"
        :onclick="() => changeImage(img)"
        :key="img"
        :src="`${img}`"
        alt="hinh meo"
      />
    </div>
    <!-- Main image -->
    <div class="w-full h-full">
      <div class="p-1 border border-gray-300 shadow-md">
        <div class="p-1 border relative">
          <div id="img-container" class="image_contain [&>*]:object-contain">
            <img :src="`${showedImg}`" alt="" />
          </div>
          <!-- Button Zoom -->
          <span
            :onclick="zoomImage"
            class="absolute bottom-0 left-0 m-5 rounded-full border border-black py-3 px-4 hover:bg-black [&>*]:hover:text-white duration-300"
          >
            <font-awesome-icon
              :icon="['fas', 'up-right-and-down-left-from-center']"
            />
          </span>
          <!-- Zoom Image -->
          <div
            :onclick="zoomImage"
            v-bind:class="isZoom ? '' : 'hidden'"
            class="flex justify-center items-center bg-black bg-opacity-80 fixed top-0 right-0 left-0 h-full z-[10]"
          >
            <img
              class="w-full lg:w-2/3 object-contain"
              :src="`${showedImg}`"
              alt=""
            />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { DOMAN } from "@/assets/js/config";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";

export default {
  name: "ImageControlMolecule",
  data() {
    return {
      doman: DOMAN,
      listImg: [
        "https://danpianohoangphuc.com/images/pro/yamaha-fg-110_7984.jpg",
        "https://danpianohoangphuc.com/images/pro/matsuoka-no25-2-chi-can-san-xuat-nam-1974_14261.jpg",
      ],
      showedImg:
        "https://danpianohoangphuc.com/images/pro/yamaha-fg-110_7984.jpg",
      isZoom: false,
      imageZoomInstance: null,
    };
  },
  props: {
    listImageLink: String,
  },
  watch: {
    listImageLink: function (newValue) {
      if (newValue) {
        let arrImage = JSON.parse(newValue);
        if (arrImage.length > 0) {
          this.listImg = arrImage;
          this.showedImg = arrImage[0];
          this.$emit("currentImage", arrImage[0]);
        } else {
          this.$emit("currentImage", "default.jpg");
        }
      }
    },
  },
  methods: {
    changeImage(newImg) {
      this.showedImg = newImg;
      // this.imageZoomInstance = undefined;
      this.initZoomer();
    },
    zoomImage() {
      this.isZoom = !this.isZoom;
    },
    initZoomer() {
      if (window.outerWidth >= 1280) {
        let myImageDiv = document.getElementById("img-container");
        var children = myImageDiv.childNodes;
        for (var i = children.length - 1; i >= 0; i--) {
          var child = children[i];
          myImageDiv.removeChild(child);
        }
        let options = {
          width: 500,
          offset: {
            vertical: 0,
            horizontal: 30,
          },
          img: this.showedImg,
        };
        this.imageZoomInstance = new window.ImageZoom(myImageDiv, options);
      }
    },
  },
  components: {
    FontAwesomeIcon,
  },
  mounted() {
    this.initZoomer();
  },
};
</script>

<style>
.image_contain img {
  object-fit: contain;
  width: 100% !important;
  height: auto !important;
}
.image_contain .js-image-zoom__zoomed-image {
  padding-left: 20px !important;
}
</style>