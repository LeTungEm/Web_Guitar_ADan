import axios from "axios";
import { DOMAN } from "@/assets/js/config";

const PRODUCT_API_URL = `${DOMAN}/back_end/api/Controllers/OriginController.php`;

class OriginService {

    getAll() {
        let formData = new FormData();
        formData.append('action', 'getAll');
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }
}

export default new OriginService();