<template>
  <div>
    <div class="flex flex-wrap justify-between text-2xl">
      <WhiteButtonAtom
        :onclick="toCreateCatForm"
        class="py-2 px-5 text-lg mb-1"
        :text="'Thêm mới'"
      />
      <div>
        <input v-model="isGuitar" hidden class="peer/guitar" type="radio" id="guitarOption" name="isGuitar" value="1" />
        <label class="peer-checked/guitar:bg-green-700 peer-checked/guitar:text-white py-2 px-5 text-lg" for="guitarOption">Đàn</label>
        <input v-model="isGuitar" hidden class="peer/acc" type="radio" id="accessoryOption" name="isGuitar" value="0" />
        <label class="peer-checked/acc:bg-green-700 peer-checked/acc:text-white py-2 px-5 text-lg" for="accessoryOption">Phụ Kiện</label>
      </div>
    </div>
    <CatsTableOrganism :is-guitar="isGuitar" />
  </div>
</template>
  
  <script>
// import PlantsService from "@/service/PlantsService";
import CatsTableOrganism from "@/components/organisms/CatsTableOrganism.vue";
import WhiteButtonAtom from "@/components/atoms/button/WhiteButtonAtom.vue";
// import { mapActions } from "vuex";

export default {
  components: { CatsTableOrganism, WhiteButtonAtom },
  name: "CatManagermentView",
  data() {
    return {
      cats: [],
      isGuitar: "1",
    };
  },
  methods: {
    // ...mapActions(["showNotification"]),
    deleteProduct() {
    //   this.plants.splice(index, 1);
    },
    changePlantStatus() {
    //   this.plants[plantIndex].status = status;
    //   this.showNotification([
    //     this.plants[plantIndex].name + " đã được " + (status == 1 ? "hiển thị." : "ẩn đi."),
    //     false,
    //   ]);
    },
    // getAllPlants() {
    //   PlantsService.getAll().then((res) => {
    //     this.plants = res.data;
    //   });
    // },
    toCreateCatForm() {
      this.$router.push("/quan-ly/quan-ly-san-pham/0");
    },
  },
  created() {
    // this.getAllPlants();
  },
};
</script>
  
  <style>
</style>