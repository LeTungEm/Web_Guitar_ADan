import axios from "axios";
import { DOMAN } from "@/assets/js/config";

const PRODUCT_API_URL = `${DOMAN}/back_end/api/Controllers/BlogController.php`;

class BlogService {

    getBCActiveLimit(limit, length) {
        let formData = new FormData();
        formData.append('action', 'getBCActiveLimit');
        formData.append('limit', limit);
        formData.append('length', length);
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }
    getTNActiveLimit(limit, length) {
        let formData = new FormData();
        formData.append('action', 'getTNActiveLimit');
        formData.append('limit', limit);
        formData.append('length', length);
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }
    
    countBC() {
        let formData = new FormData();
        formData.append('action', 'countBC');
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }
    countTN() {
        let formData = new FormData();
        formData.append('action', 'countTN');
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }
    getBySlug(slug) {
        let formData = new FormData();
        formData.append('action', 'getBySlug');
        formData.append('slug', slug);
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }
}

export default new BlogService();