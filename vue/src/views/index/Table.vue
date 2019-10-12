<template>
    <a-table
            :columns="columns"
            :rowKey="record => record.log_id"
            :dataSource="data"
            :pagination="pagination"
            :loading="loading"
            :locale = "describe"
            @change="handleTableChange">
        <template slot="name" slot-scope="name">
            {{name.first}} {{name.last}}
        </template>
    </a-table>
</template>
<script>
    import {Console} from "../../axios/api";
    import moment from "moment";
    const columns = [{
        title: 'ID',
        dataIndex: 'log_id',
        sorter: true,
        width: '20%',
        scopedSlots: { customRender: 'log_id' },
    }, {
        title: '操作管理员',
        dataIndex: 'username',
        width: '20%',
    }, {
        title: '操作时间',
        dataIndex: 'create_time',
        customRender: (text, record, index) => {
            return moment(text * 1000).format('YYYY-MM-DD HH:mm:ss');
        }
    }, {
        title: 'IP',
        dataIndex: 'ip',
    }, {
        title: '操作描述',
        dataIndex: 'log_note',
    }];
    const describe = {
        filterConfirm: '确定',
        filterReset: '重置',
        emptyText: '暂无数据'
    };
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
                describe,
                moment,
            }
        },
        methods: {
            handleTableChange (pagination, filters, sorter) {
                const pager = { ...this.pagination };
                pager.current = pagination.current;
                this.pagination = pager;
                this.fetch({
                    results: pagination.pageSize,
                    page: pagination.current,
                    sortField: sorter.field,
                    sortOrder: sorter.order,
                });
            },
            fetch (params = {}) {
                this.loading = true;
                Console({
                        results: params.results,
                        page:params.page,
                        sortField:params.sortField,
                        sortOrder:params.sortOrder
                    }).then((data) => {
                    const pagination = { ...this.pagination };
                    // Read total count from server
                    // pagination.total = data.totalCount;
                    pagination.total = data.data.log_list.total;
                    this.loading = false;
                    this.data = data.data.log_list.data;
                    this.pagination = pagination;
                });
            }
        },
    }
</script>
