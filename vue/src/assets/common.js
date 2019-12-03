import { notification } from "ant-design-vue";
import { Http } from "vue-resource";

/**
 * jsonp跨域请求
 * @param urlRows
 * @constructor
 */
export function Inform(urlRows){
    var url_num = urlRows.length;
    for(let i = 0; i< url_num; i++) {
        console.log(urlRows[i]);
        Http.jsonp(urlRows[i],{jsonp:'callback'}).then(function (res) {});
    }
}

/**
 * 弹出提醒框
 * @param type
 * @param message
 * @param description
 */
export function openNotificationWithIcon (type,message,description) {
    notification[type]({
        message: message,
        description: description,
    });
}

/**
 * 判断当前时间
 * @returns {string}
 */
export function timeFix() {
    const time = new Date()
    const hour = time.getHours()
    return hour < 9 ? '早上好' : (hour <= 11 ? '上午好' : (hour <= 13 ? '中午好' : (hour < 20 ? '下午好' : '晚上好')))
}

/**
 * 验证邮箱
 * @param {*} s
 */
export function isEmail (s) {
    return /^([a-zA-Z0-9._-])+@([a-zA-Z0-9_-])+((.[a-zA-Z0-9_-]{2,3}){1,2})$/.test(s)
}

/**
 * 验证手机号码
 * @param {*} s
 */
export function isMobile (s) {
    return /^1[0-9]{10}$/.test(s)
}

/**
 * 验证电话号码
 * @param {*} s
 */
export function isPhone (s) {
    return /^([0-9]{3,4}-)?[0-9]{7,8}$/.test(s)
}

/**
 * 验证URL地址
 * @param {*} s
 */
export function isURL (s) {
    return /^http[s]?:\/\/.*/.test(s)
}


function getBase64(img, callback) {
    const reader = new FileReader();
    reader.addEventListener('load', () => callback(reader.result));
    reader.readAsDataURL(img)
}

/**
 * 上传图片之前对图片格式/大小进行判断
 * @param file
 * @returns {*|boolean}
 */
export const  beforeUpload = file => {
    const file_type = ['image/jpeg','image/jpg','image/png'];
    const isJPG = file.type;
    const is_exist = file_type.indexOf(isJPG);
    if (is_exist == -1) {
        this.$message.error('You can only upload JPG file!')
    }
    const isLt2M = file.size / 1024 / 1024 < 2;
    if (!isLt2M) {
        this.$message.error('Image must smaller than 2MB!')
    }
    return isJPG && isLt2M
};

/**
 * 上传文件改变时的状态
 * @param info
 */
export const handleChange = info => {
    if (info.file.status === 'uploading') {
        this.loading = true;
        return
    }
    if (info.file.status === 'done') {
        this.head_pic = info.file.response.thumbUrl;
        getBase64(info.file.originFileObj, (imageUrl) => {
            this.imageUrl = imageUrl;
            this.loading = false;
        })
    } else if (info.file.status === 'error') {
        this.$message.error("上传失败", 2);
    }
};
