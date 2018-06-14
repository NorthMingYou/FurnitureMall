package com.Dao;

import java.util.List;

import com.Utils.PageBean;
import com.entity.FOrder;

public interface OrderDao extends BaseDao{

	PageBean<FOrder> getOrderListByPage(int index);

	PageBean<FOrder> getOrderListByPageForUser(int index,String name);

	PageBean<FOrder> getOrderListByState(int index, int state);

	FOrder getOrder(String orderId);

	List<FOrder> getOrderIsCancel();

	PageBean<FOrder> getFOrderListByToday(int index);
	
	
}
