<template>
    <div id="MenuList">
        <a-button class="editable-add-btn" @click="handleAdd">Add</a-button>
        <a-table :columns="columns" :dataSource="menu_list" rowKey='id'>
            <span slot="action" slot-scope="text, record">
                <a-popconfirm
                        title="Sure to delete?"
                        @confirm="() => detele_menu(record.id)">
                  <a href="javascript:;">Delete</a>
                </a-popconfirm>
<!--              <a href="javascript:;" @click="detele_menu(record.id)">Delete</a>-->
                <a-divider type="vertical" />
              <router-link :to="{path: '/Menu/edit', query: {id:record.id}}">Edit</router-link>
            </span>
        </a-table>
    </div>
</template>

<script>
    import {DeteleMenu,GetMenuList} from "../../axios/api";

    const columns = [{
        title: 'ID',
        dataIndex: 'id',
        key: 'id',
    }, {
        title: '菜单名称',
        dataIndex: 'title',
    }, {
        title: 'Controller/Action',
        dataIndex: 'rule_url',
    }, {
        title: 'ICON',
        dataIndex: 'icon',
    }, {
        title: '排序',
        dataIndex: 'sort',
    }, {
        title: '状态',
        dataIndex: 'is_link',
    }, {
        title: '创建时间 ',
        dataIndex: 'create_time',
    }, {
        title: '操作',
        scopedSlots: { customRender: 'action' },
    }];

    export default {
        name: "MenuList",
        data() {
            return {
                menu_list: [],
                columns,
                msg:""
            }
        },
        mounted() {
            this.fetch();
        },
        methods: {
            handleAdd() {
                this.$router.replace({path: '/Menu/add'});
            },
            fetch() {
                this.loading = true;
                GetMenuList().then((data) => {
                    this.menu_list = data.data;
                });
            },
            detele_menu(index){
                DeteleMenu({
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
    #MenuList .editable-add-btn {
        margin-bottom: 8px;
        right: 48%;
    }
</style>