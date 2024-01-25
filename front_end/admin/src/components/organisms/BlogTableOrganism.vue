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
          v-for="(blog, index) in listBlog"
          :key="blog.blog_id"
        >
          <td class="font-bold min-w-[200px]">{{ blog.name }}</td>
          <td class="[&>*]:max-w-[300px_!important]" v-html="blog.short_description"></td>
          <td class="items-center">
            <input
              :onchange="() => updateIsShow(blog, index)"
              class="w-[20px] h-[20px] mx-auto flex cursor-pointer"
              :checked="blog.is_show == 1 ? true : false"
              type="checkbox"
            />
          </td>
          <td>
            <div class="flex justify-center items-center gap-5">
              <font-awesome-icon
                :onclick="() => showOptionNotification(blog, index)"
                class="text-lg hover:text-green-700 cursor-pointer"
                :icon="['fas', 'delete-left']"
              />
              <font-awesome-icon
                :onclick="() => editBlog(blog.slug)"
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
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import BlogService from "@/service/BlogService";
import OptionNotificationAtom from "../atoms/OptionNotificationAtom.vue";
import TableColumnMolecule from "../molecules/TableColumnMolecule.vue";
import { mapActions } from "vuex";
import { DOMAN } from "@/assets/js/config";
import CatService from "@/service/CatService";

export default {
  name: "BlogTableOrganism",
  components: { TableColumnMolecule, OptionNotificationAtom, FontAwesomeIcon },
  props: {
    type: String,
  },
  watch: {
    type: function () {
      if (this.type == "tn") this.getAllTN();
      else this.getAllBC();
    },
  },
  data() {
    return {
      doman: DOMAN,
      optionNotifiMessage: "",
      optionNotifiStatus: false,
      deleteInfo: null,
      listBlog: [],
      columns: ["Tên", "Video", "Hiển thị", ""],
    };
  },
  methods: {
    ...mapActions(["showNotification"]),

    showOptionNotification(blog, index) {
      this.optionNotifiMessage = `Bạn có muốn xóa ${blog.name}?`;
      this.optionNotifiStatus = true;
      this.deleteInfo = { index: index, blog_id: blog.blog_id };
    },

    async deleteProduct(result) {
      if (result) {
        this.deleteBlog();
      } else {
        this.optionNotifiMessage = "";
        this.optionNotifiStatus = false;
      }
    },

    deleteBlog() {
      BlogService.deleteBlog(this.deleteInfo.blog_id).then((res) => {
        if (res.data.message == true) {
          this.showNotification([
            `Đã xóa ${this.listBlog[this.deleteInfo.index].name}`,
            false,
          ]);
          this.deleteImage(this.listBlog[this.deleteInfo.index].image);
          this.listBlog.splice(this.deleteInfo.index, 1);
          this.optionNotifiMessage = "";
          this.optionNotifiStatus = false;
        } else {
          this.showNotification([`Xóa thất bại !!!`, true]);
        }
      });
    },

    deleteImage(image) {
      CatService.deleteImage([image]).then((res) => {
        console.log("da xoa", res.data);
      });
    },

    getAllBC() {
      BlogService.getAllBC().then((res) => {
        this.listBlog = res.data;
      });
    },
    getAllTN() {
      BlogService.getAllTN().then((res) => {
        this.listBlog = res.data;
      });
    },
    updateIsShow(blog, index) {
      let newStatus = blog.is_show == 1 ? 0 : 1;
      this.listBlog[index].is_show = newStatus;
      BlogService.updateIsShow(blog.blog_id, newStatus).then((res) => {
        if (res.data.message) {
          this.showNotification(["Đã sửa trạng thái bài đăng", false]);
        }
      });
    },
    editBlog(slug) {
      this.$router.push(`/quan-ly/quan-ly-bai-viet/${slug}`);
    },
  },
  created() {
    this.getAllBC();
  },
};
</script>

<style>
</style>