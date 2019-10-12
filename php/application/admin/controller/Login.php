<?php

/**
 * ==============================================
 * Created by SaiJia Technology.
 * Author: ZhiHuaWei <zhihua_wei@foxmail.com>
 * Date: 2019/8/23 15:07
 * Project: YunAdmin
 * Power: YunAdmin 登陆管理控制器
 * Version: 1.0.0
 * ==============================================
 */

namespace app\admin\controller;

use app\admin\model\AdminUser;
use app\admin\model\AuthRule;
use think\Controller;
use think\facade\Config;
use think\facade\Cookie;

/**
 * 登陆类
 * Class Login
 * @package app\admin\controller
 */
class Login extends YunAdmin
{
    /**
     * 登陆页面
     * @return mixed
     */
    public function index()
    {
        # 1 获得cookie标识，判断是否已经登陆
        $authority = Cookie::get('authority');
        if (!empty($authority)) {
            list($identifier, $token) = explode('@#$*', $authority);
            if (ctype_alnum($identifier) && ctype_alnum($token)) {
                $admin_user = AdminUser::get(['identifier' => $identifier, 'token' => $token, 'status' => 1, 'is_delete' => 0]);
                if ($admin_user) {
                    # 2 判断用户组状态
                    if ($admin_user->group->status) {
                        if ($token == $admin_user->token && $admin_user->identifier == PWD($admin_user->uid . md5($admin_user['username'] . $admin_user->salt))) {
                            $this->redirect('admin/Index/index');
                        }
                    } else {
                        $this->error('所属用户组已被禁用，请联系管理员！', url('admin/Login/index'));
                    }
                }
            } else {
                $this->error('您还未进行登陆，请先登陆后再进行操作...', url('admin/Login/index'));
            }
        }
        return $this->fetch();
    }

    /**
     * 登陆操作
     * @return false|string
     * @author: 王爽
     * @date: 2019/9/30
     */
    public function login()
    {
        # 1 获得用户名，密码等信息
        $username = input('post.username');
        $password = input('post.password');
        $remember = input('post.remember');
        $admin_user = AdminUser::get(['username' => $username, 'password' => PWD($password)]);
        if ($admin_user) {
            # 2 进行登陆验证
            if ($admin_user->group->status) {
                $token = PWD(uniqid(rand(), true));
                $salt = getRandomString(10);
                $identifier = PWD($admin_user['admin_uid'] . md5($admin_user['username'] . $salt));
                $authority = $identifier . '@#$*' . $token;

                # 3 将登陆标记写入数据库
                $admin_user->identifier = $identifier;
                $admin_user->token = $token;
                $admin_user->salt = $salt;
                $admin_user->save();

                # 4 判断是否记住
                if ($remember) {
                    Cookie::set('authority', $authority, 3600 * 24 * 365);
                } else {
                    Cookie::set('authority', $authority, 3600);
                }
                $this->yun_administrator = $admin_user;
                //登录中心服务器
                $login_result = sso_user_login($username,$password);
                if ($login_result['rcode'] !== 'y010401'){
                    $data = [
                        'code' => 0,
                        'data' => "",
                        'msg' => $login_result['msg'],
                    ];
                    takeOperateLog($admin_user['admin_uid'], $admin_user['username'], '登陆中心服务器失败(登陆操作)');
                }else{
                    //同步登录
                    $syn = sso_sync_login($login_result);

                    // 对用户信息进行base64_decode解码
                    unset($login_result['rcode']);
                    foreach ($login_result as $k => &$v) {
                        $v = base64_decode($v);
                    }

                    $login_result['urlRows'] = $syn['urlRows'];
                    //用户authority
                    $login_result['authority'] = $authority;
                    $data = [
                        'code' => 1,
                        'data' => $login_result,
                        'msg' => "登录成功",
                    ];
                    takeOperateLog($admin_user['admin_uid'], $admin_user['username'], '登陆成功(登陆操作)');
                }
            } else {
                takeOperateLog($admin_user['admin_uid'], $admin_user['username'], '用户组已被禁用(登陆操作)');
                $data = [
                    'code'  => 0,
                    'data'  => '',
                    'msg' => '所属用户组已被禁用，请联系管理员！'
                ];
            }
        } else {
            takeOperateLog(0, $username, '用户或密码错误(登陆操作)');
            $data = [
                'code'  => 0,
                'data'  => '',
                'msg' => '用户名或密码错误，请稍后再试！'
            ];
        }
        return json_encode($data);
    }

    /**
     * 注销登陆
     * @return false|string
     * @author: 王爽
     * @date: 2019/9/30
     */
    public function logout()
    {
        $arr_userSso['user_id'] = input('user_id',0);
        $arr_userSso['user_name'] = input('user_name',"");
        $arr_userSso['user_access_token'] = input('user_access_token',"");

        //同步登出
        $syn = sso_sync_logout($arr_userSso);
        if (!empty($syn['urlRows'])){
            # 将cookie标识删除
            Cookie::delete('authority');
            takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '注销登陆(登陆操作)');
            $data = [
                'code' => 1,
                'data' => $syn['urlRows'],
                'msg' => "恭喜您，退出退出成功！"
            ];
        }else{
            $data = [
                'code' => 0,
                'data' => "",
                'msg' => "抱歉，退出退出失败！"
            ];
        }
        return json_encode($data);
    }
}