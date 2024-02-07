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
      <div class="shadow-lg rounded-sm p-5">
        <div class="mb-5 shadow-lg p-5">
          <label class="text-gray-500 font-bold" for="blogName">Tên*</label>
          <input
            id="blogName"
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
          <label class="text-gray-500 font-bold" for="type"
            >Loại bài đăng*</label
          >
          <select
            id="type"
            v-model="type"
            class="border rounded-md w-full outline-0 focus:outline-2 focus:outline-green-700 py-1 lg:py-2 px-2 lg:px-4"
          >
            <option value="tn">Thiện Nguyện</option>
            <option value="bc">Báo chí</option>
          </select>
        </div>
        <div class="mb-5 shadow-lg p-5">
          <label class="text-gray-500 font-bold" for="shortDescription">
            <span class="font-bold">Link youtube</span> (Hướng dẫn: dùng máy
            tính => vào youtube => chon video => chọn CHIA SẺ => chọn NHÚNG =>
            sao chép đoạn mã đó dán vào đây => bấm LƯU LẠI)
          </label>
          <input
            id="shortDescription"
            v-model="short_description"
            class="border rounded-md w-full outline-0 focus:outline-2 focus:outline-green-700 py-1 lg:py-2 px-2 lg:px-4"
            type="text"
          />
        </div>
        <div v-if="false" class="mb-5 shadow-lg p-5">
          <label class="text-gray-500 font-bold" for="description"
            >Nội dung (Chỉ nhập văn bản và ảnh)</label
          >
          <froala
            class="z-20 border rounded-md w-full outline-0 focus:outline-2 focus:outline-green-700 py-1 lg:py-2 px-2 lg:px-4"
            id="description"
            :tag="'textarea'"
            :config="config"
            v-model:value="description"
          ></froala>
        </div>
        <div class="mb-5 shadow-lg p-5">
          <label class="text-gray-500 font-bold" for="show">Hiển thị*</label>
          <select
            id="show"
            v-model="isShow"
            class="border rounded-md w-full outline-0 focus:outline-2 focus:outline-green-700 py-1 lg:py-2 px-2 lg:px-4"
          >
            <option value="1">Hiển thị</option>
            <option value="0">Ẩn</option>
          </select>
        </div>
        <!-- Hinh anh -->
        <div v-if="false" class="mb-5 shadow-lg p-5">
          <label class="text-gray-500 font-bold">Ảnh trưng bày</label>
          <div
            :onclick="changeCropImageStatus"
            class="border-2 rounded-md w-full bg-white hover:text-white hover:bg-green-700 py-1 lg:py-2 px-2 lg:px-4"
          >
            Chọn ảnh
          </div>
          <div class="flex gap-5 flex-wrap">
            <div class="relative m-auto">
              <img
                v-if="image"
                class="border w-[200px] mt-5 m-auto"
                :src="image.url"
                :alt="image.name"
              />
              <img
                v-else
                class="border w-[200px] mt-5 m-auto"
                :src="`${doman}/back_end/api/Controllers/GetFileController.php?imgURL=${oldImage}&width=500`"
                :alt="oldImage"
              />
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
              <CropImageMolecule
                :width="300"
                :heigh="300"
                @changeImage="changeImage"
                class="bg-black"
              />
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="flex justify-between mt-5">
      <GreenButtonAtom
        :onclick="saveBlog"
        class="py-3 px-5 w-full"
        :text="'Lưu lại'"
      />
    </div>
    <LoadingAtom :status="loadingStatus" />
  </div>
</template>

<script>
import CatService from "@/service/CatService";
import BlogService from "@/service/BlogService";
import GreenButtonAtom from "../atoms/button/GreenButtonAtom.vue";
import UploadFile from "@/service/UploadFile";
import { DOMAN } from "@/assets/js/config";
import { formatSlug } from "@/assets/js/quickFunction";
import CropImageMolecule from "./CropImageMolecule.vue";
import { mapActions } from "vuex";
import LoadingAtom from "../atoms/LoadingAtom.vue";

