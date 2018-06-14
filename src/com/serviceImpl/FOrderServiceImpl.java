package com.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.Dao.OrderDao;
import com.Utils.PageBean;
import com.entity.FOrder;
import com.service.FOrderService;

@Service
@Transactional
public class FOrderServiceImpl implements FOrderService {

	
	
	@Autowired
	private OrderDao orderDao;
	
	

	@Override
	public PageBean<FOrder> getFOrderListByPage(int index) {
		// TODO Auto-generated method stub
		return orderDao.getOrderListByPage(index);
	}

	@Override
	public PageBean<FOrder> getFOrderListByUser(int index, String name) {
		// TODO Auto-generated method stub
		return orderDao.getOrderListByPageForUser(index, name);
	}

	@Override
	public void update(FOrder fOrder) {
		// TODO Auto-generated method stub
		orderDao.update(fOrder);
	}

	@Override
	public PageBean<FOrder> getFOrderListByState(int index, int state) {
		// TODO Auto-generated method stub
		return orderDao.getOrderListByState(index,state);
	}

	@Override
	public FOrder getOrder(String orderId) {
		// TODO Auto-generated method stub
		return orderDao.getOrder(orderId);
	}

	@Override
	public List<FOrder> getOrderIsCancel() {
		
		
		return orderDao.getOrderIsCancel();
	}

	@Override
	public PageBean<FOrder> getFOrderListByToday(int index) {
		// TODO Auto-generated method stub
		return orderDao.getFOrderListByToday(index);
	}

}
