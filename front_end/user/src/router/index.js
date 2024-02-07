import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../pages/User/HomeView.vue'
// import { getEmail } from '@/assets/js/quickFunction';
// import AccountsService from '@/service/AccountsService';
import store from '../store/index'

const routes = [
  {
    name: 'home',
    path: '/',
    component: HomeView,
  },
  {
    name: 'shopView',
    path: '/cua-hang/:categorySlug',
    component: () => import('../pages/User/ShopView.vue'),
    children: [
      {
        name: 'shopViewChild',
        path: ':childCategory',
        component: () => import('../pages/User/ShopView.vue'),
      },
    ]
  },
  {
    name: 'accessorieShop',
    path: '/phu-kien',
    component: () => import('../pages/User/AccessoryView.vue'),
  },
  {
    name: 'RecomemtView',
    path: '/huong-dan-mua-hang',
    component: () => import('../pages/User/RecomemtView.vue'),
  },
  {
    name: 'ActivityDetail',
    path: '/hoat-dong/:slug',
    component: () => import('../pages/User/NewDetailView.vue'),
  },
  {
    name: 'Activity',
    path: '/hoat-dong',
    component: () => import('../pages/User/ActivityView.vue'),
  },
  {
    name: 'productDetail',
    path: '/chi-tiet/:slug',
    component: () => import('../pages/User/ProductDetail.vue'),
  },
]

// function checkLogin(email, to, next) {
//   AccountsService.isEmailExists(email).then((res) => {
//     if (res.data.message) {
//       if (to.matched.some(route => route.name == 'admin')) {
//         if (res.data.role_id.toString() == '1') {
//           next();
//         } else {
//           next('/');
//         }
//       } else {
//         next();
//       }
//     }
//   });
// }

function checkAuthentication(to, from, next) {
  if (to.matched.some(route => route.meta.requiresAuth)) {
    // Kiểm tra trạng thái đăng nhập từ Vuex store
    // let email = getEmail();
    // if (email != null) {
    //   // checkLogin(email, to, next);
    //   // Nếu đã đăng nhập, cho phép điều hướng tiếp
    // } else {
    //   // Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
    //   next('/nguoi-dung/dang-nhap');
    // }
    // console.log(store.state.loginStatus = false);
    if (store.getters.getUserLoginStatus) {
      next();
    } else {
      next('/quan-ly/dang-nhap');
    }
  } else {
    // Nếu route không yêu cầu đăng nhập, cho phép điều hướng tiếp
    next();
  }
}

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})
router.beforeEach(checkAuthentication);


export default router
