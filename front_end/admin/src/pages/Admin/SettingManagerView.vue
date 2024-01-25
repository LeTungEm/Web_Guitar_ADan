<template>
  <div
    class="relative overflow-x-auto overflow-y-scroll h-[80vh] shadow-md sm:rounded-lg z-10 p-5"
  >
    <!-- customer response -->
    <div class="mt-5 shadow-lg p-5">
      <div class="text-xl border-b-2 border-black font-bold pb-2 mb-5">
        ALBUM ẢNH
      </div>
      <div class="flex gap-5 flex-wrap">
        <label
          for="clientFile"
          class="flex justify-center items-center border-2 rounded-md w-[25vw] h-[25vw] lg:w-[10vw] lg:h-[10vw] bg-gray-300 hover:text-white hover:bg-green-700"
        >
          Chọn ảnh
        </label>
        <input
          :onchange="changeFile"
          hidden
          id="clientFile"
          accept="image/*"
          multiple
          type="file"
        />
        <div class="flex gap-5 flex-wrap" v-if="listImageUrl.length > 0">
          <div
            v-for="(imageItem, index) in listImageUrl"
            :key="imageItem"
            class="relative m-auto"
          >
            <img
              class="border object-cover object-center w-[25vw] h-[25vw] lg:w-[10vw] lg:h-[10vw] m-auto"
              :src="imageItem"
              alt="hinh anh"
            />
            <span
              :onclick="() => removeImage(index)"
              class="absolute top-0 -right-3 border border-black bg-black text-white px-[0.65rem] py-1 rounded-full cursor-pointer"
              >X</span
            >
          </div>
        </div>
        <!-- Ảnh đã có sẵn -->
        <div class="flex gap-5 flex-wrap" v-if="listOldImage.length > 0">
          <div
            v-for="(imageName, index) in listOldImage"
            :key="imageName"
            class="relative m-auto"
          >
            <img
              class="border object-cover object-center w-[25vw] h-[25vw] lg:w-[10vw] lg:h-[10vw] m-auto"
              :src="`${doman}/back_end/api/Controllers/GetFileController.php?imgURL=${imageName}&width=1200`"
              :alt="imageName"
            />
            <span
              :onclick="() => removeOldImage(index)"
              class="absolute top-0 -right-3 border border-black bg-black text-white px-[0.65rem] py-1 rounded-full cursor-pointer"
              >X</span
            >
          </div>
        </div>
      </div>
    </div>
    <!-- Banner -->
    <div class="mt-5 shadow-lg p-5">
      <div class="text-xl border-b-2 border-black font-bold pb-2 mb-5">
        BANNER
      </div>
      <div>
        <div
          class="p-3 lg:p-5 duration-300 bg-gray-300 hover:bg-green-700 hover:text-white rounded-md text-center font-bold"
          :onclick="changeCropImageBannerStatus"
        >
          Đổi Ảnh
        </div>
        <img
          class="w-full max-w-[1000px] m-auto my-5 border"
          v-if="newImage != null"
          :src="newImage"
          alt="hinh anh"
        />
        <img
          v-else
          class="w-full max-w-[1000px] m-auto mt-5 border"
          :src="`${doman}/back_end/api/Controllers/GetFileController.php?imgURL=/banner/banner.jpg&width=1000`"
          alt="meo"
        />
        <div
          v-bind:class="cropImageBannerStatus ? 'flex' : 'hidden'"
          class="fixed inset-0 bg-black bg-opacity-80 z-[25] justify-center items-center p-5"
        >
          <div class="w-full md:w-2/3 xl:w-1/2">
            <div class="flex justify-end">
              <span
                :onclick="changeCropImageBannerStatus"
                class="text-white py-3 px-5 text-lg font-bold cursor-pointer"
                >Đóng</span
              >
            </div>
            <CropImageMolecule
              :width="1920"
              :heigh="1080"
              @changeImage="changeBannerImage"
              class="bg-black"
            />
          </div>
        </div>
      </div>
    </div>
    <!-- Background -->
    <div class="mt-5 shadow-lg p-5">
      <div class="text-xl border-b-2 border-black font-bold pb-2 mb-5">
        ẢNH NỀN
      </div>
      <div>
        <div
          class="p-3 lg:p-5 duration-300 bg-gray-300 hover:bg-green-700 hover:text-white rounded-md text-center font-bold"
          :onclick="changeCropBackgroundStatus"
        >
          Đổi Ảnh
        </div>
        <img
          class="w-full max-w-[1000px] m-auto my-5 border"
          v-if="newBackground != null"
          :src="newBackground"
          alt="hinh anh"
        />
        <img
          v-else
          class="w-full max-w-[1000px] m-auto mt-5 border"
          :src="`${doman}/back_end/api/Controllers/GetFileController.php?imgURL=/background/background.jpg&width=1000`"
          alt="meo"
        />
        <div
          v-bind:class="cropBackgroundStatus ? 'flex' : 'hidden'"
          class="fixed inset-0 bg-black bg-opacity-80 z-[25] justify-center items-center p-5"
        >
          <div class="w-full md:w-2/3 xl:w-1/2">
            <div class="flex justify-end">
              <span
                :onclick="changeCropBackgroundStatus"
                class="text-white py-3 px-5 text-lg font-bold cursor-pointer"
                >Đóng</span
              >
            </div>
            <CropImageMolecule
              :width="1920"
              :heigh="1080"
              @changeImage="changeBackgroundImage"
              class="bg-black"
            />
          </div>
        </div>
      </div>
    </div>
    <loading-atom :status="loadingStatus" />
  </div>
