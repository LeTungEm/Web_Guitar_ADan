<template>
  <div class="overflow-y-auto max-h-[85vh]">
    <div class="flex justify-between mb-5">
      <GreenButtonAtom
        :onclick="backToPre"
        class="py-3 px-5"
        :text="'Trở về'"
      />
    </div>
    <div class="flex flex-col md:flex-row gap-5">
      <div class="md:w-1/2 shadow-lg rounded-sm p-5">
        <div class="mb-5 shadow-lg p-5">
          <label class="text-gray-500 font-bold" for="catName">Tên*</label>
          <input
            id="catName"
            class="border rounded-md w-full outline-0 focus:outline-2 focus:outline-green-700 py-1 lg:py-2 px-2 lg:px-4"
            type="text"
            v-model="name"
            @change="formatNameToSlug"
          />
        </div>
        <div class="mb-5 shadow-lg p-5">
          <label class="text-gray-500 font-bold" for="slug">Đường đẫn*</label>
          <input
            id="slug"
            v-model="slug"
            class="border rounded-md w-full outline-0 focus:outline-2 focus:outline-green-700 py-1 lg:py-2 px-2 lg:px-4"
            type="text"
          />
        </div>
        <div class="mb-5 shadow-lg p-5">
          <label class="text-gray-500 font-bold" for="price">Giá*</label>
          <input
            id="price"
            v-model="price"
            class="border rounded-md w-full outline-0 focus:outline-2 focus:outline-green-700 py-1 lg:py-2 px-2 lg:px-4"
            type="number"
          />
        </div>
        <div class="mb-5 shadow-lg p-5">
          <label class="text-gray-500 font-bold" for="newPrice">Giảm giá</label>
          <input
            id="newPrice"
            v-model="newPrice"
            class="border rounded-md w-full outline-0 focus:outline-2 focus:outline-green-700 py-1 lg:py-2 px-2 lg:px-4"
            type="number"
          />
        </div>
        <div class="mb-5 shadow-lg p-5">
          <label class="text-gray-500 font-bold" for="catGender"
            >Loại sản phẩm</label
          >
          <select
            class="border rounded-md w-full outline-0 focus:outline-2 focus:outline-green-700 py-1 lg:py-2 px-2 lg:px-4"
            id="catGender"
            v-model="type"
          >
            <option value="product">Đàn Guitar</option>
            <option value="accessory">Phụ Kiện</option>
          </select>
        </div>
        <div class="mb-5 shadow-lg p-5">
          <label class="text-gray-500 font-bold" for="catGender">Hãng*</label>
          <select
            class="border rounded-md w-full outline-0 focus:outline-2 focus:outline-green-700 py-1 lg:py-2 px-2 lg:px-4"
            id="catGender"
            v-model="brandId"
          >
            <option value="0">chọn hãng</option>
            <option
              v-for="brand in listBrand"
              :key="brand.key"
              :value="brand.key"
            >
              {{ brand.name }}
            </option>
          </select>
        </div>
        <div class="mb-5 shadow-lg p-5">
          <label class="text-gray-500 font-bold" for="catGender"
            >Xuất Xứ*</label
          >
          <select
            class="border rounded-md w-full outline-0 focus:outline-2 focus:outline-green-700 py-1 lg:py-2 px-2 lg:px-4"
            id="catGender"
            v-model="originId"
          >
            <option :key="0" :value="0">chọn xuất xứ</option>
            <option
              v-for="origin in listOrigin"
              :key="origin.key"
              :value="origin.key"
            >
              {{ origin.name }}
            </option>
          </select>
        </div>
        <div class="mb-5 shadow-lg p-5">
          <label class="text-gray-500 font-bold" for="catGender"
            >Tình trạng sản phẩm</label
          >
          <select
            class="border rounded-md w-full outline-0 focus:outline-2 focus:outline-green-700 py-1 lg:py-2 px-2 lg:px-4"
            id="catGender"
            v-model="status"
          >
            <option value="1">Sản phẩm mới</option>
            <option value="0">Đã qua sử dụng</option>
          </select>
        </div>
        <div v-if="type == 'product'" class="mb-5 shadow-lg p-5">
          <label class="text-gray-500 font-bold" for="catGender"
            >Loại người dùng</label
          >
          <select
            class="border rounded-md w-full outline-0 focus:outline-2 focus:outline-green-700 py-1 lg:py-2 px-2 lg:px-4"
            id="catGender"
            v-model="isProfes"
          >
            <option value="1">Chuyên nghiệp</option>
            <option value="0">Người mới chơi</option>
          </select>
        </div>
        <div class="mb-5 shadow-lg p-5">
          <label class="text-gray-500 font-bold" for="catGender"
            >Hiển thị</label
          >
          <select
            class="border rounded-md w-full outline-0 focus:outline-2 focus:outline-green-700 py-1 lg:py-2 px-2 lg:px-4"
            id="catGender"
            v-model="isShow"
          >
            <option value="1">Hiển thị</option>
            <option value="0">Ẩn</option>
          </select>
        </div>
        <div v-if="type == 'product'" class="mb-5 shadow-lg p-5">
          <label class="text-gray-500 font-bold" for="catGender"
            >Danh mục sản phẩm*</label
          >
          <select
            class="border rounded-md w-full outline-0 focus:outline-2 focus:outline-green-700 py-1 lg:py-2 px-2 lg:px-4"
            id="catGender"
            v-model="categoryId"
          >
            <option value="0">Chọn danh mục sản phẩm</option>
            <option value="8">Phụ kiện</option>
            <option value="4">Guitar Acoustic</option>
            <option value="3">Guitar Classic</option>
          </select>
        </div>
      </div>
      <div class="md:w-1/2 shadow-lg rounded-sm p-5">
        <div v-if="type == 'product'" class="mb-5 shadow-lg p-5">
          <label class="text-gray-500 font-bold">Danh mục trưng bày</label>
          <div class="flex gap-5">
            <span
              class="border rounded-md w-full outline-0 focus:outline-2 focus:outline-green-700 py-1 lg:py-2 px-2 lg:px-4"
            >
              <input
                v-model="isNew"
                class="peer"
                type="checkbox"
                name="isNew"
                id="isNew"
              />
              <label class="ml-5 peer-checked:underline" for="isNew"
                >Sản phẩm mới</label
              >
            </span>
            <span
              class="border rounded-md w-full outline-0 focus:outline-2 focus:outline-green-700 py-1 lg:py-2 px-2 lg:px-4"
            >
              <input
                v-model="isBestSeller"
                class="peer"
                type="checkbox"
                name="isBestSeller"
                id="isBestSeller"
              />
              <label class="ml-5 peer-checked:underline" for="isBestSeller"
                >Sản phẩm bán chạy</label
              >
            </span>
          </div>
        </div>
        <div class="mb-5 shadow-lg p-5">
          <label class="text-gray-500 font-bold" for="description"
            >Mô tả ngắn (Chỉ nhập văn bản và ảnh)</label
          >
          <froala
            class="z-20 border rounded-md w-full outline-0 focus:outline-2 focus:outline-green-700 py-1 lg:py-2 px-2 lg:px-4"
            id="description"
            :tag="'textarea'"
            :config="config"
            v-model:value="outstanding"
          ></froala>
        </div>
        <div class="mb-5 shadow-lg p-5">
          <label class="text-gray-500 font-bold" for="description"
            >Mô tả (Chỉ nhập văn bản và ảnh)</label
          >
          <froala
            class="z-20 border rounded-md w-full outline-0 focus:outline-2 focus:outline-green-700 py-1 lg:py-2 px-2 lg:px-4"
            id="description"
            :tag="'textarea'"
            :config="config_2"
            v-model:value="description"
          ></froala>
        </div>
        <!-- Link youtube -->
        <div class="mb-5 shadow-lg p-5">
          <label class="text-gray-500" for="video1"
            ><span class="font-bold">Link youtube</span> (Hướng dẫn: dùng máy
            tính => vào youtube => chon video => chọn CHIA SẺ => chọn NHÚNG =>
            sao chép đoạn mã đó dán vào đây => bấm THÊM)</label
          >
          <div class="flex gap-5">
            <input
              id="video1"
              v-model="video"
              class="border rounded-md w-full outline-0 focus:outline-2 focus:outline-green-700 py-1 lg:py-2 px-2 lg:px-4"
              type="text"
            />
            <div
              :onclick="addVideoLink"
              class="flex items-center justify-center px-5 text-white font-bold0 rounded-md"
            >
              THÊM
            </div>
          </div>
          <div v-if="listVideo.length > 0" class="flex gap-5 flex-wrap">
            <div
              v-for="(videoItem, index) in listVideo"
              :key="index"
              class="relative w-full"
            >
              <div
                v-html="videoItem"
                class="border [&>*]:w-full mt-5 m-auto"
              ></div>
              <span
                :onclick="() => removeVideo(index)"
                class="absolute top-0 -right-3 border border-black bg-black text-white px-[0.65rem] py-1 rounded-full cursor-pointer"
                >X</span
              >
            </div>
          </div>
        </div>
        <!-- Hinh anh -->
        <div class="mb-5 shadow-lg p-5">
          <label class="text-gray-500 font-bold">Ảnh trưng bày</label>
          <div
            :onclick="changeCropImageStatus"
            class="border-2 rounded-md w-full bg-white hover:text-white hover:bg-green-700 py-1 lg:py-2 px-2 lg:px-4"
          >
            Chọn ảnh
          </div>
          <div class="flex gap-5 flex-wrap" v-if="listImage.length > 0">
            <div
              v-for="(imageItem, index) in listImage"
              :key="imageItem"
              class="relative m-auto"
            >
              <img
                class="border w-[200px] mt-5 m-auto"
                :src="imageItem.url"
                :alt="imageItem.name"
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
                class="border w-[200px] mt-5 m-auto"
                :src="`${doman}/back_end/api/Controllers/GetFileController.php?imgURL=${imageName}&width=500`"
                :alt="imageName"
              />
              <span
                :onclick="() => removeOldImage(index)"
                class="absolute top-0 -right-3 border border-black bg-black text-white px-[0.65rem] py-1 rounded-full cursor-pointer"
                >X</span
              >
            </div>
          </div>
          <div
            v-bind:class="cropImageStatus ? 'flex' : 'hidden'"
            class="fixed inset-0 bg-black bg-opacity-80 z-[25] justify-center items-center p-5"
          >
            <div class="w-full md:w-2/3 xl:w-1/2">
              <div class="flex justify-end">
                <span
                  :onclick="changeCropImageStatus"
                  class="text-white py-3 px-5 text-lg font-bold cursor-pointer"
                  >Đóng</span
                >
              </div>
              <CropImageMolecule @changeImage="changeImage" class="bg-black" />
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="flex justify-between mt-5">
      <GreenButtonAtom
        :onclick="saveCat"
        class="py-3 px-5 w-full"
        :text="'Lưu lại'"
      />
    </div>
    <LoadingAtom :status="loadingStatus" />
  </div>
