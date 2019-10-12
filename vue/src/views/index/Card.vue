<template>
    <div style="background-color: #ececec; padding: 20px;">
        <a-row :gutter="16">
            <a-col :span="8">
                <a-card title="系统介绍" :bordered=false>
                    <h4>YunAdmin</h4><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;YunAdmin后台管理系统是基于ThinkPHP5框架和Olive Admin后台模版进行开发的。</p>
                    <p>PHP版本：
                        {{config['php_version']}}，MySQL版本：{{config['mysql_version']}}									</p>
                    <p>服务器：{{config['server_info']}}</p>
                    <p>PHP运行方式：{{config['php_sapi_name']}}</p>
                    <p>服务器IP：{{config['server_ip']}}</p>
                    <p>程序版本：{{config['version']}}</p>
                </a-card>
            </a-col>
            <a-col :span="8">
                <a-card title="开发团队" :bordered=false>
                    <h4>TEAM</h4>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;YunAdmin后台管理系统的开发团体成员都是非常优秀的（其实就我一个人），全栈工程师是我的目标， 让编程改变世界是我的理想。开源是一种精神！为中国的互联网行业发展献出一份小小的力量。
                    </p>
                    <p>团队名称：魏武横槊</p>
                    <p>团队成员：ZhiHuaWei(就是我)</p>
                    <p>开发者邮箱：zhihua_wei@foxmail.com</p>
                    <p>QQ交流群：295383702</p>
                </a-card>
            </a-col>
            <a-col :span="8">
                <a-card title="官方消息" :bordered=false>
                    <h4>OFFICIAL</h4>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;YunAdmin后台管理系统的官方正在筹建当中，有兴趣投资的朋友们可以联系我，估计也不会赚到钱。 （说的都是废话，总结一句就是没有官方。）
                    </p>
                </a-card>
            </a-col>
        </a-row>
    </div>
</template>

<script>
    import {Console} from "../../axios/api";

    export default {
        name: "Card",
        data(){
            return{
                config:[],
            }
        },
        mounted() {
            this.fetch();
        },
        methods:{
            fetch () {
                this.loading = true;
                Console().then((data) => {
                    this.config = data.data.system_info
                });
            }
        }
    }
</script>

<style scoped>

</style>