<template>
  <div>
    <Pie :data="data" :options="options" ref="chart"></Pie>
  </div>
</template>
  
  <script>
import { Pie } from "vue-chartjs";
import { Chart as ChartJS, ArcElement, Tooltip, Legend } from 'chart.js';
ChartJS.register(ArcElement, Tooltip, Legend)

export default {
  name: "PieChartMolecule",
  extends: Pie,
  props: {
    data: Object,
    options: Object,
  },
  components: {
    Pie,
  },
  create() {
    // this.renderChart(this.chartData, this.options);
  },
};
</script>
  