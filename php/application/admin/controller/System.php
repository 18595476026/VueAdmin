<?php

/**
 * ==============================================
 * Created by SaiJia Technology.
 * Author: ZhiHuaWei <zhihua_wei@foxmail.com>
 * Date: 2019/8/26 16:47
 * Project: YunAdmin
 * Power: YunAdmin 系统管理控制器
 * Version: 1.0.0
 * ==============================================
 */

namespace app\admin\controller;

use think\Db;

class System extends YunAdmin
{
    public function config()
    {
        return $this->fetch();
    }

    public function version()
    {
        $version_list = Db::name('version_log')->order('id', 'DESC')->select();
        $this->assign('list', $version_list);
        return $this->fetch();
    }
}