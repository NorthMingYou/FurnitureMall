package com.service;

import java.util.List;

import com.entity.FOrder;
import com.entity.OrderDetail;
import com.entity.Shopcart;
import com.entity.User;

public interface ShoppingService {
	
	/**
	 * 添加购物车
	 * @param shopCartDetail
	 * @return
	 */
	int addUserShopCart(Shopcart shopcart);
	
	

	
	/**
	 * 删除购物车内容
	 * @param id
	 * @return
	 */
	int deleteShopcartByscid(String scid);
	
	/**
	 * 更新购物车详情
	 * @param shopCartDetail
	 * @return
	 */
	int updataShopCart(Shopcart shopcart);
	
	/**
	 * 获取购物车
	 * @param userid
	 * @return
	 */
	List<Shopcart> getUserShopcart(String userid);
	
	Shopcart getShopcartByScid(String scid);
	
	/**
	 * 得到购物车中的总价
	 * @param list
	 * @return
	 */
	Double getAllMoney(List<Shopcart> list);
	
	/**
	 * 根据数量和家具单价得到该商品的总价格
	 * @param shopcart
	 * @return
	 */
	Double getTotalPrice(Shopcart shopcart);
	
	/**
	 * 得到这次订单的总价
	 * @param list
	 * @return
	 */
	Double getOrderTotalPrice(List<OrderDetail> list);
	
	/**
	 * 根据用户的购物车得到订单的内容
	 * @param user
	 * @return
	 */
	List<OrderDetail> getUserOrderDetail(User user);
	
	/**
	 * 添加订单
	 * @param forder
	 * @return
	 */
	int addFOrder(FOrder forder);
	
	/**
	 * 添加一个订单详情
	 * @param orderDetail
	 * @return
	 */
	int addAOrderDetail(OrderDetail orderDetail);
	
	/**
	 * 批量添加订单详情
	 * @param orderDetaillist
	 * @return
	 */
	int addOrderDetail(List<OrderDetail> orderDetaillist,FOrder fOrder);
	/**
	 * 更新订单
	 * @param forder
	 * @return
	 */
	int updataFOrder(FOrder forder);
	
	/**
	 * 跟新订单详情
	 * @param orderDetail
	 * @return
	 */
	int updataOrderDetail(OrderDetail orderDetail);
	
	
	int deleteUserShopcart(User user);
	
	/***
	 * 获取用户的订单，按时间排序
	 * @param user
	 * @return
	 */
	List<FOrder> getUserOrder(User user);
	
	/**
	 * 通过订单id，获取订单详情
	 * @param id
	 * @return
	 */
	List<OrderDetail> getOrderDetailByOrderid(String id);
	
	
	
	/**
	 * 通过订单id获取订单
	 * @param id
	 * @return
	 */
	FOrder getAOrderByorderid(String orderid);
	
	
	int changeFCountAndSaleRecord(List<OrderDetail> orderDetaillist);
}
