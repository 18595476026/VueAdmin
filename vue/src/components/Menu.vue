<template>
    <a-layout-sider breakpoint="lg"
                    collapsedWidth="0"
                    :trigger="null"
                    collapsible
                    v-model="collapsed"
                    style="background: #fff;"
    >
        <div class="logo" style="height: 59px">
            <router-link :to="{path:'/index'}">
                <img src="../assets/logo.png" alt="" style="height: 33px;width: 33px;">
                <h1 style="margin: 20px 10px;display: inline-block;font-size: 18px;color: #fff;font-family:Fantasy;">Vue-Admin</h1>
            </router-link>
        </div>
        <a-menu
                mode="inline"
                :openKeys="openKeys"
                @openChange="onOpenChange"
        >
            <a-menu-item key="1">
                <a-icon type="desktop" />
                <span><router-link tag="span" to="/index">控制台</router-link></span>
            </a-menu-item>
            <template v-for="value in menu_list">
                <a-menu-item v-if="value['children'].length === 0" :key="value['id']">
                    <a-icon type="desktop" />
                    <span><router-link :to="{path: '/' + value.rule_url}">{{ value['title'] }}</router-link></span>
                </a-menu-item>
                <a-sub-menu v-if="value['children'].length !== 0" :key="value['id']">
                    <span slot="title"><a-icon type="setting" /><span>{{ value['title'] }}</span></span>
                    <a-menu-item v-for="children in value['children']" :key="children['id']"><router-link :to="{path: '/' + children.rule_url}">{{ children['title'] }}</router-link></a-menu-item>
                </a-sub-menu>
            </template>
        </a-menu>
    </a-layout-sider>
</template>

<script>
    export default {
        name: "Menu",
        props:['collapsed','menu_list'],
        data () {
            return {
                rootSubmenuKeys: [],
                openKeys: [],
            }
        },
        updated(){
            for (var i=0;i<this.menu_list.length;i++)
            {
                this.rootSubmenuKeys.push(this.menu_list[i]['id'])
            }
        },
        methods:{
            onOpenChange (openKeys) {
                const latestOpenKey = openKeys.find(key => this.openKeys.indexOf(key) === -1);
                if (this.rootSubmenuKeys.indexOf(latestOpenKey) === -1) {
                    this.openKeys = openKeys
                } else {
                    this.openKeys = latestOpenKey ? [latestOpenKey] : []
                }
            }
        }
    }
</script>

<style scoped>

</style>