export default {
  name: "BlogFormMolecule",
  data() {
    return {
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
      cropImageStatus: false,
      loadingStatus: false,
      blog_id: "",
      name: "",
      slug: "",
      type: "tn",
      short_description: "",
      description: "",
      isShow: 1,
      image: "",
      oldImage: "",
    };
  },
  methods: {
    ...mapActions(["showNotification"]),

    backToPre() {
      this.$router.push("/quan-ly/quan-ly-bai-viet");
    },
    async saveBlog() {
      if (this.isFullField()) {
        let isSLugNotExists = await this.isSlugNotExists();
        if (isSLugNotExists) {
          let blogSlug = this.$route.params.slug;
          if (blogSlug == 0) {
            this.insertBlog();
          } else {
            this.updateBlog();
          }
        }
      }
    },
    isFullField() {
      if (
        this.name.trim() == "" ||
        this.slug.trim() == "" ||
        this.short_description.trim() == ""
      ) {
        this.showNotification(["Hãy nhập đủ thông tin", true]);
        return false;
      }
      return true;
    },
    async isSlugNotExists() {
      let result = await BlogService.getBySlug(this.slug);
      if (result.data == null) {
        return true;
      } else {
        if (this.$route.params.slug == result.data.slug) {
          return true;
        }
        this.showNotification(["Tên bài này đã tồn tại", true]);
        return false;
      }
    },
    getBlogBySlug() {
      let blogSlug = this.$route.params.slug;
      if (blogSlug != 0) {
        BlogService.getBySlug(blogSlug).then((res) => {
          this.blog_id = res.data.blog_id;
          this.name = res.data.name;
          this.slug = res.data.slug;
          this.type = res.data.type;
          this.short_description = res.data.short_description;
          this.description = res.data.description;
          this.isShow = res.data.is_show;
          this.oldImage = res.data.image;
        });
      }
    },
    insertBlog() {
      BlogService.insertBlog(
        this.name,
        this.short_description,
        this.description,
        this.isShow,
        this.image ? this.image.name : "gggdefault.jpg",
        this.slug,
        this.type
      ).then((res) => {
        if (res.data.message == true) {
          this.showNotification(["Thêm thành công", false]);
          this.saveImage();
          this.$router.push("/quan-ly/quan-ly-bai-viet");
        } else {
          this.showNotification(["Thêm thất bại", true]);
        }
      });
    },
    updateBlog() {
      BlogService.updateBlog(
        this.name,
        this.short_description,
        this.description,
        this.isShow,
        this.oldImage == "gggdefault.jpg" ? this.image.name : this.oldImage,
        this.slug,
        this.type,
        this.blog_id
      ).then((res) => {
        if (res.data.message == true) {
          this.showNotification(["Sửa thành công", false]);
          this.saveImage();
          this.$router.push("/quan-ly/quan-ly-bai-viet");
        } else {
          this.showNotification(["Sửa thất bại", true]);
        }
      });
    },
    saveImage() {
      if (this.image) {
        let imageName = "";
        if (this.$route.params.slug == 0) {
          imageName = this.image.name;
        } else {
          imageName =
            this.oldImage == "gggdefault.jpg" ? this.image.name : this.oldImage;
        }
        UploadFile.uploadImage([this.image.blob], [imageName]).then((res) => {
          console.log(res.data);
        });
      }
    },
    changeCropImageStatus() {
      this.cropImageStatus = !this.cropImageStatus;
    },
    changeImage(image) {
      this.image = image;
      this.cropImageStatus = false;
    },
    formatNameToSlug() {
      this.slug = formatSlug(this.name);
    },
  },
  mounted() {
    this.getBlogBySlug();
  },
  components: { GreenButtonAtom, CropImageMolecule, LoadingAtom },
};
</script>

<style>
</style>