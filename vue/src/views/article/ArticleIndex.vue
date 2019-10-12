<template>
    <a-table :columns="columns"
             :rowKey="record => record.article_id"
             :dataSource="data"
             :pagination="pagination"
             :loading="loading"
             @change="handleTableChange"
             bordered
    >
        <template slot="name" slot-scope="name">
            {{name.first}} {{name.last}}
        </template>
        <template slot="operation" slot-scope="text, record">
            <a-popconfirm title="Sure to delete?"
                          @confirm="() => onDelete(record.article_id)">
                <a href="javascript:;">删除</a>
            </a-popconfirm>

            <a-divider type="vertical"/>

            <router-link :to="{path: '/Article/edit', query: {article_id:record.article_id}}">编辑</router-link>
        </template>
    </a-table>
</template>
<script>
    import {ArticleList,DeleteArticle} from "../../axios/api";
    import moment from "moment";
    const columns = [{
        title: 'ID',
        dataIndex: 'article_id',
        sorter: true,
    }, {
        title: '文章名称',
        dataIndex: 'article_title',
    }, {
        title: '所属分类',
        dataIndex: 'category_name',
    }, {
        title: '文章摘要',
        dataIndex: 'article_desc',
    }, {
        title: '发布时间',
        dataIndex: 'create_time',
        sorter: true,
        customRender: (text, record, index) => {
            return moment(text * 1000).format('YYYY-MM-DD HH:mm:ss');
        }
    }, {
        title: '操作描述',
        dataIndex: '',
        scopedSlots: {customRender: 'operation'},
    }];

    export default {
        name: "ArticleIndex",
        mounted() {
            this.fetch();
        },
        data() {
            return {
                data: [],
                pagination: {},
                loading: false,
                columns,
                moment
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
                DeleteArticle({
                    article_id: key
                }).then((response) => {
                    if (response.data.code === 1) {
                        this.fetch();
                        this.$message.success(response.data.msg, 2);
                    } else {
                        this.$message.error(response.data.msg, 2);
                    }
                })
            },
            fetch(params = {}) {
                params.results = 10;
                this.loading = true;
                ArticleList(params).then((response) => {
                    var list = response.data.data;
                    const pagination = this.pagination;
                    pagination.total = list.total;
                    this.loading = false;
                    this.data = list.data;
                    this.pagination = pagination;
                });
            },
        },
    }
</script>

<style scoped>

</style>