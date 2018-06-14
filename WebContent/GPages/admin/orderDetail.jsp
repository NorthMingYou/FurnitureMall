<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<title>订单详情</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${pageContext.request.contextPath}/GPages/admin/style/adminStyle.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/GPages/admin/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/GPages/admin/js/public.js"></script>
</head>
<body>
 <div class="wrap">
  <div class="page-title">
    <span class="modular fl"><i class="order"></i><em>订单编号：${details.orderid}</em></span>
  </div>
  <dl class="orderDetail">
   <dt class="order-h">订单详情</dt>
   <dd>
    <ul>
     <li>
      <span class="h-cont h-right">用户名：</span>
      <span class="h-cont h-left">${details.user.username}</span>
     </li>
     <li>
      <span class="h-cont h-right">收件人：</span>
      <span class="h-cont h-left">${details.receiptPeople}</span>
     </li>
     <li>
      <span class="h-cont h-right">联系电话：</span>
      <span class="h-cont h-left">${details.receiptTel}</span>
     </li>
     <li>
      <span class="h-cont h-right">联系地址：</span>
      <span class="h-cont h-left">${details.receiptaddress}</span>
     </li>
     <li>
      <span class="h-cont h-right">订单状态：</span>
      <span id="colors" class="h-cont h-left">
      	<c:choose>  
		    <c:when test="${details.state == '1'}">待发货</c:when>  
		    <c:when test="${details.state == '0'}">未支付</c:when>  
		    <c:when test="${details.state == '2'}">已发货</c:when>  
		    <c:when test="${details.state == '3'}">已签收</c:when>  
		</c:choose> 
      </span>
     </li>
     <li>
      <span class="h-cont h-right">下单时间：</span>
      <span class="h-cont h-left">${details.buydate}</span>
     </li>
     
    </ul>
   </dd>
   <dd>
    <table class="list-style">
     <tr>
      <th>家具图片</th>
      <th>家具名称</th>
      <th>单价</th>
      <th>数量</th>
      <th>小计</th>
     </tr>
     <c:forEach items= '${details.orderDetails}'  var="orderDetail">   
	     <tr align="center">
	      <td width="250"><img src="${pageContext.request.contextPath}/GPages/furniture_images/${orderDetail.furniture.fpic1}" width="248px" /></td>
	      <td width="350">${orderDetail.furniture.fname}</td>
	      <td><span><i>￥</i><em>${orderDetail.furniture.fprice}</em></span></td>
	      <td>${orderDetail.quantity}</td>
	      <td><span><i>￥</i><em>${orderDetail.allmoney}</em></span></td>
	     </tr>
     </c:forEach> 
     <tr>
      <td colspan="5">
       <div class="fr">
        <span style="font-size:40px;font-weight:bold;"><i style="color:red;">订单共计金额：￥</i><b>${details.totalprice}</b></span>
       </div>
      </td>
     </tr>
    </table>
   </dd>
   <dd>
      <c:if test="${details.state == '1'}">
		  <div class="BatchOperation" align="right">
		   <!-- <input type="button" value="发货" class="btnStyle"/> -->
		   <a class="btnStyle" href="${pageContext.request.contextPath}/sendGood?orderId=${details.orderid}">发货</a>
		  </div>
	  </c:if>
   </dd>
  </dl>
 </div>
</body>
</html>