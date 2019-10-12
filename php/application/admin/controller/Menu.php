<?php

/**
 * ==============================================
 * Created by SaiJia Technology.
 * Author: ZhiHuaWei <zhihua_wei@foxmail.com>
 * Date: 2019/8/25 15:29
 * Project: YunAdmin
 * Power: YunAdmin 菜单管理控制器
 * Version: 1.0.0
 * ==============================================
 */

namespace app\admin\controller;

use app\admin\model\AuthRule;
use think\Db;

/**
 * 菜单类
 * Class Menu
 * @package app\admin\controller
 */
class Menu extends YunAdmin
{
    /**
     * 菜单列表
     * @return mixed
     */
    public function index()
    {
        # 1 获得所有操作菜单
        $menu_list_tmp = AuthRule::field('id,pid,title,rule_url,is_link,sort,icon,create_time')->where(['is_delete' => 0])->order('sort', 'ASC')->select()->toArray();
        # 2 处理形成构造树
        $menu_list = $this->getMenuRulesTree($menu_list_tmp);
        return json_encode($menu_list);
    }

    /**
     * 新增菜单
     * @return mixed
     */
    public function add()
    {
        # 1 获得所有操作菜单
        $menu_list_tmp = AuthRule::field('id,pid,title,rule_url,is_link,sort,icon,create_time')->where(['is_delete' => 0])->order('sort', 'ASC')->select()->toArray();
        # 2 处理形成构造树
        $menu_list = $this->getMenuRulesTree($menu_list_tmp);
        $data = [
            'code' => 1,
            'data' => $menu_list,
            'msg' => ""
        ];
        return json_encode($data);
    }

    /**
     * 修改菜单
     * @return mixed
     */
    public function edit()
    {
        $id = input('id', 0);
        if ($id) {
            # 1 获得所有操作菜单
            $menu_list_tmp = AuthRule::field('id,pid,title,rule_url,is_link,sort,icon,create_time')->where(['is_delete' => 0])->order('sort', 'ASC')->select()->toArray();
            # 2 处理形成构造树
            $menu_list = $this->getMenuRulesTree($menu_list_tmp);
            # 3 获得此修改菜单信息
            $menu_info = AuthRule::get(['id' => $id]);

            $data=[
                'code' => 1,
                'data' => [
                    'menu_list' => $menu_list,
                    'menu' => $menu_info
                ],
                'msg' => '请求成功!'
            ];
        } else {
            $data=[
              'code' => 0,
              'data' => '',
              'msg' => '系统异常，请重试！'
            ];
        }
        return json_encode($data);
    }

    /**
     * 保存菜单
     */
    public function save()
    {
        # 1 获得菜单信息
        $rule_info = [
            'title' => input('post.title', ''),
            'pid' => input('post.pid', 0),
            'rule_url' => input('post.rule', ''),
            'icon' => input('post.icon', 'fa fa-caret-right'),
            'sort' => input('post.sort', 0),
            'tips' => input('post.tips', ''),
            'modify_time' => date("Y-m-d H:i:s"),
        ];
        $is_link = input('post.is_link', '');
        if (empty($is_link)) {
            $rule_info['is_link'] = 0;
        } else {
            $rule_info['is_link'] = 1;
        }
        # 2 根据是否有id判断是新增还是修改
        $id = input('post.id', 0);
        if ($id) {
            # 3 修改菜单信息
            $ret = AuthRule::where(['id' => $id])->update($rule_info);
            if ($ret !== false) {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '修改菜单信息成功(菜单操作)');
                $data = [
                    'code' => 1,
                    'data' => "",
                    'msg' => "恭喜您，菜单信息修改成功！",
                ];
            } else {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '修改菜单信息失败(菜单操作)');

                $data = [
                    'code' => 0,
                    'data' => "",
                    'msg' => "菜单信息修改失败，请重试！",
                ];
            }
        } else {
            # 4 新增菜单信息
            $rule_info['create_time'] = $rule_info['modify_time'];
            $ret = Db::name('auth_rule')->insert($rule_info);
            if ($ret !== false) {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '新增菜单信息成功(菜单操作)');

                $data = [
                    'code' => 1,
                    'data' => "",
                    'msg' => "恭喜您，菜单信息新增成功！",
                ];
            } else {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '新增菜单信息失败(菜单操作)');

                $data = [
                    'code' => 0,
                    'data' => "",
                    'msg' => "菜单信息新增失败，请重试！",
                ];
            }
        }
        return json_encode($data);
    }

    /**
     * 删除菜单
     */
    public function del()
    {
        # 1 获取需删除的菜单id
        $id = input('id', 0);
        if ($id) {
            # 2 进行软删除操作
            $menu_del = [
                'is_link' => 0,
                'status' => 0,
                'is_delete' => 1,
                'modify_time' => date("Y-m-d H:i:s"),
            ];
            $ret = AuthRule::where(['id' => $id])->update($menu_del);
            # 3 结果返回
            if ($ret !== false) {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '删除菜单信息成功(菜单操作)');
                $data = [
                    'code'=>1,
                    'data'=>"",
                    'msg' => "恭喜您，菜单信息删除成功！",
                ];
            } else {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '删除菜单信息失败(菜单操作)');
                $data = [
                    'code'=>0,
                    'data'=>"",
                    'msg' => "菜单信息删除失败，请重试！",
                ];
            }
        } else {
            $data = [
                'code'=>0,
                'data'=>"",
                'msg' => "系统异常，请重试！",
            ];
        }
        return json_encode($data);
    }

    public function getMenu(){
        $data = $this -> getCurrentMenu();
        return json_encode($data);
    }
}