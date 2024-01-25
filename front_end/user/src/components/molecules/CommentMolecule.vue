<template>
  <div>
    <!-- form comment -->
    <div class="flex justify-center">
      <div class="p-5 border-2 rounded-md">
        <div class="text-xl lg:text-2xl font-bold">Thêm đánh giá</div>
        <div class="text-lg text-blue-500 font-bold mt-5">Đánh giá của bạn *</div>
        <!-- rate -->
        <div class="flex gap-5 [&>*]:[&>*]:text-[12px] lg:[&>*]:[&>*]:text-lg mt-5 [&>*]:hover:[&>*]:text-yellow-400 [&>*]:cursor-pointer">
            <!-- One star -->
            <div :onclick="() => changeStar(1)" v-bind:class="starNumber == 1?'[&>*]:text-yellow-400':''">
                <font-awesome-icon :icon="['fas', 'star']" />
            </div>
            <!-- Two star -->
            <div :onclick="() => changeStar(2)" v-bind:class="starNumber == 2?'[&>*]:text-yellow-400':''">
                <font-awesome-icon :icon="['fas', 'star']" />
                <font-awesome-icon :icon="['fas', 'star']" />
            </div>
            <!-- Three star -->
            <div :onclick="() => changeStar(3)" v-bind:class="starNumber == 3?'[&>*]:text-yellow-400':''">
                <font-awesome-icon :icon="['fas', 'star']" />
                <font-awesome-icon :icon="['fas', 'star']" />
                <font-awesome-icon :icon="['fas', 'star']" />
            </div>
            <!-- Four star -->
            <div :onclick="() => changeStar(4)" v-bind:class="starNumber == 4?'[&>*]:text-yellow-400':''">
                <font-awesome-icon :icon="['fas', 'star']" />
                <font-awesome-icon :icon="['fas', 'star']" />
                <font-awesome-icon :icon="['fas', 'star']" />
                <font-awesome-icon :icon="['fas', 'star']" />
            </div>
            <!-- Five star -->
            <div :onclick="() => changeStar(5)" v-bind:class="starNumber == 5?'[&>*]:text-yellow-400':''">
                <font-awesome-icon :icon="['fas', 'star']" />
                <font-awesome-icon :icon="['fas', 'star']" />
                <font-awesome-icon :icon="['fas', 'star']" />
                <font-awesome-icon :icon="['fas', 'star']" />
                <font-awesome-icon :icon="['fas', 'star']" />
            </div>
        </div>
        <div class="text-lg text-blue-500 font-bold mt-5">Nhận xét của bạn *</div>
        <textarea rows="3" class="border w-full p-1 rounded-sm" />
        <div class="w-full [&>*]:w-1/2 flex gap-5 justify-between mt-5">
            <div>
                <div class="text-lg text-blue-500 font-bold">Tên *</div>
                <input class="p-1 border rounded-sm w-full" type="text">
            </div>
            <div>
                <div class="text-lg text-blue-500 font-bold">Số điện thoại *</div>
                <input class="p-1 border rounded-sm w-full" type="text">
            </div>
        </div>
        <div class="flex justify-center items-center gap-5 mt-5">
            <input id="saveCmtInfo" class="w-5 h-5" type="checkbox">
            <label for="saveCmtInfo" class="text-lg font-bold">Lưu tên và số điện thoại của tôi vào trình duyệt này cho lần bình luận kế tiếp.</label>
        </div>
        <div class="mt-5 text-center font-bold py-2 px-5 rounded-md border text-white bg-blue-500">
            ĐÁNH GIÁ
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";

export default {
  name: "CommentMolecule",
  data(){
    return{
        starNumber: 0,
    };
  },
  methods:{
    changeStar(num){
        this.starNumber = num;
    }
  },
  components: {
    FontAwesomeIcon,
  },
};
</script>

<style>
</style>