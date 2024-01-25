import axios from "axios";
import { DOMAN } from "@/assets/js/config";

const PRODUCT_API_URL = `${DOMAN}/back_end/api/Controllers/BrandController.php`;

class BrandService {

    getAll() {
        let formData = new FormData();
        formData.append('action', 'getAll');
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }
    insertBrand(name) {
        let formData = new FormData();
        formData.append('action', 'insertBrand');
        formData.append('name', name);
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }
    updateBrand(name, brand_id) {
        let formData = new FormData();
        formData.append('action', 'updateBrand');
        formData.append('name', name);
        formData.append('brand_id', brand_id);
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }
}

export default new BrandService();