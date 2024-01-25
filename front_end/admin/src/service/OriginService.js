import axios from "axios";
import { DOMAN } from "@/assets/js/config";

const PRODUCT_API_URL = `${DOMAN}/back_end/api/Controllers/OriginController.php`;

class OriginService {

    getAll() {
        let formData = new FormData();
        formData.append('action', 'getAll');
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }
    insertOrigin(name) {
        let formData = new FormData();
        formData.append('action', 'insertOrigin');
        formData.append('name', name);
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }
    updateOrigin(name, origin_id) {
        let formData = new FormData();
        formData.append('action', 'updateOrigin');
        formData.append('name', name);
        formData.append('origin_id', origin_id);
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }
}

export default new OriginService();