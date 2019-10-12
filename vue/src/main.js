import Vue from 'vue';
import Ant from '../node_modules/ant-design-vue';
import "ant-design-vue/dist/antd.css";
import App from './App.vue';
import router from './router';
import store from './store';
import VueCookie from "vue-cookie";
import VueHttp from "vue-resource";
Vue.config.productionTip = false;

Vue.use(Ant);
Vue.use(VueCookie);
Vue.use(VueHttp);

new Vue({
    router,
    store,
    render: h => h(App)
}).$mount('#app');
