<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>后台管理中心起始页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link
	href="${pageContext.request.contextPath}/GPages/admin/style/adminStyle.css"
	rel="stylesheet" type="text/css" />
<style>
html, body {
	width: 100%;
}
.ogg {
	background-color: #fff;
}
.even{
	background-color: #f9f9f9;
}
</style>
<script
	src="${pageContext.request.contextPath}/GPages/admin/js/jquery.js"></script>
<script
	src="${pageContext.request.contextPath}/GPages/admin/js/public.js"></script>
<script
	src="${pageContext.request.contextPath}/GPages/admin/build/dist/echarts.js"></script>
<style type="text/css">
table th {
	background-color: #6f6e98;
	border: none 0px !important;
	color: #fff;
	padding: 0px 4px;
}

table tr, table td {
	border: none 0px !important;
}

.start-page dd {
	color: #000;
}
</style>

<script type="text/javascript">
	//页面一加载就获取默认值的统计情况
	$(function(){
		//alert("页面加载！");
		//获取销量数据
		getStatic();
		
		
		//获取收益数据
		getIncome();
	});
	
	function getStatic(){
		var $year = $("#saleYear").val();
		var $month = $("#saleMonth").val();
		var $style = $("#saleStyle").val();
		var url="${pageContext.request.contextPath}/saleStatic";
		var param={"year":$year,"month":$month,"style":$style};
		
		$.ajax({  
            type: "GET",  
            url: url,  
            data: param,  
            dataType: "json",
            success: function(data){ 
            	console.log(data);
            	echartOfShowByBar('xiaoliang',['家具销量统计直方图'],'category',
                        ["床","沙发","椅子","桌子"],'value','件',
                        "家具销量统计直方图","bar",data);
            }  
        });  
	}
	function getIncome(){
		var $year = $("#incomeYear").val();
		var $month = $("#incomeMonth").val();
		var url="${pageContext.request.contextPath}/incomeStatic";
		var param={"year":$year,"month":$month};
		
		$.ajax({  
            type: "GET",  
            url: url,  
            data: param,  
            dataType: "json",
            success: function(data){ 
            	console.log(data);
          
            	echartOfShowByLine('shouyi',['家具销售收益统计折线图'],'category',
                        ["床","沙发","椅子","桌子"],'value','元',
                        "家具销量统计折线图","line",data);
            }  
        });  
	}
</script>
<script type="text/javascript">

    /* echartOfShowByBar('xiaoliang',['家具销量统计直方图'],'category',
                      ["床","椅子","沙发","桌子"],'value','件',
                      "家具销量统计直方图","bar",[5, 23, 62, 10]);
    echartOfShowByLine('shouyi',['家具销售收益统计折线图'],'category',
                      ["床","椅子","沙发","桌子"],'value','元',
                      "家具销量统计折线图","line",[5, 23, 62, 10]); */
    /**
     * 显示直方图
     * @param  {[id]} pos            [要显示的位置的id]
     * @param  {[Array]} title       [字符串数组，在这里默认只有一个元素，直方图的标题]
     * @param  {[string]} xType      [x轴的数据类型，默认是category]
     * @param  {[Array]} xData       [字符x轴显示的名称]
     * @param  {[string]} yType      [y轴的数据类型，默认是value]
     * @param  {[string]} yName      [y轴数据显示的单位]
     * @param  {[string]} seriesName [对应标题的字符串数组的第一个元素]
     * @param  {[string]} seriesType [显示图形的类型，bar是直方图]
     * @param  {[Array]} seriesData  [要显示的数据]
     * @return {[None]}              [没有返回值]
     */
    function echartOfShowByBar(pos,title,xType,xData,yType,yName,seriesName,seriesType,seriesData) {
      // 路径配置
      require.config({
          paths: {
              echarts: '${pageContext.request.contextPath}/GPages/admin/build/dist'
          }
      });
      // 使用
      require(
          [
              'echarts',
              'echarts/chart/bar' // 使用柱状图就加载bar模块，按需加载
          ],
          function (ec) {
              // 基于准备好的dom，初始化echarts图表
              var myChart = ec.init(document.getElementById(pos)); //要显示的位置参数id
              
              var option = {
              	  title:{
                	 text:title,
                	 x:'center'
            	  },	 	
                  tooltip: {
                      show: true
                  },
                  // legend: {
                  //     data:title,   //图标显示的标题
                  //     // backgroundColor:'#cc2828'
                  // },
                  xAxis : [
                      {
                          type : xType,        //类别
                          data : xData   //x轴显示的数据名称
                      }
                  ],
                  yAxis : [
                      {
                          type : yType,
                          name : yName   //y的单位   
                      }
                  ],
                  series : [
                      {
                          name:seriesName,   
                          type:seriesType,             //类型
                          data:seriesData,    //数据
                          // 设置顶部数字显示
                          itemStyle: {  
                            normal: {  
                                label: {  
                                    show: true,//是否展示  
                                    textStyle: {  
                                        fontWeight:'bolder',  
                                        fontSize : '12',  
                                        fontFamily : '微软雅黑',  
                                    }  
                                }  
                            }  
                        },  
                      }
                  ]
              };
      
              // 为echarts对象加载数据 
              myChart.setOption(option); 
          }
      );
    }

    function echartOfShowByLine(pos,title,xType,xData,yType,yName,seriesName,seriesType,seriesData) {
      // 路径配置
      require.config({
          paths: {
              echarts: '${pageContext.request.contextPath}/GPages/admin/build/dist'
          }
      });
      // 使用
      require(
          [
              'echarts',
              'echarts/chart/line' // 使用柱状图就加载bar模块，按需加载
          ],
          function (ec) {
              // 基于准备好的dom，初始化echarts图表
              var myChart = ec.init(document.getElementById(pos)); //要显示的位置参数id
              
              var option = {
                  tooltip: {
                      show: true
                  },
                  title:{
                	 text:title,
                	 x:'center'
            	  },
                  xAxis : [
                      {
                          type : xType,        //类别
                          data : xData   //x轴显示的数据名称
                      }
                  ],
                  yAxis : [
                      {
                          type : yType,
                          name : yName   //y的单位   
                      }
                  ],
                  series : [
                      {
                          name:seriesName,   
                          type:seriesType,             //类型
                          data:seriesData,    //数据
                          // 设置顶部数字显示
                          itemStyle: {  
                            normal: {  
                                label: {  
                                    show: true,//是否展示  
                                    textStyle: {  
                                        fontWeight:'bolder',  
                                        fontSize : '12',  
                                        fontFamily : '微软雅黑',  
                                    }  
                                }  
                            }  
                        },  
                      }
                  ]
              };
      
              // 为echarts对象加载数据 
              myChart.setOption(option); 
          }
      );
    }  
