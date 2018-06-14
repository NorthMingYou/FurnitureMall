<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta charset="utf-8"> 
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Home | 菜鸟家具</title>
        <meta name="description" content="">
		<!-- Mobile specific metas --> 
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- FONTS -->
		<!-- <link href='http://fonts.googleapis.com/css?family=Josefin+Sans:400,600italic,300italic,700' rel='stylesheet' type='text/css'> -->
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/GPages/mall/img/favicon_01.ico">
		<!-- font awesome -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/GPages/mall/css/font-awesome.min.css">
		<!-- carousel CSS -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/GPages/mall/css/owl.carousel.css">
		<!-- carousel Theme CSS -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/GPages/mall/css/owl.my_theme.css">
		<!-- carousel transitions CSS -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/GPages/mall/css/owl.transitions.css">
		<!-- nivo slider slider css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/GPages/mall/css/nivo-slider.css">
		<!-- animate css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/GPages/mall/css/animate.css">
		<!-- Price jquery-ui  -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/GPages/mall/css/jquery-ui.css">
		<!-- fancy-box theme -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/GPages/mall/fancy-box/jquery.fancybox.css">
		<!-- normalizer -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/GPages/mall/css/normalize.css">
		<!-- bootstrap -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/GPages/mall/css/bootstrap.min.css">
		<!-- Mobile menu css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/GPages/mall/css/meanmenu.min.css">
		<!-- main -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/GPages/mall/css/main.css">
		<!-- style -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/GPages/mall/style.css">
		<!-- Responsive css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/GPages/mall/css/responsive.css">
		<!-- modernizr JS -->
        <script src="${pageContext.request.contextPath}/GPages/mall/js/vendor/modernizr-2.8.3.min.js"></script>
        <!-- jquery JS -->
        <script src="${pageContext.request.contextPath}/GPages/mall/js/vendor/jquery-1.11.3.min.js"></script>
        <script src="${pageContext.request.contextPath}/GPages/mall/js/myjs.js">
       		
       	</script>
    	 <script type="text/javascript">
    	//加载商城商品
    	$(function (){
			//alert("加载商品！！");
			//获取“床”
			getproduct_bed();
			//获取“沙发”
			getproduct_sofa();
			//获取“桌子”
			getproduct_table();
			//获取“椅子”
			getproduct_chair();
			
		});
    	
    	function getproduct_bed() {
    		
    		var param={"ftype":"床"};
    		var tmp ="";
    		var inner ="";
    		
    		$.ajax({  
                type: 'post',  
                url: '${pageContext.request.contextPath}/product',
                data: param,  
                dataType: 'json',
                async:false,
                success: function(data){ 
                	 //alert(data);
                	 console.log(data);
                	 //html拼接显示商品
                	 $.each(data,function(index,item){
     					tmp = "<div class='col-lg-3 col-md-3 col-sm-6 col-xs-12' >"+
										"<div class='product_list'>"+
											"<div class='single_product'>"+
												"<a target='heart'  href='${pageContext.request.contextPath}/toDetails?fid="+item.fid+"'><img src='${pageContext.request.contextPath}/GPages/furniture_images/"+item.fpic1+"' style='height: 250px;' /></a>"+
													"<div class='product_details'>"+
														"<h2>"+item.fname+"</h2>"+
															"<p><span class='popular_price'><i>￥</i> <em>"+item.fprice+"</em></span></p>"+
																"</div>"+
																"<div class='product_detail'>"+
																"<div class='star_icon'>"+
																"</div>"+
																"<div class='product_button'>"+
																"<div class='cart_details'>"+
																"<a href='javascript:;' onclick='addtoCarts(this);' fid='"+item.fid+"'>加入购物车</a>"+
																"</div>"+
															"<div class='cart_details'>"+
														"<a href='${pageContext.request.contextPath}/toDetails?fid="+item.fid+"' target='heart'>立即购买</a>"+
													"</div>"+
												"</div>"+
											"</div>"+
										"</div>"+
									"</div>"+
								"</div>"
     					inner += tmp;
							//限制次数
							if( index==3){
								return false;
							}
     				})
     				$("#bed").html(inner);   	
                },
                error :function(data){
                	alert("shibai!!!!!!!!!!!!!!!");        	
                }
            });  
		}
    	
