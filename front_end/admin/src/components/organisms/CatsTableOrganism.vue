<template>
  <div
    class="relative overflow-x-auto overflow-y-scroll h-[80vh] shadow-md sm:rounded-lg z-10"
  >
    <table class="w-full text-sm text-left text-gray-600 dark:text-gray-400">
      <thead
        class="sticky top-0 text-xs text-gray-700 uppercase bg-gray-100 dark:bg-gray-700 dark:text-gray-400 shadow-lg"
      >
        <TableColumnMolecule :columns="columns" />
      </thead>
      <tbody>
        <tr
          class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600 xl:[&>*]:text-base [&>*]:border-2 [&>*]:p-1"
          v-for="(cat, index) in listCat"
          :key="cat.cat_id"
        >
          <td class="font-bold min-w-[200px]">{{ cat.name }}</td>
          <td>
            <div class="grid grid-cols-2 justify-center gap-5">
              <img
                v-for="imageItem in parseJson(cat.image)"
                :key="imageItem"
                loading="lazy"
                class="w-[100px] border"
                :src="`${doman}/back_end/api/Controllers/GetFileController.php?imgURL=${imageItem}&width=300`"
                alt=""
              />
            </div>
          </td>
          <td>
            <PriceTextAtom :minPrice="cat.price" :maxPrice="cat.price" />
          </td>
          <td>
            <PriceTextAtom
              :minPrice="cat.new_price"
              :maxPrice="cat.new_price"
            />
          </td>
          <td>
            {{ cat.brand_name }}
          </td>
          <td>
            {{ cat.category_name }}
          </td>
          <td class="items-center">
            <input
              :onchange="() => setDisplayOfCat(cat, index)"
              class="w-[20px] h-[20px] mx-auto flex cursor-pointer"
              :checked="cat.isShow == 1 ? true : false"
              type="checkbox"
            />
          </td>
          <td v-if="isGuitar == '1'" class="items-center">
            <input
              :onchange="() => changeBestSellerList(cat, index)"
              class="w-[20px] h-[20px] mx-auto flex cursor-pointer"
              :checked="cat.isBestSeller == 1 ? true : false"
              type="checkbox"
            />
          </td>
          <td v-if="isGuitar == '1'" class="items-center">
            <input
              :onchange="() => changeNewList(cat, index)"
              class="w-[20px] h-[20px] mx-auto flex cursor-pointer"
              :checked="cat.isNew == 1 ? true : false"
              type="checkbox"
            />
          </td>
          <td>
            <div class="flex justify-center items-center gap-5">
              <font-awesome-icon
                :onclick="() => showOptionNotification(cat, index)"
                class="text-lg hover:text-green-700 cursor-pointer"
                :icon="['fas', 'delete-left']"
              />
              <font-awesome-icon
                :onclick="() => editCat(cat.slug)"
                class="text-lg hover:text-green-700 cursor-pointer"
                :icon="['fas', 'pen-to-square']"
              />
            </div>
          </td>
        </tr>
      </tbody>
    </table>
    <OptionNotificationAtom
      @pickOption="deleteProduct"
      :status="optionNotifiStatus"
      :text="optionNotifiMessage"
    />
  </div>
</template>
  
  <script>
// import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import TableColumnMolecule from "../molecules/TableColumnMolecule.vue";
import OptionNotificationAtom from "../atoms/OptionNotificationAtom.vue";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import CatService from "@/service/CatService";
import { mapActions } from "vuex";
import { DOMAN } from "@/assets/js/config";
import PriceTextAtom from "../atoms/text/PriceTextAtom.vue";

