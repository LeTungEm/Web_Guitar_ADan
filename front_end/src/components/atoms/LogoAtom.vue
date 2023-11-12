<template>
  <div class="flex justify-center items-center">
    <div :onclick="comeToHome" class="lg:text-4xl whitespace-nowrap text-xl font-bold cursor-pointer">BỜM GUITAR</div>
  </div>
</template>

<script>
export default {
  name: "LogoAtom",
  methods:{
    comeToHome(){
      this.$router.push('/');
    },
    fotmatImage(){
      window.addEventListener(scroll, ()=>{
        
      })
    }
  }
};
</script>

<style>
</style>