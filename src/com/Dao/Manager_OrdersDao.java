package com.Dao;

import java.util.List;

import com.entity.FOrder;
import com.entity.OrderDetail;
public interface Manager_OrdersDao extends BaseDao{
	/*
	 * 订单部分
	 */
	//显示全部订单（分页）
	public List<FOrder> getOrders(Integer start,Integer size);
	//key value搜索订单（分页)
	public List<FOrder> searchOrders(String key,String value,Integer start,Integer size);
	//key value搜索订单（不分页）
	public List<FOrder> searchOrders(String key,String value);
	//查看对应订单的订单详情 
	public List<OrderDetail> searchOrderdetails(String orderId);
	//获取订单的总记录数
	public Integer getTotalFOrder(String hql);
	//根据订单状态查询（分页）
	public List<FOrder> searchOrders(Integer state,Integer start,Integer size);
	//根据订单状态查询（不分页）
	public List<FOrder> searchOrders(Integer state);
	//关键字与订单状态联合查询（分页）
	public List<FOrder> searchOrders(String key, String value,Integer state,Integer start,Integer size);
	
}
