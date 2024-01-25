import axios from "axios";
import { DOMAN } from "@/assets/js/config";

const PRODUCT_API_URL = `${DOMAN}/back_end/api/Controllers/CategoryController.php`;

class CategoryService {

    getAll() {
        let formData = new FormData();
        formData.append('action', 'getAll');
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }
    getClassicCategory() {
        let formData = new FormData();
        formData.append('action', 'getClassicCategory');
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }
    getOldCategory() {
        let formData = new FormData();
        formData.append('action', 'getOldCategory');
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }
    getChildBySlug(category_slug) {
        let formData = new FormData();
        formData.append('action', 'getChildBySlug');
        formData.append('category_slug', category_slug);
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }

}

export default new CategoryService();