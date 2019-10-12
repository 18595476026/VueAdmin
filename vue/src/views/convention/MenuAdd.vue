<template>
    <a-form :form="form" @submit="handleSubmit">
        <a-tag color="#108ee9">新增菜单</a-tag>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="菜单名称">
            <a-input v-decorator="['title',{rules: [{ required: true, message: '请填写菜单名称' }]}]" placeholder="请填写菜单名称"/>
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="上级菜单">
            <a-tree-select
                    v-decorator="['pid',{rules: [{ required: false, message: '请选择父级菜单' }]}]"
                    showSearch
                    style="width: 100%"
                    :dropdownStyle="{ maxHeight: '400px', overflow: 'auto' }"
                    placeholder='请选择'
                    allowClear
                    treeDefaultExpandAll
                    @change="onChange"
            >
                <a-icon slot="suffixIcon" type="smile" />
                <a-tree-select-node v-for="menu1 in menu_list" :value="menu1.id+''" :title='menu1.title' :key='menu1.id'>
                    <a-tree-select-node v-if="menu1.children.length != 0" v-for="menu2 in menu1.children" :value="menu2.id+''" :title='menu2.title' :key='menu2.id'>
                    </a-tree-select-node>
                </a-tree-select-node>
            </a-tree-select>
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="路由/Router">
            <a-input v-decorator="['rule',{rules: [{ required: true, message: '请填写路由地址' }]}]" placeholder="请填写路由地址"/>
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="菜单图标">
            <a-input v-decorator="['icon',{rules: [{ required: false, message: '菜单图标' }]}]" placeholder="菜单图标"/>
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="显示状态">
            <a-switch v-decorator="['is_link',{initialValue:true,rules: [{ required: false, message: '请选择状态' }]}]" defaultChecked />
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="排序">
            <a-input-number v-decorator="['sort',{rules: [{ required: false, message: '请选择权重' }]}]" style="width: 100%" />
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="页面提示">
            <a-textarea v-decorator="['tips',{rules: [{ required: false, message: '请填写页面提示' }]}]" :autosize="{ minRows: 2, maxRows: 6 }" />
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
    import {AddMenu,SaveMenu} from "../../axios/api";

    export default {
        name: "MenuEdit",
        data: function () {
            return {
                form: this.$form.createForm(this),
                menu_list: [],
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
            AddMenu().then((response)=>{
                if (response.data.code == 1){
                    this.menu_list = response.data.data;
                }else{
                    this.msg = response.data.msg;
                    this.openNotification();
                }
            }).catch((err)=>{
                console.log(err);
            })
        },
        methods:{
            openNotification () {
                this.$notification.open({
                    message: "提醒框",
                    description: this.msg,
                });
            },
            onChange (value) {
                this.value = value
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
                SaveMenu(param).then((res)=>{
                    if (res.data.code == 1){
                        this.$message.success(res.data.msg, 2);
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