<?php


namespace app\admin\controller;


use think\Db;

/**
 * SOO单点登录通知接口
 * Class Administrator
 * @package app\admin\controller
 */
class Inform extends YunAdmin
{
    //通知接口
    public function index(){

    }

    //同步接口
    public function login_status(){
        $act = input('a','');
        $code = input('code','');
        $sign = input('sign','');

        if (!in_array($act, ['login', 'logout'])) {
            $ret = [
                'code' => 0,
                'msg' => 'action error'
            ];
            return json_encode($ret);
        }

        if (empty($sign) || empty($code)) {
            $ret = [
                'code' => 0,
                'msg' => 'no code or no sign'
            ];
            return json_encode($ret);
        }

        $_arr_decrypt = decrypt($code, config('sso.app_key'), config('sso.app_secret'));

        $admin_info = json_decode($_arr_decrypt['decrypt'], true);

        foreach ($admin_info as $k => $v) {
            $admin_info[$k] = base64_decode($v);
        }

        $sign_ret = sign_check($_arr_decrypt['decrypt'], $sign, config('sso.app_key'), config('sso.app_secret'));
        if (!$sign_ret) {
            $ret = [
                'code' => 0,
                'msg' => 'sign error'
            ];
            return json_encode($ret);
        }

        if ($act == 'login') {
            $ret = [
                'code' => 1,
                'data' => $admin_info,
                'msg' => 'login success'
            ];
            return json_encode($ret);
        } elseif ($act == 'logout') {
            $ret = [
                'code' => 1,
                'data' => "",
                'msg' => 'logout success'
            ];
            return json_encode($ret);
        } else {
            $ret = [
                'code' => 0,
                'data' => "",
                'msg' => 'action error'
            ];
            return json_encode($ret);
        }
    }
}