function getproduct_sofa() {
    		
    		var param={"ftype":"沙发"};
    		var tmp ="";
    		var inner ="";
    		
    		$.ajax({  
                type: 'post',  
                url: '${pageContext.request.contextPath}/product',
                data: param,  
                dataType: 'json',
                async:false,
                success: function(data){ 
                	 //alert(data);
                	 console.log(data);
                	 //html拼接显示商品
                	 $.each(data,function(index,item){
     					tmp = "<div class='col-lg-3 col-md-3 col-sm-6 col-xs-12' >"+
										"<div class='product_list'>"+
											"<div class='single_product'>"+
												"<a target='heart'  href='${pageContext.request.contextPath}/toDetails?fid="+item.fid+"'><img src='${pageContext.request.contextPath}/GPages/furniture_images/"+item.fpic1+"' style='height: 250px;' /></a>"+
													"<div class='product_details'>"+
														"<h2>"+item.fname+"</h2>"+
															"<p><span class='popular_price'><i>￥</i> <em>"+item.fprice+"</em></span></p>"+
																"</div>"+
																"<div class='product_detail'>"+
																"<div class='star_icon'>"+
																"</div>"+
																"<div class='product_button'>"+
																"<div class='cart_details'>"+
																"<a href='javascript:;' onclick='addtoCarts(this);' fid='"+item.fid+"'>加入购物车</a>"+
																"</div>"+
															"<div class='cart_details'>"+
														"<a href='${pageContext.request.contextPath}/toDetails?fid="+item.fid+"' target='heart'>立即购买</a>"+
													"</div>"+
												"</div>"+
											"</div>"+
										"</div>"+
									"</div>"+
								"</div>"
     					inner += tmp;
							//限制次数
							if( index==3){
								return false;
							}
     				})
     				$("#sofa").html(inner);   	
                }
            });  
		}
