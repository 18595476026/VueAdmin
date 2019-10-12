<?php

/**
 * ==============================================
 * Created by SaiJia Technology.
 * Author: ZhiHuaWei <zhihua_wei@foxmail.com>
 * Date: 2019/8/25 12:04
 * Project: YunAdmin
 * Power: YunAdmin 上传类控制器
 * Version: 1.0.0
 * ==============================================
 */

namespace app\admin\controller;

use think\App;
use think\Exception;
use think\Image;

/**
 * 上传类
 * Class Uploads
 * @package app\admin\controller
 */
class Uploads extends YunAdmin
{

    /**
     * 头像图片上传
     * @param $name
     * @param $file_path
     * @return array
     */
    public function uploadHeadImg($name, $file_path)
    {
        # 1 根据表单名称获取上传的图片文件
        try {
            $file = request()->file($name);
            if ($file) {
                # 2 将其保存在uploads文件夹下 | 后续如果想要保存在云端也可在此修改
                $file_paths = UPLOAD_PATH . $file_path;
                if (!file_exists($file_paths)) {
                    mkdir($file_paths, 0777, true);
                }
                $info = $file->move($file_paths);
                if ($info) {
                    # 3 保存原始图片文件
                    $img_path = 'uploads/' . $file_path . '/' . $info->getSaveName();
                    $thumb_image = Image::open($img_path);
                    $date_path = 'uploads/' . $file_path . '/thumb/' . date('Ymd');
                    if (!file_exists($date_path)) {
                        mkdir($date_path, 0777, true);
                    }
                    # 4 保存缩略图
                    $thumb_140_path = $date_path . '/140_' . $info->getFilename();
                    $thumb_30_path = $date_path . '/30_' . $info->getFilename();
                    $thumb_image->thumb(140, 140)->save($thumb_140_path);
                    $thumb_image->thumb(30, 30)->save($thumb_30_path);
                    $data['img'] = config('app_host') . $img_path;
                    $data['thumb_140_img'] = config('app_host') . $thumb_140_path;
                    $data['thumb_30_img'] = config('app_host') . $thumb_30_path;
                    # 5 成功结果返回
                    $ret_data = [
                        'code' => 1,
                        'msg' => 'SUCCESS',
                        'data' => $data
                    ];
                    return $ret_data;
                } else {
                    # 6 失败结果返回
                    $ret_data = [
                        'code' => 0,
                        'msg' => $file->getError(),
                        'data' => []
                    ];
                    return $ret_data;
                }
            }
        } catch (Exception $e) {
            $ret_data = [
                'code' => 0,
                'msg' => $e->getMessage(),
                'data' => []
            ];
            return $ret_data;
        }
    }

    /**
     * 文章插图上传
     * @param $name
     * @param $file_path
     * @return array
     */
    public function uploadArticleImg($name, $file_path)
    {
        # 1 根据表单名称获取上传的图片文件
        try {
            $file = request()->file($name);
            if ($file) {
                # 2 将其保存在uploads文件夹下 | 后续如果想要保存在云端也可在此修改
                $file_paths = UPLOAD_PATH . $file_path;
                if (!file_exists($file_paths)) {
                    mkdir($file_paths, 0777, true);
                }
                $info = $file->move($file_paths);
                if ($info) {
                    # 3 保存原始图片文件
                    $img_path = 'uploads/' . $file_path . '/' . $info->getSaveName();
                    $thumb_image = Image::open($img_path);
                    $date_path = 'uploads/' . $file_path . '/thumb/' . date('Ymd');
                    if (!file_exists($date_path)) {
                        mkdir($date_path, 0777, true);
                    }
                    # 4 保存缩略图
                    $thumb_path = $date_path . '/140_' . $info->getFilename();
                    $thumb_image->thumb(140, 140)->save($thumb_path);

                    $data['img'] = config('app_host') . $img_path;
                    $data['thumb_img'] = config('app_host') . $thumb_image;
                    # 5 成功结果返回
                    $ret_data = [
                        'code' => 1,
                        'msg' => 'SUCCESS',
                        'data' => $data
                    ];
                    return $ret_data;
                } else {
                    # 6 失败结果返回
                    $ret_data = [
                        'code' => 0,
                        'msg' => $file->getError(),
                        'data' => []
                    ];
                    return $ret_data;
                }
            }
        } catch (Exception $e) {
            $ret_data = [
                'code' => 0,
                'msg' => $e->getMessage(),
                'data' => []
            ];
            return $ret_data;
        }
    }

    /**
     * 图片上传
     * @param $name
     * @param $file_path
     * @param $width
     * @param $height
     * @return mixed
     */
    public function uploadImg($name, $file_path, $width, $height)
    {
        # 1 根据表单名称获取上传的图片文件
        $file = request()->file($name);
        if ($file) {
            # 2 将其保存在uploads文件夹下 | 后续如果想要保存在云端也可在此修改
            $file_paths = UPLOAD_PATH . $file_path;
            if (!file_exists($file_paths)) {
                mkdir($file_paths, 0777, true);
            }
            $info = $file->move($file_paths);
            if ($info) {
                # 3 保存原始图片文件
                $img_path = 'uploads/' . $file_path . '/' . $info->getSaveName();
                $image = Image::open($img_path);
                $date_path = 'uploads/' . $file_path . '/thumb/' . date('Ymd');
                if (!file_exists($date_path)) {
                    mkdir($date_path, 0777, true);
                }
                # 4 保存缩略图
                $thumb_path = $date_path . '/' . $info->getFilename();
                $image->thumb($width, $height)->save($thumb_path);
                $data['img'] = config('app_host') . $img_path;
                $data['thumb_img'] = config('app_host') . $thumb_path;
                # 5 成功结果返回
                $ret_data = [
                    'code' => 1,
                    'msg' => 'SUCCESS',
                    'data' => $data
                ];
                return $ret_data;
            } else {
                # 6 失败结果返回
                $ret_data = [
                    'code' => 0,
                    'msg' => $file->getError(),
                    'data' => []
                ];
                return $ret_data;
            }
        }
    }
}