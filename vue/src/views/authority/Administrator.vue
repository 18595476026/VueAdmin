<template>
    <a-table :columns="columns"
             :rowKey="record => record.admin_uid"
             :dataSource="data"
             :pagination="pagination"
             :loading="loading"
             @change="handleTableChange"
    >
        <template slot="name" slot-scope="name">
            {{name.first}} {{name.last}}
        </template>
        <template slot="operation" slot-scope="text, record">
            <a-popconfirm v-if="record.group_id != 1" title="Sure to delete?"
                          @confirm="() => onDelete(record.admin_uid)">
                <a href="javascript:;">Delete</a>
            </a-popconfirm>

            <a-divider v-if="record.group_id != 1" type="vertical"/>

            <a-popconfirm v-if="record.status == 0 && record.group_id != 1" title="您确定要解除锁定?"
                          @confirm="() => dispark(record.admin_uid,'')">
                <a href="javascript:;">解除锁定</a>
            </a-popconfirm>
            <a-popconfirm v-if="record.status != 0 && record.group_id != 1" title="您确定要锁定禁用?"
                          @confirm="() => dispark(record.admin_uid,'lock')">
                <a href="javascript:;">锁定禁用</a>
            </a-popconfirm>

            <a-divider v-if="record.group_id != 1" type="vertical"/>

            <router-link :to="{path: '/Administrator/edit', query: {uid:record.admin_uid}}">Edit</router-link>
        </template>
    </a-table>
</template>
<script>
    import {AdministratorLock, DeleteAdministrator, GetAdministrator} from "../../axios/api";

    const columns = [{
        title: 'ID',
        dataIndex: 'admin_uid',
        sorter: true,
        scopedSlots: {customRender: 'admin_uid'},
    }, {
        title: '用户名',
        dataIndex: 'username',
    }, {
        title: '所属权限组',
        dataIndex: 'group_title',
    }, {
        title: '性别',
        dataIndex: 'sex',
        filters: [
            {text: '男', value: '1'},
            {text: '女', value: '2'},
            {text: '保密', value: '0'},
        ]
    }, {
        title: '出生年月',
        dataIndex: 'birthday',
    }, {
        title: '电话',
        dataIndex: 'phone',
    }, {
        title: 'QQ',
        dataIndex: 'qq',
    }, {
        title: '邮箱',
        dataIndex: 'email',
    }, {
        title: '状态',
        dataIndex: 'status',
        customRender: (text, record, index) => {
            if (text === 1) {
                return '正常'
            } else {
                return '锁定'
            }
        }
    }, {
        title: '创建时间',
        dataIndex: 'create_time',
    }, {
        title: '操作描述',
        dataIndex: '',
        scopedSlots: {customRender: 'operation'},
    }];

    export default {
        mounted() {
            this.fetch();
        },
        data() {
            return {
                data: [],
                pagination: {},
                loading: false,
                columns,
            }
        },
        methods: {
            handleTableChange(pagination, filters, sorter) {
                const pager = {pagination};
                pager.current = pagination.current;
                this.pagination = pager;
                this.fetch({
                    sex: filters.sex[0],
                    results: pagination.pageSize,
                    page: pagination.current,
                    sortField: sorter.field,
                    sortOrder: sorter.order,
                });
            },
            onDelete(key) {
                DeleteAdministrator({
                    uid: key
                }).then((response) => {
                    if (response.data.code === 1) {
                        this.$message.success(response.data.msg, 2);
                    } else {
                        this.$message.error(response.data.msg, 2);
                    }
                })
            },
            fetch(params = {}) {
                params.results = 10;
                this.loading = true;
                GetAdministrator(params).then((response) => {
                    var list = response.data.data.list;
                    var auth_group = response.data.data.auth_group;
                    var sex = response.data.data.sex;
                    for (var i = 0; i < list.data.length; i++) {
                        list.data[i]['sex'] = sex[list.data[i]['sex']]
                        list.data[i]['group_title'] = auth_group[list.data[i]['group_id']]
                    }
                    const pagination = this.pagination;
                    pagination.total = list.total;
                    this.loading = false;
                    this.data = list.data;
                    this.pagination = pagination;
                });
            },
            dispark(uid, opt) {
                this.loading = true;
                AdministratorLock({
                    'uid': uid,
                    'opt': opt,
                }).then((response) => {
                    if (response.data.code === 1) {
                        this.$message.success(response.data.msg, 2);
                    } else {
                        this.$message.error(response.data.msg, 2);
                    }
                });
                this.loading = false;
            }
        },
    }
</script>
