<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>菜鸟商城后台系统</title>
<link rel="icon" href="${pageContext.request.contextPath}/GPages/admin/cainiao_favicon.ico" mce_href="${pageContext.request.contextPath}/GPages/admin/cainiao_favicon.ico" type="image/x-icon" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

</head>
<frameset rows="76,*" framespacing="0" border="0">
  <frame src="${pageContext.request.contextPath}/GPages/admin/top.jsp" frameborder="no" scrolling="no">
  <frameset cols="180, 10, *" framespacing="0" border="0" id="frame-body">
    <frame src="${pageContext.request.contextPath}/g-menu" frameborder="no" scrolling="yes">
    <frame src="${pageContext.request.contextPath}/GPages/admin/bar.html" frameborder="no" scrolling="no">
    <!-- 加载main主页框架 -->
    <frame src="${pageContext.request.contextPath}/g-main" name="mainCont" frameborder="no" scrolling="yes">
  </frameset>
</frameset><noframes></noframes>
</html>

