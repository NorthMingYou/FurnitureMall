<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
						<!--Start Search area -->
						<form action="#" name="myForm"> 
							<div class="search_box">
								<input name="Name" id="itp" class="input_text" type="text" value="Search"/>
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
						<!--Start Header Right Cart area -->
						<div class="account_card_area"> 
							<ul id="account_nav">
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
		<div class="checkout_accrodion_area">
			<div class="container">
				<div class="row">
					<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
						<div class="accordion-inner">
							<div class="row">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">		
									<div class="accordion_total_pricing">
										<table id="product_details_price">
											<tr>
												<th>图片</th>
												<th>名称</th>
												<th>单价</th>
												<th>数量</th>
												<th>总价</th>
											</tr>
											<c:forEach var="item" items="${sessionScope.buylist}" varStatus="status">
												<tr>
													<td>
														<a href="#">
															<img style='width:50px;height:50px;' 
															src='${pageContext.request.contextPath}/GPages/furniture_images/${item.furniture.getFpic1() }' />
														</a>
													</td>
													<td><a href="#">${item.furniture.getFname() }</a></td>
													<td><p>¥${item.furniture.fprice }</p></td>
													<td><p>${item.quantity } </p></td>
													<td><p>¥${item.allmoney}</p></td>
												</tr>
											</c:forEach>
										</table>
										<table id="product_details_rate">
											<tr>
												<td>总计</td>
												<td>¥${sessionScope.ordermoney}</td>
											</tr>
										</table>
									</div>
									<form action="${pageContext.request.contextPath}/confirmOrder" method="post" accept-charset="UTF-8" >
										<div class="shopping_details_des">
											<h2>请填写收货信息</h2>
											<h3>输入您的收货地址和联系电话以及联系人</h3>
											<div class="shopping_form">
												<h4>收件人</h4>
												<!-- <input class="input-text " type="text" name="receiptPeople" value=""> -->
												<input type="text" name="receiptPeople" value="${sessionScope.user.username}">
												<h4>收货地址</h4>
												<input class="input-text " type="text" name="receiptaddress" value="${sessionScope.user.address}">
												
												<h4>联系电话</h4>
												<input class="input-text " type="text" name="receiptTel" value="${sessionScope.user.phone}">
												
												<h4>备注</h4>
												<input class="input-text " type="text" name="remark" value="">
											</div>
										</div>
										<div class="Continue_button continue_top place_order">
											<button type="submit" title="Submit Review" class="button">确定订单</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--Start branding area -->
		
		<!--End branding area -->
		<!--Start footer area -->
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
    </body>
</html>
