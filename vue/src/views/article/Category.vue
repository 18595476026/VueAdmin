<template>
    <div id="Category">
        <div style="margin: 0 0 18px 0">
            <a-button class="editable-add-btn" type="primary" @click="handleAdd"><a-icon type="plus" />新增</a-button>
        </div>
        <a-table :columns="columns" :dataSource="category_list" rowKey='category_id' bordered>
            <span slot="action" slot-scope="text, record">
                <a-popconfirm
                        title="Sure to delete?"
                        @confirm="() => detele_category(record.category_id)">
                  <a href="javascript:;">删除</a>
                </a-popconfirm>
                <a-divider type="vertical" />
                <router-link :to="{path: '/Category/edit', query: {id:record.category_id}}">编辑</router-link>
            </span>
        </a-table>
    </div>
</template>
<script>
    import {CategoryList,DeleteCategory} from "../../axios/api";

    const columns = [{
        title: 'ID',
        dataIndex: 'category_id',
        key: 'category_id',
    }, {
        title: '分类名称',
        dataIndex: 'category_name',
    }, {
        title: '关键字',
        dataIndex: 'keywords',
    }, {
        title: '排序',
        dataIndex: 'sort',
    }, {
        title: '创建时间 ',
        dataIndex: 'create_time',
    }, {
        title: '操作',
        scopedSlots: { customRender: 'action' },
    }];

    export default {
        name: "Category",
        data() {
            return {
                category_list: [],
                columns,
                msg:""
            }
        },
        mounted() {
            this.fetch();
        },
        methods: {
            handleAdd() {
                this.$router.replace({path: '/Category/add'});
            },
            fetch() {
                this.loading = true;
                CategoryList().then((data) => {
                    this.category_list = data.data.data;
                });
            },
            detele_category(index){
                DeleteCategory({
                    id:index
                }).then((data) => {
                    this.msg = data.data.msg;
                    this.fetch();
                    this.openNotification();
                });
            },
            openNotification () {
                this.$notification.open({
                    message: "提醒框",
                    description: this.msg,
                });
            },
        }
    }
</script>

<style scoped>
    #Category .editable-add-btn {
        margin-bottom: 8px;
        right: 48%;
    }
</style>