<?php

/**
 * ==============================================
 * Created by SaiJia Technology.
 * Author: ZhiHuaWei <zhihua_wei@foxmail.com>
 * Date: 2019/8/23 14:52
 * Project: YunAdmin
 * Power: YunAdmin 首页控制器
 * Version: 1.0.0
 * ==============================================
 */

namespace app\admin\controller;

use think\Db;

/**
 * 控制台类
 * Class Index
 * @package app\admin\controller
 */
class Index extends YunAdmin
{
    /**
     * 控制台
     * @return mixed
     */
    public function index()
    {
        $pageSize = input('get.results')? input('get.results'): 10;
        $pageNum = input('get.page')? input('get.page'): 0;
        $sortField = input('get.sortField')? input('get.sortField'): 'log_id';
        $sortOrder = input('get.sortOrder');
        if (isset($sortOrder) && $sortOrder == 'ascend'){
            $sortOrder = 'ASC';
        }else{
            $sortOrder = 'DESC';
        }
        # 1 查询系统信息
        $mysql = Db::query("select VERSION() as mysql");
        $system_info = [
            'php_version' => PHP_VERSION,
            'mysql_version' => $mysql[0]['mysql'],
            'server_info' => php_uname('s'),
            'php_sapi_name' => php_sapi_name(),
            'server_ip' => GetHostByName($_SERVER['SERVER_NAME']),
        ];
        $data['system_info'] = $system_info;
        # 2 查询日志信息
        if ($this->yun_administrator['admin_uid'] == 1) {
            $log_list = Db::name('admin_operate_log')->order($sortField, $sortOrder)->paginate(['page'=>$pageNum,'list_rows'=>$pageSize]);
        } else {
            $log_list = Db::name('admin_operate_log')->where(['admin_uid' => $this->yun_administrator['admin_uid']])->order($sortField, $sortOrder)->paginate(['page'=>1]);
        }
        $data['log_list'] = $log_list;
        return json_encode($data);
    }

}

