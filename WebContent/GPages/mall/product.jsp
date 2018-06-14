<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Single Product | 菜鸟家具</title>
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
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/GPages/admin/css/normalize.css" />
		<!-- modernizr JS -->
        <script src="${pageContext.request.contextPath}/GPages/mall/js/vendor/modernizr-2.8.3.min.js"></script>
        <!-- jquery JS -->
        <script src="${pageContext.request.contextPath}/GPages/mall/js/vendor/jquery-1.11.3.min.js"></script>
    	<style type="text/css">
    	.bb{
    		border: 2px solid white;
    	}
    	.bb:hover{
			border: 2px solid yellow;
		}
		.numstyle{
			    height: 35px;
			    width:200px;
			    font-size:20px;
			    text-align:center;
			    border: 2px solid #333;
		}
</style>
<script type="text/javascript"> 
	
	//加载家具详情
	$(function (){
		//alert("jiaz");
		
		//加载详情
		getDetial();
		
	});
	
	function getDetial() {
		var fid = "<%=request.getParameter("fid")%>";  
		var tmp ="";
		var inner ="";
		var flag = 0;
		var param={"fid":fid};
		
		$.ajax({  
            type: 'post',  
            url: '${pageContext.request.contextPath}/furnituredetail',
            data: param,  
            dataType: 'json',
            async:false,
            success: function(data){ 
            	 //alert("成功！");
            	 console.log(data);
            	 //html拼接
            	 tmp ="<div class='col-lg-6 col-md-6 col-sm-12 col-xs-12'>"+
						"<div class='my_tabs'>"+
							"<div class='tab-content tab_content_style'>"+
								"<div id='tab1' class='tab-pane fade in active'>"+
									"<div class='blog_tabs'>"+
										"<a class='fancybox' href='${pageContext.request.contextPath}/GPages/furniture_images/"+data.fpic1+"' data-fancybox-group='gallery' title='Lorem ipsum dolor sit amet'><img src='${pageContext.request.contextPath}/GPages/furniture_images/"+data.fpic1+"' style='width: 450px;height: 420px;' alt=''   /></a>"+
									"</div>"+
								"</div>"+
								"<div id='tab2' class='tab-pane fade'>"+
									"<div class='blog_tabs'>"+
									"<a class='fancybox' href='${pageContext.request.contextPath}/GPages/furniture_images/"+data.fpic2+"' data-fancybox-group='gallery' title='Lorem ipsum dolor sit amet'><img src='${pageContext.request.contextPath}/GPages/furniture_images/"+data.fpic2+"' style='width: 450px;height: 420px;' alt=''  /></a>"+
									"</div>"+
								"</div>"+
								"<div id='tab3' class='tab-pane fade'>"+
									"<div class='blog_tabs'>"+
									"<a class='fancybox' href='${pageContext.request.contextPath}/GPages/furniture_images/"+data.fpic3+"' data-fancybox-group='gallery' title='Lorem ipsum dolor sit amet'><img src='${pageContext.request.contextPath}/GPages/furniture_images/"+data.fpic3+"' style='width: 450px;height: 420px;' alt=''  /></a>"+
									"</div>"+
								"</div>"+	
							"</div>"+
							"<div class='blog_view_list'>"+
								"<ul class='tab_style tab_bottom'>"+
									"<li class='active'>"+
										"<div class='blog_single_carousel bb'>"+
										"<a data-toggle='tab' href='#tab1'><img src='${pageContext.request.contextPath}/GPages/furniture_images/"+data.fpic1+"' style='width: 125px;height: 100px;' /></a>"+
										"</div>"+
									"</li>"+
									"<li>"+
										"<div class='blog_single_carousel bb' >"+
										"<a data-toggle='tab' href='#tab2'><img src='${pageContext.request.contextPath}/GPages/furniture_images/"+data.fpic2+"' style='width: 125px;height: 100px;' /></a>"+
										"</div>"+
									"</li>"+
									"<li>"+
										"<div class='blog_single_carousel bb'>"+
										"<a data-toggle='tab' href='#tab3'><img src='${pageContext.request.contextPath}/GPages/furniture_images/"+data.fpic3+"' style='width: 125px;height: 100px;' /></a>"+
										"</div>"+
									"</li>"+
								"</ul>"+
							"</div>"+
						"</div>"+
					"</div>"+
					"<div class='col-lg-6 col-md-6 col-sm-12 col-xs-12'>"+
						"<div class='blog_product_details'>"+
							"<h2 class='blog_heading'>"+data.fname+"</h2>"+
							"<p>&nbsp;</p>"+
							"<div>"+
								"<p>&nbsp;</p>"+
								"<p style='font-size: 18px;'>"+data.ftype+"&nbsp;&nbsp;"+data.fstyle+"风格</p>"+
							"</div>"+
							"<div class='pricing_rate'>"+
								"<p class='rating_dollor'><span class='rating_value_two'  >¥"+data.fprice+"</span></p>"+
								"<p class='blog_texts'>"+data.fsummary+"</p>"+
							"</div>"+
						"</div>"+
						"<div class='product_options_area'>"+
							"<div class='product_options_selection'>"+
								"<ul id='options_selection'>"+
									"<li><span class='star_color'></span><span class='Product_color'>&nbsp;</span> <span class='required'></span></li>"+
									"<li>"+
									"<span  style='font-size:18px;'>请选择数量：</span>"+
									"<input id='fcount' type='number'  min='1' max='99'  class='numstyle' title='Qty' value='1' class='qty' onclick='calculatemoney(\""+data.fprice+"\")' onfocus='this.blur()''/>"+
									"<span class='required' style='font-size: 15px'>*库存"+data.fnum+"</span>"+
									"</li>"+
									"<li>&nbsp;</li>"+
									"<li >"+
									"<p align='left' class='rating_dollor rating_margin add-to-cart' style='font-size: 24px;'>"+
									"<em style='color:red;'>¥&nbsp;</em>"+
									"<span id='money' class='rating_value_two'  style='color:red;''>"+data.fprice+"</span></p>"+
									"</li>"+
								"</ul>"+
							"</div>"+
							"<div class='cart_blog_item'>"+
								"<div class='add-to-cart' >"+
									"<a href='javascript:;' onclick='addtoCarts(this);' fid='"+data.fid+"'><button class='cart_button' ><span>加入购物车</span></button></a>"+
									"<a href='javascript:;' onclick='buyItNow(this);' fid='"+data.fid+"'><button class='cart_button' ><span>立即购买</span></button></a>"+
									
								"</div>"+
							"</div>"+
						"</div>"+
					"</div>"
					
   				inner = "<li><span class='guT'>商品名称：</span>"+data.fname+"</li>"+
						"<li><span class='guT'>商品编号：</span>"+data.fid+"</li>"+
						"<li><span class='guT'>商品风格：</span>"+data.fstyle+"</li>"+
						"<li><span class='guT'>商品库存：</span>"+data.fnum+"</li>"+
						"<li><span class='guT'>商品介绍：</span>"+data.fsummary+"</li>"+
						"<img style='height:650px;width:880px;' src='${pageContext.request.contextPath}/GPages/furniture_images/"+data.fpic1+"' />"+
						"<img style='height:650px;width:880px;' src='${pageContext.request.contextPath}/GPages/furniture_images/"+data.fpic2+"' />"+
						"<img style='height:650px;width:880px;' src='${pageContext.request.contextPath}/GPages/furniture_images/"+data.fpic3+"' />"
					
				$("#detail").html(tmp);
				$("#canshu").html(inner);
            }
      });  
 }

 	function calculatemoney(aa) {
		
 		var price = aa;
 		var num = document.getElementById("fcount").value;
 		var sum = num*price;
 		document.getElementById("money").innerText=sum;
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
						<div class="breadcrumb-single breadcrumb_top">
							<ul id="breadcrumbs">
								<li><a href="${pageContext.request.contextPath}/GPages/mall/index.jsp"><i class="fa fa-home"  style="font-size: 36px;"></i>Home</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="blog_single_view_area">
			<div class="container">
				<div class="row" id="detail">
				</div>
			</div>
		</div>
		
		
		<div class="gdetail">
		<!-- right -->
		<script>
			var detail = document.querySelector('.detail');
			var origOffsetY = detail.offsetTop;
			function onScroll(e) {
				window.scrollY >= origOffsetY ? detail.classList.add('sticky')
						: detail.classList.remove('sticky');
			}
			document.addEventListener('scroll', onScroll);
		</script>
		<div class="detail">
			<div class="active_tab" id="outer">
				<ul class="act_title_left" id="tab">
					<li class="act_active"><a href="#">商品参数</a></li>
				</ul>
				<div class="clear"></div>
			</div>
			<div id="content" class="active_list">
				<!--0-->
				<div id="ui-a" class="ui-a">
					<ul id="canshu">
						
					</ul>
				</div>
 				<script>
//  					$(function() {
//  						window.onload = function() {
//  							var $li = $('#tab li');
//  							var $ul = $('#content ul');

//  							$li.mouseover(function() {
//  								var $this = $(this);
//  								var $t = $this.index();
//  								$li.removeClass();
//  								$this.addClass('act_active');
// 								$ul.css('display', 'none');
//  								$ul.eq($t).css('display', 'block');
//  							})
//  						}
//  					});
  				</script>
			</div>
		</div>
	</div>
	<div class="service_info_area">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					</div>
				</div>
			</div>
		</div>
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
		<!-- End Footer area -->
		
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
        //立即购买
     	 function buyItNow(obj){
    		var fid=$(obj).attr("fid");
    		var count=$("#fcount").val();
    		console.log(fid);
    		$.ajax({
    			url:'${pageContext.request.contextPath}/checkoutByFid',
    			type:'post',
    			data:{'fid':fid,"count":count},
    			success:function(data){
    				console.log(data);
    				if(data=="login"){
    					$(location).attr('href', '${pageContext.request.contextPath}/GPages/mall/userLogin.jsp');
    				}else{
    					$(location).attr('href', '${pageContext.request.contextPath}/GPages/mall/checkout.jsp');
    				}
    				 
    				//alert(data[0].furniture.fpic1);
    			}
    		});
    	}; 
      //添加到购物车
       	function addtoCarts(obj){
    		var fid=$(obj).attr("fid");
    		var count=$("#fcount").val();
    		console.log(fid);
    		$.ajax({
    			url:'${pageContext.request.contextPath}/addToShopCart',
    			type:'post',
    			data:{'fid':fid,"count":count},
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