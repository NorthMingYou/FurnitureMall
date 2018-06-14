package com.service;

import java.util.List;

import com.entity.OrderDetail;

public interface OrderDetailService {

	List<OrderDetail> get(String orderId);

}
