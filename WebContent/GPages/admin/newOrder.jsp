<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${pageContext.request.contextPath}/GPages/admin/style/adminStyle.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/GPages/admin/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/GPages/admin/js/public.js"></script>

</head>
<body>
 <div class="wrap">
  <div class="page-title">
    <span class="modular fl"><i class="order"></i><em>最新订单列表</em></span>
  </div>
  <table class="list-style Interlaced">
   <tr>
    <th>订单编号</th>
    <th>下单时间</th>
    <th>收件人</th>
    <th>联系电话</th>
    <th>收货地址</th>
    <th>金额</th>
    <th>订单状态</th>
    <th>订单详情</th>
   </tr>
   <tr align="center">
    <td>
     <a href="${pageContext.request.contextPath}/GPages/admin/order_detail.html">2015041803225</a>
    </td>
    <td class="center">
     <span class="block">2015-04-18 12:00</span>
    </td>
    <td class="center">
     <span class="block">老李头</span>
    </td>
    <td class="center">
     <span class="block">17876253527</span>
    </td>
    <td width="420">
     <address>陕西省西安市未央区255号</address>
    </td>
    <td class="center">
     <span><i>￥</i><b>58.00</b></span>
    </td>
    <td class="center">
     <span id="colors">待收货</span>
    </td>
    <td class="center">
     <a href="${pageContext.request.contextPath}/GPages/admin/order_detail.html" class="inline-block" title="查看订单"><img src="${pageContext.request.contextPath}/GPages/admin/images/icon_view.gif"/></a>
    </td>
   </tr>
  </table>
  <!-- BatchOperation -->
  <div style="overflow:hidden;">
	  <!-- turn page -->
	  <div class="turnPage center fr">
	   <a>第一页</a>
	   <a>1</a>
	   <a>最后一页</a>
	  </div>
  </div>
 </div>
</body>
</html>