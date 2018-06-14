package com.Dao;

import java.util.List;

import com.entity.OrderDetail;

public interface OrderDetailDao {
	public List<OrderDetail> get(String orderId);

}
