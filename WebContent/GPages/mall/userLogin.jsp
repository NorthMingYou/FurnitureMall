<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>菜鸟家具用户登录</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/GPages/mall/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/GPages/mall/css/demo.css" />
<!--必要样式-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/GPages/mall/css/component.css" />
<!--[if IE]>
<script src="js/html5.js"></script>
<![endif]-->
</head>
<body>
	<div class="logodiv" onclick="location.href='${pageContext.request.contextPath}/GPages/mall/index.jsp'"></div>
	<div class="logonext">
		<h2>欢迎登录!</h2>
	</div>
	<div class="container demo-1">

		<div class="content">
			<div id="large-header" class="large-header">
				<canvas id="demo-canvas"></canvas>
				<div class="logo_box">
					<h3>账户登录</h3>
					<form action="${pageContext.request.contextPath}/user/login" id="loginForm" method="post" >
						<div class="input_outer">
							<span class="u_user"></span> 
							<input name="phone" id="phone" class="text" autofocus value="" style="color: #FFFFFF !important" type="text" placeholder="请输入账户/手机号">
						</div>
						<div class="input_outer">
							<span class="us_uer"></span> 
							<input name="password" id="password" class="text" value="" style="color: #FFFFFF !important; 
							position: absolute; z-index: 100;" type="password" placeholder="请输入密码" autocomplete='off'>
						</div>
						<div>
							<c:if test="${not empty requestScope.loginTips }">
								<p id="login-tip" style="color:red;">${requestScope.loginTips }</p>
							</c:if>
						</div>
						
						<div class="mb2">
							<button class="act-but submit" id="lodin_submit" style="width:320px;">登录</button>
							<!-- <a class="act-but submit" href="#" onclick="document.getelementbyid('loginForm').submit();" style="color: #FFFFFF">登录</a> -->
						</div>
						<div class="registered">
							<a href="${pageContext.request.contextPath}/GPages/mall/register.jsp">立即注册？</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- /container -->
	<script src="${pageContext.request.contextPath}/GPages/mall/js/demo-1.js"></script>
	<script src="${pageContext.request.contextPath}/GPages/mall/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/GPages/mall/js/myjs.js"></script>
	<div style="text-align: center;">
		<p>
			<a rel="nofollow" target="_blank" href="">关于我们</a>| 
			<a rel="nofollow" target="_blank" href="">联系我们</a>| 
			<a rel="nofollow" target="_blank" href="">广告服务</a>
		</p>
		<p>
			<a href="" target="_blank">Copyright © 2018 菜鸟A队</a>
		</p>
	</div>
	<script type="text/javascript">
		$(function(){
			$("#lodin_submit").click(function(){
				if($("#phone").val()&&$("#password").val()){
					$("#loginForm").submit();
					/* $.ajax({
						url:'${pageContext.request.contextPath}/user/login',
						type:'post',
						data:$('#loginForm').serialize(),
						success:function(data){
							if(data==0){
								alert("用户名或密码错误！");
							}else{
								window.location.href='${pageContext.request.contextPath}/user/toIndex';
							}
						}
					}); */
				}
				else if(!$("#phone").val()){
					alert("账号/手机号不能为空！");
				}
				else if(!$("#password").val()){
					alert("密码不能为空！");
				}
			});
		});
	</script>
</body>
</html>