<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>header</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${pageContext.request.contextPath}/GPages/admin/style/adminStyle.css" rel="stylesheet" type="text/css" />
<script src="js/jquery.js"></script>
<script type="text/javascript">
	//加载该头部信息的时候
</script>
</head>
<body>
<div class="header">
 <div class="logo">
  <img src="${pageContext.request.contextPath}/GPages/admin/img/admin_logo.png" title="后台页面"/>
 </div>
 <div class="fr top-link">
  <a href="${pageContext.request.contextPath}/GPages/mall/index.jsp" target="_blank" title="访问站点"><i class="shopLinkIcon"></i><span>首页</span></a>
  <%-- <a href="${pageContext.request.contextPath}/GPages/admin/admin_list.html" target="mainCont" title="DeathGhost"><i class="adminIcon"></i><span>欢迎你！李老头~</span></a> --%>
  <!-- <a href="${pageContext.request.contextPath}/GPages/admin/revise_password.html" target="mainCont" title="修改密码"><i class="revisepwdIcon"></i><span>修改密码</span></a>  -->
  <a href="javascript:;" onclick="logout(this)" title="退出" ><i class="quitIcon"></i><span>退出</span></a>
 </div>
</div>
</body>
</html>
<script>
	function logout(obj){
		this.parent.location.href="${pageContext.request.contextPath}/logout";
	}

</script>