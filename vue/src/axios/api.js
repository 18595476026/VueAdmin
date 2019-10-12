import service from './request';

//登录
export const Login = data => {
    return service({
        url: "/index.php/admin/Login/login",
        method: 'post',
        data
    })
};
//获取菜单
export const GetMenu = data => {
    return service({
        url: "/index.php/admin/Menu/getMenu",
        method: 'get',
        params: data,
    })
};
//获取控制台信息
export const Console = data => {
    return service({
        url: "/index.php/admin/Index/index",
        method: 'get',
        params:data,
    })
};
//获取后台菜单列表
export const GetMenuList = data => {
    return service({
        url: "/index.php/admin/Menu/index",
        method: 'get',
        params: data,
    })
};
//删除后台菜单,根据菜单ID
export const DeteleMenu = data => {
    return service({
        url: "/index.php/admin/Menu/del",
        method: 'post',
        data
    })
};
//新增菜单
export const AddMenu = data => {
    return service({
        url: "/index.php/admin/menu/add",
        method: 'get',
        params: data
    })
};
//编辑菜单
export const EditMenu = data => {
    return service({
        url: "/index.php/admin/menu/edit",
        method: 'get',
        params: data
    })
};
//保存菜单
export const SaveMenu = data => {
    return service({
        url: "/index.php/admin/Menu/save",
        method: 'post',
        data
    })
};
//管理员列表
export const GetAdministrator = data => {
    return service({
        url: "/index.php/admin/administrator/index",
        method: 'get',
        params: data,
    })
};
//管理员状态管理
export const AdministratorLock = data => {
    return service({
        url: "/index.php/admin/administrator/lock",
        method: 'get',
        params: data,
    })
};
//删除管理员
export const DeleteAdministrator = data => {
    return service({
        url: "/index.php/admin/administrator/del",
        method: 'post',
        data,
    })
};
//新增管理员
export const AddAdministrator = data => {
    return service({
        url: "/index.php/admin/administrator/add",
        method: 'get',
        params: data,
    })
};
//编辑管理员
export const EditAdministrator = data => {
    return service({
        url: "/index.php/admin/administrator/edit",
        method: 'get',
        params: data,
    })
}
//保存管理员
export const SaveAdministrator = data => {
    return service({
        url: "/index.php/admin/administrator/save",
        method: 'post',
        data,
    })
};
//获取角色列表
export const GroupList = data => {
    return service({
        url: "/index.php/admin/Group/index",
        method: 'get',
        params: data,
    })
};
//管理角色状态
export const GroupLock = data => {
    return service({
        url: "/index.php/admin/group/lock",
        method: 'post',
        data,
    })
};
//删除角色
export const DeleteGroup = data => {
    return service({
        url: "/index.php/admin/group/del",
        method: 'post',
        data,
    })
};
//新增角色
export const AddGroup = data => {
    return service({
        url: "/index.php/admin/group/add",
        method: 'get',
        params: data,
    })
};
//编辑角色
export const EditGroup = data => {
    return service({
        url: "/index.php/admin/group/edit",
        method: 'get',
        params: data,
    })
};
//保存角色
export const SaveGroup = data => {
    return service({
        url: "/index.php/admin/group/save",
        method: 'post',
        data,
    })
};
//获取文章列表
export const ArticleList = data => {
    return service({
        url: "/index.php/admin/Article/index",
        method: 'get',
        params: data,
    })
};
//编辑文章
export const EditArticle = data => {
    return service({
        url: "/index.php/admin/Article/edit",
        method: 'get',
        params: data,
    })
};
//添加文章
export const AddArticle = data => {
    return service({
        url: "/index.php/admin/Article/add",
        method: 'get',
        params: data,
    })
};
//保存文章
export const SaveArticle = data => {
    return service({
        url: "/index.php/admin/Article/save",
        method: 'post',
        data,
    })
};
//删除文章
export const DeleteArticle = data => {
    return service({
        url: "/index.php/admin/Article/del",
        method: 'post',
        data,
    })
};
//文章分类列表
export const CategoryList = data => {
    return service({
        url: "/index.php/admin/Category/index",
        method: 'get',
        params: data,
    })
};
//新增文章分类
export const CategoryAdd = data => {
    return service({
        url: "/index.php/admin/Category/add",
        method: 'post',
        data,
    })
};
//编辑文章分类
export const CategoryEdit = data => {
    return service({
        url: "/index.php/admin/Category/edit",
        method: 'get',
        params: data,
    })
};
//保存文章分类
export const CategorySave = data => {
    return service({
        url: "/index.php/admin/Category/save",
        method: 'post',
        data,
    })
};
//删除文章分类
export const DeleteCategory = data => {
    return service({
        url: "/index.php/admin/Category/del",
        method: 'post',
        data
    })
};
//个人中心
export const PersonalIndex = data => {
    return service({
        url: "/index.php/admin/Personal/index",
        method: 'get',
        params: data,
    })
};
//修改密码
export const ChangePassword = data => {
    return service({
        url: "/index.php/admin/Personal/changePwd",
        method: 'post',
        data,
    })
};
//退出登录
export const Logout = data => {
    return service({
        url: "/index.php/admin/Login/logout",
        method: 'post',
        data,
    })
};