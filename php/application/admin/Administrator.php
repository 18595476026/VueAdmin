<?php

/**
 * ==============================================
 * Created by SaiJia Technology.
 * Author: ZhiHuaWei <zhihua_wei@foxmail.com>
 * Date: 2019/8/25 20:24
 * Project: YunAdmin
 * Power: YunAdmin 管理员控制器
 * Version: 1.0.0
 * ==============================================
 */

namespace app\admin\controller;

use app\admin\model\AdminUser;
use app\admin\model\AuthGroup;
use think\Db;

/**
 * 管理员类
 * Class Administrator
 * @package app\admin\controller
 */
class Administrator extends YunAdmin
{
    /**
     * 管理员列表
     * @return mixed
     */
    public function index()
    {
        # 1 获得是否根据关键字查询
        $keyword = input('keyword', '');
        $results = input('results', '');
        $sex_param = input('sex');
        $sortField = input('sortField', '');
        $sortOrder = input('sortOrder', '');
        if ($sortOrder == "ascend"){
            $sortOrder = 'ASC';
        }else{
            $sortOrder = 'DESC';
        }

        $where['is_delete'] = 0;
        if (isset($sex_param)){
            $where['sex'] = $sex_param;
        }

        # 2 获取管理员列表
        if (empty($keyword)) {
            $admin_list = AdminUser::field('admin_uid,group_id,username,status,head_pic,sex,birthday,phone,qq,email,create_time')->where($where)->order($sortField ,$sortOrder)->paginate($results);
        } else {
            $admin_list = AdminUser::field('admin_uid,group_id,username,status,head_pic,sex,birthday,phone,qq,email,create_time')->where($where)->where('username|phone', 'like', "%{$keyword}%")->order($sortField ,$sortOrder)->paginate($results, false, ['query' => request()->param()]);
        }
        $auth_group = Db::name('auth_group')->column('title','id');
        # 3 渲染传值
        $sex = [0 => '保密', 1 => '男', 2 => '女'];

        $data =[
            'code' => 1,
            'data' => [
                'keyword' => $where,
                'sex' => $sex,
                'auth_group' => $auth_group,
                'list' => $admin_list,
            ],
            'msg' => "获取成功!",
        ];
        return json_encode($data);
    }

    /**
     * 新增管理员
     * @return mixed
     */
    public function add()
    {
        # 1 查询出所有的可用权限组
        $group_list = AuthGroup::field('id,title')->where(['is_delete' => 0, 'status' => 1])->select();
        # 2 没有可用权限组禁止新增管理员
        if (empty($group_list)) {
            $data = [
                'code' => 0,
                'data' => "",
                'msg' => "当前无启用的用户组，请调整后用户组信息后再进行添加管理员！",
            ];
        }else{
            $data = [
                'code' => 1,
                'data' => $group_list,
                'msg' => "获取数据成功!",
            ];
        }
        return json_encode($data);
    }

    /**
     * 修改管理员
     * @return mixed
     */
    public function edit()
    {
        $admin_uid = input('uid', 0);
        if ($admin_uid) {
            # 1 获得所有权限组
            $group_list = AuthGroup::field('id,title')->where(['is_delete' => 0])->select();
            # 2 获得此管理员信息
            $admin_info = AdminUser::get(['admin_uid' => $admin_uid]);
            $this->assign('list', $group_list);
            $this->assign('admin', $admin_info);
            $data = [
                'code' => 1,
                'data' => [
                    'group_list' => $group_list,
                    'admin_info' => $admin_info,
                ],
                'msg' => "获取数据成功！",
            ];
        } else {
            $data = [
                'code' => 0,
                'data' => "",
                'msg' => "系统异常，请重试！",
            ];
        }
        return json_encode($data);
    }

