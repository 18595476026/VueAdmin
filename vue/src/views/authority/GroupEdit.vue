<template>
    <a-form :form="form" @submit="handleSubmit">
        <a-tag color="#108ee9">编辑角色</a-tag>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="角色名称">
            <a-input v-decorator="['title',{initialValue:group.title,rules: [{ required: true, message: '请填写角色名称' }]}]"
                     placeholder="请填写角色名称"/>
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="角色状态">
            <a-switch v-if="group.status === 1" defaultChecked v-decorator="['status',{initialValue:true}]"/>
            <a-switch v-if="group.status === 0" v-decorator="['status',{initialValue:false}]"/>
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="角色描述">
            <a-textarea :autosize="{ minRows: 2, maxRows: 6 }" v-decorator="['note',{initialValue:group.note}]"/>
        </a-form-item>
        <a-form-item :label-col="labelCol" :wrapper-col="wrapperCol" label="权限选择">
            <a-tree
                    checkable
                    v-model="CheckedKeys"
                    :selectedKeys="CheckedKeys"
                    :treeData="treeData"
                    v-decorator="['rules',{initialValue: CheckedKeys}]"
            />
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

    import {EditGroup, SaveGroup} from "../../axios/api";

    export default {
        data() {
            return {
                form: this.$form.createForm(this),
                id: this.$route.query.id,
                group: [],
                treeData: [],
                ExpandedKeys: [],
                CheckedKeys: [],
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
        mounted() {
            this.fetch()
        },
        methods: {
            fetch() {
                EditGroup({'id': this.id}).then((response) => {
                    if (response.data.code === 1) {
                        this.group = response.data.data.group;
                        var rule_list = response.data.data.rule_list;
                        for (var i = 0; i < rule_list.length; i++) {
                            rule_list[i].key = rule_list[i].id.toString();
                            if (rule_list[i]['children'].length != 0) {
                                for (var j = 0; j < rule_list[i]['children'].length; j++) {
                                    rule_list[i]['children'][j]['key'] = rule_list[i]['children'][j]['id'].toString();
                                    if (rule_list[i]['children'][j]['children'] && rule_list[i]['children'][j]['children'].length != 0) {
                                        for (var a = 0; a < rule_list[i]['children'][j]['children'].length; a++) {
                                            rule_list[i]['children'][j]['children'][a]['key'] = rule_list[i]['children'][j]['children'][a]['id'].toString();
                                        }
                                    }
                                }
                            }
                        }
                        this.treeData = rule_list;
                        this.CheckedKeys = response.data.data.group.rules;
                        this.ExpandedKeys = response.data.data.group.rules;
                    } else {
                        this.$message.error(response.data.msg, 2);
                    }
                })
            },
            onCheck(checkedKeys, info) {
                console.log('onCheck', checkedKeys, info)
            },
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
                console.log(param);
                if (param.status === false) {
                    param.status = 0;
                } else {
                    param.status = 1;
                }
                param.id = this.id;
                SaveGroup(param).then((res) => {
                    if (res.data.code == 1) {
                        this.$message.success(res.data.msg, 2);
                    } else {
                        this.$message.error(res.data.msg, 2);
                    }
                }).catch((error) => {
                    console.log(error);
                })
            },
        }
    };
</script>

<style scoped>

</style>