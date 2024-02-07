import axios from "axios";
import { DOMAN } from "@/assets/js/config";

const PRODUCT_API_URL = `${DOMAN}/back_end/api/Controllers/SettingController.php`;

class SettingService {

    getAll() {
        let formData = new FormData();
        formData.append('action', 'getAll');
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }
    
    updateSetting(banner, facebook, tiktok, instagram, youtube, phone, zalo, messenger, recomment) {
        let formData = new FormData();
        formData.append('action', 'updateSetting');
        formData.append('banner', banner);
        formData.append('facebook', facebook);
        formData.append('tiktok', tiktok);
        formData.append('instagram', instagram);
        formData.append('youtube', youtube);
        formData.append('phone', phone);
        formData.append('zalo', zalo);
        formData.append('messenger', messenger);
        formData.append('recomment', recomment);
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }
    updateClientRespons(client_respons) {
        let formData = new FormData();
        formData.append('action', 'updateClientRespons');
        formData.append('client_respons', client_respons);
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }

}

export default new SettingService();