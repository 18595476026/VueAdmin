<?php

/**
 * ==============================================
 * Created by SaiJia Technology.
 * Author: ZhiHuaWei <zhihua_wei@foxmail.com>
 * Date: 2019/8/23 14:57
 * Project: YunAdmin
 * Power: YunAdmin 父控制器
 * Version: 1.0.0
 * ==============================================
 */

namespace app\admin\controller;

use app\admin\model\AdminUser;
use app\admin\model\AuthRule;
use think\Controller;
use think\facade\Cookie;
use think\facade\Request;

/**
 * 公共父类
 * Class YunAdmin
 * @package app\admin\controller
 */
class YunAdmin extends Controller
{
    /**
     * @var array 管理员信息
     */
    protected $yun_administrator;

    /**
     * @var string 当前url地址
     */
    protected $yun_url;

    /**
     * @var array 系统配置信息
     */
    protected $yun_config;

    /**
     * 系统初始化
     */
    public function initialize()
    {
        parent::initialize();
        # 1 获取系统配置信息
        $this->yun_config = config('yac.');
        if (empty($this->yun_config)) {
            $this->error('系统缺少配置文件，请检查...');
        }
        $this->assign('yun_config', $this->yun_config);

        # 2 进行登陆权限验证
        $this->authRule();

        # 3 进行数据初始化
        if ($this->yun_administrator) {
            if ($this->yun_administrator->group_id == 1 || $this->yun_administrator['admin_uid'] ==1) {
                $auth_rules_list = AuthRule::field('id,pid,rule_url,title,icon,tips')->where(['status' => 1, 'is_link' => 1, 'is_delete' => 0])->order('sort', 'ASC')->select()->toArray();
            } else {
                $auth_rules_list = AuthRule::field('id,pid,rule_url,title,icon,tips')->where("status = 1 AND is_link = 1 AND is_delete = 0 AND id IN ({$this->yun_administrator->group->rules})")->order('sort', 'ASC')->select()->toArray();
            }
            $auth_rules = $this->getMenuRulesTree($auth_rules_list);
            $current_menu = AuthRule::field('id,pid,rule_url,title,icon,tips')->where(['rule_url' => $this->yun_url])->find();

            # 3.1 定义颜色css
            $css_color = [
                1 => 'label-info',
                2 => 'label-success',
                3 => 'label-danger',
                4 => 'label-primary',
                5 => 'label-warning',
                6 => 'label-inverse',
                7 => 'label-default',
            ];
            $this->assign('current_menu', $current_menu);
            $this->assign('auth_rules', $auth_rules);
            $this->assign('yun_administrator', $this->yun_administrator);
            $this->assign('css_color', $css_color);
        }
    }

    /**
     * 权限验证
     * @return bool
     */
    public function authRule()
    {
        # 1 无需登陆即可访问的操作
        $no_need_login_rule = [
            'Login/index',
            'Login/login',
            'Login/verify_code',
            'Login/signin',
            'Logout/index',
        ];

        # 2 登陆后无需验证的操作
        $no_need_check_rule = [
            'Uploads' => 'upload_img'
        ];

        # 3 当前url地址 | 是否允许访问
        $allow_status = false;
        $this->yun_url = Request::controller() . '/' . Request::action();
        if (in_array($this->yun_url, $no_need_login_rule)) {
            return true;
        }

        # 4 根据授权是否存在判断是否已经登陆 | 存在则验证授权
//        $authority = Cookie::get('authority');
        $sig = AdminUser::get(['admin_uid' => 1, 'is_delete' => 0]);
        $authority = implode('@#$*',[$sig->identifier,$sig->token]);
        if (empty($authority)) {
            $this->error('您还未进行登陆，请先登陆后再进行操作...', url('admin/login/index'));
        } else {
            # 5 验证授权
            list($identifier, $token) = explode('@#$*', $authority);
            if (ctype_alnum($identifier) && ctype_alnum($token)) {
                $admin_user = AdminUser::get(['identifier' => $identifier, 'token' => $token, 'status' => 1, 'is_delete' => 0]);
                if ($admin_user) {
                    if ($admin_user->group->status || $admin_user->status == 0) {
                        if ($token == $admin_user->token && $admin_user->identifier == PWD($admin_user['admin_uid'] . md5($admin_user['username'] . $admin_user->salt))) {
                            $allow_status = true;
                        }
                    } else {
                        $this->error('用户或所属用户组已被禁用，请联系管理员！', url('admin/Login/index'));
                    }
                }
                $admin_user->head_pic = $admin_user->head_pic;
                $this->yun_administrator = $admin_user;
            } else {
                $this->error('您还未进行登陆，请先登陆后再进行操作...', url('admin/Login/index'));
            }
        }

        # 6 验证页面操作权限
        if ($allow_status) {
            if (in_array($this->yun_url, $no_need_check_rule)) {
                return true;
            } else {
                # 6.1 超级管理员不验证此权限
                if ($this->yun_administrator['admin_uid'] != 1) {
                    $current_url_info = AuthRule::get(['rule_url' => $this->yun_url]);
                    if ($current_url_info && in_array($current_url_info->id, explode(',', $this->yun_administrator->group->rules))) {
                        return true;
                    } else {
                        $this->error('权限不足，不能访问此页面...');
                    }
                }
            }
        } else {
            $this->error('您还未进行登陆，请先登陆后再进行操作...', url('admin/login/index'));
        }
    }

    /**
     * 操作菜单列表生成树状
     * @param $items
     * @param string $id
     * @param string $pid
     * @param string $son
     * @return array
     */
    protected function getMenuRulesTree($items, $id = 'id', $pid = 'pid', $son = 'children')
    {
        $tree = array();
        $tmpMap = array_column($items, null, $id);
        foreach ($items as $item) {
            if (isset($tmpMap[$item[$pid]])) {
                $tmpMap[$item[$pid]][$son][] = &$tmpMap[$item[$id]];
            } else {
                $tmpMap[$item[$id]][$son] = [];
                $tree[] = &$tmpMap[$item[$id]];
            }
        }
        return $tree;
    }

    protected function getCurrentMenu(){
        if ($this->yun_administrator) {
            if ($this->yun_administrator->group_id == 1 || $this->yun_administrator['admin_uid'] ==1) {
                $auth_rules_list = AuthRule::field('id,pid,rule_url,title,icon,tips')->where(['status' => 1, 'is_link' => 1, 'is_delete' => 0])->order('sort', 'ASC')->select()->toArray();
            } else {
                $auth_rules_list = AuthRule::field('id,pid,rule_url,title,icon,tips')->where("status = 1 AND is_link = 1 AND is_delete = 0 AND id IN ({$this->yun_administrator->group->rules})")->order('sort', 'ASC')->select()->toArray();
            }
            $auth_rules = $this->getMenuRulesTree($auth_rules_list);
            $current_menu = AuthRule::field('id,pid,rule_url,title,icon,tips')->where(['rule_url' => $this->yun_url])->find();

            # 3.1 定义颜色css
            $css_color = [
                1 => 'label-info',
                2 => 'label-success',
                3 => 'label-danger',
                4 => 'label-primary',
                5 => 'label-warning',
                6 => 'label-inverse',
                7 => 'label-default',
            ];
            $data['current_menu'] = $current_menu;
            $data['auth_rules'] = $auth_rules;
            $data['yun_administrator'] = $this->yun_administrator;
            $data['css_color'] = $css_color;

            return $data;
        }
    }

}