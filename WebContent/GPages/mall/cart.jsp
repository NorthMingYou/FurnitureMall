<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="en">
    <head>
		<!-- Basic page needs
        ============================================ -->   
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>my-account | Hope</title>
        <meta name="description" content="">
		<!-- Mobile specific metas --> 
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- FONTS ============================================ -->
		<!-- <link href='http://fonts.googleapis.com/css?family=Josefin+Sans:400,600italic,300italic,700' rel='stylesheet' type='text/css'> -->
		<!-- Favicon============================================ -->
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/GPages/mall/img/favicon.ico">
		<!-- font awesome -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/GPages/mall/css/font-awesome.min.css">
		<!-- carousel CSS  -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/GPages/mall/css/owl.carousel.css">
		<!-- carousel Theme CSS  -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/GPages/mall/css/owl.my_theme.css">
		<!-- carousel transitions CSS  -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/GPages/mall/css/owl.transitions.css">
		<!-- nivo slider slider css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/GPages/mall/css/nivo-slider.css">
		<!-- animate css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/GPages/mall/css/animate.css">
		<!-- Price jquery-ui  -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/GPages/mall/css/jquery-ui.css">
		<!-- fancy-box theme -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/GPages/mall/fancy-box/jquery.fancybox.css">
		<!-- normalizer  -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/GPages/mall/css/normalize.css">
		<!-- bootstrap  -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/GPages/mall/css/bootstrap.min.css">
		<!-- Mobile menu css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/GPages/mall/css/meanmenu.min.css">
		<!-- main  -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/GPages/mall/css/main.css">
		<!-- style  -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/GPages/mall/style.css">
		<!-- Responsive css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/GPages/mall/css/responsive.css">
		<!-- modernizr JS ============================================ -->
        <script src="${pageContext.request.contextPath}/GPages/mall/js/vendor/modernizr-2.8.3.min.js"></script>
    </head>
    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
		<!--Start Header Top area -->
		<div class="header_area_top"> 
			<div class="container">
				<div class="row">
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
					<!--Start Search area搜索框 -->
						<form action="${pageContext.request.contextPath}/tosearch" name="myForm" id="searchform">
							<div class="search_box">
								<input name="fname" id="mall_search" class="input_text" type="text" value="Search"/>
								<button type="submit" class="btn-search">
									<span><i class="fa fa-search"></i></span>
								</button>
							</div>
						</form> 
						<!--End Search area -->
					</div>
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
						<!--Start Logo area -->
						<div class="logo"> 
							<a href="${pageContext.request.contextPath}/GPages/mall/index.jsp">
								<img src="${pageContext.request.contextPath}/GPages/mall/img/logo_01.png" alt="" />
							</a>
						</div> 
						<!--End Logo area -->
					</div>
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
						<!--Start Header Right Cart area 购物车 -->
						<div class="account_card_area"> 
							<ul id="account_nav">
								<li><a href="${pageContext.request.contextPath}/GPages/mall/cart.jsp"><i class="fa fa-shopping-cart"></i>购物车 
										<span class="cart_zero" id="Numofspecies">
											<c:choose>
												<c:when test="${sessionScope.shopCount!=null || !empty sessionScope.shopCount}">
													${sessionScope.shopCount}
												</c:when>
												<c:otherwise>
													0
												</c:otherwise>
											</c:choose>
										</span>
									</a>
									<div class="cart_down_area" id="myShopCart">
										<c:choose>
											<c:when test="${sessionScope.shoppinglist!=null || !empty sessionScope.shoppinglist}">
												<c:forEach var="item" items="${sessionScope.shoppinglist}" varStatus="status">
													<div class="cart_single">
														<a href="#"><img style='width:50px;height:50px;' src='${pageContext.request.contextPath}/GPages/furniture_images/${item.furniture.getFpic1() }' /></a>
														<h2><a href="#">${item.furniture.getFname() } </a> <a href="javascript:;"><span><i class="fa fa-trash" onclick="deleteSCDetail(this)" value='${item.scid }' ></i></span></a></h2>
														<p>${item.quantity } x ¥${item.furniture.fprice }</p>
													</div>
												</c:forEach>
												<div class="cart_shoptings">
													<a href="${pageContext.request.contextPath}/checkoutWithShopcart">结算</a>
												</div>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${sessionScope.user!=null }">
														<h4>购物车中还没有任何东西喔！你可以</h4>
														<div class="cart_shoptings">
															<a href="${pageContext.request.contextPath}/GPages/mall/index.jsp">浏览商品</a>
														</div>
													</c:when>
													<c:otherwise>
														<h4>购物车中还没有任何东西喔！你可以</h4>
														<div class="cart_shoptings">
															<a href="${pageContext.request.contextPath}/GPages/mall/userLogin.jsp">立即登录</a>
														</div>
														<div class="cart_shoptings">
															<a href="${pageContext.request.contextPath}/GPages/mall/register.jsp">立即注册</a>
														</div>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
									</div>
								</li>
								<li>
									<ul id="nav_menu" class="active_cl">
										<li><a href="${pageContext.request.contextPath}/GPages/mall/my_account.jsp"><span class="Home">我的账户</span></a>
											<div class="home_mega_menu">
												<c:choose>
													<c:when test="${sessionScope.user!=null }">
														<a href="${pageContext.request.contextPath}/GPages/mall/my_account.jsp">个人信息</a>
														<a href="${pageContext.request.contextPath}/GPages/mall/myOrder.jsp">我的订单</a>
														<a href="${pageContext.request.contextPath}/user/logout">退出</a>
													</c:when>
													<c:otherwise>
														<a href="${pageContext.request.contextPath}/GPages/mall/userLogin.jsp">立即登录</a>
														<a href="${pageContext.request.contextPath}/GPages/mall/register.jsp">立即注册</a>
													</c:otherwise>
												</c:choose>
											</div>
										</li>
									</ul>	
								</li>
							</ul>
							
						</div> 
						<!--End Header Right Cart area -->
					</div>
				</div>
			</div>
		</div> 
		<!--End Header Top area -->
		<!--Start Main Menu area -->
		
			<!--start Mobile Menu area -->
			
			<!--End Mobile Menu area -->
		<!--End Main Menu area -->
		<!--Start Shopping Cart top area -->
		<div class="shopping_cart_area">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="cart_title">
							<h2>我的购物车</h2>
						</div>
						<div class="shopping-cart-table">
							<table class="cart_items" id="shopCartTable">
								<tr>
									<th>图片</th>
									<th>名称</th>
									<th>单价</th>
									<th>数量</th>
									<th>总价</th>
									<th>删除</th>
								</tr>
								<c:choose>
									<c:when test="${sessionScope.shoppinglist!=null }">
										<c:forEach var="item" items="${sessionScope.shoppinglist}" varStatus="status">
											<tr>
												<td>
													<a href="#">
														<img style='width:50px;height:50px;' 
														src='${pageContext.request.contextPath}/GPages/furniture_images/${item.furniture.getFpic1() }' />
													</a>
												</td>
												<td><a href="#">${item.furniture.getFname() }</a></td>
												<td><p>¥${item.furniture.fprice }</td>
												<td>
													<input type="number" value='${item.quantity }' totalpriceid="${item.scid}" 
													 aprice='${item.furniture.fprice }' min="1" max="5" class="input-text qty" onchange="getTotalPrice(this)">
												</td>
												<td><p>¥${item.totalprice}</p></td>
												<td>
													<a href="javascript:;" onclick="deleteSCDetail(this)" value='${item.scid }'>
														<img src="img/arrow/btn_trash.gif" />
													</a>
												</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr><td><h4>购物车中还没有任何东西喔!</h4></td></tr>
									</c:otherwise>
								</c:choose>
							</table>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="shopping_cart_main">
							<div class="shopping_button">
								<a href="${pageContext.request.contextPath}/GPages/mall/index.jsp">
									<button type="button" title="shop" class="continue_shopping">继续购物</button>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--End Shopping Cart top area -->
		<!--Start Estimate Shipping,Discount,Total checkout area -->
		<div class="cart-collaterals-item">
			<div class="container">
				<div class="row" >
					<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
						<div class="total_price">
							<table class="total_rate">
								<tr>
									<td>总价</td>
									<td><p id="allPrice">¥${sessionScope.allmoney }</p></td>
								</tr>
							</table>
						</div>
						<div class="check_out_simble review_button ">
							<a href="${pageContext.request.contextPath}/checkoutWithShopcart">
								<button title="Submit Review" class="button">结算</button>
							</a>
						
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--End Estimate Shipping,Discount,Total checkout area -->
		<!--Start Branding area -->
		
		<!--End Branding area -->
		<!--Start Footer area -->
		<div class="footer_area home1_margin_top">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="feature_text feature_newsletter">
							<h4>菜鸟皇家家具城</h4>
							<p>给最棒的你、做最好的家具</p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="footer_bottom_area">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="copy_visa">
								<div class="copy_right">
									<h2>Copyright © 2018 <a href="">designBy</a>菜鸟A队</h2>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--End Footer area -->
        <!-- jquery JS -->
        <script src="${pageContext.request.contextPath}/GPages/mall/js/vendor/jquery-1.11.3.min.js"></script>
		<!-- bootstrap JS -->
        <script src="${pageContext.request.contextPath}/GPages/mall/js/bootstrap.min.js"></script>
		<!-- Mobile menu JS -->
        <script src="${pageContext.request.contextPath}/GPages/mall/js/jquery.meanmenu.js"></script>
		<!-- jquery.easing js -->
        <script src="${pageContext.request.contextPath}/GPages/mall/js/jquery.easing.1.3.min.js"></script>
		<!-- knob circle js -->
        <script src="${pageContext.request.contextPath}/GPages/mall/js/jquery.knob.js"></script>
		<!-- fancybox JS -->
        <script src="${pageContext.request.contextPath}/GPages/mall/fancy-box/jquery.fancybox.pack.js"></script>
		<!-- price slider JS  -->
        <script src="${pageContext.request.contextPath}/GPages/mall/js/price-slider.js"></script>
		<!-- nivo slider JS -->
        <script src="${pageContext.request.contextPath}/GPages/mall/js/jquery.nivo.slider.pack.js"></script>
		<!-- wow JS -->
        <script src="${pageContext.request.contextPath}/GPages/mall/js/wow.js"></script>
		<!-- nivo-plugin JS -->
		<script src="${pageContext.request.contextPath}/GPages/mall/js/nivo-plugin.js"></script>
		<!-- scrollUp JS -->
		<script src="${pageContext.request.contextPath}/GPages/mall/js/jquery.scrollUp.js"></script>
		<!-- carousel JS  -->
        <script src="${pageContext.request.contextPath}/GPages/mall/js/owl.carousel.min.js"></script>
		<!-- plugins JS  -->
        <script src="${pageContext.request.contextPath}/GPages/mall/js/plugins.js"></script>
		<!-- main JS  -->
        <script src="${pageContext.request.contextPath}/GPages/mall/js/main.js"></script>
        
        <script type="text/javascript">
        	$(function(){
        		$.ajax({
	    			url:'${pageContext.request.contextPath}/loadShopCart',
	    			type:'post',
	    			success:function(data){
	    				if(data!=null && data!=""){
	    					console.log(data);
		    				updataCartDiv(data);
		    				updataTableDiv(data)
	    				}else{
	    	    			var inner ="<h4>购物车中还没有任何东西喔！你可以</h4>"+
	    								"<div class='cart_shoptings'>"+
	    									"<a href='${pageContext.request.contextPath}/GPages/mall/index.jsp'>浏览商品</a>"+
	    								"</div>";
	    	    			$("#myShopCart").html(inner);
	    					$("#Numofspecies").text("0");
	    					var inner_2="<tr><td><h4>购物车中还没有任何东西喔!</h4></td></tr>";
	    					$("#shopCartTable").html(inner_2);
	    					$("#allPrice").text("¥0");
	    				}
	    			}
	    		});
        	})
	        
	        function updataTableDiv(data){
	        	var allmoney=0;
	        	var tmp ="";
	    		var inner ="<tr><th>图片</th><th>名称</th><th>单价</th><th>数量</th><th>总价</th><th>删除</th></tr>";
	    		$.each(data,function(i,n){
	    			tmp="<tr>"+
							"<td>"+
								"<a href='#'>"+
									"<img style='width:50px;height:50px;' "+
									"src='${pageContext.request.contextPath}/GPages/furniture_images/"+data[i].furniture.fpic1+"' />"+
								"</a>"+
							"</td>"+
							"<td><a href=''>"+data[i].furniture.fname+"</a></td>"+
							"<td><p>¥"+data[i].furniture.fprice+"</td>"+
							"<td>"+
								"<input type='number' value='"+data[i].quantity +"' scid='"+data[i].scid+"' "+ 
								 "aprice='"+data[i].furniture.fprice+"' min='1' max='5' class='input-text qty' onchange='getTotalPrice(this)'>"+
							"</td>"+
							"<td><p>¥"+data[i].totalprice+"</p></td>"+
							"<td>"+
								"<a href='javascript:;' onclick='deleteSCDetail(this)' value='"+data[i].scid+"'>"+
									"<img src='img/arrow/btn_trash.gif' />"
								"</a>"+
							"</td>"+
						"</tr>";
	    			
					inner += tmp;
					
					allmoney+=data[i].totalprice;
				});
				$("#shopCartTable").html(inner);
				$("#allPrice").text("¥"+allmoney);
				
	        }
	    	
	    	function getTotalPrice(obj){
	    		var scid=$(obj).attr("scid");
	    		var aprice=$(obj).attr("aprice");
	    		var num=$(obj).val();
	    		var totp=aprice*num;
	    		$("#"+scid).text(totp);
	    		
	    		$.ajax({
	    			url:'${pageContext.request.contextPath}/updataShopcartNum',
	    			type:'post',
	    			data:{'num':num,"scid":scid},
	    			success:function(data){
	    				console.log(data);
	    				updataCartDiv(data);
	    				updataTableDiv(data);
	    			}
	    		});
	    		
	    	}
	    	
	    	
	    	function updataCartDiv(data){
	    		console.log(data);
    			var tmp ="";
	    		var inner ="";
	    		$.each(data,function(i,n){
					tmp = "<div class='cart_single'>"+
								"<a href=''><img style='width:50px;height:50px;' src='${pageContext.request.contextPath}/GPages/furniture_images/"+data[i].furniture.fpic1+"' /></a>"+
									"<h2><a href=''>"+data[i].furniture.fname+"</a> <a href='javascript:;'><span><i class='fa fa-trash' onclick='deleteSCDetail(this)' value='"+data[i].scid+"'></i></span></a></h2>"+
								"<p>"+data[i].quantity+" x ¥"+data[i].furniture.fprice+"</p>"+
						  "</div>";
						  
						
					inner += tmp;
				});
	    		inner += "<div class='cart_shoptings'>"+
							"<a href='${pageContext.request.contextPath}/checkoutWithShopcart'>结算</a>"+
						"</div>";
				$("#myShopCart").html(inner);
				$("#Numofspecies").text(data.length);
	    		
	    		
	    	}
	    	function deleteSCDetail(obj){
	    		var scid=$(obj).attr("value");
	    		$.ajax({
	    			url:'${pageContext.request.contextPath}/removeFormShopcart',
	    			type:'post',
	    			data:{'scid':scid},
	    			success:function(data){
	    				alert("删除成功");
	    				if(data!=null && data!=""){
	    					console.log(data);
		    				
		    				updataCartDiv(data);
		    				updataTableDiv(data);
	    				}else{
	    					
	    					console.log("321");
	    	    			var inner ="<h4>购物车中还没有任何东西喔！你可以</h4>"+
	    								"<div class='cart_shoptings'>"+
	    									"<a href='${pageContext.request.contextPath}/GPages/mall/index.jsp'>浏览商品</a>"+
	    								"</div>";
	    	    			$("#myShopCart").html(inner);
	    					$("#Numofspecies").text("0");
	    					var inner_2="<tr><td><h4>购物车中还没有任何东西喔!</h4></td></tr>";
	    					$("#shopCartTable").html(inner_2);
	    					$("#allPrice").text("¥0");
	    				}
	    				
	    			}
	    		});
	    	}
	    	
        
        </script>
    </body>
</html>