</template>
  
  <script>
import CategoryService from "@/service/CategoryService";
import CatService from "@/service/CatService";
import GreenButtonAtom from "../atoms/button/GreenButtonAtom.vue";
import CropImageMolecule from "./CropImageMolecule.vue";
import { formatSlug } from "@/assets/js/quickFunction";
import { mapActions } from "vuex";
import UploadFile from "@/service/UploadFile";
import { DOMAN } from "@/assets/js/config";
import LoadingAtom from "../atoms/LoadingAtom.vue";
import BrandService from "@/service/BrandService";
import OriginService from "@/service/OriginService";

export default {
  name: "CatFormMolecule",
  data() {
    return {
      loadingStatus: false,
      doman: DOMAN,
      config: {
        events: {
          initialized: function () {
            console.log("initialized");
          },
          "image.inserted": function (img) {
            let imageName =
              Math.floor(Math.random() * (100000000 - 1000000 + 1)) +
              1000000 +
              "image_news.jpg";
            fetch(img[0].src)
              .then((response) => response.blob())
              .then((blob) => {
                UploadFile.uploadImage([blob], [`word/${imageName}`]).then(
                  (res) => {
                    console.log(res.data);
                    // set new src of image in HTML
                    let newUrls = `${DOMAN}/back_end/api/Controllers/GetFileController.php?imgURL=word/${imageName}&width=1200`;
                    let htmlString = this.html.get();
                    let parser = new DOMParser();
                    let doc = parser.parseFromString(htmlString, "text/html");

                    // Lấy tất cả các thẻ <img> trong cây DOM
                    let imgElements = doc.querySelectorAll("img");

                    // Thay đổi thuộc tính src của mỗi thẻ <img> bằng các URL mới
                    imgElements.forEach(function (itemImg) {
                      if (itemImg.src === img[0].src) {
                        itemImg.src = newUrls;
                      }
                    });

                    // Chuyển cây DOM thành chuỗi HTML mới
                    let newHtmlString = doc.documentElement.outerHTML;
                    this.html.set(newHtmlString);
                  }
                );
              });
          },
          "image.removed": function (img) {
            let url = img[0].src.toString();
            url = url.replace(
              `${DOMAN}/back_end/api/Controllers/GetFileController.php?imgURL=`,
              ""
            );
            url = url.replace("&width=1200", "");
            console.log(url);
            CatService.deleteImage([url]).then((res) => {
              console.log("da xoa", res.data);
            });
          },
          "image.replaced": function (img) {
            let imageName =
              Math.floor(Math.random() * (100000000 - 1000000 + 1)) +
              1000000 +
              "image_news.jpg";
            fetch(img[0].src)
              .then((response) => response.blob())
              .then((blob) => {
                UploadFile.uploadImage([blob], [`word/${imageName}`]).then(
                  (res) => {
                    console.log(res.data);
                    // set new src of image in HTML
                    let newUrls = `${DOMAN}/back_end/api/Controllers/GetFileController.php?imgURL=word/${imageName}&width=1200`;
                    let htmlString = this.html.get();
                    let parser = new DOMParser();
                    let doc = parser.parseFromString(htmlString, "text/html");

                    // Lấy tất cả các thẻ <img> trong cây DOM
                    let imgElements = doc.querySelectorAll("img");

                    // Thay đổi thuộc tính src của mỗi thẻ <img> bằng các URL mới
                    imgElements.forEach(function (itemImg) {
                      if (itemImg.src === img[0].src) {
                        itemImg.src = newUrls;
                      }
                    });

                    // Chuyển cây DOM thành chuỗi HTML mới
                    let newHtmlString = doc.documentElement.outerHTML;
                    this.html.set(newHtmlString);
                  }
                );
              });
          },
        },
      },
      config_2: {
        events: {
          initialized: function () {
            console.log("initialized");
          },
          "image.inserted": function (img) {
            let imageName =
              Math.floor(Math.random() * (100000000 - 1000000 + 1)) +
              1000000 +
              "image_news.jpg";
            fetch(img[0].src)
              .then((response) => response.blob())
              .then((blob) => {
                UploadFile.uploadImage([blob], [`word/${imageName}`]).then(
                  (res) => {
                    console.log(res.data);
                    // set new src of image in HTML
                    let newUrls = `${DOMAN}/back_end/api/Controllers/GetFileController.php?imgURL=word/${imageName}&width=1200`;
                    let htmlString = this.html.get();
                    let parser = new DOMParser();
                    let doc = parser.parseFromString(htmlString, "text/html");

                    // Lấy tất cả các thẻ <img> trong cây DOM
                    let imgElements = doc.querySelectorAll("img");

                    // Thay đổi thuộc tính src của mỗi thẻ <img> bằng các URL mới
                    imgElements.forEach(function (itemImg) {
                      if (itemImg.src === img[0].src) {
                        itemImg.src = newUrls;
                      }
                    });

                    // Chuyển cây DOM thành chuỗi HTML mới
                    let newHtmlString = doc.documentElement.outerHTML;
                    this.html.set(newHtmlString);
                  }
                );
              });
          },
          "image.removed": function (img) {
            let url = img[0].src.toString();
            url = url.replace(
              `${DOMAN}/back_end/api/Controllers/GetFileController.php?imgURL=`,
              ""
            );
            url = url.replace("&width=1200", "");
            console.log(url);
            CatService.deleteImage([url]).then((res) => {
              console.log("da xoa", res.data);
            });
          },
          "image.replaced": function (img) {
            let imageName =
              Math.floor(Math.random() * (100000000 - 1000000 + 1)) +
              1000000 +
              "image_news.jpg";
            fetch(img[0].src)
              .then((response) => response.blob())
              .then((blob) => {
                UploadFile.uploadImage([blob], [`word/${imageName}`]).then(
                  (res) => {
                    console.log(res.data);
                    // set new src of image in HTML
                    let newUrls = `${DOMAN}/back_end/api/Controllers/GetFileController.php?imgURL=word/${imageName}&width=1200`;
                    let htmlString = this.html.get();
                    let parser = new DOMParser();
                    let doc = parser.parseFromString(htmlString, "text/html");

                    // Lấy tất cả các thẻ <img> trong cây DOM
                    let imgElements = doc.querySelectorAll("img");

                    // Thay đổi thuộc tính src của mỗi thẻ <img> bằng các URL mới
                    imgElements.forEach(function (itemImg) {
                      if (itemImg.src === img[0].src) {
                        itemImg.src = newUrls;
                      }
                    });

                    // Chuyển cây DOM thành chuỗi HTML mới
                    let newHtmlString = doc.documentElement.outerHTML;
                    this.html.set(newHtmlString);
                  }
                );
              });
          },
        },
      },
      cropImageStatus: false,
      video: null,
      categories: [],
      listImage: [],
      listImageName: [],
      listImageBlob: [],
      listOldImage: [],
      cat_id: "",
      name: "",
      slug: "",
      price: 0,
      newPrice: 0,
      brandId: 0,
      originId: 0,
      status: 1,
      isProfes: 1,
      type: "product",
      isShow: 1,
      categoryId: 0,
      outstanding: "",
      description: "",
      isNew: false,
      isBestSeller: false,
      listVideo: [],
      listBrand: [],
      listOrigin: [],
    };
  },
  watch: {
    type: function () {
      if (this.type != "product") {
        this.categoryId = "8";
      }
    },
  },
  components: {
    GreenButtonAtom,
    CropImageMolecule,
    LoadingAtom,
  },
  // emits: ["toNextForm", "insertData"],
  methods: {
    ...mapActions(["showNotification"]),
    backToPre() {
      this.$router.push("/quan-ly/quan-ly-san-pham");
    },

    async getBrand() {
      await BrandService.getAll().then((res) => {
        this.listBrand = res.data;
      });
    },

    async getOrigin() {
      await OriginService.getAll().then((res) => {
        this.listOrigin = res.data;
      });
    },

    async getAllCategory() {
      await CategoryService.getAllChild().then((res) => {
        this.categories = res.data;
      });
    },

    async saveCat() {
      if (
        this.isFullField() &&
        this.isPriceCorrect() &&
        this.isSelectCategory()
      ) {
        let isSLugNotExists = await this.isSlugNotExists();
        if (isSLugNotExists) {
          let catSlug = this.$route.params.slug;
          if (catSlug == 0) {
            this.insertCat();
          } else {
            this.updateCat();
          }
        }
      }
    },
    updateCat() {
      this.loadingStatus = true;
      CatService.updateCat(
        this.name,
        this.slug,
        this.price,
        this.newPrice == "" ? 0 : this.newPrice,
        this.brandId,
        this.originId,
        this.outstanding,
        this.description,
        this.status,
        this.isProfes,
        this.type,
        this.isShow,
        JSON.stringify([...this.listImageName, ...this.listOldImage]),
        JSON.stringify(this.listVideo),
        0,
        this.categoryId,
        this.isBestSeller ? 1 : 0,
        this.isNew ? 1 : 0,
        this.cat_id
      )
        .then((res) => {
          if (res.data.message == true) {
            this.showNotification(["Sửa thành công", false]);
            this.saveImage();
            this.$router.push("/quan-ly/quan-ly-san-pham");
          } else {
            this.showNotification(["Sửa thất bại", true]);
          }
        })
        .finally(() => {
          this.loadingStatus = false;
        });
    },
    insertCat() {
      this.loadingStatus = true;
      CatService.insertCat(
        this.name,
        this.slug,
        this.price,
        this.newPrice == "" ? 0 : this.newPrice,
        this.brandId,
        this.originId,
        this.outstanding,
        this.description,
        this.status,
        this.isProfes,
        this.type,
        this.isShow,
        JSON.stringify([...this.listImageName, ...this.listOldImage]),
        JSON.stringify(this.listVideo),
        0,
        this.categoryId,
        this.isBestSeller ? 1 : 0,
        this.isNew ? 1 : 0
      )
        .then((res) => {
          if (res.data.message == true) {
            this.showNotification(["Thêm thành công", false]);
            this.saveImage();
            this.$router.push("/quan-ly/quan-ly-san-pham");
          } else {
            this.showNotification(["Thêm thất bại", true]);
          }
        })
        .finally(() => {
          this.loadingStatus = false;
        });
    },
    saveImage() {
      if (this.listImage.length > 0) {
        UploadFile.uploadImage(this.listImageBlob, this.listImageName).then(
          (res) => {
            console.log(res.data);
          }
        );
      }
    },
    async isSlugNotExists() {
      let result = await CatService.getBySlug(this.slug);
      if (result.data == null) {
        return true;
      } else {
        if (this.$route.params.slug == result.data.slug) {
          return true;
        }
        this.showNotification(["Tên sản phẩm đã tồn tại", true]);
        return false;
      }
    },
    isFullField() {
      if (
        this.name.trim() == "" ||
        this.slug.trim() == "" ||
        this.price.toString().trim() == "" ||
        this.brandId == 0 ||
        this.originId == 0 ||
        this.categoryId == 0
      ) {
        this.showNotification(["Hãy nhập đủ thông tin", true]);
        return false;
      }
      return true;
    },
    isPriceCorrect() {
      if (this.price <= 0) {
        this.showNotification(["Hãy nhập giá lớn hơn 0", true]);
        return false;
      } else if (this.newPrice > this.price) {
        this.showNotification(["Giá được giảm đã lớn hơn giá mặc định", true]);
        return false;
      }
      return true;
    },
    isSelectCategory() {
      if (this.categoryId == 0) {
        this.showNotification(["Hãy chọn danh mục", true]);
        return false;
      }
      return true;
    },
    changeCropImageStatus() {
      this.cropImageStatus = !this.cropImageStatus;
    },
    changeImage(image) {
      this.listImage.push(image);
      this.listImageName.push(image.name);
      this.listImageBlob.push(image.blob);
      this.cropImageStatus = false;
    },
    formatNameToSlug() {
      this.slug = formatSlug(this.name);
    },
    removeImage(index) {
      this.listImage.splice(index, 1);
      this.listImageName.splice(index, 1);
      this.listImageBlob.splice(index, 1);
    },
    removeOldImage(index) {
      CatService.deleteImage([this.listOldImage[index]]).then((res) => {
        console.log("da xoa", res.data);
      });
      this.listOldImage.splice(index, 1);
    },
    addVideoLink() {
      if (this.video != null) {
        this.listVideo.push(this.video);
        this.video = null;
      }
    },
    removeVideo(index) {
      this.listVideo.splice(index, 1);
    },
    getCatInfo() {
      let catSlug = this.$route.params.slug;
      if (catSlug != 0) {
        this.loadingStatus = true;
        CatService.getBySlug(catSlug)
          .then((res) => {
            if (res.data) {
              this.setCatInfo(res.data);
            }
          })
          .finally(() => {
            this.loadingStatus = false;
          });
      }
    },
    setCatInfo(catInfo) {
      this.cat_id = catInfo.cat_id;
      this.name = catInfo.name;
      this.slug = catInfo.slug;
      this.price = catInfo.price;
      this.newPrice = catInfo.new_price;
      this.brandId = catInfo.brand;
      this.originId = catInfo.origin;
      this.outstanding = catInfo.outstanding;
      this.description = catInfo.description;
      this.status = catInfo.status;
      this.isProfes = catInfo.isProfes;
      this.type = catInfo.type;
      this.isShow = catInfo.isShow;
      this.listVideo = JSON.parse(catInfo.video);
      this.listOldImage = JSON.parse(catInfo.image);
      this.categoryId = catInfo.category_id;
      this.isBestSeller = catInfo.isBestSeller == 1 ? true : false;
      this.isNew = catInfo.isNew == 1 ? true : false;
    },
  },
  async created() {
    await this.getAllCategory();
    await this.getBrand();
    await this.getOrigin();
    await this.getCatInfo();
  },
};
</script>
  
  <style>
</style>