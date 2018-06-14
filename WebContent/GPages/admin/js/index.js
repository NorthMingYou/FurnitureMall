
$(function () {
	// body...

	//登录事件检测
	$("#login-btn").click(function (argument) {
		var $name = $("#adminname");
		var $password = $("#password");

		if(!checkAdminName($name)){
			return false;
		}

		if(!checkAdminPassword($password)){
			return false;
		}
		//让表单提交
		$("#login-form").submit();
		return true;
	});
});


// 用户名检测
function checkAdminName(obj) {

	//首先判断值空
	if(obj.val().trim() == ""){
		$("#login-tip").html("管理员账号不能为空！");
		return false;
	}
	return true;
}

function checkAdminPassword(obj) {

	//首先判断值空
	if(obj.val() == ""){

	    $("#login-tip").html("管理员密码不能为空！");
		return false;
	}
	return true;
}

//高亮边框
function heightLightBorder(obj) {
	obj.style.border = "1px solid #478fca";
	obj.style.boxShadow = "0px 0px 5px #478fca";
}
//恢复边框
function resetBorder(obj) {
	obj.style.border = "1px solid #ddd";
	obj.style.boxShadow = "";

}