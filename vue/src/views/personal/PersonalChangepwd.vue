<template>
    <a-form :form="form" @submit="handleSubmit">
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="旧密码">
            <a-input v-decorator="['oldpwd',{rules: [{ required: true, message: 'Please input your name' }]}]"/>
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="新密码">
            <a-input v-decorator="['password',{rules: [{ required: true, message: 'Please input your name' }]}]"/>
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="确认新密码">
            <a-input
                    v-decorator="['confirm_password',{rules: [{ validator:validatePass2,required: true }],validateTrigger: 'blur'}]"/>
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol">
            <div>
                <a-button type="primary" html-type="submit" class="login-form-button" style="margin-right: 5%;">
                    保存
                </a-button>

                <a-button type="danger" class="login-form-button" @click="resetFields">
                    重置
                </a-button>
            </div>
        </a-form-item>
    </a-form>
</template>
<script>
    import {ChangePassword} from "../../axios/api";

    export default {
        name: "PersonalIndex",
        data() {
            return {
                loading: false,
                form: this.$form.createForm(this),
                labelCol: {
                    xs: {span: 24},
                    sm: {span: 5},
                },
                wrapperCol: {
                    xs: {span: 24},
                    sm: {span: 12},
                },
            };
        },
        methods: {
            handleSubmit(e) {
                e.preventDefault();
                this.form.validateFields((errors, values) => {
                    if (errors) {
                        console.log(errors);
                    } else {
                        this.postSubmit(values);
                    }
                })
            },
            postSubmit(param) {
                ChangePassword(param).then((res) => {
                    if (res.data.code == 1) {
                        this.$message.success(res.data.msg, 2);
                        this.$router.replace({path: '/login'});
                    } else {
                        this.$message.error(res.data.msg, 2);
                    }
                }).catch((error) => {
                    console.log(error);
                })
            },
            resetFields() {
                this.form.resetFields()
            },
            validatePass2(rule, value, callback) {
                var password = this.form.getFieldValue('password');
                if (value === '') {
                    callback(new Error('请再次输入密码'));
                } else if (value !== password) {
                    callback(new Error('两次输入密码不一致!'));
                } else {
                    callback();
                }
            }
        }
    };
</script>

<style scoped>

</style>