<?php

/**
 * ==============================================
 * Created by SaiJia Technology.
 * Author: ZhiHuaWei <zhihua_wei@foxmail.com>
 * Date: 2019/8/26 11:33
 * Project: YunAdmin
 * Power: YunAdmin 权限组管理控制器
 * Version: 1.0.0
 * ==============================================
 */

namespace app\admin\controller;

use app\admin\model\AuthGroup;
use app\admin\model\AuthRule;
use think\Db;

/**
 * 权限组类
 * Class Administrator
 * @package app\admin\controller
 */
class Group extends YunAdmin
{
    /**
     * 角色权限组管理
     * @return mixed
     */
    public function index()
    {
        $pagination = input('results',10);
        $sortField = input('sortField',"id");
        $sortOrder = input('sortOrder',"ascend");
        if ($sortOrder == "ascend"){
            $sortOrder = "ASC";
        }else{
            $sortOrder = "DESC";
        }
        $group_list = AuthGroup::field('id,title,status,note,create_time')->where(['is_delete' => 0])->order($sortField,$sortOrder)->paginate($pagination);
        foreach ($group_list as $k => $item) {
            $group_list[$k]['counts'] = $item->admins->count();
        }
        $data = [
            'code' => 1,
            'data' => $group_list,
            'msg' => "获取数据成功!"
        ];
        return json_encode($data);
    }

    /**
     * 新增角色权限组
     * @return mixed
     */
    public function add()
    {
        $auth_rules_list = AuthRule::field('id,pid,rule_url,title')->where(['is_delete' => 0])->order('sort', 'ASC')->select()->toArray();
        $rule_list = $this->getMenuRulesTree($auth_rules_list);
        $data = [
            'code' => 1,
            'data' => $rule_list,
            'msg' =>"数据获取成功!"
        ];

        return json_encode($data);
    }

    /**
     * 修改角色权限组
     * @return mixed
     */
    public function edit()
    {
        $id = input('id', 0);
        if ($id) {
            # 1 获得所有操作规则
            $auth_rules_list = AuthRule::field('id,pid,rule_url,title')->where(['is_delete' => 0])->order('sort', 'ASC')->select()->toArray();
            # 2 处理形成构造树
            $rule_list = $this->getMenuRulesTree($auth_rules_list);
            # 3 获得此角色权限组信息
            $group_info = AuthGroup::get(['id' => $id]);
            $group_info['rules'] = explode(',', $group_info['rules']);

            $data = [
                'code' => 1,
                'data' => [
                    'rule_list'=>$rule_list,
                    'group' => $group_info,
                ],
                'msg' => "获取数据成功!",
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
     * 保存角色权限组
     */
    public function save()
    {
        # 1 获取提交信息 | 进行验证
        $group_info = [
            'title' => input('post.title', ''),
            'note' => input('post.note', ''),
            'modify_time' => date("Y-m-d H:i:s"),
        ];
        $rules_tmp = input('post.rules', '');
        if (empty($rules_tmp)) {
            $this->error("请选中此权限组的权限!");
        } else {
            $group_info['rules'] = implode(',', $rules_tmp);
        }
        $status = input('post.status', '');
        if (empty($status)) {
            $group_info['status'] = 0;
        } else {
            $group_info['status'] = 1;
        }

        # 2 根据是否有id判断是新增还是修改
        $id = input('post.id', 0);
        if ($id) {
            # 3 修改权限组信息
            $ret = AuthGroup::where(['id' => $id])->update($group_info);
            if ($ret !== false) {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '修改角色权限组成功(角色操作)');
                $data = [
                    'code' => 1,
                    'data' => "",
                    'msg' => "恭喜您，角色权限组修改成功！"
                ];
            } else {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '修改角色权限组失败(角色操作)');
                $this->error('');
                $data = [
                    'code' => 0,
                    'data' => "",
                    'msg' => "角色权限组修改失败，请重试！"
                ];
            }
        } else {
            # 4 新增权限组信息
            $group_info['create_time'] = $group_info['modify_time'];
            $ret = Db::name('auth_group')->insert($group_info);
            if ($ret !== false) {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '新增角色权限组成功(角色操作)');
                $data = [
                    'code' => 1,
                    'data' => "",
                    'msg' => "恭喜您，角色权限组新增成功！"
                ];
            } else {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '新增角色权限组失败(角色操作)');
                $data = [
                    'code' => 0,
                    'data' => "",
                    'msg' => "角色权限组新增失败，请重试！"
                ];
            }
        }
        return json_encode($data);
    }

    /**
     * 删除角色权限组
     */
    public function del()
    {
        # 1 获取需删除的权限组id
        $id = input('id', 0);
        if ($id) {

            # 2 判断此权限组下是否还有管理员用户
            $is_have_admin = AuthGroup::where(['id' => $id])->find()->admins()->count();
            if ($is_have_admin) {
                $this->error('此角色权限组下存在管理员用户，暂不允许删除！');
            }

            # 3 进行软删除操作
            $group_del = [
                'status' => 0,
                'is_delete' => 1,
                'modify_time' => date("Y-m-d H:i:s"),
            ];
            $ret = AuthGroup::where(['id' => $id])->update($group_del);
            # 4 结果返回
            if ($ret !== false) {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '删除角色权限组成功(角色操作)');
                $data = [
                    'code' => 1,
                    'data' => "",
                    'msg' => '恭喜您，角色权限组删除成功！',
                ];
            } else {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '删除角色权限组失败(角色操作)');
                $data = [
                    'code' => 0,
                    'data' => "",
                    'msg' => '角色权限组删除失败，请重试！',
                ];
            }
        } else {
            $data = [
                'code' => 0,
                'data' => "",
                'msg' => '系统异常，请重试！',
            ];
        }
        return json_encode($data);
    }

    /**
     * 锁定\解除锁定角色权限组
     */
    public function lock()
    {
        # 1 获取需锁定禁用\解除锁定的权限组id
        $id = input('id', 0);
        if ($id) {
            # 2 进行锁定禁用\解除锁定操作
            $opt = input('opt', 'lock');
            if ($opt == 'lock') {
                $group_lock['status'] = 0;
                $tips = '锁定禁用';
            } else {
                $group_lock['status'] = 1;
                $tips = '解除锁定';
            }
            $group_lock['modify_time'] = date("Y-m-d H:i:s");
            $ret = AuthGroup::where(['id' => $id])->update($group_lock);
            # 3 结果返回
            if ($ret !== false) {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], $tips . '角色权限组成功(角色操作)');
                $data = [
                    'code' => 1,
                    'data' => "",
                    'msg' => "恭喜您，角色权限组" . $tips . "成功！",
                ];
            } else {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], $tips . '角色权限组失败(角色操作)');
                $data = [
                    'code' => 0,
                    'data' => "",
                    'msg' => "角色权限组" . $tips . "失败，请重试！",
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