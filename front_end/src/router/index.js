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
        component: () => import('../pages/Admin/LoginView.vue'),
      },
    ]
  },
  {
    name: 'productDetail',
    path: '/:categorySlug/:slug',
    component: () => import('../pages/User/ProductDetail.vue'),
  },
  {
    name: 'shopByType',
    path: '/meo-canh/:categorySlug',
    component: HomeView,
  },
  {
    name: 'shop',
    path: '/meo-canh',
    component: HomeView,
  },
  {
    name: 'admin',
    path: '/quan-ly',
    children: [
      {
        name: 'loginForm',
        path: 'dang-nhap',
        component: () => import('../pages/Admin/LoginView.vue'),
      },
      {
        name: 'catFormMolecule',
        path: 'quan-ly-meo/:slug',
        meta: { requiresAuth: true },
        component: () => import('../components/molecules/CatFormMolecule.vue'),
      },
      {
        name: 'catManager',
        path: 'quan-ly-meo',
        meta: { requiresAuth: true },
        component: () => import('../pages/Admin/CatManagermentView.vue'),
      },
      {
        name: 'orderManager',
        path: 'quan-ly-dat-hang',
        meta: { requiresAuth: true },
        component: () => import('../pages/Admin/OrderManagerView.vue'),
      }
    ],
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
