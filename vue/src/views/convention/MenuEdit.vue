<template>
    <a-form :form="form" @submit="handleSubmit">
        <a-tag color="#108ee9">菜单编辑</a-tag>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="菜单名称">
            <a-input v-decorator="['title',{initialValue:menu.title,rules: [{ required: true, message: '请填写菜单名称' }]}]" placeholder="请填写菜单名称"/>
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="上级菜单">
            <a-tree-select
                    v-decorator="['pid',{initialValue:menu.pid+'',rules: [{ required: false, message: '请选择父级菜单' }]}]"
                    showSearch
                    style="width: 100%"
                    :dropdownStyle="{ maxHeight: '400px', overflow: 'auto' }"
                    placeholder='请选择'
                    allowClear
                    treeDefaultExpandAll
                    @change="onChange"
            >
                <a-icon slot="suffixIcon" type="smile" />
                <a-tree-select-node value='0' title='顶级菜单' key='0'></a-tree-select-node>
                <a-tree-select-node v-for="menu1 in menu_list" :value="menu1.id+''" :title='menu1.title' :key='menu1.id'>
                    <a-tree-select-node v-if="menu1.children.length != 0" v-for="menu2 in menu1.children" :value="menu2.id+''" :title='menu2.title' :key='menu2.id'>
                    </a-tree-select-node>
                </a-tree-select-node>
            </a-tree-select>
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="路由/Router">
            <a-input v-decorator="['rule',{initialValue:menu.rule_url,rules: [{ required: true, message: '请填写路由地址' }]}]" placeholder="请填写路由地址"/>
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="菜单图标">
            <a-input v-decorator="['icon',{initialValue:menu.icon,rules: [{ required: false, message: '菜单图标' }]}]" placeholder="菜单图标"/>
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="显示状态">
            <a-switch v-decorator="['is_link',{initialValue:is_link,rules: [{ required: false, message: '请选择状态' }]}]" />
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="排序">
            <a-input-number v-decorator="['sort',{initialValue:menu.sort+'',rules: [{ required: false, message: '请选择权重' }]}]" style="width: 100%" />
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="页面提示">
            <a-textarea v-decorator="['tips',{initialValue:menu.tips,rules: [{ required: false, message: '请填写页面提示' }]}]" :autosize="{ minRows: 2, maxRows: 6 }" />
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
    import {EditMenu,SaveMenu} from "../../axios/api";

    export default {
        name: "MenuEdit",
        data: function () {
            return {
                formLayout: 'horizontal',
                form: this.$form.createForm(this),
                id: this.$route.query.id,
                menu: [],
                menu_list: [],
                defaultValue:"",
                is_link:false,
                labelCol: {
                    xs: {span: 24},
                    sm: {span: 5},
                },
                wrapperCol: {
                    xs: {span: 24},
                    sm: {span: 12},
                },
                value: undefined,
            };
        },
        created() {
            EditMenu({
                        id:this.id
                    }).then((response)=>{
                if (response.data.code == 1){
                    this.menu = response.data.data.menu;
                    this.value = response.data.data.menu.pid;
                    this.menu_list = response.data.data.menu_list;
                    if (response.data.data.menu.is_link == 1){
                        this.is_link = true;
                    }
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
                        values.id = this.id;
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