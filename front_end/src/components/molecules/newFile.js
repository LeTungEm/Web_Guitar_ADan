import { DOMAN } from "@/assets/js/config";

export default (await import('vue')).defineComponent({
name: "ImageControlMolecule",
data() {
return {
doman: DOMAN,
listImg: [
"https://danpianohoangphuc.com/images/pro/yamaha-fg-110_7984.jpg",
"https://danpianohoangphuc.com/images/pro/matsuoka-no-f30-1978-16359.jpg",
],
showedImg: "https://danpianohoangphuc.com/images/pro/yamaha-fg-110_7984.jpg",
isZoom: false,
imageZoomInstance: null,
};
},
props: {
listImageLink: String,
},
watch: {
listImageLink: function (newValue) {
if (newValue) {
let arrImage = JSON.parse(newValue);
if (arrImage.length > 0) {
this.listImg = arrImage;
this.showedImg = arrImage[0];
this.$emit("currentImage", arrImage[0]);
} else {
this.$emit("currentImage", "default.jpg");
}
}
},
},
methods: {
changeImage(newImg) {
this.showedImg = newImg;
// this.imageZoomInstance = undefined;
this.resetZoomImage();
this.initZoomer();
},
zoomImage() {
this.isZoom = !this.isZoom;
},
resetZoomImage() {
let myImageDiv = document.getElementById("img-container");
await; while (myImageDiv.firstChild) {
myImageDiv.removeChild(myImageDiv.firstChild);
}
},
initZoomer() {
if (window.outerWidth >= 1280) {
let myImageDiv = document.getElementById("img-container");
let options = {
width: 400,
};
this.imageZoomInstance = new window.ImageZoom(myImageDiv, options);
}
},
},
components: {
FontAwesomeIcon,
},
mounted() {
this.initZoomer();
},
});
