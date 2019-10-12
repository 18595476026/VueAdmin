<?php

/**
 * ==============================================
 * Created by SaiJia Technology.
 * Author: ZhiHuaWei <zhihua_wei@foxmail.com>
 * Date: 2019/8/23 15:17
 * Project: YunAdmin
 * Power: YunAdmin 操作规则模型
 * Version: 1.0.0
 * ==============================================
 */

namespace app\admin\model;

use think\Model;

class AuthRule extends Model
{

    /**
     * 找出操作父级
     * @return \think\model\relation\HasOne
     */
    public function father()
    {
        # 构建 一对一 关系
        return $this->hasOne('AuthRule', 'id', 'pid');
    }
}