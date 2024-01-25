const Buffer = require('buffer').Buffer;
const scrollToTop = () => {
    window.scrollTo({
        top: 0,
        behavior: "smooth",
    });
}
const scrollToMainDiv = () => {
    var targetElement = document.getElementById("mainDiv");
    targetElement.scrollIntoView({ behavior: 'smooth' });
}
const encodeEmail = (email) => {
    const encodedEmail = Buffer.from(email).toString('base64');
    return encodedEmail;
}

const decodeEmail = (encodedEmail) => {
    const decodedEmail = Buffer.from(encodedEmail, 'base64').toString('utf8');
    return decodedEmail;
}

const getCurrentTime = () => {
    let date = new Date();
    let day = date.getDate();
    day = day >= 10 ? day : `0${day}`;
    let month = date.getMonth();
    month = month >= 10 ? month : `0${month}`;
    let year = date.getFullYear();
    return `${year}-${month}-${day}`;
}

const getEmail = () => {
    let email = null;
    let userSession = sessionStorage.getItem("EMUR");
    let userLocal = localStorage.getItem("CEMURK");
    if (userSession) {
        email = userSession;
    } else if (userLocal) {
        email = userLocal;
        sessionStorage.setItem("EMUR", email);
    }
    if (email != null) {
        return decodeEmail(email);
    } else {
        return null;
    }
}

const normalizeString = (str) => {
    return str
        .toLowerCase()
        .normalize("NFD")
        .replace(/[\u0300-\u036f]/g, "");
}

const formatSlug = (string) => {
    let nomalString = normalizeString(string);
    return nomalString.replace(/ /g, "-");
}
const imageZoomMethod = (imgID, resultID) => {
    var img, lens, result, cx, cy;
    img = document.getElementById(imgID);
    result = document.getElementById(resultID);
    /*create lens:*/
    lens = document.createElement("DIV");
    lens.setAttribute("class", "img-zoom-lens");
    /*insert lens:*/
    img.parentElement.insertBefore(lens, img);
    /*calculate the ratio between result DIV and lens:*/
    cx = result.offsetWidth / lens.offsetWidth;
    cy = result.offsetHeight / lens.offsetHeight;
    /*set background properties for the result DIV:*/
    result.style.backgroundImage = "url('" + img.src + "')";
    result.style.backgroundSize = (img.width * cx) + "px " + (img.height * cy) + "px";
    /*execute a function when someone moves the cursor over the image, or the lens:*/
    lens.addEventListener("mousemove", moveLens);
    img.addEventListener("mousemove", moveLens);
    /*and also for touch screens:*/
    lens.addEventListener("touchmove", moveLens);
    img.addEventListener("touchmove", moveLens);
    function moveLens(e) {
        var pos, x, y;
        /*prevent any other actions that may occur when moving over the image:*/
        e.preventDefault();
        /*get the cursor's x and y positions:*/
        pos = getCursorPos(e);
        /*calculate the position of the lens:*/
        x = pos.x - (lens.offsetWidth / 2);
        y = pos.y - (lens.offsetHeight / 2);
        /*prevent the lens from being positioned outside the image:*/
        if (x > img.width - lens.offsetWidth) { x = img.width - lens.offsetWidth; }
        if (x < 0) { x = 0; }
        if (y > img.height - lens.offsetHeight) { y = img.height - lens.offsetHeight; }
        if (y < 0) { y = 0; }
        /*set the position of the lens:*/
        lens.style.left = x + "px";
        lens.style.top = y + "px";
        /*display what the lens "sees":*/
        result.style.backgroundPosition = "-" + (x * cx) + "px -" + (y * cy) + "px";
    }
    function getCursorPos(e) {
        var a, x = 0, y = 0;
        e = e || window.event;
        /*get the x and y positions of the image:*/
        a = img.getBoundingClientRect();
        /*calculate the cursor's x and y coordinates, relative to the image:*/
        x = e.pageX - a.left;
        y = e.pageY - a.top;
        /*consider any page scrolling:*/
        x = x - window.pageXOffset;
        y = y - window.pageYOffset;
        return { x: x, y: y };
    }
}
export { imageZoomMethod, scrollToTop, scrollToMainDiv, encodeEmail, decodeEmail, getCurrentTime, getEmail, normalizeString, formatSlug }