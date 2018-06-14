package com.service;

import java.util.List;

import com.Utils.PageBean;
import com.entity.FOrder;
import com.entity.OrderDetail;

public interface ManagerOrdersService {
	//获取全部订单(分页)
	public PageBean<FOrder> getOrders(Integer size,Integer PageCode);
	//获取全部订单（不分页）
	public List<FOrder> getOrders();
	//key value 搜索订单（分页）
	public PageBean<FOrder> searchOrders(String key,String value,Integer PageCode,Integer size);
	//key value 搜索订单不分页
	public List<FOrder> searchOrders(String key,String value);
	//查看对应订单的订单详情 
	public List<OrderDetail> searchOrderdetails(String orderId);
	//根据订单状态查询（分页）
	public PageBean<FOrder> searchOrders(Integer state,Integer size,Integer PageCode);
	//根据订单状态查询（不分页）
	public List<FOrder> searchOrders(Integer state);
	//关键字与订单状态联合查询（分页）
	public PageBean<FOrder> searchOrders(String key, String value,String state,Integer PageCode,Integer size);
	//关键字与订单状态联合查询（不分页），暂时关闭此方法
	public List<FOrder> searchOrders(String key,String value,Integer state);
	//发货
	public int sendProduct(String orderid);
	//处理退货
	public int HandleForderCancel(String orderid);
	//整合到PageBean
	public PageBean<?> setTopageBean(Integer PageCode,Integer size,String hql,List<?> list);
	
	/**
	 * 分页查询
	 * @param index
	 * @return
	 */
	public List<FOrder> getOrdersByPage(int index);
}
