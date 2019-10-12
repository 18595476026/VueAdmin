<template>
    <a-form :form="form" @submit="handleSubmit">
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="分类名称">
            <a-input v-decorator="['category_name',{rules: [{ required: true, message: '请填写分类名称' }]}]" placeholder="请填写分类名称"/>
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="上级分类">
            <a-tree-select
                    v-decorator="['category_pid',{rules: [{ required: true, message: '请选择父级分类' }]}]"
                    showSearch
                    style="width: 100%"
                    :dropdownStyle="{ maxHeight: '400px', overflow: 'auto' }"
                    placeholder='请选择'
                    allowClear
                    treeDefaultExpandAll
            >
                <a-icon slot="suffixIcon" type="smile" />
                <a-tree-select-node value='0' title='顶级分类' key='0'></a-tree-select-node>
                <a-tree-select-node v-for="category1 in category_tree" :value="category1.category_id+''" :title='category1.category_name' :key='category1.category_id'>
                    <a-tree-select-node v-if="category1.children.length != 0" v-for="category2 in category1.children" :value="category2.category_id+''" :title='category2.category_name' :key='category2.category_id'>
                        <a-tree-select-node v-if="category2.children.length != 0" v-for="category3 in category2.children" :value="category3.category_id+''" :title='category3.category_name' :key='category3.category_id'>
                        </a-tree-select-node>
                    </a-tree-select-node>
                </a-tree-select-node>
            </a-tree-select>
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="简单描述">
            <a-textarea :autosize="{ minRows: 2, maxRows: 6 }" v-decorator="['category_desc',{rules: [{ required: false, message: '请填写简单描述' }]}]"/>
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="关键字">
            <a-input v-decorator="['keywords',{rules: [{ required: false, message: '请填写关键字' }]}]" placeholder="请填写关键字"/>
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="排序">
            <a-input-number v-decorator="['sort',{rules: [{ required: false, message: '请选择权重' }]}]" style="width: 100%" />
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
    import {CategoryAdd,CategorySave} from "../../axios/api";

    export default {
        name: "CategoryAdd",
        data: function () {
            return {
                form: this.$form.createForm(this),
                category_tree: [],
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
                CategoryAdd().then((response)=>{
                    if (response.data.code == 1){
                        this.category_tree = response.data.data;
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
                        this.postSubmit(values);
                    }
                })
            },
            resetFields(){
                this.form.resetFields()
            },
            postSubmit(param){
                CategorySave(param).then((res)=>{
                    if (res.data.code == 1){
                        this.$message.success(res.data.msg, 2);
                        this.$router.replace({path: '/Category/index'});
                    }else{
                        this.$message.error(res.data.msg, 2);
                    }
                }).catch((error)=>{
                    console.log(error);
                })
            }
        }
    };
</script>

<style scoped>

</style>