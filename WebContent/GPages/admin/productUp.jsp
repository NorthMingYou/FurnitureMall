<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>产品列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link
	href="${pageContext.request.contextPath}/GPages/admin/style/adminStyle.css"
	rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/GPages/admin/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/GPages/admin/js/public.js"></script>
	<!-- <script>
	    $(document).ready(function(){
	      $.ajax({
	        url:'${pageContext.request.contextPath}/furniture/getAll',
	        type:"post",
	      })
	    });
	</script> -->
	
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
		//一开始获取第一页的上架商品列表
		getProductListByState(1,0);
	});
	
	/*
		根据分页下标获取商品列表
	*/
	function getProductListByState(index,state){
		var url="${pageContext.request.contextPath}/getProductListByState";
		var param={"index":index,"state":state};
		/* var isDrop=["no","yes"]; */
		var isDrop=["yes","yes"];
		$.ajax({  
            type: "POST",  
            url: url,  
            data: param,  
            dataType: "json",
            success: function(data){ 
            	
            	if(data.totalCount== 0){
            		
            		$("#tbody-productList").html("暂无上架商品！");
            		$("#product-pageIndex").html("");
            		return;
            	}
            	
            	//拼接表格内容
            	var inner = "";
            	$.each(data.beanList, function (index,value){
            		console.log(value);
            		
            		if(index%2 == 0){
            			var temp ="<tr class='ogg'>"+
	            		"<td class='center'>"+(index*1+1)+"</td>"+
	            		"<td class='td-name center'><span class='ellipsis td-name block'>"+value.fname+"</span>"+
	            		"</td>"+
	            		"<td class='center'><span> <i>"+value.ftype+"</i></span></td>"+
	            		"<td class='center'><span> <i>"+value.fstyle+"</i></span></td>"+
	            		"<td class='center'><span> <em>"+value.fprice+"</em> <i>元</i></span></td>"+
	            		"<td class='center'><span> <em>"+value.fnum+"</em> <i>件</i></span></td>"+
	            		"<td class='center'><img src='${pageContext.request.contextPath}/GPages/admin/images/"+isDrop[value.isdropoff]+".gif' /></td>"+
	            		"<td class='center'>"+
	            		"<a href='${pageContext.request.contextPath}/upProduct?productId="+value.fid+"' title='商品上架'>"+
	            		"<img src='${pageContext.request.contextPath}/GPages/admin/images/upGood.png'/>"+
	            		"</a> "+
						"</td>"+
						"</tr>";
            		}
            		else{
            			var temp ="<tr class='even'>"+
	            		"<td class='center'>"+(index*1+1)+"</td>"+
	            		"<td class='td-name center'><span class='ellipsis td-name block'>"+value.fname+"</span>"+
	            		"</td>"+
	            		"<td class='center'><span> <i>"+value.ftype+"</i></span></td>"+
	            		"<td class='center'><span> <i>"+value.fstyle+"</i></span></td>"+
	            		"<td class='center'><span> <em>"+value.fprice+"</em> <i>元</i></span></td>"+
	            		"<td class='center'><span> <em>"+value.fnum+"</em> <i>件</i></span></td>"+
	            		"<td class='center'><img src='${pageContext.request.contextPath}/GPages/admin/images/"+isDrop[value.isdropoff]+".gif' /></td>"+
	            		"<td class='center'>"+
	            		"<a href='${pageContext.request.contextPath}/upProduct?productId="+value.fid+"' title='商品上架'>"+
	            		"<img src='${pageContext.request.contextPath}/GPages/admin/images/upGood.png'/>"+
	            		"</a> "+
						"</td>"+
						"</tr>";
            		}
	            	
					
					inner += temp;
            	});
            	
            	$("#tbody-productList").html(inner);
            	
            	//拼接页数：
           /*  	pageCode	1
            	totalCount	19
            	pageSize	8
            	totalPage	3 
            	product-pageIndex
            	*/
            	
            	var pageHtml="";
            	
            	for (var i=0;i<data.totalPage;i++)
            	{
            		pageIndex = i+1;
            		pageHtml += "<li><a style='margin-right:8px;' href='javascript:;' onclick='getProductListByState("+pageIndex+",0)'>"+pageIndex+"</a></li>";
            	}
            	
            	$("#product-pageIndex").html(pageHtml);
            	
            }  
        });
	}
</script>
</head>
<body>
	<div class="wrap">
		<div class="page-title">
			<span class="modular fl"><i></i><em>商品上架管理</em></span> 
			<span class="modular fr">
				<a href="${pageContext.request.contextPath}/GPages/admin/add_product.jsp" class="pt-link-btn">+添加商品</a>
			</span>
		</div>
		<table class="list-style Interlaced" >
			<thead>
				<tr style="background-color: #6f6e98;">
					<th>序号</th>
					<th>名称</th>
					<th>类型</th>
					<th>风格</th>
					<th>价格</th>
					<th>库存</th>
					<th>是否下架</th>
					<th>商品上架</th>
				</tr>
			</thead>
			<tbody id="tbody-productList">
			</tbody>
			 <!-- ${requestScope.user} -->
			<%-- <c:forEach items="${requestScope.flist}" var="aFurniture" varStatus="status"> --%>
			<%-- 	<tr>
					<td class="td-name center"><span class="ellipsis td-name block">${flist.getFname()}</span>
					</td>
					<td class="center"><span> <i>${flist.ftype}</i></span></td>
					<td class="center"><span> <i>${flist.fstyle}</i></span></td>
					<td class="center"><span> <em>${flist.fprice}</em> <i>元</i></span></td>
					<td class="center"><span> <em>${flist.fprice}</em> <i>件</i></span></td>
					<td class="center"><img src="${pageContext.request.contextPath}/GPages/admin/images/no.gif" /></td>
					<td class="center">
						<a href="" title="查看">
							<img src="${pageContext.request.contextPath}/GPages/admin/images/icon_view.gif" />
						</a> 
						<a href="edit_product.html" title="编辑">
							<img src="${pageContext.request.contextPath}/GPages/admin/images/icon_edit.gif" />
						</a> 
						<a title="删除">
							<img src="${pageContext.request.contextPath}/GPages/admin/images/icon_drop.gif" />
						</a>
					</td>
				</tr --%>
			<%-- </c:forEach> --%>
			
		</table>
		<!-- BatchOperation
		overflow: hidden;
		text-align: center;
		position: fixed;
		right: 200px;
bottom: 50px;
		 -->
		<div style="overflow: hidden;position: fixed;right: 500px;bottom: 30px; text-align:center;">
			<ul class="turnPage center fr" id="product-pageIndex">
				<!-- <a>第一页</a> 
				<a>1</a>
				<a>最后一页</a> -->
			</ul>
		</div>
	</div>
</body>
</html>