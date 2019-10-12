/**
 * ==============================================
 * Created by SaiJia Technology.
 * Author: ZhiHuaWei <zhihua_wei@foxmail.com>
 * Date: 2019/8/24 13:07
 * Project: YunAdmin后台管理系统
 * Version: 1.0.0
 * Power: group.js
 * ==========================================
 */

$(function() {

	$(".children").click(function() {
		$(this).parent().parent().parent().find(".father").prop("checked", true);
	})
	$(".father").click(function() {
		if(this.checked) {
			$(this).parent().parent().parent().find(".children").prop("checked", true);
		} else {
			$(this).parent().parent().parent().find(".children").prop("checked", false);
		}
	})

});

//表单提交验证
var Script = function() {

	'use strict';

	$.validator.setDefaults({
		submitHandler: function(form) {
			form.submit();
		}
	});

	$().ready(function() {
		$("#authGroupAddForm").validate({
			rules: {
				title: {
					required: true,
				},
			},
			messages: {
				title: "角色名不能为空！",
			}
		});
	});

	$().ready(function() {
		$("#authGroupEditForm").validate({
			rules: {
				title: {
					required: true,
				},
			},
			messages: {
				title: "角色名不能为空！",
			}
		});
	});

}();