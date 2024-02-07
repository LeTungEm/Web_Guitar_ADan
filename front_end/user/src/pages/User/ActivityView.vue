<template>
  <div>
    <PageTemplate class="relative">
      <div class="mb-10">
        <div class="text-lg text-white lg:text-3xl font-bold capitalize mb-5">
          Thiện nguyện
        </div>
        <grid-news-organisms
          @changePage="getListTN"
          :listNew="listTN"
          :listLength="TNLength"
        />
      </div>
      <div class="mb-10">
        <div class="text-lg text-white lg:text-3xl font-bold capitalize mb-5">
          Báo chí
        </div>
        <grid-news-organisms
          @changePage="getListBC"
          :listNew="listBC"
          :listLength="BCLength"
        />
      </div>
      <div>
        <div class="text-lg text-white lg:text-3xl font-bold capitalize mb-5">
          Hình ảnh
        </div>
        <div class="flex flex-wrap gap-5">
          <img
            v-for="img in listImage"
            class="h-auto object-contain w-[25vw] lg:w-[10vw]"
            :key="img"
            :src="`${doman}/back_end/api/Controllers/GetFileController.php?imgURL=${img}&width=400`"
            alt="hinh meo"
          />
        </div>
      </div>
      <loading-atom :status="loadingStatus" />
    </PageTemplate>
  </div>
</template>

<script>
import PageTemplate from "@/components/templates/PageTemplate.vue";
import GridNewsOrganisms from "../../components/organisms/GridNewsOrganisms.vue";
import BlogService from "@/service/BlogService";
import LoadingAtom from "@/components/atoms/LoadingAtom.vue";
import { DOMAN, NEWS_EACH_PAGE } from "@/assets/js/config";
import { mapGetters } from "vuex";

export default {
  name: "ActivityView",
  data() {
    return {
      TNLength: 1,
      listTN: [],
      BCLength: 1,
      listBC: [],
      loadingStatus: false,
      listImage: [],
      doman: DOMAN,
    };
  },
  components: { PageTemplate, GridNewsOrganisms, LoadingAtom },
  computed: {
    ...mapGetters(["getSocial"]),
  },
  methods: {
    getImage() {
      let imageJson = this.getSocial.client_respons;
      if (imageJson) {
        let listImage = JSON.parse(imageJson);
        this.listImage = listImage;
      }
    },
    countTN() {
      BlogService.countTN().then((res) => {
        this.TNLength = res.data;
      });
    },
    countBC() {
      BlogService.countBC().then((res) => {
        this.BCLength = res.data;
      });
    },
    getListBC(currentPage) {
      this.loadingStatus = true;
      currentPage = currentPage * NEWS_EACH_PAGE;
      if(currentPage < 0){
        currentPage = 0;
      }
      BlogService.getBCActiveLimit(
        currentPage,
        NEWS_EACH_PAGE
      )
        .then((res) => {
          this.listBC = res.data;
        })
        .finally(() => {
          this.loadingStatus = false;
        });
    },
    getListTN(currentPage) {
      this.loadingStatus = true;
      currentPage = currentPage * NEWS_EACH_PAGE;
      if(currentPage < 0){
        currentPage = 0;
      }
      BlogService.getTNActiveLimit(
        currentPage,
        NEWS_EACH_PAGE
      )
        .then((res) => {
          this.listTN = res.data;
        })
        .finally(() => {
          this.loadingStatus = false;
        });
    },
  },
  created() {
    this.countTN();
    this.countBC();
    this.getImage();
  },
};
</script>

<style>
</style>