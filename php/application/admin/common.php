<?php

/**
 * ==============================================
 * Created by SaiJia Technology.
 * Author: ZhiHuaWei <zhihua_wei@foxmail.com>
 * Date: 2019/8/23 14:39
 * Project: YunAdmin
 * Power: YunAdmin应用公共文件
 * Version: 1.0.0
 * ==============================================
 */

use app\admin\model\AdminUser;
use think\Db;

/**
 * 记录后台操作日志
 * @param int $admin_uid
 * @param string $username
 * @param string $log_note
 */
function takeOperateLog($admin_uid = 0, $username = '', $log_note = '')
{
    $log = [
        'admin_uid' => $admin_uid,
        'username' => $username,
        'create_time' => time(),
        'ip' => getClientServerIp(),
        'log_note' => $log_note,
    ];
    Db::name('admin_operate_log')->insert($log);
}

/**
 * 密码加密
 * @param $password
 * @return string
 */
function PWD($password)
{
    return md5(crypt('Y' . $password . 'W', 'Yun'));
}

/**
 * 获得随机字符串
 * @param int $length 长度
 * @param string $type 类型
 * @param int $convert 转换大小写
 * @return string 随机字符串
 */
function getRandomString($length = 6, $type = 'string', $convert = 0)
{
    $config = array('number' => '1234567890', 'letter' => 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', 'string' => 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ23456789', 'all' => 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890');

    if (!isset($config[$type]))
        $type = 'string';
    $string = $config[$type];

    $code = '';
    $str_len = strlen($string) - 1;
    for ($i = 0; $i < $length; $i++) {
        $code .= $string{mt_rand(0, $str_len)};
    }
    if (!empty($convert)) {
        $code = ($convert > 0) ? strtoupper($code) : strtolower($code);
    }
    return $code;
}

/**
 * 检查管理员用户名是否重复
 * @param int $admin_uid
 * @param $username
 * @return bool
 */
function checkUsernameRepeat($admin_uid = 0, $username)
{
    if ($admin_uid) {
        $check = Db::name('admin_user')->field('admin_uid,username')->where("admin_uid != {$admin_uid} AND username = '{$username}' AND is_delete = 0")->find();
    } else {
        $check = AdminUser::get(['username' => $username, 'is_delete' => 0]);
    }
    if (empty($check)) {
        return false;
    } else {
        return true;
    }
}


function mSubStr($str, $start = 0, $length, $charset = "utf-8", $suffix = true)
{
    if (function_exists("mb_substr")) {
        if ($suffix)
            return mb_substr($str, $start, $length, $charset) . "...";
        else
            return mb_substr($str, $start, $length, $charset);
    } elseif (function_exists('iconv_substr')) {
        if ($suffix)
            return iconv_substr($str, $start, $length, $charset) . "...";
        else
            return iconv_substr($str, $start, $length, $charset);
    }
    $re['utf-8'] = "/[x01-x7f]|[xc2-xdf][x80-xbf]|[xe0-xef]
                  [x80-xbf]{2}|[xf0-xff][x80-xbf]{3}/";
    $re['gb2312'] = "/[x01-x7f]|[xb0-xf7][xa0-xfe]/";
    $re['gbk'] = "/[x01-x7f]|[x81-xfe][x40-xfe]/";
    $re['big5'] = "/[x01-x7f]|[x81-xfe]([x40-x7e]|xa1-xfe])/";
    preg_match_all($re[$charset], $str, $match);
    $slice = join("", array_slice($match[0], $start, $length));
    if ($suffix) return $slice . "…";
    return $slice;
}

/**
 * SSO 单点登录
 * @param $str_userName
 * @param $str_userPass
 * @return array|void
 * @author: 王爽
 * @date: 2019/9/23
 */
function sso_user_login($str_userName, $str_userPass)
{
    $_arr_crypt = array(
        'user_name' => $str_userName,
        'user_pass' => md5($str_userPass),
        'user_ip' => fn_getIp(),
    );

    $_str_crypt = fn_jsonEncode($_arr_crypt, true);

    $_arr_encrypt = encrypt($_str_crypt, config('sso.app_key'), config('sso.app_secret'));
    if ($_arr_encrypt['rcode'] != 'ok') {
        return $_arr_encrypt;
    }

    $_arr_sso = array(
        'a' => 'login',
        'code' => $_arr_encrypt['decrypt'],
    );

    $_arr_ssoData = array_merge(config('sso.arr_data'), $_arr_sso);
    $_str_crypt = json_decode($_str_crypt, true);
    $_arr_ssoData['sign'] = sign_make($_str_crypt, config('sso.app_key'), config('sso.app_secret'));

    $_arr_get = fn_http(config('sso.api_url') . '?m=user&c=api', $_arr_ssoData, 'post'); //提交

    $_arr_result = result_process($_arr_get);

    if ($_arr_result['rcode'] != 'y010401') {
        return $_arr_result; //返回错误信息
    }

    $_arr_decode = sso_decode($_arr_result['code'], $_arr_result['sign']); //解码

    $_arr_decode['rcode'] = $_arr_result['rcode'];

    return $_arr_decode;
}

/**
 * 同步登录
 * sso_sync_login function.
 *
 * @access public
 * @param mixed $num_userId
 * @return void
 */
function sso_sync_login($_arr_userSubmit = array())
{
    $_arr_crypt = array(
        'user_id' => base64_decode($_arr_userSubmit['user_id']),
        'user_access_token' => md5(base64_decode($_arr_userSubmit['user_access_token'])),
    );

    $_str_crypt = fn_jsonEncode($_arr_crypt, true);

    $_arr_encrypt = encrypt($_str_crypt, config('sso.app_key'), config('sso.app_secret'));
    if ($_arr_encrypt['rcode'] != 'ok') {
        return $_arr_encrypt;
    }

    $_arr_sso = array(
        'a' => 'login',
        'code' => $_arr_encrypt['decrypt'],
    );

    $_arr_ssoData = array_merge(config('sso.arr_data'), $_arr_sso);
    $_arr_ssoData['sign'] = sign_make($_str_crypt, config('sso.app_key'), config('sso.app_secret'));

    $_arr_get = fn_http(config('sso.api_url') . '?m=sync&c=api', $_arr_ssoData, 'post'); //提交

    $_arr_result = result_process($_arr_get);

    if (isset($_arr_result['urlRows']) && !fn_isEmpty($_arr_result['urlRows'])) {
        foreach ($_arr_result['urlRows'] as $_key => $_value) {
            $_arr_result['urlRows'][$_key] = fn_htmlcode(urldecode($_value), 'decode', 'url');
        }
    }

    return $_arr_result;
}

/**
 * 同步登出
 * @param array $_arr_userSubmit
 * @return array|void
 */
function sso_sync_logout($_arr_userSubmit = array())
{
    $_arr_crypt = array(
        'user_id' => $_arr_userSubmit['user_id'],
        'user_access_token' => md5($_arr_userSubmit['user_access_token']),
    );

    $_str_crypt = fn_jsonEncode($_arr_crypt, true);

    $_arr_encrypt = encrypt($_str_crypt, config('sso.app_key'), config('sso.app_secret'));
    if ($_arr_encrypt['rcode'] != 'ok') {
        return $_arr_encrypt;
    }

    $_arr_sso = array(
        'a' => 'logout',
        'code' => $_arr_encrypt['decrypt'],
    );

    $_arr_ssoData = array_merge(config('sso.arr_data'), $_arr_sso);
    $_arr_ssoData['sign'] = sign_make($_str_crypt, config('sso.app_key'), config('sso.app_secret'));

    $_arr_get = fn_http(config('sso.api_url') . '?m=sync&c=api', $_arr_ssoData, 'post'); //提交

    $_arr_result = result_process($_arr_get);

    if (isset($_arr_result['urlRows']) && !fn_isEmpty($_arr_result['urlRows'])) {
        foreach ($_arr_result['urlRows'] as $_key => $_value) {
            $_arr_result['urlRows'][$_key] = fn_htmlcode(urldecode($_value), 'decode', 'url');
        }
    }

    return $_arr_result;
}

/**
 * 获取 IP
 * fn_getIp function.
 *
 * @access public
 * @return void
 */
function fn_getIp() {
    $_str_ip = '0.0.0.0';
    /*
    if (isset($_SERVER)) {
        if (fn_isEmpty(fn_server('REMOTE_ADDR'))) {
            $_str_ip = '0.0.0.0';
        } else {
            $_str_ip = fn_server('REMOTE_ADDR');
        }
    } else {
        if (fn_isEmpty(getenv('REMOTE_ADDR'))) {
            $_str_ip = '0.0.0.0';
        } else {
            $_str_ip = getenv('REMOTE_ADDR');
        }
    }*/
    return $_str_ip;
}

/**
 * JSON 编码（内容可编码成 base64）
 * fn_jsonEncode function.
 *
 * @access public
 * @param string $arr_json (default: '')
 * @param string $method (default: '')
 * @return void
 */
function fn_jsonEncode($arr_json = '', $encode = false) {
    if ($encode) {
        $_str_encode = 'encode';
    }

    if (fn_isEmpty($arr_json)) {
        $str_json = '';
    } else {
        @$arr_json = fn_eachArray($arr_json, $_str_encode);
        //print_r($method);
        $str_json = json_encode($arr_json); //json编码
    }

    return $str_json;
}

/**
 * JSON 解码 (内容可解码自 base64)
 * jsonDecode function.
 *
 * @access public
 * @param string $str_json (default: '')
 * @param string $method (default: '')
 * @return void
 */
function fn_jsonDecode($str_json = '', $decode = false) {
    if ($decode) {
        $_str_decode = 'decode';
    }
    if (fn_isEmpty($str_json)) {
        $arr_json = array();
    } else {
        $arr_json = json_decode($str_json, true); //json解码
        $arr_json = fn_eachArray($arr_json, $_str_decode);
    }

    return $arr_json;
}

/**
 * 判断是否为空
 * @param $data
 * @return bool
 * @author: 王爽
 * @date: 2019/9/23
 */
function fn_isEmpty($data) {
    if (!isset($data)) {
        return true;
    }
    if ($data === null) {
        return true;
    }
    if (is_array($data) || is_object($data)) {
        if (empty($data)) {
            return true;
        }
    } else {
        if (empty($data) || trim($data) === '') {
            return true;
        }
    }

    return false;
}

/**
 * 生成签名
 * @param $str_json
 * @param $key_appKey
 * @param $key_appSecret
 * @return string
 * @author: 王爽
 * @date: 2019/9/23
 */
function sign_make($str_json, $key_appKey, $key_appSecret) {

    if(is_array($str_json)){
        $_str_signSrc = json_encode($str_json);
    }else{
        $_str_signSrc = $str_json;
    }

    if (get_magic_quotes_gpc()){
        $_str_signSrc = stripslashes($_str_signSrc);
    }

    return strtoupper(md5($key_appKey . $_str_signSrc . $key_appSecret));
}

/**
 * 验证签名
 * @param $str_json
 * @param $str_sign
 * @param $key_appKey
 * @param $key_appSecret
 * @return bool
 * @author: 王爽
 * @date: 2019/9/23
 */
function sign_check($str_json, $str_sign, $key_appKey, $key_appSecret) {

    $_str_signChk = sign_make($str_json, $key_appKey, $key_appSecret);

    if ($_str_signChk == $str_sign) {
        return true;
    } else {
        return false;
    }
}

/**
 * http 请求函数
 * fn_http function.
 *
 * @access public
 * @param mixed $str_url
 * @param mixed $arr_data
 * @param string $str_method (default: 'get')
 * @return void
 */
function fn_http($str_url, $arr_data=null, $str_method = 'get') {

    $_obj_http = curl_init();
    $_str_data = !empty($arr_data) ? http_build_query($arr_data) : "";

    $_arr_headers = array(
        'Content-Type: application/x-www-form-urlencoded',
        //'Content-length: ' . strlen($_str_data),
    );

    curl_setopt($_obj_http, CURLOPT_HTTPHEADER, $_arr_headers);

    if ($str_method == 'post') {
        curl_setopt($_obj_http, CURLOPT_POST, true);
        curl_setopt($_obj_http, CURLOPT_POSTFIELDS, $_str_data);
        curl_setopt($_obj_http, CURLOPT_URL, $str_url);
    } else {
        if (stristr($str_url, '?')) {
            $_str_conn = '&';
        } else {
            $_str_conn = '?';
        }
        if (!empty($_str_data)){
            curl_setopt($_obj_http, CURLOPT_URL, $str_url . $_str_conn . $_str_data);
        }else{
            curl_setopt($_obj_http, CURLOPT_URL, $str_url);
        }

    }

    curl_setopt($_obj_http, CURLOPT_RETURNTRANSFER, true);

    $_obj_ret = curl_exec($_obj_http);

    $_arr_return = array(
        'ret'   => $_obj_ret,
        'error' => curl_error($_obj_http),
        'errno' => curl_errno($_obj_http),
    );

    curl_close($_obj_http);

    return $_arr_return;
}

/**
 * 加工处理请求结果
 * @param $arr_get
 * @return array|mixed
 * @author: 王爽
 * @date: 2019/9/23
 */
function result_process($arr_get)
{
    if (!isset($arr_get['ret'])) {
        $_arr_result = array(
            'rcode' => 'x030208'
        );
        return $_arr_result;
    }

    $_arr_result = json_decode($arr_get['ret'], true);

    if (!isset($_arr_result['rcode'])) {
        $_arr_result = array(
            'rcode' => 'x030209'
        );
        return $_arr_result;
    }

    if (!isset($_arr_result['prd_sso_pub'])) {
        $_arr_result = array(
            'rcode' => 'x030210'
        );
        return $_arr_result;
    }

    if ($_arr_result['prd_sso_pub'] < 20180224) {
        $_arr_result = array(
            'rcode' => 'x030211'
        );
        return $_arr_result;
    }

    return $_arr_result;
}

/**
 * 加密
 * @param $string
 * @param $key_appKey
 * @param $key_appSecret
 * @return array
 * @author: 王爽
 * @date: 2019/9/23
 */
function encrypt($string, $key_appKey, $key_appSecret) {
    if (strlen($key_appSecret) != 16) {
        return array(
            'rcode' => 'x030308',
        );
    }

    $_str_encrypt   = openssl_encrypt($string, 'AES-128-CBC', $key_appKey, 1, $key_appSecret);

    $_str_encrypt   = base64_encode($_str_encrypt);

    $_str_encrypt   = str_ireplace('=', '|', $_str_encrypt);
    $_str_encrypt   = str_ireplace('/', '@', $_str_encrypt);
    $_str_encrypt   = str_ireplace('+', '_', $_str_encrypt);

    return array(
        'rcode'     => 'ok',
        'decrypt'   => $_str_encrypt,
    );
}

/**
 * 解密
 * @param $string
 * @param $key_appKey
 * @param $key_appSecret
 * @return array
 * @author: 王爽
 * @date: 2019/9/23
 */
function decrypt($string, $key_appKey, $key_appSecret) {
    if (strlen($key_appSecret) != 16) {
        return array(
            'rcode' => 'x030308',
        );
    }

    $string         = str_ireplace('|', '=', $string);
    $string         = str_ireplace('@', '/', $string);
    $string         = str_ireplace('_', '+', $string);
    $string         = base64_decode($string);

    $_str_decrypt   = openssl_decrypt($string, 'AES-128-CBC', $key_appKey, 1, $key_appSecret);

    return array(
        'rcode'     => 'ok',
        'decrypt'   => $_str_decrypt,
    );
}

/**
 * 解码
 * sso_decode function.
 *
 * @access public
 * @return void
 */
function sso_decode($str_code, $str_sign)
{
    //解码
    $_arr_decrypt = decrypt($str_code, config('sso.app_key'), config('sso.app_secret'));
    if ($_arr_decrypt['rcode'] != 'ok') {
        return $_arr_decrypt;
    }

    //var_dump($_arr_decrypt);
    //var_dump($str_sign);
    //exit;

    //验证签名
    if (!sign_check($_arr_decrypt['decrypt'], $str_sign, config('sso.app_key'), config('sso.app_secret'))) {
        return array(
            'rcode' => 'x050403',
        );
    }

    return fn_jsonDecode($_arr_decrypt['decrypt'], true);
}

/**
 * 遍历数组，并进行 base64 解码编码
 * fn_eachArray function.
 *
 * @access public
 * @param mixed $arr
 * @param string $method (default: 'encode')
 * @return void
 */
function fn_eachArray($arr, $method = 'encode') {

    $_is_magic = get_magic_quotes_gpc();

    if (fn_isEmpty($arr)) {
        $arr = array();
    } else {
        foreach ($arr as $_key=>$_value) {
            if (fn_isEmpty($_value)) {
                switch ($method) {
                    case 'encode':
                        if (!$_is_magic) {
                            $_str = addslashes($_value);
                        } else {
                            $_str = $_value;
                        }
                        $arr[$_key] = base64_encode($_str);
                        break;

                    case 'decode':
                        $_str = base64_decode($_value);
                        $arr[$_key] = stripslashes($_str);
                        break;

                    default:
                        if (!$_is_magic) {
                            $_str = addslashes($_value);
                        } else {
                            $_str = $_value;
                        }
                        $arr[$_key] = $_str;
                        break;
                }
            } else {
                @$arr[$_key] = fn_eachArray($_value, $method);
            }
        }
    }
    return $arr;
}

/**
 * 转换字符串中的特殊字符
 * @param $str_html
 * @param string $method
 * @param bool $spec
 * @return mixed|string
 * @author: 王爽
 * @date: 2019/9/23
 */
function fn_htmlcode($str_html, $method = 'encode', $spec = false) {
    switch ($method) {
        case 'decode':
            $str_html = html_entity_decode($str_html, ENT_QUOTES, 'UTF-8');

            switch ($spec) {
                case 'json': //转换 json 特殊字符
                    $str_html = str_ireplace('&#58;', ':', $str_html);
                    $str_html = str_ireplace('&#91;', '[', $str_html);
                    $str_html = str_ireplace('&#93;', ']', $str_html);
                    $str_html = str_ireplace('&#123;', '{', $str_html);
                    $str_html = str_ireplace('&#125;', '}', $str_html);
                    $str_html = str_ireplace('|', ',', $str_html);
                    break;
                case 'url': //转换 加密 特殊字符
                    $str_html = str_ireplace('&#58;', ':', $str_html);
                    $str_html = str_ireplace('&#45;', '-', $str_html);
                    $str_html = str_ireplace('&#61;', '=', $str_html);
                    $str_html = str_ireplace('&#63;', '?', $str_html);
                    break;
                case 'crypt': //转换 加密 特殊字符
                    $str_html = str_ireplace('&#37;', '%', $str_html);
                    break;
                case 'base64': //转换 base64 特殊字符
                    $str_html = str_ireplace('&#61;', '=', $str_html);
                    break;
            }
            break;
        default:
            $str_html = htmlentities($str_html, ENT_QUOTES, 'UTF-8');
            break;
    }

    return $str_html;
}