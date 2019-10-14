<template>
    <a-spin size="large" tip="正在退出..." style="font-size: 20px" :spinning="spinning" />
</template>

<script>
    import {Logout} from "../../axios/api";
    import { Inform } from "../../assets/common";

    export default {
        name: "LogOut",
        data(){
            return {
                spinning:false,
            }
        },
        created() {
            this.spinning = true;
            const login_user = {
                'user_id':this.$cookie.get('user_id'),
                'user_name':this.$cookie.get('user_name'),
                'user_access_token':this.$cookie.get('user_access_token'),
            };
            Logout(login_user).then((res) => {
                if (res.data.code == 1) {
                    this.$cookie.delete('user_id');
                    this.$cookie.delete('user_name');
                    this.$cookie.delete('user_access_token');

                    //单点登录-同步通知接口
                    Inform(res.data.data);

                    this.$message.success(res.data.msg, 2);
                    this.$router.replace({path: '/login'});
                } else {
                    this.$message.error(res.data.msg, 2);
                    this.$router.replace({path: '/index'});
                }
                this.spinning = false;
            });
        },
    }
</script>

<style scoped>

</style>