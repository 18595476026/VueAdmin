<template>
    <a-form :form="form" @submit="handleSubmit">
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="文章分类">
            <a-tree-select
                    v-decorator="['category_id',{initialValue:article.category_id+'',rules: [{ required: true, message: '请选择文章分类' }]}]"
                    showSearch
                    style="width: 100%"
                    :dropdownStyle="{ maxHeight: '400px', overflow: 'auto' }"
                    placeholder='请选择文章分类'
                    allowClear
                    treeDefaultExpandAll
            >
                <a-icon slot="suffixIcon" type="smile" />
                <a-tree-select-node v-for="cate1 in cate_list" :value="cate1.category_id+''" :title='cate1.category_name' :key='cate1.category_id'>
                    <a-tree-select-node v-if="cate1.children.length != 0" v-for="cate2 in cate1.children" :value="cate2.category_id+''" :title='cate2.category_name' :key='cate2.category_id'>
                        <a-tree-select-node v-if="cate2.children.length != 0" v-for="cate3 in cate2.children" :value="cate3.category_id+''" :title='cate3.category_name' :key='cate3.category_id'>
                        </a-tree-select-node>
                    </a-tree-select-node>
                </a-tree-select-node>
            </a-tree-select>
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="文章名称">
            <a-input v-decorator="['article_title',{initialValue:article.article_title,rules: [{ required: true, message: '请填写文章名称' }]}]" />
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="关键词" help="关键词用英文逗号','分隔">
            <a-input v-decorator="['keywords',{initialValue:article.keywords,rules: [{ required: true, message: '请填写关键词' }]}]" />
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="文章摘要">
            <a-textarea  v-decorator="['article_desc',{initialValue:article.article_desc,rules: [{ required: false, message: '请填写关键词' }]}]" autosize />
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="文章插图">
            <a-upload
                    name="article_pic"
                    listType="picture-card"
                    class="avatar-uploader"
                    :showUploadList="false"
                    action="https://www.mocky.io/v2/5cc8019d300000980a055e76"
                    :beforeUpload="beforeUpload"
                    @change="handleChange"
                    v-decorator="['article_pic']"
            >
                <img v-if="imageUrl" :src="imageUrl" alt="avatar" />
                <div v-else>
                    <a-icon :type="loading ? 'loading' : 'plus'" />
                    <div class="ant-upload-text">选择头像</div>
                </div>
            </a-upload>
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="文章内容">
            <tinymce_editor v-model="content"
                            :disabled="disabled"
                            ref="editor">
            </tinymce_editor>
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
    import {EditArticle,SaveArticle} from "../../axios/api";
    import TinyMce from '../../components/Tinymce';
    function getBase64 (img, callback) {
        const reader = new FileReader();
        reader.addEventListener('load', () => callback(reader.result));
        reader.readAsDataURL(img)
    }

    export default {
        name: "MenuEdit",
        components:{
            tinymce_editor:TinyMce,
        },
        data: function () {
            return {
                loading: false,
                form: this.$form.createForm(this),
                article_id: this.$route.query.article_id,
                article:[],
                cate_list:[],
                imageUrl:"",
                head_pic:"",
                labelCol: {
                    xs: {span: 24},
                    sm: {span: 5},
                },
                wrapperCol: {
                    xs: {span: 24},
                    sm: {span: 12},
                },
                disabled: false,
                content:"欢迎来到TinyMCE 5编辑器",
                primeval:""
            };
        },
        created() {
            this.fetch();
        },
        methods:{
            openNotification () {
                this.$notification.open({
                    message: "提醒框",
                    description: this.msg,
                });
            },
            fetch(){
                EditArticle({
                    article_id:this.article_id
                }).then((response)=>{
                    if (response.data.code == 1){
                        this.article = response.data.data.article;
                        this.cate_list = response.data.data.cate_list;
                        this.imageUrl = response.data.data.article.article_pic;
                        this.content = response.data.data.article.content;
                        this.primeval = response.data.data.article.content;
                    }else{
                        this.msg = response.data.msg;
                        this.openNotification();
                    }
                }).catch((err)=>{
                    console.log(err);
                })
            },
            handleSubmit (e) {
                e.preventDefault();
                this.form.validateFields((errors,values)=>{
                    if (errors){
                        console.log(errors);
                    }else{
                        values.article_id = this.article_id;
                        values.article_pic = this.article_pic;
                        values.content = this.content;
                        this.postSubmit(values);
                    }
                })
            },
            resetFields(){
                this.form.resetFields();
                this.content = this.primeval;
            },
            postSubmit(param){
                SaveArticle(param).then((res)=>{
                    if (res.data.code == 1){
                        this.fetch();
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
                    this.article_pic = info.file.response.thumbUrl;
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
        }
    };
</script>

<style scoped>

</style>