<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${pageContext.request.contextPath}/GPages/admin/style/adminStyle.css" rel="stylesheet" type="text/css" />
<title>商品详情</title>
<meta name="keywords" content="商品详情" />
<meta name="description" content="商品详情" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/GPages/admin/css/normalize.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/GPages/admin/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/GPages/admin/js/common.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var showproduct = {
			"boxid" : "showbox",
			"sumid" : "showsum",
			"boxw" : 400,//宽度,该版本中请把宽高填写成一样
			"boxh" : 400,//高度,该版本中请把宽高填写成一样
			"sumw" : 60,//列表每个宽度,该版本中请把宽高填写成一样
			"sumh" : 60,//列表每个高度,该版本中请把宽高填写成一样
			"sumi" : 7,//列表间隔
			"sums" : 5,//列表显示个数
			"sumsel" : "sel",
			"sumborder" : 1,//列表边框，没有边框填写0，边框在css中修改
			"lastid" : "showlast",
			"nextid" : "shownext"
		};//参数定义	  
		$.ljsGlasses.pcGlasses(showproduct);//方法调用，务必在加载完后执行
	});
</script>
</head>
<body>
	
	<div class="showall" style="margin-left: 150px;">
		<div class="page-title" style="margin-left: -150px;">
	      <span class="modular fl">
	        <i></i>
	        <em>商品详情</em>
	      </span>
	      <span class="modular fr" style="margin-right: 250px;">
	        <a href="${pageContext.request.contextPath}/editProduct?productId=${furniture.fid}" class="pt-link-btn">修改信息</a>
	      </span>
		</div>
		<div class="active_tab" style="float: left;margin-left: -150px; width:100%;">
				<ul class="act_title_left">
					<li class="act_active"><a href="${pageContext.request.contextPath}/productList">返回</a></li>
				</ul>
				<div class="clear"></div>
		</div>
		
		<!--left -->
		<div class="showbot">
			<div id="showbox">
				<img src="${pageContext.request.contextPath}/GPages/furniture_images/${furniture.fpic1}" width="400" height="400" />
				<img src="${pageContext.request.contextPath}/GPages/furniture_images/${furniture.fpic2}" width="400" height="400" />
				<img src="${pageContext.request.contextPath}/GPages/furniture_images/${furniture.fpic3}" width="400" height="400" /> 
			</div>
			<!--展示图片盒子-->
			<div id="showsum">
				<!--展示图片里边
					private String fid;//家具id
					private String fname;//家具名
					private String ftype;//家具类型
					private String fstyle;//家具风格
					private String fsummary;//家具描述
					
					private Integer fnum;//家具数量
					
					private Double fprice;//家具单价
					private String fpic1;//家具图片1
					private String fpic2;//家具图片2
					private String fpic3;//家具图片3
					private String isdropoff;//是否下架
					//private Integer sales;//家具销售量
					
					private String date;	//添加商品的时间
				-->
			</div>
			<p class="showpage">
				<a href="javascript:void(0);" id="showlast"> < </a>
				 <a href="javascript:void(0);" id="shownext"> > </a>
			</p>
		</div>

		<div class="tb-property">
			<div class="tr-nobdr">
				<h3>${furniture.fname}</h3>
			</div>
			<div class="txt">
				<span class="nowprice">￥<a href="">${furniture.fprice}</a></span>
				<!-- <div class="cumulative">
					<span class="number ty1">累计售出<br /> <em
						id="add_sell_num_363">370</em></span>
				</div> -->
			</div>
			<div class="txt-h">
				<span class="tex-o">分类</span>
				<ul class="glist" id="glist"
					data-monitor="goodsdetails_fenlei_click">
					<li><a title="红色36g" href="">${furniture.ftype}</a></li>
				</ul>
			</div>
			<div class="txt-h">
				<span class="tex-o">风格</span>
				<ul class="glist" id="glist"
					data-monitor="goodsdetails_fenlei_click">
					<li><a title="红色36g" href="">${furniture.fstyle}</a></li>

				</ul>
			</div>
			<script>
				$(document).ready(function() {
					
					var t = $("#text_box");
					
					$('#min').attr('disabled', true);
					
					$("#add").click(function() {
						t.val(parseInt(t.val()) + 1)
						if (parseInt(t.val()) != 1) {
							$('#min').attr('disabled', false);
						}

					})
					
					$("#min").click(function() {
						t.val(parseInt(t.val()) - 1);
						if (parseInt(t.val()) == 1) {
							$('#min').attr('disabled', true);
						}

					})
				});
			</script>
			<div class="gcIpt">
				<span class="guT">库存</span>
				
				<input id="text_box" disabled type="text" value="${furniture.fnum}"
					style="width: 30px; text-align: center; color: #0F0F0F;" />
				
			</div>
		</div>
	</div>
	<!-- 商品介紹 -->
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
					<ul style="display: block;">
						<li><span class="guT">商品名称：</span>${furniture.fname}</li>
						<li><span class="guT">商品编号：</span>${furniture.fid}</li>
						<li><span class="guT">商品风格：</span>${furniture.fstyle}</li>
						<li><span class="guT">添加时间：</span>${furniture.date}</li>
						<li><span class="guT">商品库存：</span>${furniture.fnum}</li>
						<li><span class="guT">商品介绍：</span>${furniture.fsummary}</li>
						<!-- 商品介绍图片 -->
						<li><img src="${pageContext.request.contextPath}/GPages/furniture_images/${furniture.fpic1}" /></li>
						<li><img src="${pageContext.request.contextPath}/GPages/furniture_images/${furniture.fpic2}" /></li>
						<li><img src="${pageContext.request.contextPath}/GPages/furniture_images/${furniture.fpic3}" /></li>
					</ul>
				</div>
				<script>
					$(function() {
						window.onload = function() {
							var $li = $('#tab li');
							var $ul = $('#content ul');

							$li.mouseover(function() {
								var $this = $(this);
								var $t = $this.index();
								$li.removeClass();
								$this.addClass('act_active');
								$ul.css('display', 'none');
								$ul.eq($t).css('display', 'block');
							})
						}
					});
				</script>
			</div>
		</div>
	</div>
</body>
</html>
