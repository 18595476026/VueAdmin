<?php

/**
 * ==============================================
 * Created by SaiJia Technology.
 * Author: ZhiHuaWei <zhihua_wei@foxmail.com>
 * Date: 2019/8/25 9:40
 * Project: YunAdmin
 * Power: YunAdmin 个人中心管理控制器
 * Version: 1.0.0
 * ==============================================
 */
namespace app\admin\controller;

use think\Db;
use think\Exception;
use think\facade\Request;
use think\Image;

/**
 * 个人中心类
 * Class Personal
 * @package app\admin\controller
 */
class Personal extends YunAdmin
{
    /**
     * 个人资料
     * @return mixed
     */
    public function index()
    {
        if (Request::isPost()) {
            # 1 获取提交信息
            $personal_info = [
                'head_pic' => input('post.head_pic', ''),
                'sex' => input('post.sex', 0),
                'birthday' => input('post.birthday', ''),
                'phone' => input('post.mobile', ''),
                'qq' => input('post.qq', ''),
                'email' => input('post.email', ''),
            ];
            # 2 进行头像图片上传
//            $upload_img = new Uploads();
//            $head_img = $upload_img->uploadHeadImg('head_pic', 'head_picture');
//            if ($head_img['code']) {
//                $head_pic = [
//                    'head_pic' => $head_img['data']['img'],
//                    'head_pic_140_thumb' => $head_img['data']['thumb_140_img'],
//                    'head_pic_30_thumb' => $head_img['data']['thumb_30_img']
//                ];
//                $personal_info['head_pic'] = serialize($head_pic);
//            }
            # 3 更新个人资料信息，并记入操作日志
            $ret = Db::name('admin_user')->where(['admin_uid' => $this->yun_administrator['admin_uid']])->update($personal_info);
            if ($ret !== false) {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '修改个人信息成功(修改信息)');
                $data = [
                    'code' => 1,
                    'data' => "",
                    'msg' => "恭喜您，个人资料信息修改成功！"
                ];
            } else {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '修改个人信息失败(修改信息)');
                $data = [
                    'code' => 0,
                    'data' => "",
                    'msg' => "个人资料信息修改失败，请重试！"
                ];
            }
        } else {
            $data = [
                'code' => 0,
                'data' => "",
                'msg' => "修改失败!!!"
            ];
        }
        return json_encode($data);
    }

    /**
     * 修改密码
     * @return mixed
     */
    public function changePwd()
    {
        if (Request::isPost()) {
            # 1 获得密码信息
            $old_pwd = PWD(input('post.oldpwd', ''));
            $new_pwd = PWD(input('post.password', ''));
            $confirm_password = PWD(input('post.confirm_password'));
            # 2 进行验证判断
            if ($new_pwd === $confirm_password) {
                if ($old_pwd === $this->yun_administrator->password) {
                    $ret = Db::name('admin_user')->where(['admin_uid' => $this->yun_administrator['admin_uid']])->update(['password' => $new_pwd, 'token' => '', 'identifier' => '']);
                    # 3 更新密码，记录日志，返回结果
                    if ($ret !== false) {
                        takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '修改登陆密码成功(修改密码)');
                        $data = [
                            'code' => 1,
                            'data' => "",
                            'msg' => "恭喜您，登陆密码修改成功，请使用新密码重新登陆！"
                        ];
                    } else {
                        takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '修改登陆密码失败(修改密码)');
                        $data = [
                            'code' => 0,
                            'data' => "",
                            'msg' => "登陆密码修改失败，请重试！"
                        ];
                    }
                } else {
                    takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '修改登陆密码失败2(修改密码)');
                    $data = [
                        'code' => 0,
                        'data' => "",
                        'msg' => "您的旧密码输入错误，请重新输入！"
                    ];
                }
            } else {
                takeOperateLog($this->yun_administrator['admin_uid'], $this->yun_administrator['username'], '修改登陆密码失败1(修改密码)');
                $data = [
                    'code' => 0,
                    'data' => "",
                    'msg' => "您的确认密码和新密码不一致，请重新输入！"
                ];
            }
        } else {
            $data = [
                'code' => 0,
                'data' => "",
                'msg' => "修改失败!"
            ];
        }
        return json_encode($data);
    }
}