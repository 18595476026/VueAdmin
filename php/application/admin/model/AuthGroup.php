<?php

/**
 * ==============================================
 * Created by SaiJia Technology.
 * Author: ZhiHuaWei <zhihua_wei@foxmail.com>
 * Date: 2019/8/23 16:26
 * Project: YunAdmin
 * Power:
 * Version: 1.0.0
 * ==============================================
 */

namespace app\admin\model;

use think\Model;

class AuthGroup extends Model
{
    public function admins()
    {
        return $this->hasMany('AdminUser', 'group_id', 'id')->field('admin_uid,username')->where(['is_delete' => 0]);
    }
}