<template>
    <a-form :form="form" @submit="handleSubmit">
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="用户名"  help="无法修改">
            <a-input v-decorator="['username',{initialValue:yun_administrator.username,rules: [{ required: true, message: 'Please input your name' }]}]" :disabled=disabled />
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
                <img v-if="imageUrl" :src="imageUrl" alt="avatar" />
                <div v-else>
                    <a-icon :type="loading ? 'loading' : 'plus'" />
                    <div class="ant-upload-text">选择头像</div>
                </div>
            </a-upload>
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="性别">
            <a-select style="width: 100%" v-decorator="['sex',{initialValue:yun_administrator.sex,rules: [{ required: true, message: '请选择性别' }]}]">
                <a-select-option :value="0">保密</a-select-option>
                <a-select-option :value="1">男</a-select-option>
                <a-select-option :value="2">女</a-select-option>
            </a-select>
        </a-form-item>
        <a-form-item label="生日" :label-col="labelCol" :wrapper-col="wrapperCol">
            <a-date-picker
                    style="width: 100%"
                    v-decorator="['birthday',{initialValue:!yun_administrator.birthday ? null:moment(yun_administrator.birthday)}]"
                    @change="dateChange"
            />
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="电话">
            <a-input v-decorator="['mobile',{initialValue:yun_administrator.phone,rules: [{ required: false, message: '请填写电话' }]}]" placeholder="请填写电话"/>
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="QQ">
            <a-input v-decorator="['qq',{initialValue:yun_administrator.qq,rules: [{ required: false, message: '请填写QQ' }]}]" placeholder="请填写QQ"/>
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="E-mail">
            <a-input v-decorator="['email',{initialValue:yun_administrator.email,rules: [{ required: false, message: '请填写E-mail' }]}]" placeholder="请填写E-mail"/>
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
    import {GetMenu, PersonalIndex} from "../../axios/api";
    import moment from "moment";
    function getBase64 (img, callback) {
        const reader = new FileReader();
        reader.addEventListener('load', () => callback(reader.result));
        reader.readAsDataURL(img)
    }
    export default {
        name: "PersonalIndex",
        data() {
            return {
                loading: false,
                form:this.$form.createForm(this),
                yun_administrator:[],
                imageUrl:"",
                head_pic:"",
                disabled:true,
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
        mounted(){
            this.fetch();
        },
        methods:{
            handleSubmit (e) {
                e.preventDefault();
                this.form.validateFields((errors,values)=>{
                    if (errors){
                        console.log(errors);
                    }else{
                        this.postSubmit(values);
                    }
                })
            },
            postSubmit(param){
                param.head_pic = this.head_pic;
                PersonalIndex(param).then((res)=>{
                    if (res.data.code == 1){
                        this.$message.success(res.data.msg, 2);
                    }else{
                        this.$message.error(res.data.msg, 2);
                    }
                }).catch((error)=>{
                    console.log(error);
                })
            },
            handleChange (info) {
                if (info.file.status === 'uploading') {
                    this.loading = true;
                    return
                }
                if (info.file.status === 'done') {
                    this.head_pic = info.file.response.thumbUrl;
                    // Get this url from response in real world.
                    getBase64(info.file.originFileObj, (imageUrl) => {
                        this.imageUrl = imageUrl;
                        this.loading = false;
                    })
                }else if(info.file.status === 'error'){
                    this.$message.error("上传失败",2);
                }
            },
            beforeUpload (file) {
                const isJPG = file.type === 'image/jpeg'
                if (!isJPG) {
                    this.$message.error('You can only upload JPG file!')
                }
                const isLt2M = file.size / 1024 / 1024 < 2
                if (!isLt2M) {
                    this.$message.error('Image must smaller than 2MB!')
                }
                return isJPG && isLt2M
            },
            resetFields(){
                this.form.resetFields()
            },
            dateChange(date, dateString){
                this.birthday = dateString;
            },
            fetch () {
                this.loading = true;
                GetMenu().then((data) => {
                    this.yun_administrator = data.data.yun_administrator;
                    this.imageUrl = data.data.yun_administrator.head_pic.head_pic;
                    this.loading = false;
                });
            }
        }
    };
</script>

<style scoped>

</style>