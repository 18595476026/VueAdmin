<template>
        <a-form id="components-form-demo-normal-login" :form="form" class="login-form" @submit="handleSubmit">
            <a-spin size="large" tip="登录中..." style="font-size: 20px" :spinning="spinning" />
            <h2 id="title">{{systemName}}</h2>
            <a-form-item>
                <a-input v-decorator="['username',{ rules: [{ required: true, message: 'Please input your username!' }] }]" placeholder="Username">
                    <a-icon slot="prefix" type="user" style="color: rgba(0,0,0,.25)"/>
                </a-input>
            </a-form-item>
            <a-form-item>
                <a-input v-decorator="['password',{ rules: [{ required: true, message: 'Please input your Password!' }] }]" type="password" placeholder="Password">
                    <a-icon slot="prefix" type="lock" style="color: rgba(0,0,0,.25)"/>
                </a-input>
            </a-form-item>
            <a-form-item>
                <a-checkbox v-decorator="['remember',{valuePropName: 'checked',initialValue: true,}]">
                    记住密码
                </a-checkbox>

<!--                <router-link :to="{path:'/forgot'}">-->
<!--                    Forgot password-->
<!--                </router-link>-->
                <a-button type="primary" html-type="submit" class="login-form-button">
                    Log in
                </a-button>
<!--                Or-->
<!--                <router-link :to="{path:'/register'}">-->
<!--                    register now!-->
<!--                </router-link>-->
            </a-form-item>
        </a-form>
</template>

<script>
    import {Login} from '../../axios/api';
    export default {
        name: "Login",
        data () {
            return{
                systemName:"VueAdmin通用后台登录",
                spinning:false,
            }
        },
        beforeCreate () {
            this.form = this.$form.createForm(this);
        },
        methods: {
            handleSubmit (e) {
                this.spinning = true;
                e.preventDefault();
                this.form.validateFields((err, values) => {
                    if (!err) {
                        const params = {
                                    username:values.username,
                                    password:values.password,
                                    remember:values.remember
                                };

                        Login(params).then((response)=>{
                            if (response.data.code === 1){
                                this.$cookie.set('user_id',response.data.data.user_id);
                                this.$cookie.set('user_name',response.data.data.user_name);
                                this.$cookie.set('user_access_token',response.data.data.user_access_token);

                                //同步通知接口
                                this.Inform(response.data.data.urlRows);

                                this.openNotificationWithIcon('success','欢迎',"欢迎回来！！！");
                                this.$router.replace({path: '/Article/index'});
                            }else {
                                this.spinning = false;
                                this.form.resetFields()
                                this.openNotificationWithIcon('error','登录失败！！！',response.data.msg);
                            }

                        });

                    }
                });
            },
            openNotificationWithIcon (type,message,description) {
                this.$notification[type]({
                    message: message,
                    description: description,
                });
            },
            Inform(urlRows){
                var url_num = urlRows.length;
                for(let i = 0; i< url_num; i++) {
                    this.$http.jsonp(urlRows[i],{jsonp:'callback'}).then(function (res) {});
                }
            },
        },
    };
</script>

<style scoped>
    #components-form-demo-normal-login .login-form {
        max-width: 300px;
    }
    #components-form-demo-normal-login .login-form-forgot {
        float: right;
    }
    #components-form-demo-normal-login .login-form-button {
        width: 100%;
    }
    .login-form {
        padding: 20px;
        /*box-shadow: 0 0px 8px 0 rgba(0, 0, 0, 0.06), 0 1px 0px 0 rgba(0, 0, 0, 0.02);*/
        -webkit-border-radius: 5px;
        border-radius: 5px;
        -moz-border-radius: 5px;
        background-clip: padding-box;
        margin-bottom: 20px;
        background-color: #F9FAFC;
        margin: 120px auto;
        width: 400px;
        border: 2px solid #8492A6;
    }

    #title {
        margin: 0px auto 40px auto;
        text-align: center;
        color: #505458;
    }

    .login-form {
        width: 350px;
        padding: 35px 35px 15px 35px;
    }
</style>