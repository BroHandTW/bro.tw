import Vue from 'vue';
import VueRouter from 'vue-router';

// need @babel/plugin-syntax-dynamic-import
const Home = () => import('@/../src/views/Home.vue');
const About = () => import('@/../src/views/About.vue');
const Share = () => import('@/../src/views/Share.vue');
const Users = () => import('@/../src/views/Users.vue');
const User = () => import('@/../src/views/User.vue');
const Profile = () => import('@/../src/views/Profile.vue');
const Orders = () => import('@/../src/views/Orders.vue');
const NotFound = () => import('@/../src/views/404.vue');

Vue.use(VueRouter);

const routes = [
  {
    name: 'home',
    path: '/',
    component: Home,
    meta: { title: 'Home', breadcrumb: [] }
  }, {
    name: 'about',
    path: '/about',
    component: About,
    meta: {
      title: 'About',
      breadcrumb: [
        { name: 'Home', link: 'home' },
        { name: 'About', link: 'about' },
      ]
    }
  }, {
    name: 'share',
    path: '/share',
    component: Share,
    meta: {
      title: 'Share',
      breadcrumb: [
        { name: 'Home', link: 'home' },
        { name: 'Share', link: 'share' },
      ]
    }
  }, {
    name: 'users#index',
    path: '/users',
    component: Users,
    meta: {
      title: 'Users',
      breadcrumb: [
        { name: 'Home', link: 'home' },
        { name: 'Users', link: 'users#index' },
      ]
    },
    children: [{
      name: 'users#show',
      path: ':id',
      component: User,
      meta: {
        title: 'Users#Show',
        breadcrumb: [
          { name: 'Home', link: 'home' },
          { name: 'Users', link: 'users#index' },
          { name: 'User', link: 'users#show' },
        ]
      },
      children: [{
        name: 'users#profile',
        path: 'profile',
        component: Profile,
        meta: {
          title: 'Users#Profile',
          breadcrumb: [
            { name: 'Home', link: 'home' },
            { name: 'Users', link: 'users#index' },
            { name: 'User', link: 'users#show' },
            { name: 'Profile', link: 'users#profile' },
          ]
        },
      }, {
        name: 'users#orders',
        path: 'orders',
        component: Orders,
        meta: {
          title: 'Users#Orders',
          breadcrumb: [
            { name: 'Home', link: 'home' },
            { name: 'Users', link: 'users#index' },
            { name: 'User', link: 'users#show' },
            { name: 'Orders', link: 'users#orders' },
          ]
        },
      }],
    }],
  }, {
    path: '*',
    component: NotFound,
    meta: { title: 'not found' }
  }
];

const router = new VueRouter({
  mode: 'history',
  routes,
});

router.beforeEach((to, from, next) => {
  document.title = to.meta.title + '| BroBao'
  next()
})
export default router;
