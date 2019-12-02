//上传图片之前对图片格式/大小进行判断
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
}