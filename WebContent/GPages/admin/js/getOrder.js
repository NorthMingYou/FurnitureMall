/**
 * 
 */
	function getOrdersByState(btn)
	{
		var state = btn.value;
		$.ajax({
			dataType:'json',
			type:'post',
			data:{
				state:state,
			},
			url:'${pageContext.request.contextPath}/Manager/getOrdersByState',
			success:function(data){	
				var orderData = [];
				var html = "";
				$.each(data, function(index, item){
					orderData.push({
						username:item.user.username,
						buydate:item.buydate,
						receiptaddress:item.receiptaddress,
						receiptPeople:item.receiptPeople,
						receiptTel:item.receiptTel,
						state:item.state,
						cancel:item.cancel,
						validity:item.validity,
						experience:"<button class=\"btn btn-primary btn-xs\" onclick=\"sendProduct('"+item.orderid+"')\">发货</button>&nbsp;"
						+"<button class=\"btn btn-info btn-xs\" onclick=\"orderDetails('"+item.orderid+"')\">订单详情</button>"
					
					});
				})
				layer.alert(html);
				$("#tbody").html(html);
				var table = layui.table;
				table.reload('order',{
					data:orderData
				});
			},
			error:function(){
				layer.alert("处理失败");
			},
		})
	}	