export default {
  name: "CatsTableOrganism",
  data() {
    return {
      doman: DOMAN,
      listCat: [],
      columns: [
        "Tên",
        "Ảnh",
        "Giá",
        "Giảm Giá",
        "Hãng",
        "Loại",
        "Hiển Thị",
        "Sản Phẩm Bán Chạy",
        "Sản Phẩm Mới",
        "",
      ],
      optionNotifiMessage: "",
      optionNotifiStatus: false,
      deleteInfo: null,
    };
  },
  props: {
    isGuitar: String,
  },
  watch: {
    isGuitar: function () {
      if (this.isGuitar == 1) {
        this.columns = [
          "Tên",
          "Ảnh",
          "Giá",
          "Giảm Giá",
          "Hãng",
          "Loại",
          "Hiển Thị",
          "Sản Phẩm Bán Chạy",
          "Sản Phẩm Mới",
          "",
        ];
        this.getAllCat();
      } else {
        this.columns = [
          "Tên",
          "Ảnh",
          "Giá",
          "Giảm Giá",
          "Hãng",
          "Loại",
          "Hiển Thị",
          "",
        ];
        this.getAllAccessory();
      }
    },
  },
  components: {
    TableColumnMolecule,
    OptionNotificationAtom,
    FontAwesomeIcon,
    PriceTextAtom,
  },
  methods: {
    ...mapActions(["showNotification"]),

    getAllCat() {
      CatService.getAll().then((res) => {
        this.listCat = res.data;
        console.log("pro");
      });
    },
    getAllAccessory() {
      CatService.getAllAccessory().then((res) => {
        this.listCat = res.data;
        console.log("acc");
      });
    },
    parseJson(string) {
      if (string) {
        return JSON.parse(string);
      }
    },
    showOptionNotification(cat, index) {
      this.optionNotifiMessage = `Bạn có muốn xóa ${cat.name}?`;
      this.optionNotifiStatus = true;
      this.deleteInfo = { index: index, cat_id: cat.cat_id };
    },
    async deleteProduct(result) {
      if (result) {
        this.deleteCat();
      } else {
        this.optionNotifiMessage = "";
        this.optionNotifiStatus = false;
      }
    },
    deleteCat() {
      CatService.deleteCat(
        this.deleteInfo.cat_id,
        this.listCat[this.deleteInfo.index].image
      ).then((res) => {
        if (res.data.message == true) {
          this.deleteImageInBlogText(this.listCat[this.deleteInfo.index].description);
          this.showNotification([
            `Đã xóa ${this.listCat[this.deleteInfo.index].name}`,
            false,
          ]);
          this.listCat.splice(this.deleteInfo.index, 1);
        } else {
          this.showNotification([`Xóa thất bại !!!`, true]);
        }
      });

      this.optionNotifiMessage = "";
      this.optionNotifiStatus = false;
    },
    deleteImageInBlogText(description) {
      let htmlString = description;
      let parser = new DOMParser();
      let doc = parser.parseFromString(htmlString, "text/html");

      // Lấy tất cả các thẻ <img> trong cây DOM
      let imgElements = doc.querySelectorAll("img");

      // Thay đổi thuộc tính src của mỗi thẻ <img> bằng các URL mới
      imgElements.forEach(function (itemImg) {
        // if (itemImg.src === img[0].src) {
        //   itemImg.src = newUrls;
        // }

        let url = itemImg.src.toString();
        url = url.replace(
          `${DOMAN}/back_end/api/Controllers/GetFileController.php?imgURL=`,
          ""
        );
        url = url.replace("&width=1200", "");

        CatService.deleteImage([url]).then((res) => {
          console.log("da xoa", res.data, url);
        });
      });
    },
    setDisplayOfCat(cat, index) {
      this.listCat[index].isShow = cat.isShow == 1 ? 0 : 1;
      CatService.changeIsShow(cat.cat_id, this.listCat[index].isShow).then(
        (res) => {
          if (res.data.message) {
            this.showNotification(["Sửa thành công", false]);
          }
        }
      );
    },
    changeBestSellerList(cat, index) {
      this.listCat[index].isBestSeller = cat.isBestSeller == 1 ? 0 : 1;
      let flag = this.listCat[index].isBestSeller;
      CatService.changeBestSellerList(
        cat.cat_id,
        this.listCat[index].isBestSeller
      ).then((res) => {
        console.log("doi bestsl", res.data.message);
        if (res.data.message) {
          if (flag == 1)
            this.showNotification([
              `(${this.listCat[index].name}) đã được thêm vào danh sách bán chạy!`,
              false,
            ]);
          else
            this.showNotification([
              `Đã xóa (${this.listCat[index].name}) khỏi danh sách bán chạy!`,
              false,
            ]);
        }
      });
    },
    changeNewList(cat, index) {
      this.listCat[index].isNew = cat.isNew == 1 ? 0 : 1;
      let flag = this.listCat[index].isNew;
      CatService.changeNewList(cat.cat_id, this.listCat[index].isNew).then(
        (res) => {
          if (res.data.message) {
            if (flag == 1)
              this.showNotification([
                `(${this.listCat[index].name}) đã được thêm vào danh sách hàng mới!`,
                false,
              ]);
            else
              this.showNotification([
                `Đã xóa (${this.listCat[index].name}) khỏi danh sách hàng mới!`,
                false,
              ]);
          }
        }
      );
    },
    editCat(catSlug) {
      this.$router.push(`/quan-ly/quan-ly-san-pham/${catSlug}`);
    },
  },
  created() {
    this.getAllCat();
  },
};
</script>
  
  <style>
</style>