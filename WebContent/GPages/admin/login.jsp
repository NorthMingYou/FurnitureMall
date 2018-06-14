<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<title>管理员登录</title>
		<link rel="icon" href="cainiao_favicon.ico" mce_href="${pageContext.request.contextPath}/GPages/admin/cainiao_favicon.ico" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/GPages/admin/css/basic.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/GPages/admin/css/index.css"/>

		<script type="text/javascript" src="${pageContext.request.contextPath}/GPages/admin/js/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/GPages/admin/js/index.js"></script>
	</head>
		
	<body>
		<div class="login-container">
			<img src="${pageContext.request.contextPath}/GPages/admin/img/bg.jpg"/>
			<!--登录窗体-->
			<div class="login-box">
				<form action="${pageContext.request.contextPath}/login" id="login-form" method="post">
				<div class="login-title input-item">
					<h1>管理员登录</h1>
				</div>
				<div class="login-adminname input-item">
					<input onclick="heightLightBorder(this)" onblur="resetBorder(this)" type="text" name="adminname" id="adminname" placeholder="管理员账号" />
				</div>
				<div class="login-password input-item">
					<input onclick="heightLightBorder(this)" onblur="resetBorder(this)" type="password" name="password" id="password" placeholder="管理员密码" />
				</div>
				<div class="login-forget ">
					<a id="forget" class="input-submit" href="forget-password.html">忘记密码</a>
				</div>
				<div class="login-submit input-item">
					<a id="login-btn" class="input-submit" href="javascript:;">登录</a>
				</div>
				</form>	
				<div class="login-tip input-item">
					<!-- 登录信息提示 -->
					<c:if test="${not empty requestScope.msg }">
						<p id="login-tip">${requestScope.msg }</p>
					</c:if>
					<p id="login-tip"></p>
				</div>
				
			</div>
		</div>
		<div class="info-copyright">
			<p>Design by A TEAM OF CAINIAO 菜鸟家具商城</p>
			<p>Copyright &copy; 菜鸟A队 2018</p>
		</div>
	</body>

</html>