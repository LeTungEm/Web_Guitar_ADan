<template>
  <PageTemplate v-if="catInfo != null" class="relative">
    <div class="lg:flex gap-10">
      <!-- image -->
      <ImageControlMolecule
        @currentImage="getCurrentImage"
        :listImageLink="`['https://danpianohoangphuc.com/images/pro/yamaha-fg-110_7984.jpg']`"
      />
      <!-- info -->
      <div class="lg:w-1/2">
        <!-- link -->
        <div
          class="text-lg mb-2 inline-block text-gray-400 font-bold capitalize"
        >
          <span>Trang Chủ</span>
          <span class="text-black">&nbsp;/&nbsp;dan guitar day</span>
        </div>
        <!-- Cat Info -->
        <div>
          <h1 class="capitalize text-3xl font-bold">dan guitar day</h1>
          <hr class="w-[5vw] border-b-4 my-5" />
          <div class="flex gap-5 flex-wrap">
            <price-text-atom
              class="text-3xl lg:text-4xl text-[red_!important]"
              :maxPrice="2000000"
              :minPrice="2000000"
            />
            <PriceTextWLineThroughAtom
              class="text-3xl"
              :minPrice="1500000"
              :maxPrice="1500000"
            />
          </div>
          <div class="mt-5">
            <div class="text-2xl font-bold">Đặc điểm nổi bật</div>
            <div class="text-xl">
              danadn danadn danadn danadn danadn danadn danadn danadn danadn
              danadn danadndanadndanadn v v
            </div>
          </div>
        </div>
        <!-- contact -->
        <div class="mt-10">
          <div
            class="flex gap-2 [&>*]:w-full [&>*]:flex [&>*]:justify-center [&>*]:items-center [&>*]:px-5 [&>*]:py-2"
          >
            <a :href="social.zalo" class="bg-blue-500 text-white font-bold">
              CHAT ZALO
            </a>
            <a
              :href="`tel:${social.messenger}`"
              class="bg-green-600 text-white font-bold"
            >
              CHAT FACEBOOK
            </a>
          </div>
          <a
            :href="`tel:${social.phone}`"
            class="mt-2 bg-orange-500 text-white font-bold flex justify-center items-center px-5 py-2"
          >
            LIÊN HỆ MUA NGAY
          </a>
        </div>
      </div>
    </div>
    <!-- description -->
    <div class="mt-5">
      <DropTextMolecule :defaultStatus="true" :title="'Mô tả'">
        <div class="m-5 md:m-10" v-html="catInfo.description"></div>
      </DropTextMolecule>
      <DropTextMolecule :title="'Đánh giá'">
        <CommentMolecule />
      </DropTextMolecule>
    </div>
    <div class="flex flex-wrap gap-5 justify-center items-center">
      <div
        v-for="videoItem in listLinkVideo"
        :key="videoItem"
        v-html="videoItem"
        class="[&>*]:max-w-full mt-5 m-auto"
      ></div>
    </div>
  </PageTemplate>
</template>

<script>
import PageTemplate from "@/components/templates/PageTemplate.vue";
import PriceTextAtom from "@/components/atoms/text/PriceTextAtom.vue";
import ImageControlMolecule from "@/components/molecules/ImageControlMolecule.vue";
import DropTextMolecule from "@/components/molecules/DropTextMolecule.vue";
import CommentMolecule from "@/components/molecules/CommentMolecule.vue";
// import CatService from "@/service/CatService";
import PriceTextWLineThroughAtom from "@/components/atoms/text/PriceTextWLineThroughAtom.vue";
import { mapActions, mapGetters } from "vuex";
import { scrollToTop } from "@/assets/js/quickFunction";

export default {
  name: "ProductDetail",
  data() {
    return {
      social: {},
      catInfo: {},
      currentPrice: 0,
      oldPrice: 0,
      listLinkVideo: [],
      currentImage: "",
      quantity: 1,
    };
  },
  components: {
    PageTemplate,
    PriceTextAtom,
    ImageControlMolecule,
    DropTextMolecule,
    CommentMolecule,
    PriceTextWLineThroughAtom,
  },
  watch: {
    "$route.params.slug": {
      immediate: true,
      handler(newParam, oldParam) {
        if (newParam !== oldParam && oldParam != undefined) {
          // this.getCat();
          scrollToTop();
        }
      },
    },
  },
  computed: {
    ...mapGetters(["getSocial"]),
  },
  methods: {
    ...mapActions(["changeCartChangeNumber"]),

    getSocialLink() {
      this.social = this.getSocial;
    },

    // getCat() {
    //   let slug = this.$route.params.slug;
    //   CatService.getBySlug(slug).then((res) => {
    //     this.catInfo = res.data;
    //     this.getCurrentPrice(res.data);
    //     this.listLinkVideo = JSON.parse(res.data.video);
    //   });
    // },
    // getCurrentPrice(catInfo) {
    //   if (catInfo.new_price > 0) {
    //     this.oldPrice = catInfo.price;
    //     this.currentPrice = catInfo.new_price;
    //   } else {
    //     this.currentPrice = catInfo.price;
    //   }
    // },
    getCurrentImage(imageName) {
      this.currentImage = imageName;
    },
  },
  created() {
    // this.getCat();
    this.getSocialLink();
  },
};
</script>

<style>
</style>