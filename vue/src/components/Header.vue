<template>
    <a-layout-header style="background: #1890ff; padding: 0;height: 59px">
        <a-icon style="float: left;color: #fff;font-size: 22px;height: 59px" class="trigger" :type="collapsed ? 'menu-unfold' : 'menu-fold'" @click="click_collapsed"/>
        <span style="float: left;color: #fff;height: 59px">Vue-admin通用开发平台</span>
        <span>
                    <router-link :to="{path: '/Login/logout'}">
                        <a-button type="link" style="margin:17px 20px 0 0;padding-left:5px;float: right;color: #fff">退出登录</a-button>
                        <a-icon type="logout" style="margin:25px 0 0 0;float: right;color: #fff" />
                    </router-link>
                </span>
        <span>
                    <a-dropdown style="margin:0 20px 0 0;float: right;color: #fff">
                        <a class="ant-dropdown-link" href="#">
                            {{ user_name }} <a-icon type="down" />
                        </a>
                        <a-menu slot="overlay">
                            <a-menu-item>
                                <router-link :to="{path: '/personal/index'}"><a-icon type="user" /> 个人资料</router-link>
                            </a-menu-item>
                            <a-menu-item>
                                <router-link :to="{path: '/personal/changepwd'}"><a-icon type="setting" /> 修改密码</router-link>
                            </a-menu-item>
                            <a-menu-item>
                                <router-link :to="{path: '/Login/logout'}"><a-icon type="export" /> 退出</router-link>
                            </a-menu-item>
                        </a-menu>
                    </a-dropdown>
<!--                    <a-avatar :src="member_info.head_pic" style="margin:15px;float: right" />-->
                    <a-avatar src="https://zos.alipayobjects.com/rmsportal/jkjgkEfvpUPVyRjUImniVslZfWPnJuuZ.png" style="margin:15px;float: right" />
                </span>
    </a-layout-header>
</template>

<script>
    export default {
        name: "Head",
        props:['member_info'],
        data(){
            return{
                collapsed:false,
                user_name:this.$cookie.get('user_name'),
            }
        },
        methods:{
            click_collapsed(){
                this.collapsed = !this.collapsed;
                this.$emit('collapsed',this.collapsed)
            }
        }
    }
</script>

<style scoped>

</style>