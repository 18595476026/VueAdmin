import axios from 'axios';
const service = axios.create({
    // baseURL: "http://sso.shuang.zhihuawei.cn/php/public", // api的base_url
    baseURL: "http://www.vueadmin.io", // api的base_url
    // timeout: 5000, //请求超时时间
    headers: {},
    withCredentials: false, // `withCredentials` 表示跨域请求时是否需要使用凭证,默认 false
    responseType: 'json', // `responseType` 表示服务器响应的数据类型，可以是 'arraybuffer', 'blob', 'document', 'json', 'text', 'stream',默认 json
});

// 请求拦截器
service.interceptors.request.use(function (config) {
    // 在发送请求之前做些什么
    if(config.method=='post'){
        config.data = {
            ...config.data,
        }
    }else if(config.method=='get'){
        config.params = {
            ...config.params
        }
    }
    return config;
}, function (error) {
    // 对请求错误做些什么
    return Promise.reject(error);
});

// 响应拦截器
service.interceptors.response.use(function (response) {
    // 对响应数据做点什么
    return response
}, function (error) {
    // 对响应错误做点什么
    return Promise.reject(error);
});

export default service;