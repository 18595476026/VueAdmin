<template>
    <a-table :columns="columns"
             :rowKey="record => record.id"
             :dataSource="data"
             :pagination="pagination"
             :loading="loading"
             @change="handleTableChange"
    >
        <template slot="name" slot-scope="name">
            {{name.first}} {{name.last}}
        </template>
        <template slot="operation" slot-scope="text, record">
            <a-popconfirm v-if="record.id != 1" title="Sure to delete?"
                          @confirm="() => onDelete(record.id)">
                <a href="javascript:;">Delete</a>
            </a-popconfirm>

            <a-divider v-if="record.id != 1" type="vertical"/>

            <a-popconfirm v-if="record.status == 0 && record.id != 1" title="您确定要解除锁定?"
                          @confirm="() => dispark(record.id,'')">
                <a href="javascript:;">解除锁定</a>
            </a-popconfirm>
            <a-popconfirm v-if="record.status != 0 && record.id != 1" title="您确定要锁定禁用?"
                          @confirm="() => dispark(record.id,'lock')">
                <a href="javascript:;">锁定禁用</a>
            </a-popconfirm>

            <a-divider v-if="record.id != 1" type="vertical"/>

            <router-link v-if="record.id != 1" :to="{path: '/group/edit', query: {id:record.id}}">Edit</router-link>

            <a-tooltip v-if="record.id == 1">
                <template slot='title'>
                    禁止操作超级管理员
                </template>
                <a-icon type="stop"/>
            </a-tooltip>
        </template>
    </a-table>
</template>
<script>
    import {GroupList, GroupLock, DeleteGroup} from "../../axios/api";

    const columns = [{
        title: 'ID',
        dataIndex: 'id',
        sorter: true,
    }, {
        title: '角色名称',
        dataIndex: 'title',
    }, {
        title: '角色下管理员数量',
        dataIndex: 'counts',
    }, {
        title: '角色状态',
        dataIndex: 'status',
        customRender: (text, record, index) => {
            if (text === 1) {
                return '正常'
            } else {
                return '锁定禁用'
            }
        }
    }, {
        title: '角色描述',
        dataIndex: 'note',
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
                    results: pagination.pageSize,
                    page: pagination.current,
                    sortField: sorter.field,
                    sortOrder: sorter.order,
                });
            },
            onDelete(key) {
                DeleteGroup({
                    id: key
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
                GroupList(params).then((response) => {
                    this.data = response.data.data.data;
                    this.loading = false;
                });
            },
            dispark(id, opt) {
                this.loading = true;
                GroupLock({
                    'id': id,
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
