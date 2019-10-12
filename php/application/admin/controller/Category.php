<?php

/**
 * ==============================================
 * Created by SaiJia Technology.
 * Author: ZhiHuaWei <zhihua_wei@foxmail.com>
 * Date: 2019/8/26 17:40
 * Project: YunAdmin
 * Power: YunAdmin 文章类别控制器
 * Version: 1.0.0
 * ==============================================
 */

namespace app\admin\controller;

use think\Db;

/**
 * 文章类别类
 * Class Category
 * @package app\admin\controller
 */
class Category extends YunAdmin
{
    /**
     * 分类管理
     * @return false|string
     * @author: 王爽
     * @date: 2019/9/27
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $results = input('get.results', 10);
        $sortField = input('get.sortField', "sort");
        $sortOrder = input('get.sortOrder', "ascend");
        if ($sortOrder == "ascend") {
            $sortOrder = "ASC";
        } else {
            $sortOrder = "DESC";
        }
        # 1 获得所有操作菜单
        $category_list_tmp = Db::name('category')->where(['is_delete' => 0])->order('sort', 'ASC')->paginate($results)->toArray();

        # 2 处理形成构造树
        $category_list_tmp['data'] = $this->getMenuRulesTree($category_list_tmp['data'],'category_id','category_pid');
        return json_encode($category_list_tmp);
    }

    /**
     * 新增分类
     * @return mixed
     */
    public function add()
    {
        $category_list_tmp = Db::name('category')->where(['is_delete' => 0])->order('sort', 'ASC')->select();
        # 2 处理形成构造树
        $category_tree = $this->getMenuRulesTree($category_list_tmp,'category_id','category_pid');
        $data = [
            'code' => 1,
            'data' => $category_tree,
            'msg' => "获取数据成功!!!",
        ];
        return json_encode($data);
    }

    /**
     * 修改分类
     * @return false|string
     * @author: 王爽
     * @date: 2019/9/27
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function edit()
    {
        $id = input('id', 0);
        if ($id) {
            $category_info = Db::name('category')->where(['category_id' => $id])->find();
            $category_list_tmp = Db::name('category')->where(['is_delete' => 0])->order('sort', 'ASC')->select();
            # 2 处理形成构造树
            $category_tree = $this->getMenuRulesTree($category_list_tmp,'category_id','category_pid');

            $data = [
                'code' => 1,
                'data' => [
                    'category_info' =>$category_info,
                    'category_tree' =>$category_tree
                ],
                'msg' => "获取数据成功!!!",
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
     * 保存分类
     */
    public function save()
    {
        # 1 获得提交分类信息
        $category_info = [
            'category_name' => input('post.category_name', ''),
            'category_pid' => input('post.category_pid', 0),
            'keywords' => input('post.keywords', ''),
            'sort' => input('post.sort', 0),
            'category_desc' => input('post.category_desc', ''),
            'modify_time' => date("Y-m-d H:i:s"),
        ];

        # 2 根据是否有id判断是新增还是修改
        $id = input('post.id', 0);
        if ($id) {
            # 3 修改文章分类信息
            $ret = Db::name('category')->where(['category_id' => $id])->update($category_info);
            if ($ret !== false) {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '修改文章类别信息成功(文章类别操作)');
                $data = [
                    'code' => 1,
                    'data' => "",
                    'msg' => "恭喜您，文章分类信息修改成功！",
                ];
            } else {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '修改文章类别信息失败(文章类别操作)');
                $data = [
                    'code' => 0,
                    'data' => "",
                    'msg' => "文章分类信息修改失败，请重试！",
                ];
            }
        } else {
            # 4 新增文章分类信息
            $category_info['create_time'] = $category_info['modify_time'];
            $ret = Db::name('category')->insert($category_info);
            if ($ret !== false) {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '新增文章类别信息成功(文章类别操作)');
                $data = [
                    'code' => 1,
                    'data' => "",
                    'msg' => "恭喜您，文章分类信息新增成功！",
                ];
            } else {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '新增文章类别信息失败(文章类别操作)');
                $data = [
                    'code' => 0,
                    'data' => "",
                    'msg' => "文章分类信息新增失败，请重试！",
                ];
            }
        }
        return json_encode($data);
    }

    /**
     * 删除分类
     */
    public function del()
    {
        # 1 获取需删除的类别id
        $id = input('id', 0);
        if ($id) {
            # 2 进行软删除操作
            $category_del = [
                'is_delete' => 1,
                'modify_time' => date("Y-m-d H:i:s"),
            ];
            $ret = Db::name('category')->where(['category_id' => $id])->update($category_del);
            # 3 结果返回
            if ($ret !== false) {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '删除文章分类信息成功(文章类别操作)');
                $data = [
                    'code' => 0,
                    'data' => "",
                    'msg' => "恭喜您，文章分类信息删除成功！",
                ];
            } else {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '删除文章分类信息失败(文章类别操作)');
                $data = [
                    'code' => 0,
                    'data' => "",
                    'msg' => "文章分类信息删除失败，请重试！",
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