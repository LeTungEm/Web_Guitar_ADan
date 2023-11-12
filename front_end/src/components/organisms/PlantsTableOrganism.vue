<template>
  <div
    v-if="plants.length > 0"
    class="relative overflow-x-auto overflow-y-scroll h-[80vh] shadow-md sm:rounded-lg z-10"
  >
    <table class="w-full text-sm text-left text-gray-600 dark:text-gray-400">
      <thead
        class="sticky top-0 text-xs text-gray-700 uppercase bg-gray-100 dark:bg-gray-700 dark:text-gray-400 shadow-lg"
      >
        <TableColumnMolecule :columns="Object.keys(plants[0])" />
      </thead>
      <tbody>
        <tr
          v-for="(plant, index) in plants"
          :key="plant"
          v-bind:class="plant.status ? '' : 'opacity-40'"
          class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600 xl:[&>*]:text-base"
        >
          <td
            v-for="key in Object.keys(plant)"
            :key="key"
            class="min-w-[200px] px-6 py-4 font-medium dark:text-white"
          >
            <div class="text-black font-normal" v-if="key == 'name'">
              {{ plant.name }}
            </div>
            <div v-else-if="key == 'image'">
              <img
                class="w-20 rounded-lg bg-black"
                :src="`http://localhost/LeTungEm/plant_store_api__php/api/Controllers/GetFileController.php?imgURL=${plant.image}`"
                :alt="plant.name"
              />
            </div>
            <div v-else-if="key == 'status'">
              <input
                :checked="plant.status"
                @change="changePlantStatus"
                class="w-5 h-5 mr-5"
                :value="index"
                type="checkbox"
              />
              <span>{{ plant.status ? "Hiển thị" : "Ẩn" }}</span>
            </div>
            <div v-else>
              {{ subString(plant[key]) }}
            </div>
          </td>
          <td
            class="min-w-[100px] px-6 py-4 text-right text-xl whitespace-nowrap"
          >
            <font-awesome-icon
              @click="() => toFormEdit(plant.slug)"
              class="mr-5 cursor-pointer p-2 border rounded-md text-green-700 bg-white hover:text-white hover:bg-green-700 duration-300"
              :icon="['fas', 'pen-fancy']"
            />
            <font-awesome-icon
              @click="() => deleteProduct(index)"
              class="cursor-pointer p-2 border rounded-md text-green-700 bg-white hover:text-white hover:bg-green-700 duration-300"
              :icon="['fas', 'eraser']"
            />
          </td>
        </tr>
      </tbody>
    </table>
    <OptionNotificationAtom
      @pickOption="isDelete"
      :status="optionNotifiStatus"
      :text="optionNotifiMessage"
    />
  </div>
</template>

<script>
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import TableColumnMolecule from "../molecules/TableColumnMolecule.vue";
import PlantsService from "@/service/PlantsService";
import OptionNotificationAtom from "../atoms/OptionNotificationAtom.vue";
import PlantSetService from "@/service/PlantSetService";
import PlantsCategoriesService from "@/service/PlantsCategoriesService";
import { mapActions } from "vuex";

export default {
  name: "PlantsTableOrganism",
  data() {
    return {
      optionNotifiMessage: "",
      optionNotifiStatus: false,
      deleteIndex: "",
    };
  },
  props: {
    plants: Array,
  },
  components: { FontAwesomeIcon, TableColumnMolecule, OptionNotificationAtom },
  emits: ["changePlantStatus", "deleteProduct"],
  methods: {
    ...mapActions(["showNotification"]),

    subString(data){
      if(typeof data === 'string'){
        if(data.length > 100){
          return data.substr(0,100)+'...';
        }
      }
      return data;
    },

    deleteProduct(index) {
      this.changeOptionNotificationStatus(
        "Bạn có muốn xóa " + this.plants[index].name
      );
      this.deleteIndex = index;
    },
    async isDelete(result) {
      this.changeOptionNotificationStatus();
      if (result) {
        let deletePlantSetStatus = await this.deletePlantSet(
          this.plants[this.deleteIndex].plant_id
        );
        if (deletePlantSetStatus.data.message == true) {
          await this.deletePlantCategories(
            this.plants[this.deleteIndex].plant_id
          );
          await this.deletePlant(this.plants[this.deleteIndex].plant_id);
          this.showNotification(["Xóa thành công "+ this.plants[this.deleteIndex].name, false]);
          this.$emit("deleteProduct", this.deleteIndex);
        } else {
          let plantIndex = this.deleteIndex;
          let plantId = this.plants[plantIndex].plant_id;
          this.setStatusOfPlant(0, plantId, plantIndex);
        }
      }
    },
    async deletePlant(plantId) {
      await PlantsService.deletePlant(plantId);
    },
    async deletePlantSet(plantId) {
      return await PlantSetService.deletePlantSetByPlantId(plantId);
    },
    async deletePlantCategories(plantId) {
      await PlantsCategoriesService.deletePlantCategoriesByPlantId(
        plantId
      );
    },
    toFormEdit(plantSlug) {
      this.$router.push(`/quan-ly/quan-ly-cay/${plantSlug}`);
    },
    changeOptionNotificationStatus(message) {
      this.optionNotifiMessage = message;
      this.optionNotifiStatus = !this.optionNotifiStatus;
    },
    changePlantStatus(e) {
      let status = e.target.checked ? 1 : 0;
      let plantIndex = e.target.value;
      let plantId = this.plants[plantIndex].plant_id;
      this.setStatusOfPlant(status, plantId, plantIndex);
    },
    setStatusOfPlant(status, plantId, plantIndex) {
      PlantsService.setPlantStatus(status, plantId).then((res) => {
        if (res.data.message) {
          this.$emit("changePlantStatus", plantIndex, status);
        }
      });
      PlantSetService.setStatusByPlantId(status, plantId);
    },
  },
};
</script>

<style>
</style>