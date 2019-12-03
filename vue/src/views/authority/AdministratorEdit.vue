<template>
    <a-form :form="form" @submit="handleSubmit">
        <a-tag color="#108ee9">编辑管理员</a-tag>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="用户名">
            <a-input
                    v-decorator="['username',{initialValue:admin_info.username,rules: [{ required: true, message: '请填写菜单名称' }]}]"
                    placeholder="请填写用户名称"/>
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="所属用户组">
            <a-select style="width: 100%"
                      v-decorator="['group_id',{initialValue:admin_info.group_id,rules: [{ required: true, message: '请选择所属用户组' }]}]">
                <a-select-option :value="0">请选择所属用户组</a-select-option>
                <a-select-option v-for="group in group_list" :value="group.id">{{ group.title }}</a-select-option>
            </a-select>
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="登录密码" help="为空表示不做修改...">
            <a-input v-decorator="['password']" placeholder="登录密码"/>
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="头像">
            <a-upload
                    name="head_pic"
                    listType="picture-card"
                    class="avatar-uploader"
                    :showUploadList="false"
                    action="https://www.mocky.io/v2/5cc8019d300000980a055e76"
                    :beforeUpload="beforeUpload"
                    @change="handleChange"
                    v-decorator="['head_pic']"
            >
                <img v-if="imageUrl" :src="imageUrl" alt="avatar"/>
                <div v-else>
                    <a-icon :type="loading ? 'loading' : 'plus'"/>
                    <div class="ant-upload-text">选择头像</div>
                </div>
            </a-upload>
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="性别">
            <a-select style="width: 100%"
                      v-decorator="['sex',{initialValue:admin_info.sex,rules: [{ required: true, message: '请选择性别' }]}]">
                <a-select-option :value="0">保密</a-select-option>
                <a-select-option :value="1">男</a-select-option>
                <a-select-option :value="2">女</a-select-option>
            </a-select>
        </a-form-item>
        <a-form-item label="生日" :label-col="labelCol" :wrapper-col="wrapperCol">
            <a-date-picker
                    style="width: 100%"
                    v-decorator="['birthday',{initialValue:!admin_info.birthday ? null:moment(admin_info.birthday)}]"
                    @change="dateChange"
            />
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="电话">
            <a-input
                    v-decorator="['mobile',{initialValue:admin_info.phone,rules: [{ required: false, message: '请填写电话' }]}]"
                    placeholder="请填写电话"/>
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="QQ">
            <a-input v-decorator="['qq',{initialValue:admin_info.qq,rules: [{ required: false, message: '请填写QQ' }]}]"
                     placeholder="请填写QQ"/>
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="E-mail">
            <a-input
                    v-decorator="['email',{initialValue:admin_info.email,rules: [{ required: false, message: '请填写E-mail' }]}]"
                    placeholder="请填写E-mail"/>
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
    import {EditAdministrator, SaveAdministrator} from "../../axios/api";
    import {handleChange,beforeUpload} from "../../assets/common";
    import moment from "moment";

    export default {
        data: function () {
            return {
                loading: false,
                form: this.$form.createForm(this),
                uid: this.$route.query.uid,
                admin_info: [],
                group_list: [],
                imageUrl: "",
                head_pic: "",
                birthday: "",
                labelCol: {
                    xs: {span: 24},
                    sm: {span: 5},
                },
                wrapperCol: {
                    xs: {span: 24},
                    sm: {span: 12},
                },
                moment,
            };
        },
        created() {
            EditAdministrator({
                uid: this.uid
            }).then((response) => {
                if (response.data.code == 1) {
                    this.group_list = response.data.data.group_list;
                    this.admin_info = response.data.data.admin_info;
                    this.imageUrl = response.data.data.admin_info.head_pic;
                    this.birthday = response.data.data.admin_info.birthday;
                } else {
                    this.$message.error(response.data.msg, 2);
                }
            }).catch((err) => {
                console.log(err);
            })
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
            resetFields() {
                this.form.resetFields()
            },
            postSubmit(param) {
                param.admin_uid = this.uid;
                param.head_pic = this.head_pic;
                param.birthday = this.birthday;
                SaveAdministrator(param).then((res) => {
                    if (res.data.code == 1) {
                        this.$message.success(res.data.msg, 2);
                    } else {
                        this.$message.error(res.data.msg, 2);
                    }
                }).catch((error) => {
                    console.log(error);
                })
            },
            handleChange(info) {
                handleChange(info);
            },
            beforeUpload(file) {
                beforeUpload(file);
            },
            dateChange(date, dateString) {
                this.birthday = dateString;
            }
        }
    };
</script>

<style scoped>
    .avatar-uploader > .ant-upload {
        width: 128px;
        height: 128px;
    }

    .ant-upload-select-picture-card i {
        font-size: 32px;
        color: #999;
    }

    .ant-upload-select-picture-card .ant-upload-text {
        margin-top: 8px;
        color: #666;
    }
</style>