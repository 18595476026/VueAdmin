<?php

/**
 * ==============================================
 * Created by SaiJia Technology.
 * Author: ZhiHuaWei <zhihua_wei@foxmail.com>
 * Date: 2019/8/26 17:33
 * Project: YunAdmin
 * Power: YunAdmin 文章管理控制器
 * Version: 1.0.0
 * ==============================================
 */

namespace app\admin\controller;

use think\Db;

class Article extends YunAdmin {
    public function index()
    {
        $results = input('get.results', 10);
        $sortField = input('get.sortField', "a.article_id");
        $sortOrder = input('get.sortOrder', "a.ascend");
        if ($sortOrder == "ascend") {
            $sortOrder = "ASC";
        } else {
            $sortOrder = "DESC";
        }
        $art_list = Db::name('article')->alias('a')->join('category b','a.category_id = b.category_id')->field('a.article_id,a.category_id,b.category_name,a.article_title,a.keywords,a.article_desc,a.create_time,a.modify_time')->where(['a.is_delete' => 0])->order($sortField, $sortOrder)->paginate($results);
        $data = [
            'code' => 1,
            'data' => $art_list,
            'msg'  => "获取数据成功!"
        ];
        return json_encode($data);
    }

    public function add()
    {
        $category_list_tmp = Db::name('category')->where(['is_delete' => 0])->order('sort', 'ASC')->select();

        # 2 处理形成构造树
        $cate_list = $this->getMenuRulesTree($category_list_tmp,'category_id','category_pid');
        if (empty($cate_list)) {
            $data = [
                'code' => 0,
                'data' => "",
                'msg'  => "当前无文章类别信息，请调整后文章分类后再进行添加文章！",
            ];
        } else {
            $data = [
                'code' => 1,
                'data' => $cate_list,
                'msg'  => "获取文章分类成功!!!",
            ];
        }

        return json_encode($data);
    }

    public function edit()
    {
        $article_id = input('get.article_id', 0);
        //获取文章分类
        $category_list_tmp = Db::name('category')->where(['is_delete' => 0])->order('sort', 'ASC')->select();
        # 2 处理形成构造树
        $cate_list = $this->getMenuRulesTree($category_list_tmp,'category_id','category_pid');
        if (empty($cate_list)) {
            $data = [
                'code' => 0,
                'data' => [
                    'article'   => "",
                    'cate_list' => "",
                ],
                'msg'  => '当前无文章类别信息，请调整后文章分类后再进行编辑文章！',
            ];
        } else {
            //获取文章
            $article = Db::name('article')->field('article_id,category_id,article_title,keywords,article_desc,article_pic,content,create_time,modify_time')->where(['article_id' => $article_id])->find();
            if (empty($article)) {
                $data = [
                    'code' => 0,
                    'data' => [
                        'article'   => "",
                        'cate_list' => $cate_list,
                    ],
                    'msg'  => '文章不存在!!!',
                ];
            } else {
                $data = [
                    'code' => 1,
                    'data' => [
                        'article'   => $article,
                        'cate_list' => $cate_list,
                    ],
                    'msg'  => '获取数据成功',
                ];
            }
        }
        return json_encode($data);
    }

    public function save()
    {
        # 1 获得文章信息
        $article_info = [
            'category_id'   => input('post.category_id', 0),
            'article_title' => input('post.article_title', ''),
            'keywords'      => input('post.keywords', ''),
            'article_desc'  => input('post.article_desc', ''),
            'article_pic'  => input('post.article_pic', ''),
            'content'       => input('post.content', ''),
            'modify_time'   => date("Y-m-d H:i:s"),
        ];

        # 2 处理上传图片
//        $upload_img = new Uploads();
//        $article_img = $upload_img->uploadArticleImg('article_pic', 'article_picture');
//        if ($article_img['code']) {
//            $article_info['article_pic'] = $article_img['data']['img'];
//            $article_info['thumb_pic'] = $article_img['data']['thumb_img'];
//        }

        # 3 根据是否有id判断是新增还是修改
        $id = input('post.article_id', 0);
        if ($id) {
            # 4 修改文章信息
            $ret = Db::name('article')->where(['article_id' => $id])->update($article_info);
            if ($ret !== false) {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '修改文章信息成功(文章操作)');
                $data = [
                    'code' => 1,
                    'data' => "",
                    'msg' => '恭喜您，文章信息修改成功！',
                ];
            } else {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '修改文章信息失败(文章操作)');
                $data = [
                    'code' => 0,
                    'data' => "",
                    'msg' => '文章信息修改失败，请重试！',
                ];
            }
        } else {
            # 5 新增文章分类信息
            $article_info['create_time'] = $article_info['modify_time'];
            $ret = Db::name('article')->insert($article_info);
            if ($ret !== false) {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '新增文章信息成功(文章操作)');
                $data = [
                    'code' => 1,
                    'data' => "",
                    'msg' => '恭喜您，文章信息新增成功！',
                ];
            } else {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '新增文章信息失败(文章操作)');
                $data = [
                    'code' => 0,
                    'data' => "",
                    'msg' => '文章信息新增失败，请重试！',
                ];
            }
        }
        return json_encode($data);
    }

    public function del()
    {
        # 1 获取需删除的菜单id
        $id = input('article_id', 0);
        if ($id) {
            # 2 进行软删除操作
            $article_del = [
                'is_show' => 0,
                'is_delete' => 1,
                'modify_time' => date("Y-m-d H:i:s"),
            ];
            $ret = Db::name('article')->where(['article_id' => $id])->update($article_del);
            # 3 结果返回
            if ($ret !== false) {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '删除文章成功(内容管理操作)');
                $data = [
                    'code'=>1,
                    'data'=>"",
                    'msg' => "恭喜您，文章删除成功！",
                ];
            } else {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '删除文章失败(内容管理操作)');
                $data = [
                    'code'=>0,
                    'data'=>"",
                    'msg' => "文章删除失败，请重试！",
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
}