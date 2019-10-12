<template>
    <a-layout id="components-layout-demo-custom-trigger">
        <a-Menu :collapsed="collapsed" :menu_list="menu_list"></a-Menu>
        <a-layout>
            <a-Header :member_info="member_info" @collapsed="click_collapsed"></a-Header>
            <a-layout-content :style="{ margin: '24px 16px', padding: '24px', background: '#fff', minHeight: '280px' }">
                <router-view name="card"></router-view>
                <router-view name="content"></router-view>
                <router-view name="system"></router-view>
                <router-view name="menu_edit"></router-view>
                <router-view name="menu_add"></router-view>
                <router-view name="Administrator"></router-view>
                <router-view name="AdministratorEdit"></router-view>
                <router-view name="AdministratorAdd"></router-view>
                <router-view name="group"></router-view>
                <router-view name="groupedit"></router-view>
                <router-view name="groupadd"></router-view>
                <router-view name="articleindex"></router-view>
                <router-view name="personalindex"></router-view>
                <router-view name="personalchangepwd"></router-view>
                <router-view name="LogOut"></router-view>
                <router-view name="articledit"></router-view>
                <router-view name="articleadd"></router-view>
                <router-view name="categorylist"></router-view>
                <router-view name="categoryadd"></router-view>
                <router-view name="categoryedit"></router-view>
            </a-layout-content>
        </a-layout>
    </a-layout>
</template>
<script>
    import Header from "./Header";
    import Menu from "./Menu";
    import {GetMenu} from "../axios/api"
    export default {
        data(){
            return {
                collapsed: false,
                menu_list:[],
                member_info:[],
            }
        },
        created(){
            this.fetch();
        },
        methods:{
            fetch () {
                this.loading = true;
                GetMenu().then((data) => {
                    this.menu_list = data.data.auth_rules;
                    this.member_info = data.data.yun_administrator;
                });
                this.loading = false;
            },
            click_collapsed(index){
                this.collapsed = index;
            }
        },
        components:{
            'a-Menu':Menu,
            'a-Header':Header,
        }
    }
</script>
<style>
    #components-layout-demo-custom-trigger .trigger {
        font-size: 18px;
        line-height: 64px;
        padding: 0 24px;
        cursor: pointer;
        transition: color .3s;
    }

    #components-layout-demo-custom-trigger .trigger:hover {
        color: #1890ff;
    }

    #components-layout-demo-custom-trigger .logo {
        height: 32px;
        background: rgba(255,255,255,.2);
        margin: 16px;
    }
    #components-layout-demo-custom-trigger .logo{
        background-color:#1890ff;
        margin: 0px;
        padding-left: 24px;
        height: 64px;
    }
</style>
