<?php

/**
 * ==============================================
 * Created by SaiJia Technology.
 * Author: ZhiHuaWei <zhihua_wei@foxmail.com>
 * Date: 2019/8/23 16:06
 * Project: YunAdmin
 * Power: 管理员模型
 * Version: 1.0.0
 * ==============================================
 */

namespace app\admin\model;

use think\Model;

/**
 * 管理员模型类
 * Class AdminUser
 * @package app\admin\model
 */
class AdminUser extends Model
{
    /**
     * 管理员所属权限组
     * @return array|null|\PDOStatement|string|Model
     */
    public function group()
    {
        return $this->hasOne('AuthGroup', 'id', 'group_id')->where(['is_delete' => 0])->field('id,title,rules,status');
    }

    /**
     * 验证管理员登陆
     * @param $username
     * @param $password
     * @return array|null|\PDOStatement|string|Model
     */
    public function login($username, $password)
    {
        return $this->where(['username' => $username, 'password' => $password])->find();
    }
}