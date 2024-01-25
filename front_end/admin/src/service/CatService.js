import axios from "axios";
import { DOMAN } from "@/assets/js/config";

const PRODUCT_API_URL = `${DOMAN}/back_end/api/Controllers/CatController.php`;

class CatService {

    getAll() {
        let formData = new FormData();
        formData.append('action', 'getAll');
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }
    getAllAccessory() {
        let formData = new FormData();
        formData.append('action', 'getAllAccessory');
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }
    searchCat(search) {
        let formData = new FormData();
        formData.append('action', 'searchCat');
        formData.append('search', search);
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }
    changeIsShow(cat_id, isShow) {
        let formData = new FormData();
        formData.append('action', 'changeIsShow');
        formData.append('cat_id', cat_id);
        formData.append('isShow', isShow);
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }
    changeBestSellerList(cat_id, isBestSeller) {
        let formData = new FormData();
        formData.append('action', 'changeBestSellerList');
        formData.append('cat_id', cat_id);
        formData.append('isBestSeller', isBestSeller);
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }
    changeNewList(cat_id, isNew) {
        let formData = new FormData();
        formData.append('action', 'changeNewList');
        formData.append('cat_id', cat_id);
        formData.append('isNew', isNew);
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }
    deleteCat(cat_id, listImage) {
        let formData = new FormData();
        formData.append('action', 'deleteCat');
        formData.append('cat_id', cat_id);
        formData.append('listImage', listImage);
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }
    deleteImage(listImage) {
        let jsonString = JSON.stringify(listImage);
        let formData = new FormData();
        formData.append('action', 'deleteImage');
        formData.append('listImage', jsonString);
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }
    getBySlug(slug) {
        let formData = new FormData();
        formData.append('action', 'getBySlug');
        formData.append('slug', slug);
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }
    insertCat(name, slug, price, new_price, brand, origin, outstanding, description, status, isProfes, type, isShow, image, video, is_delete, category_id, isBestSeller, isNew) {
        let formData = new FormData();
        formData.append('action', 'insertCat');
        formData.append('name', name);
        formData.append('slug', slug);
        formData.append('price', price);
        formData.append('new_price', new_price);
        formData.append('brand', brand);
        formData.append('origin', origin);
        formData.append('outstanding', outstanding);
        formData.append('description', description);
        formData.append('status', status);
        formData.append('isProfes', isProfes);
        formData.append('type', type);
        formData.append('isShow', isShow);
        formData.append('image', image);
        formData.append('video', video);
        formData.append('is_delete', is_delete);
        formData.append('category_id', category_id);
        formData.append('isBestSeller', isBestSeller);
        formData.append('isNew', isNew);

        return axios.post(`${PRODUCT_API_URL}`, formData);
    }
    updateCat(name, slug, price, new_price, brand, origin, outstanding, description, status, isProfes, type, isShow, image, video, is_delete, category_id, isBestSeller, isNew, cat_id) {
        let formData = new FormData();
        formData.append('action', 'updateCat');
        formData.append('name', name);
        formData.append('slug', slug);
        formData.append('price', price);
        formData.append('new_price', new_price);
        formData.append('brand', brand);
        formData.append('origin', origin);
        formData.append('outstanding', outstanding);
        formData.append('description', description);
        formData.append('status', status);
        formData.append('isProfes', isProfes);
        formData.append('type', type);
        formData.append('isShow', isShow);
        formData.append('image', image);
        formData.append('video', video);
        formData.append('is_delete', is_delete);
        formData.append('category_id', category_id);
        formData.append('isBestSeller', isBestSeller);
        formData.append('isNew', isNew);
        formData.append('cat_id', cat_id);
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }

}

export default new CatService();