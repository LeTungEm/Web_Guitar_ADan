import axios from "axios";
import { DOMAN } from "@/assets/js/config";

const PRODUCT_API_URL = `${DOMAN}/back_end/api/Controllers/BlogController.php`;

class BlogService {

    getAll() {
        let formData = new FormData();
        formData.append('action', 'getAll');
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }

    getAllTN() {
        let formData = new FormData();
        formData.append('action', 'getAllTN');
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }
    
    getAllBC() {
        let formData = new FormData();
        formData.append('action', 'getAllBC');
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }
    
    updateIsShow(blog_id, is_show) {
        let formData = new FormData();
        formData.append('action', 'updateIsShow');
        formData.append('blog_id', blog_id);
        formData.append('is_show', is_show);
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }
    getBySlug(slug) {
        let formData = new FormData();
        formData.append('action', 'getBySlug');
        formData.append('slug', slug);
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }
    insertBlog(name, short_description, description, is_show, image, slug, type) {
        let formData = new FormData();
        formData.append('action', 'insertBlog');
        formData.append('name', name);
        formData.append('short_description', short_description);
        formData.append('description', description);
        formData.append('is_show', is_show);
        formData.append('image', image);
        formData.append('slug', slug);
        formData.append('type', type);
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }
    updateBlog(name, short_description, description, is_show, image, slug, type, blog_id) {
        let formData = new FormData();
        formData.append('action', 'updateBlog');
        formData.append('name', name);
        formData.append('short_description', short_description);
        formData.append('description', description);
        formData.append('is_show', is_show);
        formData.append('image', image);
        formData.append('slug', slug);
        formData.append('type', type);
        formData.append('blog_id', blog_id);
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }
    deleteBlog(blog_id) {
        let formData = new FormData();
        formData.append('action', 'deleteBlog');
        formData.append('blog_id', blog_id);
        return axios.post(`${PRODUCT_API_URL}`, formData);
    }
}

export default new BlogService();