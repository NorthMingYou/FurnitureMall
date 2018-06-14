<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<<head>
		<!-- Basic page needs --> 
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Shop | 菜鸟家具</title>
        <meta name="description" content="">
		<!-- Mobile specific metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- FONTS  -->
		<!-- <link href='http://fonts.googleapis.com/css?family=Josefin+Sans:400,600italic,300italic,700' rel='stylesheet' type='text/css'> -->
		
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
		<!-- main  -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/GPages/mall/css/main.css">
		<!-- Mobile menu css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/GPages/mall/css/meanmenu.min.css">
		<!-- style  -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/GPages/mall/style.css">
		<!-- Responsive css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/GPages/mall/css/responsive.css">
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/GPages/mall/img/favicon_01.ico">
		
		<!-- modernizr JS  -->
        <script src="${pageContext.request.contextPath}/GPages/mall/js/vendor/modernizr-2.8.3.min.js"></script>
        <!-- jquery JS  -->
        <script src="${pageContext.request.contextPath}/GPages/mall/js/vendor/jquery-1.11.3.min.js"></script>
   
    	<script type="text/javascript">
		
    	$(function () {
    		var type = "<%=request.getParameter("ftype")%>";
    		getfbytype(1,type);
		});
    	
    	
    	function getfbytype(index,types) {
    		
    		//alert("成功！");
    		var param = {"ftype":types,"index":index};;
    		var aa = "";
    		var page = "";
    		var tmp = "";
    		var inner = "";
    		var biao = "";
    		var up;
    		var down;
    		
    		$.ajax({
    			type:'post',
    			url:'${pageContext.request.contextPath}/pageproduct',
    			data:param,
    			dataType:'json',
    			async:false,
    			success: function(data){
    				 //alert("大成功！！！");
    				 aa ="<li><a href='javascript:;' onclick='getfbytands(1,\""+types+"\",\"现代\");'>现代</a></li>"+
						 	"<li><a href='javascript:;' onclick='getfbytands(1,\""+types+"\",\"复古\")'>复古</a></li>"+
								"<li><a href='javascript:;' onclick='getfbytands(1,\""+types+"\",\"简约\")'>简约</a></li>"+
								"<li><a href='javascript:;' onclick='getfbytands(1,\""+types+"\",\"欧式\")'>欧式</a></li>"
     				
					biao = "<li style='font-size:22px;color:blue;font-family:幼圆;margin-right:30px;'>类别：<em style='color:green;'>"+types+"</em></li>"+
							"<li style='font-size:22px;color:blue;font-family:幼圆'>风格：<em style='color:green;'>全部</em></li>"
					up = data.pageCode-1;
					down = data.pageCode+1;
					if(data.totalPage==1){
						page ="";
					}else if(data.pageCode==1){
     					page = 	"<li>最首页</li>"+
								"<li>"+data.pageCode+"</li>"+
								"<li><a id='limitdown' href='javascript:;' onclick='getfbytype(\""+down+"\",\""+types+"\");'>下一页</a></li>"		
     				}else if(data.pageCode==data.totalPage){
						page = 	"<li><a id='limitup' href='javascript:;' onclick='getfbytype(\""+up+"\",\""+types+"\");' >上一页</a></li>"+
								"<li>"+data.pageCode+"</li>"+
								"<li>最末页</li>"
					}else{
						page = 	"<li><a id='limitup' href='javascript:;' onclick='getfbytype(\""+up+"\",\""+types+"\");' >上一页</a></li>"+
								"<li>"+data.pageCode+"</li>"+
								"<li><a id='limitdown' href='javascript:;' onclick='getfbytype(\""+down+"\",\""+types+"\");'>下一页</a></li>"		
					}
								
								
    				$.each(data.beanList,function(index,item){
						tmp =  "<div class='row'>"+
						"<div class='col-lg-4 col-md-4 col-sm-12 col-xs-12'>"+
						"<div class='product_blog_image'>"+
							"<div class='product_blog_image'>"+
								"<a target='heart'  href='${pageContext.request.contextPath}/toDetails?fid="+item.fid+"'><img src='${pageContext.request.contextPath}/GPages/furniture_images/"+item.fpic1+"' style='height: 250px;width: 260px;' alt='图片被人吃了' /></a>"+
							"</div>"+
						"</div>"+
					"</div>"+
					"<div class='col-lg-8 col-md-8 col-sm-12 col-xs-12'>"+
						"<div class='blog_product_details'>"+
							"<h2 class='blog_heading' style='font-size:18px'><a target='heart'  href='${pageContext.request.contextPath}/toDetails?fid="+item.fid+"'>"+item.fname+"</a></h2>"+
							"<div class='product_rating'>"+
								"<span>"+item.ftype+"</span>&nbsp;"+
								"<span>"+item.fstyle+"</span>"+
							"</div>"+
							"<div class='pricing_rate'>"+
								"<p class='rating_dollor'><span class='rating_value_two'>¥"+item.fprice+"</span></p>"+
								"<p class='blog_texts'>"+item.fsummary+"</p>"+
							"</div>"+
							"<div class='product_blog_button'>"+
								"<div class='cart_blog_details'>"+
									"<a href='javascript:;' onclick='addtoCarts(this);' fid='"+item.fid+"'>加入购物车</a>"+
								"</div>"+
								"<div class='cart_blog_details'>"+
									"<a target='heart'  href='${pageContext.request.contextPath}/toDetails?fid="+item.fid+"'>立即购买</a>"+
								"</div>"+
							"</div>"+
						"</div>"+
					"</div>"+
				"</div>"
									inner+=tmp;	
 							 })
 						$("#biao").html(biao);
    				   	$("#single_popular").html(aa);
    		 			$("#tab1").html(inner);
    		 			$("#page").html(page);
    			} 
    		});
		}

		
	function  getfbytands(index,type,style) {
			//alert( "成功了吗");
			var param = {"ftype":type,"fstyle":style,"index":index};
			var tmp = "";
    		var inner = "";
    		var page = "";
    		var biao = "";
    		var test = 0;
    		var up;
    		var down;
			
    		$.ajax({
    			type:'post',
    			url:'${pageContext.request.contextPath}/bypagetands',
    			data:param,
    			dataType:'json',
    			async:false,
    			success: function(data){
    				//alert(data.totalPage);
    				up = data.pageCode-1;
					down = data.pageCode+1;
					
					biao = "<li style='font-size:22px;color:blue;font-family:幼圆;margin-right:30px;'>类别：<em style='color:green;'>"+type+"</em></li>&nbsp;&nbsp;&nbsp;"+
							"<li style='font-size:22px;color:blue;font-family:幼圆;'>风格：<em style='color:green;'>"+style+"</em></li>"
					if(data.totalPage==1){
						page ="";
					}else if(data.pageCode==1){
     					page = 	"<li>最首页</li>"+
								"<li>"+data.pageCode+"</li>"+
								"<li><a id='limitdown' href='javascript:;' onclick='getfbytands(\""+down+"\",\""+type+"\",\""+style+"\");'>下一页</a></li>"		
     				}else if(data.pageCode==data.totalPage){
						page = 	"<li><a id='limitup' href='javascript:;' onclick='getfbytands(\""+up+"\",\""+type+"\",\""+style+"\");' >上一页</a></li>"+
								"<li>"+data.pageCode+"</li>"+
								"<li>最末页</li>"
					}else{
						page = 	"<li><a id='limitup' href='javascript:;' onclick='getfbytands(\""+up+"\",\""+type+"\",\""+style+"\");' >上一页</a></li>"+
								"<li>"+data.pageCode+"</li>"+
								"<li><a id='limitdown' href='javascript:;' onclick='getfbytype(\""+down+"\",\""+type+"\",\""+style+"\");'>下一页</a></li>"		
					}
    				 tmp1 = "<h2 style='font-size:22px'>暂无此类商品...</h2>"
     				 $.each(data.beanList,function(index,item){
						
     					 tmp2 = "<div class='row'>"+
										"<div class='col-lg-4 col-md-4 col-sm-12 col-xs-12'>"+
											"<div class='product_blog_image'>"+
												"<div class='product_blog_image'>"+
													"<a target='heart'  href='${pageContext.request.contextPath}/toDetails?fid="+item.fid+"'><img src='${pageContext.request.contextPath}/GPages/furniture_images/"+item.fpic1+"' style='height: 250px;width: 260px;' alt='图片被人吃了' /></a>"+
												"</div>"+
											"</div>"+
										"</div>"+
										"<div class='col-lg-8 col-md-8 col-sm-12 col-xs-12'>"+
											"<div class='blog_product_details'>"+
												"<h2 class='blog_heading' style='font-size:18px'><a target='heart'  href='${pageContext.request.contextPath}/toDetails?fid="+item.fid+"'>"+item.fname+"</a></h2>"+
												"<div class='product_rating'>"+
													"<span>"+item.ftype+"</span>&nbsp;"+
													"<span>"+item.fstyle+"</span>"+
												"</div>"+
												"<div class='pricing_rate'>"+
													"<p class='rating_dollor'><span class='rating_value_two'>¥"+item.fprice+"</span></p>"+
													"<p class='blog_texts'>"+item.fsummary+"</p>"+
												"</div>"+
												"<div class='product_blog_button'>"+
													"<div class='cart_blog_details'>"+
														"<a href='javascript:;' onclick='addtoCarts(this);' fid='"+item.fid+"'>加入购物车</a>"+
													"</div>"+
													"<div class='cart_blog_details'>"+
														"<a target='heart'  href='${pageContext.request.contextPath}/toDetails?fid="+item.fid+"'>立即购买</a>"+
													"</div>"+
												"</div>"+
											"</div>"+
										"</div>"+
									"</div>"
									inner+=tmp2;
									test++;
 							 })
 							if( test>0){
 								$("#biao").html(biao);
 								$("#tab1").html(inner);
 								$("#page").html(page);
 							}			
 						   else{
 							  $("#biao").html(biao);
 							  $("#tab1").html(tmp1);
 							 $("#page").html("");
 							}
    				 
    			} 		
    		});
		}
    	</script>
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
		<div class="breadcrumbs_area">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="breadcrumb-single">
							<ul id="breadcrumbs">
								<li><a href="${pageContext.request.contextPath}/GPages/mall/index.jsp"><i class="fa fa-home"  style="font-size: 36px;"></i>Home</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="clothing_product_area">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
						<div class="catagory_price_color">
							<div class="catagory_area">
								<h2>类别</h2>
								<ul class="catagory">
									<li><a id="type_zhuozi" href="javascript:void(0)" onclick="getfbytype(1,'桌子')"><i class="fa fa-angle-right"></i>桌子</a> </li>
									<li><a id="type_yizi" href="javascript:void(0)" onclick="getfbytype(1,'椅子')"><i class="fa fa-angle-right"></i>座椅</a></li>
									<li><a id="type_shafa" href="javascript:void(0)" onclick="getfbytype(1,'沙发')"><i class="fa fa-angle-right"></i>沙发</a></li>
									<li><a id="type_chuang" href="javascript:void(0)" onclick="getfbytype(1,'床')"><i class="fa fa-angle-right"></i>大床</a></li>
								</ul>
							</div>
						</div>
						<div class="popular_tag_area">
							<div class="popular_items">
								<h2>&ensp;风格</h2>
								<ul id="single_popular">
									
								</ul>
							</div>
						</div>
					</div>
					<div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
					<div class="my_tabs">
						<ul class="tab_style" id="biao">
								
							</ul>
							<div class="tab-content tab_content_style">
								<div id="tab1" class="tab-pane fade in active"  id="furniturelists">
									
								</div>
								
								<div class="row">
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="blog_pagination">
												<ul class="pagination_list" id="page">
													
												</ul>
											</div>
										</div>
									</div>
							</div>
					</div>
				</div>
			</div>
		</div>
		<!--End clothing product area -->
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
		<!--End footer area -->
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
    					
    					console.log("321");
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