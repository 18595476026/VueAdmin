<?php

/**
 * ==============================================
 * Created by SaiJia Technology.
 * Author: ZhiHuaWei <zhihua_wei@foxmail.com>
 * Date: 2019/8/27 8:40
 * Project: YunAdmin
 * Power: 文章模型
 * Version: 1.0.0
 * ==============================================
 */

namespace app\admin\model;

use think\Model;

/**
 * 文章模型类
 * Class Article
 * @package app\admin\model
 */
class Article extends Model
{
    public function category()
    {
        return $this->hasOne('Category','category_id','category_id');
    }
}