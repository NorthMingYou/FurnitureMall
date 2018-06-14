<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>左侧导航</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${pageContext.request.contextPath}/GPages/admin/style/adminStyle.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/GPages/admin/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/GPages/admin/js/public.js"></script>
</head>
<body style="background:#313131">
<div class="menu-list">
 <a href="${pageContext.request.contextPath}/GPages/admin/main.jsp" target="mainCont" class="block menu-list-title center" style="border:none;margin-bottom:8px;color:#fff;">菜鸟家具</a>
 <ul>
  <li class="menu-list-title">
   <span>订单管理</span>
   <i>◢</i>
  </li>
  <li>
   <ul class="menu-children">
    <li><a href="${pageContext.request.contextPath}/orderList" title="订单列表" target="mainCont">全部订单</a></li>
    <li><a href="${pageContext.request.contextPath}/newOrderList" title="最新订单" target="mainCont">最新订单</a></li>
    <li><a href="${pageContext.request.contextPath}/noPayList" title="最新订单" target="mainCont">未支付订单</a></li>
    <li><a href="${pageContext.request.contextPath}/isSendList" title="最新订单" target="mainCont">已发货订单</a></li>
    <li><a href="${pageContext.request.contextPath}/waitRecList" title="最新订单" target="mainCont">待收货订单</a></li>
    <li><a href="${pageContext.request.contextPath}/isRecList" title="最新订单" target="mainCont">已签收订单</a></li>
   </ul>
  </li>
 
  <li class="menu-list-title">
   <span>商品管理</span>
   <i>◢</i>
  </li>
  <li>
   <ul class="menu-children">
    <li><a href="${pageContext.request.contextPath}/productList" title="商品列表" target="mainCont">商品列表</a></li>
   </ul>
   <ul class="menu-children">
    <li><a href="${pageContext.request.contextPath}/productDrop" title="商品下架" target="mainCont">商品下架</a></li>
   </ul>
   <ul class="menu-children">
    <li><a href="${pageContext.request.contextPath}/productUp" title="商品上架" target="mainCont">商品上架</a></li>
   </ul>
  </li>
  
  <li class="menu-list-title">
   <span>售后处理</span>
   <i>◢</i>
  </li>
  <li>
   <ul class="menu-children">
    <li><a href="${pageContext.request.contextPath}/quitGoods" title="退货申请" target="mainCont">退货申请</a></li>
   </ul>
  </li>
 </ul>
</div>

</body>
</html>