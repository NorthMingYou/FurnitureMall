package com.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.Dao.OrderDetailDao;
import com.entity.OrderDetail;
import com.service.OrderDetailService;

@Service
@Transactional
public class OrderDetailServiceImpl implements OrderDetailService {
	@Autowired
	private OrderDetailDao orderDetailDao;
	
	@Override
	public List<OrderDetail> get(String orderId) {
		// TODO Auto-generated method stub
		return orderDetailDao.get(orderId);
	}

}
