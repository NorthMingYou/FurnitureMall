package com.service;

import java.util.List;

import com.Utils.PageBean;
import com.entity.FOrder;

public interface FOrderService {
	
	
	
	/**
	 * 分页查询商品列表
	 * 
	 * @param index
	 * @return
	 */
	public PageBean<FOrder> getFOrderListByPage(int index);

	public PageBean<FOrder> getFOrderListByUser(int index, String username);

	public void update(FOrder furniture);
	
	/**
	 * 
	 * @param index
	 * @param state 
	 * @return
	 */
	public PageBean<FOrder> getFOrderListByState(int index, int state);

	public FOrder getOrder(String orderId);
	
	/**
	 * 获取所有申请退货的订单
	 * @return
	 */
	public List<FOrder> getOrderIsCancel();

	public PageBean<FOrder> getFOrderListByToday(int index);

}