</script>
</head>
<body>
	<div class="wrap start-page" style="color: #000; background: #fff;">
		<h1>
			<i class="home-icon"></i>菜鸟商城后台管理系统
		</h1>
		<div class="sale-static" style="width: 50%; float: left;">
				<dt>收益情况统计</dt>
				<dd>
					<ul>
						<li>年份： <select class="textBox" name="year" id="incomeYear" onchange="getIncome()">
								<option value="2016">2016</option>
								<option value="2017" selected="selected">2017</option>
								<option value="2018">2018</option>
						</select>
						</li>
						<li>月份： <select class="textBox" name="month" id="incomeMonth" onchange="getIncome()">
								<option value="1" selected="selected">1月</option>
								<option value="2">2月</option>
								<option value="3">3月</option>
								<option value="4">4月</option>
								<option value="5">5月</option>
								<option value="6">6月</option>
								<option value="7">7月</option>
								<option value="8">8月</option>
								<option value="9">9月</option>
								<option value="10">10月</option>
								<option value="11">11月</option>
								<option value="12">12月</option>
						</select>
						</li>
					</ul>
				</dd>
				<div id="shouyi" style="width: 100%; height: 250px;"></div>
			</dl>
			<dl>
				<dt>销售记录统计</dt>
				<dd>
					<ul>
						<li>年份： <select class="textBox" name="year" id="saleYear" onchange="getStatic()">
								<option value="2016">2016</option>
								<option value="2017">2017</option>
								<option value="2018" selected="selected">2018</option>
						</select>
						</li>
						<li>月份： <select class="textBox" name="month" id="saleMonth" onchange="getStatic()">
								<option value="1" selected="selected">1月</option>
								<option value="2">2月</option>
								<option value="3">3月</option>
								<option value="4">4月</option>
								<option value="5">5月</option>
								<option value="6">6月</option>
								<option value="7">7月</option>
								<option value="8">8月</option>
								<option value="9">9月</option>
								<option value="10">10月</option>
								<option value="11">11月</option>
								<option value="12">12月</option>
						</select>
						</li>
						<li>风格： <select class="textBox" name="fstyle" id="saleStyle" onchange="getStatic()">
						              <option vlaue="复古" selected="selected">复古</option>
						              <option vlaue="欧式">欧式</option>
						              <option vlaue="简约">简约</option>
						              <option vlaue="现代">现代</option>
						            </select>
						</li>
						
					</ul>
				</dd>
				<div id="xiaoliang" style="width: 100%; height: 250px;"></div>
			</dl>
		</div>
		<div class="sale-static" style="width: 45%; float: right;">
			<div class="frame clearfix">
				<dl>
					<dt>商品月销量<b>TOP10</b></dt>
				</dl>
				<table frame=void class="list-style" style="text-align: center;">
					<tr>
						<th>序号</th>
						<th>商品名称</th>
						<th>交易数目</th>
						<!-- <th>交易额</th> -->
					</tr>
					<c:forEach items="${sessionScope.records }" var="aRecord"  varStatus="status">
						<c:if test="${status.count%2 == 0}">
							<tr  class="even" style="height:35px;line-height:35px; ">
								<td>
									<span> <i style="font-weight:600;">${status.count }</i></span>
								</td>
								<td style="text-align: left">${aRecord.name}</td>
								<td>${aRecord.count}</td>
								<%-- <td class="center"><span> <i>￥</i> <em>${aRecord.amount}</em></span></td> --%>
							</tr>
						</c:if>
						<c:if test="${status.count%2 == 1}">
							<tr  class="ogg" style="height:35px;line-height:35px; ">
								<td>
									<span> <i style="font-weight:600;">${status.count }</i></span>
								</td>
								<td style="text-align: left">${aRecord.name}</td>
								<td>${aRecord.count}</td>
								<%-- <td class="center"><span> <i>￥</i> <em>${aRecord.amount}</em></span></td> --%>
							</tr>
						</c:if>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>