function getproduct_table() {
	
	var param={"ftype":"桌子"};
	var tmp ="";
	var inner ="";
	
	$.ajax({  
        type: 'post',  
        url: '${pageContext.request.contextPath}/product',
        data: param,  
        dataType: 'json',
        async:false,
        success: function(data){ 
        	 //alert(data);
        	 console.log(data);
        	 //html拼接显示商品
        	 $.each(data,function(index,item){
					tmp = "<div class='col-lg-3 col-md-3 col-sm-6 col-xs-12' >"+
								"<div class='product_list'>"+
									"<div class='single_product'>"+
										"<a target='heart'  href='${pageContext.request.contextPath}/toDetails?fid="+item.fid+"'><img src='${pageContext.request.contextPath}/GPages/furniture_images/"+item.fpic1+"' style='height: 250px;' /></a>"+
											"<div class='product_details'>"+
												"<h2>"+item.fname+"</h2>"+
													"<p><span class='popular_price'><i>￥</i> <em>"+item.fprice+"</em></span></p>"+
														"</div>"+
														"<div class='product_detail'>"+
														"<div class='star_icon'>"+
														"</div>"+
														"<div class='product_button'>"+
														"<div class='cart_details'>"+
														"<a href='javascript:;' onclick='addtoCarts(this);' fid='"+item.fid+"'>加入购物车</a>"+
														"</div>"+
													"<div class='cart_details'>"+
												"<a href='${pageContext.request.contextPath}/toDetails?fid="+item.fid+"' target='heart'>立即购买</a>"+
											"</div>"+
										"</div>"+
									"</div>"+
								"</div>"+
							"</div>"+
						"</div>"
					inner += tmp;
					//限制次数
					if( index==3){
						return false;
					}
				})
				$("#tables").html(inner);   	
        }
    });  
}
function getproduct_chair() {
	
	var param={"ftype":"椅子"};
	var tmp ="";
	var inner ="";
	
	$.ajax({  
        type: 'post',  
        url: '${pageContext.request.contextPath}/product',
        data: param,  
        dataType: 'json',
        async:false,
        success: function(data){ 
        	 //alert(data);
        	 console.log(data);
        	 //html拼接显示商品
        	 $.each(data,function(index,item){
					tmp = "<div class='col-lg-3 col-md-3 col-sm-6 col-xs-12' >"+
								"<div class='product_list'>"+
									"<div class='single_product'>"+
										"<a target='heart'  href='${pageContext.request.contextPath}/toDetails?fid="+item.fid+"'><img src='${pageContext.request.contextPath}/GPages/furniture_images/"+item.fpic1+"' style='height: 250px;' /></a>"+
											"<div class='product_details'>"+
												"<h2>"+item.fname+"</h2>"+
													"<p><span class='popular_price'><i>￥</i> <em>"+item.fprice+"</em></span></p>"+
														"</div>"+
														"<div class='product_detail'>"+
														"<div class='star_icon'>"+
														"</div>"+
														"<div class='product_button'>"+
														"<div class='cart_details'>"+
														"<a href='javascript:;' onclick='addtoCarts(this);' fid='"+item.fid+"'>加入购物车</a>"+
														"</div>"+
													"<div class='cart_details'>"+
												"<a target='heart'  href='${pageContext.request.contextPath}/toDetails?fid="+item.fid+"' >立即购买</a>"+
											"</div>"+
										"</div>"+
									"</div>"+
								"</div>"+
							"</div>"+
						"</div>"
					inner += tmp;
					//限制次数
					if( index==3){
						return false;
					}
				})
				$("#chair").html(inner);   	
        }
    });  
}
	
	function searchbylike() {
		var fname = document.getElementById("mall_search").value;
		alert(fname);
		var param = {"fname":fname};
		
		$.ajax({
			type:'post',
			url:'${pageContext.request.contextPath}/tosearch',
			data:param,
			dataType:'json',
			async:false,
			success:function(data){
				
			}
		})
	}
    
    
		
    </script>
    </head>
    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
		<!--Start Header Top area顶部开始区域 -->
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
		<!-- slider-area start -->
		<section class="slider-area">
			<!-- slider start -->
			<div class="slider">
				<div id="mainSlider" class="nivoSlider nevo-slider">
					<img src="${pageContext.request.contextPath}/GPages/mall/img/slider/myslider_1.jpg" alt="main slider" title="#htmlcaption1"/>
					<img src="${pageContext.request.contextPath}/GPages/mall/img/slider/myslider_2.jpg" alt="main slider" title="#htmlcaption2"/> 
				</div>		
				<div id="htmlcaption1" class="nivo-html-caption slider-caption">
					<div class="slider-progress"></div>
					<div class="slider-text">
						<div class="middle-text">
							<div class="width-cap" style="margin-right: -100px" >
								<h3 class="slider-tiile-top top-ani-1"><span >清新淡雅小脱俗</span></h3>
								<h2 class="slider-tiile-middle middle-ani-1"><span>简约</span></h2>
								</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				 <div id="htmlcaption2" class="nivo-html-caption slider-caption">
					<div class="slider-progress"></div>
					<div class="slider-text">
						<div class="middle-text">
							<div class="width-cap" style="margin-left:100px">
								<h3 class="slider2-tiile-top top-ani-2"><span>高端大气上档次</span></h3>
								<h2 class="slider2-tiile-middle middle-ani-2"><span>欧式</span></h2>					
							</div>
						</div>
					</div>					
				</div>
			<!-- slider end -->
		</section>
		<!-- slider-area end -->
		
		<!--Start Feature area -->
	    <div class="feature_area">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="feature_text">
							<h4><a target='heart'  href="${pageContext.request.contextPath}/toShop?ftype=床">优雅大床</a></h4>
						</div>
					</div>
				</div>
				<div class="row"  id="bed">
					</div>
					 			
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="feature_text">
							<h4><a target='heart'  href="${pageContext.request.contextPath}/toShop?ftype=沙发">高贵沙发</a></h4>
						</div>
					</div>
				</div>
				<div class="row" id="sofa">
				</div>
				
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="feature_text">
							<h4><a target='heart'  href="${pageContext.request.contextPath}/toShop?ftype=桌子">豪华桌子</a></h4>
						</div>
					</div>
				</div>
				<div class="row"  id="tables">
				</div>
				
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="feature_text">
							<h4><a target='heart'  href="${pageContext.request.contextPath}/toShop?ftype=椅子">精品座椅</a></h4>
						</div>
					</div>
				</div>
				<div class="row"  id="chair">
				</div>
			</div>
		</div>
		<!--End Feature area -->
		<!--Start Contact info area --> 
		<div class="service_info_area">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
						<div class="service_list">
							<h2><i class="fa fa-envelope-o"></i> QQ:1334180712</h2>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
						<div class="service_list">
							<h3><i class="fa fa-phone"></i> (+0766) 666 666</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--End Contact info area -->
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
								<div class="copy_right" >
									<h2>Copyright © 2018 <a href="">designBy</a>菜鸟A队</h2>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--End Footer area -->
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
		<!-- carousel JS -->
        <script src="${pageContext.request.contextPath}/GPages/mall/js/owl.carousel.min.js"></script>
		<!-- plugins JS -->
        <script src="${pageContext.request.contextPath}/GPages/mall/js/plugins.js"></script>
		<!-- main JS  -->
        <script src="${pageContext.request.contextPath}/GPages/mall/js/main.js"></script>
       	
       	<script>
	        $(function(){
	    		$.ajax({
	    			url:'${pageContext.request.contextPath}/loadShopCart',
	    			type:'post',
	    			success:function(data){
	    				if(data!=null && data!=""){
		    				updataCartDiv(data);
	    				}else{
	    	    			var inner ="<h4>购物车中还没有任何东西喔！你可以</h4>"+
	    								"<div class='cart_shoptings'>"+
	    									"<a href='${pageContext.request.contextPath}/GPages/mall/index.jsp'>浏览商品</a>"+
	    								"</div>";
	    	    			$("#myShopCart").html(inner);
	    					$("#Numofspecies").text("0");
	    					
	    				}
	    			}
	    		});
	    	});
       		//添加到购物车
	       	function addtoCarts(obj){
	    		var fid=$(obj).attr("fid");
	    		
	    		console.log(fid);
	    		$.ajax({
	    			url:'${pageContext.request.contextPath}/addToShopCart',
	    			type:'post',
	    			data:{'fid':fid,"count":1},
	    			success:function(data){
	    				console.log(data);
	    				//alert(data[0].furniture.fpic1);
	    				alert("添加成功，已在购物车中等着你窝!");
	    				updataCartDiv(data);
	    			}
	    		});
	    	};
	    	
	    	//更新右上角的购物车列表
	    	function updataCartDiv(data){
	    		console.log(data);
	    		//alert(data.length);
	    		
    			console.log("123");
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
	    	
	    	//删除购物车
	    	function deleteSCDetail(obj){
	    		var scid=$(obj).attr("value");
	    		$.ajax({
	    			url:'${pageContext.request.contextPath}/removeFormShopcart',
	    			type:'post',
	    			data:{'scid':scid},
	    			success:function(data){
	    				if(data!=null && data!=""){
	    					console.log(data);
		    				alert("删除成功");
		    				updataCartDiv(data);
	    				}else{
	    	    			var inner ="<h4>购物车中还没有任何东西喔！你可以</h4>"+
	    								"<div class='cart_shoptings'>"+
	    									"<a href='${pageContext.request.contextPath}/GPages/mall/index.jsp'>浏览商品</a>"+
	    								"</div>";
	    	    			$("#myShopCart").html(inner);
	    					$("#Numofspecies").text("0");
	    					
	    				}
	    				
	    			}
	    		});
	    	}
	    	
       	</script>
       
       
    </body>
</html>