</template>

<script>
import { DOMAN } from "@/assets/js/config";
import CropImageMolecule from "@/components/molecules/CropImageMolecule.vue";
import CatService from "@/service/CatService";
import SettingService from "@/service/SettingService";
import UploadFile from "@/service/UploadFile";
import LoadingAtom from "@/components/atoms/LoadingAtom.vue";

export default {
  name: "SettingManagerView",
  data() {
    return {
      aboutFiles: [],
      listAboutImageUrl: [],
      listAboutImageName: [],
      files: [],
      listImageUrl: [],
      listImageName: [],
      listOldImage: [],
      cropImageStatus: false,
      cropImageBannerStatus: false,
      cropBackgroundStatus: false,
      doman: DOMAN,
      newImage: null,
      newBackground: null,
      loadingStatus: false,
    };
  },
  methods: {
    changeFile(e) {
      if (e.target.files.length > 0) {
        this.files = [...e.target.files];
        this.getImagePropertive(e.target.files);
        this.saveImage(this.files, this.listImageName);
        this.saveData();
      }
    },
    getImagePropertive(listFile) {
      for (let index = 0; index < listFile.length; index++) {
        const element = listFile[index];
        this.listImageUrl.push(URL.createObjectURL(element));
        this.listImageName.push(
          this.formatName("client_responses/", element.name)
        );
      }
    },
    formatName(folder, string) {
      let num = Math.floor(Math.random() * (100000000 - 1000000 + 1)) + 1000000;
      let newName = string.substring(0, string.lastIndexOf("."));
      return folder + num + newName + ".jpg";
    },
    changeCropImageBannerStatus() {
      this.cropImageBannerStatus = !this.cropImageBannerStatus;
    },
    changeCropBackgroundStatus() {
      this.cropBackgroundStatus = !this.cropBackgroundStatus;
    },
    removeImage(index) {
      this.deleteImage(this.listImageName[index]);
      this.listImageUrl.splice(index, 1);
      this.listImageName.splice(index, 1);
      this.files.splice(index, 1);
      this.saveData();
    },
    removeOldImage(index) {
      this.deleteImage(this.listOldImage[index]);
      this.listOldImage.splice(index, 1);
      this.saveData();
    },
    changeImage(image) {
      this.listImage.push(image);
      this.listImageName.push("client_responses/" + image.name);
      this.saveImage(image.blob, "client_responses/" + image.name);
      this.cropImageStatus = false;
    },
    changeBannerImage(image) {
      this.newImage = image.url;
      this.saveImage([image.blob], ["banner/banner.jpg"]);
      this.cropImageBannerStatus = false;
    },
    changeBackgroundImage(image) {
      this.newBackground = image.url;
      this.saveImage([image.blob], ["background/background.jpg"]);
      this.cropBackgroundStatus = false;
    },
    deleteImage(image) {
      this.loadingStatus = true;
      CatService.deleteImage([image])
        .then((res) => {
          console.log("da xoa", res.data);
        })
        .finally(() => {
          this.loadingStatus = false;
        });
    },
    saveImage(imageBlob, imageName) {
      this.loadingStatus = true;
      UploadFile.uploadImage(imageBlob, imageName)
        .then((res) => {
          console.log(res.data);
        })
        .finally(() => {
          this.loadingStatus = false;
        });
    },
    saveData() {
      let newArr = [...this.listImageName, ...this.listOldImage];
      let jsonArr = JSON.stringify(newArr);
      SettingService.updateClientRespons(jsonArr).then((res) => {
        console.log(res.data);
      });
    },
    getSetting() {
      SettingService.getAll().then((res) => {
        if (res.data) {
          this.listOldImage = JSON.parse(res.data.client_respons);
        }
      });
    },
  },
  components: {
    CropImageMolecule,
    LoadingAtom,
  },
  created() {
    this.getSetting();
  },
};
</script>

<style>
</style>