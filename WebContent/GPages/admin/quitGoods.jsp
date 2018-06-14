<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>订单列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${pageContext.request.contextPath}/GPages/admin/style/adminStyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/GPages/admin/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/GPages/admin/js/public.js"></script>
<style type="text/css">
	table tr{
		height: 35px;
		line-height: 35px;
	}
	table tr, table td,table th {
		border: none 0px !important;
	}
	.ogg {
		background-color: #fff;
	}
	.even{
		background-color: #f9f9f9;
	}
	
	#product-pageIndex{
		 display: table margin:40px auto;
	}
	#product-pageIndex li{
		display: table-cell; 
	}
</style>
<script type="text/javascript">
	
	$(function(){
		
		getOrderListByIndex(1);
	});
	
	
	function getOrderListByIndex(index){
		var url="${pageContext.request.contextPath}/getQuitOrderList";
		var param={"index":index};
		/* 1已支付（待发货）   0未支付   2代表已发货  3代表已签收 
			<th>订单编号</th>
		    <th>下单时间</th>
		    <th>收件人</th>
		    <th>联系电话</th>
		    <th>收货地址</th>
		    <th>金额</th>
		    <th>订单状态</th>
		    <th>订单详情</th>
		    
		*/
		var orderState=["未支付","待发货","已发货","已签收"];
		$.ajax({  
            type: "POST",  
            url: url,  
            data: param,  
            dataType: "json",
            success: function(data){ 
               if(data == ''){
            		$("#tbody-orderList").html("暂无退单申请！");
            		$("#product-pageIndex").html("");
            		return;
            	}
            	
            	//拼接表格内容
            	var inner = "";
            	$.each(data, function (index,value){
            		console.log(value);
            		
            		if(index%2 == 0){
            			var temp ="<tr class='ogg'>"+
	            		"<td class='center'>"+value.user.username+"</td>"+
	            		"<td class='td-name center'><span class='ellipsis td-name block'>"+value.orderid+"</span>"+
	            		"</td>"+
	            		"<td class='center'><span> <i>"+value.buydate+"</i></span></td>"+
	            		"<td class='center'><span> <i>"+value.receiptPeople+"</i></span></td>"+
	            		"<td class='center'><span> <em>"+value.receiptTel+"</em> </span></td>"+
	            		"<td class='center'><span> <em>"+value.receiptaddress+"</em></span></td>"+
	            		"<td class='center'><span> <em>"+value.totalprice+"</em></span></td>"+
	            		"<td class='center'><span> <em style='color:red;'>"+orderState[value.state]+"</em></span></td>"+
	            		"<td class='center'>"+
	            		"<a href='${pageContext.request.contextPath}/toDoQuitGood?orderId="+value.orderid+"' title='退单处理'>"+
	            		"<img src='${pageContext.request.contextPath}/GPages/admin/images/icon_view.gif'/>"+
	            		"</a> "+
						"</td>"+
						"</tr>";
            		}
            		else{
            			var temp ="<tr class='even'>"+
            			"<td class='center'>"+value.user.username+"</td>"+
	            		"<td class='td-name center'><span class='ellipsis td-name block'>"+value.orderid+"</span>"+
	            		"</td>"+
	            		"<td class='center'><span> <i>"+value.buydate+"</i></span></td>"+
	            		"<td class='center'><span> <i>"+value.receiptPeople+"</i></span></td>"+
	            		"<td class='center'><span> <em>"+value.receiptTel+"</em> </span></td>"+
	            		"<td class='center'><span> <em>"+value.receiptaddress+"</em></span></td>"+
	            		"<td class='center'><span> <em>"+value.totalprice+"</em></span></td>"+
	            		"<td class='center'><span> <em style='color:red;'>"+orderState[value.state]+"</em></span></td>"+
	            		"<td class='center'>"+
	            		"<a href='${pageContext.request.contextPath}/toDoQuitGood?orderId="+value.orderid+"' title='退单处理'>"+
	            		"<img src='${pageContext.request.contextPath}/GPages/admin/images/icon_view.gif'/>"+
	            		"</a> "+
						"</td>"+
						"</tr>";
            		}
	            	
					
					inner += temp;
            	});
            	
            	$("#tbody-orderList").html(inner);
            	
            }  
        });
	}
</script>

</head>
<body>
 <div class="wrap">
  <div class="page-title">
    <span class="modular fl"><i class="order"></i><em>退单申请列表</em></span>
  </div>
  <table class="list-style Interlaced">
  <thead>
   <tr>
   	<th>用户名称</th>
    <th>订单编号</th>
    <th>下单时间</th>
    <th>收件人</th>
    <th>联系电话</th>
    <th>收货地址</th>
    <th>金额</th>
    <th>订单状态</th>
    <th>订单详情</th>
   </tr>
  </thead>
  <tbody id="tbody-orderList">
  </tbody>
   <%-- <tr align="center">
    <td>
     <a href="order_detail.html">2015041803225</a>
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
     <a href=""${pageContext.request.contextPath}/GPages/admin/order_detail.html" class="inline-block" title="查看订单"><img src=""${pageContext.request.contextPath}/GPages/admin/images/icon_view.gif"/></a>
    </td>
   </tr> --%>
  </table>
 </div>
</body>
</html>