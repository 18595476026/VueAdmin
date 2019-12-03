<template>
    <a-form :form="form" @submit="handleSubmit">
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="文章分类">
            <a-tree-select
                    v-decorator="['category_id',{rules: [{ required: true, message: '请选择文章分类' }]}]"
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
            <a-input v-decorator="['article_title',{rules: [{ required: true, message: '请填写文章名称' }]}]" />
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="关键词" help="关键词用英文逗号','分隔">
            <a-input v-decorator="['keywords',{rules: [{ required: true, message: '请填写关键词' }]}]" />
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="文章摘要">
            <a-textarea  v-decorator="['article_desc',{rules: [{ required: false, message: '请填写关键词' }]}]" autosize />
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
    import {AddArticle,SaveArticle} from "../../axios/api";
    import {handleChange,beforeUpload} from "../../assets/common";
    import TinyMce from '../../components/Tinymce';

    export default {
        name: "MenuEdit",
        components:{
            tinymce_editor:TinyMce,
        },
        data: function () {
            return {
                loading: false,
                form: this.$form.createForm(this),
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
                AddArticle({
                    article_id:this.article_id
                }).then((response)=>{
                    if (response.data.code == 1){
                        this.cate_list = response.data.data;
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
                        values.article_pic = this.article_pic;
                        values.content = this.content;
                        console.log(values);
                        this.postSubmit(values);
                    }
                })
            },
            resetFields(){
                this.form.resetFields();
                this.content = "";
            },
            postSubmit(param){
                SaveArticle(param).then((res)=>{
                    if (res.data.code == 1){
                        this.$message.success(res.data.msg, 2);
                        this.$router.replace({path: '/Article/index'});
                    }else{
                        this.$message.error(res.data.msg, 2);
                    }
                }).catch((error)=>{
                    console.log(error);
                })
            },
            handleChange (info) {
                handleChange(info);
            },
            beforeUpload (file) {
                beforeUpload(file);
            },
        }
    };
</script>

<style scoped>

</style>