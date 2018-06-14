<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
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
	
		<!--End Main Menu area -->
		<!--Start Register & login area -->
		<div class="checkout_accrodion_area">
			<div class="container">
				<div class="row">
					<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
						<div class="accordion" id="accordion2">
							<div class="panel accordion-group">
								<div class="accordion-heading" id="headingOne">
								  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
									 <span>1</span>个人信息
								  </a>
								</div>
								<div id="collapseOne" class="panel-collapse collapse in" aria-labelledby="headingOne">
								    <div class="accordion-inner">
								    	<form method="post" id="updataForm">
								    	
	                                        <div class="row">
	                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
	                                                <div class="billing_info">
	                                                    <ul class="billing_in">
	                                                    	<li>手机号码</li>
	                                                        <li>${sessionScope.user.getPhone() }</li>
	                                                        
	                                                        <li>用户名</li>
	                                                        <li>
	                                                        <input type="text" id="username" name="username" value='${sessionScope.user.getUsername() }' class="input-text required-entry"></li>
	                                                        <li>性别</li>
	                                                        <li>
	                                                            <select name="gender" id="gender" class="validate-select" >
	                                                                <option value="male" <c:if test="${ sessionScope.user.getGender()  eq 'male' }">selected</c:if> >男</option>
	                                                                <option value="female" <c:if test="${ sessionScope.user.getGender() eq 'female' }">selected</c:if> >女</option>
	                                                            </select>
	                                                        </li>
	                                                        <%-- <li><input type="text" id="phone" name="mn" value='${sessionScope.user.getPhone() }' class="input-text required-entry" readonly="readonly"></li> --%>
	                                                        <li>QQ</li>
	                                                        <li><input type="text" id="QQ" name="QQ" value='${sessionScope.user.getQQ() }' class="input-text "></li>
	                                                        <li>电子邮箱</li>
	                                                        <li><input type="text" name="email" id="email" value='${sessionScope.user.getEmail() }' class="input-text validate-email required-entry"></li>
	                                                        <li>联系地址</li>
	                                                        <li><input type="text" name="address" id="address" value='${sessionScope.user.getAddress() }' class="input-text "></li>
	                                                    </ul>
	                                                </div>
	                                            </div>
	                                        </div>
	                                        <div class="row">
	                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	                                                <div class="Continue_button">
	                                                    <button id="submit_button" class="button">更新</button>
	                                                </div>
	                                            </div>
	                                        </div>
									    	
								    	</form>
								    </div>
								</div>
							</div>
							<div class="panel accordion-group">
								<div class="accordion-heading" id="headingTwo">
								  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
									<span>2</span>修改密码
								  </a>
								</div>
								<div id="collapseTwo" class="panel-collapse collapse" aria-labelledby="headingTwo">
								    <div class="accordion-inner">
										<div class="row">
										 <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                            <form  method="post" id="updataPwdForm">
                                                <div class="new_customer">
                                                    <ul class="register_form">
                                                        <li>原密码<span>*</span></li>
                                                        <li>
                                                            <div class="email_address">
                                                                <input type="password" class="email_test" id="oldPassword" name="oldPassword" style="border:0px;"/>
                                                                <label id="oldPasswordTips"></label>
                                                            </div>
                                                        </li>
                                                        <li>新密码<span>*</span></li>
                                                        <li>
                                                            <div class="email_address">
                                                                <input type="password" class="password" id="newPassword" name="newPassword" style="border:0px;"/>
                                                                <label id="newPasswordTips"></label>
                                                            </div>
                                                        </li>
                                                        <li>确认密码<span>*</span></li>
                                                        <li>
                                                            <div class="email_address">
                                                                <input type="password" class="password" id="newPassword_2" name="newPassword_2" style="border:0px;"/>
                                                                <label id="newPassword_2Tips"></label>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="create_button_area">
                                                    <button class="btn btn-dark" id="toupdatapwd" disabled style="color:black">确定修改</button>
                                                </div>  
                                            </form>
                                            </div>
                                        </div>
								    </div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--End Register & login area -->
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
        <!-- jquery JS  -->
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
        	
        	//更改用户信息
        	$(function(){
        		$("#submit_button").click(function(){
        			
        			$.ajax({
        				url:'${pageContext.request.contextPath}/user/updataInfo',
        				type:'post',
        				data:$("#updataForm").serialize(),
						success:function(data){
							if(data=="ok"){
								console.log(data);
								alert("更新成功！");
								$(location).attr('href', '${pageContext.request.contextPath}/GPages/mall/my_account.jsp'); 
							}
							else{
								alert("更新失败");
							}
						}
        			});
        		});
        	});
        	
        	
        	var a=0,b=0;
        	//检查密码
        	$(function(){
				$("#newPassword").keyup(function(){
					var myreg_password=/^[0-9a-zA-Z_]{6,15}$/;
					if(!$(this).val || !myreg_password.test($("#newPassword").val()))//只处验证和上面一样  
					{  
						$("#newPasswordTips").text("密码格式错误！");
						$("#newPasswordTips").css("color",'red');
						a=0;
						getUpdataButton();	  
					}
					else{
						$("#newPasswordTips").text("密码有效！"); 
						$("#newPasswordTips").css("color",'green');
						a=1;
						getUpdataButton();
					}
				})
			});
        	//再次检查
			$(function(){
				$("#newPassword_2").keyup(function(){
					if(!$(this).val() || $(this).val() != $("#newPassword").val())//此处验证和上面一样  
					{  
						$("#newPassword_2Tips").text("密码不一致!");
						$("#newPassword_2Tips").css("color",'red');
						b=0;
						getUpdataButton();
					}
					else 
					{  
						$("#newPassword_2Tips").text("密码一致!");
						$("#newPassword_2Tips").css("color",'green');
						b=1;
						getUpdataButton();  
					}  
	
				})
			});
        	
			function getUpdataButton(){
				if(a+b>=2){
					$('#toupdatapwd').removeAttr("disabled"); 
				}
				else {
					$("#toupdatapwd").attr("disabled","disabled");
				}
			}
			
			$(function(){
				$("#oldPassword").keyup(function(){
					var oldpassword=$(this).val();
					$.ajax({
        				url:'${pageContext.request.contextPath}/user/checkPwd',
        				type:'post',
        				data:{oldpassword:oldpassword},
						success:function(data){
							if(data=='ojbk'){
								$("#oldPasswordTips").text("密码正确！"); 
								$("#oldPasswordTips").css("color",'green');
							}
							else{
								$("#oldPasswordTips").text("原密码错误！"); 
								$("#oldPasswordTips").css("color",'red');
							}
						}
        			});
	
				})
			});
			
			
			$(function(){
        		$("#toupdatapwd").click(function(){
        			var newpassword=$("#newPassword").val();
        			$.ajax({
        				url:'${pageContext.request.contextPath}/user/updataPwd',
        				type:'post',
        				data:{newpassword:newpassword},
						success:function(data){
							if(data=="ok"){
								alert("更改成功！请重新登陆！");
								$(location).attr('href', '${pageContext.request.contextPath}/user/logout'); 
							}else{
								alert("更新失败");
							}
						}
        			});
        		});
        	});
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
			//更新右上角的购物车列表
	    	function updataCartDiv(data){
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