    /**
     * 保存管理员
     */
    public function save()
    {
        # 1 获取提交信息 | 进行验证
        $admin_info = [
            'username' => input('post.username', ''),
            'group_id' => input('post.group_id', 0),
            'sex' => input('post.sex', 0),
            'head_pic' => input('post.head_pic', ''),
            'birthday' => input('post.birthday', ''),
            'phone' => input('post.mobile', ''),
            'qq' => input('post.qq', ''),
            'email' => input('post.email', ''),
            'modify_time' => date("Y-m-d H:i:s"),
        ];
        if (empty($admin_info['username']) || $admin_info['group_id'] == 0) {
            $data = [
                'code' => 0,
                'data' => "",
                'msg' => "管理员用户名不能为空！",
            ];
            return json_encode($data);
        }
        $password = input('post.password', '');
        if (!empty($password)) {
            $admin_info['password'] = PWD($password);
        }
        $admin_uid = input('post.admin_uid', 0);

        # 2 判断用户名是否重复
        $check_ret = checkUsernameRepeat($admin_uid, $admin_info['username']);
        if ($check_ret) {
            $data = [
                'code' => 0,
                'data' => "",
                'msg' => "此管理员用户名已存在！",
            ];
            return json_encode($data);
        }

        # 3 处理上传头像
//        $upload_img = new Uploads();
//        $head_img = $upload_img->uploadHeadImg('head_pic', 'head_picture');
//        if ($head_img['code']) {
//            $head_pic = [
//                'head_pic' => $head_img['data']['img'],
//                'head_pic_140_thumb' => $head_img['data']['thumb_140_img'],
//                'head_pic_30_thumb' => $head_img['data']['thumb_30_img']
//            ];
//            $admin_info['head_pic'] = serialize($head_pic);
//        }

        # 4 根据是否有id判断是新增还是修改
        if ($admin_uid) {
            # 5 修改管理员用户信息
            $ret = AdminUser::where(['admin_uid' => $admin_uid])->update($admin_info);
            if ($ret !== false) {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '修改管理员用户信息成功(管理员操作)');
                $data = [
                    'code' => 1,
                    'data' => "",
                    'msg' => "恭喜您，管理员用户信息修改成功！",
                ];
                return json_encode($data);
            } else {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '修改管理员用户信息失败(管理员操作)');
                $data = [
                    'code' => 0,
                    'data' => "",
                    'msg' => "管理员用户信息修改失败，请重试！",
                ];
                return json_encode($data);
            }
        } else {
            # 6 新增管理员信息
            $admin_info['create_time'] = $admin_info['modify_time'];
            $ret = Db::name('admin_user')->insert($admin_info);
            if ($ret !== false) {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '新增管理员用户信息成功(管理员操作)');
                $data = [
                    'code' => 1,
                    'data' => "",
                    'msg' => "恭喜您，管理员用户信息新增成功！",
                ];
                return json_encode($data);
            } else {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '新增管理员用户信息失败(管理员操作)');
                $data = [
                    'code' => 0,
                    'data' => "",
                    'msg' => "管理员用户信息新增失败，请重试！",
                ];
                return json_encode($data);
            }
        }
    }

    /**
     * 删除管理员
     */
    public function del()
    {
        # 1 获得需要删除的管理员id
        $admin_uid = input('uid', 0);
        if ($admin_uid) {
            # 2 进行软删除操作
            $admin_del = [
                'status' => 0,
                'is_delete' => 1,
                'modify_time' => date("Y-m-d H:i:s"),
            ];
            $ret = AdminUser::where(['admin_uid' => $admin_uid])->update($admin_del);
            # 3 结果返回
            if ($ret !== false) {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '删除管理员用户信息成功(管理员操作)');
                $data = [
                    'code'=> 1,
                    'data' => "",
                    'msg' => "恭喜您，管理员用户信息删除成功！",
                ];
            } else {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '删除管理员用户信息失败(管理员操作)');
                $data = [
                    'code'=> 0,
                    'data' => "",
                    'msg' => "管理员用户信息删除失败，请重试！",
                ];
            }
        } else {
            $data = [
                'code'=> 0,
                'data' => "",
                'msg' => "系统异常，请重试！",
            ];
        }
        return json_encode($data);
    }

    /**
     * 锁定管理员
     */
    public function lock()
    {
        # 1 获得需要锁定禁用\解除锁定的管理员id
        $admin_uid = input('uid', 0);
        if ($admin_uid) {

            # 2 进行锁定禁用\解除锁定操作
            $opt = input('opt', 'lock');
            if ($opt == 'lock') {
                $admin_lock['status'] = 0;
                $tips = '锁定禁用';
            } else {
                $admin_lock['status'] = 1;
                $tips = '解除锁定';
            }
            $admin_lock['modify_time'] = date("Y-m-d H:i:s");

            $ret = AdminUser::where(['admin_uid' => $admin_uid])->update($admin_lock);
            # 3 结果返回
            if ($ret !== false) {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], $tips . '管理员用户信息成功(管理员操作)');
                $data = [
                    'code' => 1,
                    'data' => "",
                    'msg' => "恭喜您，管理员用户' . $tips . '成功！",
                ];
            } else {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], $tips . '管理员用户信息失败(管理员操作)');
                $data = [
                    'code' => 0,
                    'data' => "",
                    'msg' => "管理员用户' . $tips . '失败，请重试！",
                ];
            }
        } else {
            $data = [
                'code' => 0,
                'data' => "",
                'msg' => "系统异常，请重试！",
            ];
        }
        return json_encode($data);
    }
}
