import Vue from 'vue';
import Router from 'vue-router';
import Login from './views/login/Login.vue';
import Forgot from './views/login/Forgot';
import Register from './views/login/Register';
import Home from './components/Home.vue';
import Table from './views/index/Table.vue';
import Card from "./views/index/Card.vue";
import SystemSetup from "./views/convention/SystemSetup";
import MenuList from "./views/convention/MenuList";
import MenuEdit from "./views/convention/MenuEdit";
import MenuAdd from "./views/convention/MenuAdd";
import Administrator from "./views/authority/Administrator";
import AdministratorEdit from "./views/authority/AdministratorEdit";
import AdministratorAdd from "./views/authority/AdministratorAdd";
import Group from "./views/authority/Group";
import GroupEdit from "./views/authority/GroupEdit";
import GroupAdd from "./views/authority/GroupAdd";
import ArticleIndex from "./views/article/ArticleIndex";
import PersonalIndex from "./views/personal/PersonalIndex";
import PersonalChangepwd from "./views/personal/PersonalChangepwd";
import LogOut from "./views/login/LogOut";
import ArticleEdit from "./views/article/ArticleEdit";
import ArticleAdd from "./views/article/ArticleAdd";
import CategoryList from "./views/article/Category";
import CategoryAdd from "./views/article/CategoryAdd";
import CategoryEdit from "./views/article/CategoryEdit";

Vue.use(Router);

const router = new Router({
    mode: 'history',
    base: process.env.BASE_URL,
    fallback: true,
    routes: [
        {
            path: '/login',
            name: 'login',
            meta: {
                title: "登录"
            },
            component: Login
        },
        {
            path: '/forgot',
            name: 'forgot',
            meta: {
                title: "忘记密码"
            },
            component: Forgot
        },
        {
            path: '/register',
            name: 'register',
            meta: {
                title: "注册"
            },
            component: Register
        },
        {
            path: '/',
            name: 'home',
            meta: {
                title: "首页"
            },
            component: Home,
            children: [{
                path: "/index",
                name: 'index',
                components: {
                    content: Table,
                    card: Card,
                }
            }]
        }, {
            path: '/',
            name: 'routine',
            meta: {
                title: "常规管理"
            },
            component: Home,
            children: [{
                path: "System/config",
                components: {
                    system: SystemSetup,
                }
            }, {
                path: "Menu/index",
                components: {
                    system: MenuList,
                }
            }, {
                path: "Menu/edit",
                components: {
                    menu_edit: MenuEdit,
                },
            }, {
                path: "Menu/add",
                components: {
                    menu_add: MenuAdd,
                },
            }]
        }, {
            path: '/',
            name: 'Authority',
            meta: {
                title: "权限管理"
            },
            component: Home,
            children: [{
                path: "Administrator/index",
                components: {
                    Administrator: Administrator,
                }
            }, {
                path: "Administrator/edit",
                components: {
                    AdministratorEdit: AdministratorEdit,
                }
            }, {
                path: "Administrator/add",
                components: {
                    AdministratorAdd: AdministratorAdd,
                }
            }, {
                path: "group/index",
                components: {
                    group: Group,
                }
            }, {
                path: "group/edit",
                components: {
                    groupedit: GroupEdit,
                }
            }, {
                path: "group/add",
                components: {
                    groupadd: GroupAdd,
                }
            }]
        }, {
            path: '/',
            name: 'Article',
            meta: {
                title: "内容管理"
            },
            component: Home,
            children: [{
                path: "Article/index",
                components: {
                    articleindex: ArticleIndex,
                }
            },{
                path: "Article/edit",
                components: {
                    articledit: ArticleEdit,
                }
            },{
                path: "Article/add",
                components: {
                    articleadd: ArticleAdd,
                }
            },{
                path: "Category/index",
                components: {
                    categorylist: CategoryList,
                }
            },{
                path: "Category/add",
                components: {
                    categoryadd: CategoryAdd,
                }
            },{
                path: "Category/edit",
                components: {
                    categoryedit: CategoryEdit,
                }
            }]
        }, {
            path: '/',
            name: 'Personal',
            meta: {
                title: "个人中心"
            },
            component: Home,
            children: [{
                path: "personal/index",
                components: {
                    personalindex: PersonalIndex,
                }
            }, {
                path: "personal/changepwd",
                components: {
                    personalchangepwd: PersonalChangepwd,
                }
            }]
        },
        {
            path: '/',
            name: 'logout',
            meta: {
                title: "退出登录"
            },
            component: Home,
            children: [{
                path: "Login/logout",
                components: {
                    LogOut: LogOut,
                }
            }]
        },
        {
            path: '/Inform_status',
            name: 'Inform_status',
            component: Home,
        },
    ]
});

//路由守卫
router.beforeEach((to, from, next) => {
    document.title = to.matched[0].meta.title;
    var user_access_token =  router.app.$cookie.get('user_access_token');
    if (to.fullPath != '/login' && to.fullPath != '/'){
        if (user_access_token) {
            next()
        } else {
            next({
                path: '/login'
            });
        }
    }else {
        if (user_access_token){
            next({
                path: '/index'
            });
        }else{
            if (to.fullPath == '/'){
                next({
                    path: '/login'
                });
            }else {
                next();
            }
        }
    }
});


export default router;