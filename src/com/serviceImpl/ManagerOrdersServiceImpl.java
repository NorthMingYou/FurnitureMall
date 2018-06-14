package com.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.Dao.Manager_OrdersDao;
import com.Utils.PageBean;
import com.entity.FOrder;
import com.entity.OrderDetail;
import com.service.ManagerOrdersService;
@Transactional
@Service
public class ManagerOrdersServiceImpl implements ManagerOrdersService {
	
	@Autowired
	Manager_OrdersDao MD;
	@SuppressWarnings("rawtypes")
	@Autowired
	PageBean pb;
	public static Integer start;
	/**
	 * size表示每页显示的个数，pageCode表示当前页
	 */
	@SuppressWarnings("unchecked")
	@Override
	public PageBean<FOrder> getOrders(Integer size,Integer PageCode) {
		// TODO Auto-generated method stub
		start = (PageCode-1)*size;
		List<FOrder> list = MD.getOrders(start, size);
		String hql = " select count(FOrder) from FOrder ";
		return (PageBean<FOrder>) this.setTopageBean(PageCode, size, hql, list);
	}
	@SuppressWarnings("unchecked")
	@Override
	public PageBean<FOrder> searchOrders(String key, String value, Integer PageCode, Integer size) {
		// TODO Auto-generated method stub
		start = (PageCode-1)*size;
		String hql;
		List<FOrder> list;
		value = "%"+value+"%";
		if(value.equals("")||key.equals(""))
		{
			hql = "select count(FOrder) from FOrder";
			list = MD.getOrders(start,size);
		}	
		hql = " select count(FOrder) from FOrder where "+key+"like"+value;
		list = MD.searchOrders(key, value, PageCode, size);
		return (PageBean<FOrder>) this.setTopageBean(PageCode, size, hql, list);
	}
	@Override
	public List<OrderDetail> searchOrderdetails(String orderId) {
		// TODO Auto-generated method stub
		List<OrderDetail> list = MD.searchOrderdetails(orderId);
		return list;
	}
	@SuppressWarnings("unchecked")
	@Override
	public PageBean<FOrder> searchOrders(Integer state, Integer size, Integer PageCode) {
		// TODO Auto-generated method stub
		start = (PageCode-1)*size;
		List<FOrder> list = MD.searchOrders(state, start, size);
		String hql = " select count(FOrder) from FOrder ";
		return (PageBean<FOrder>) this.setTopageBean(PageCode, size, hql, list);
	}
	@Override
	public List<FOrder> searchOrders(Integer state) {
		// TODO Auto-generated method stub
		return MD.searchOrders(state);
	}
	@Override
	public PageBean<FOrder> searchOrders(String key, String value, String state, Integer PageCode, Integer size) {
		// TODO Auto-generated method stub
		/*start = PageCode*size;
		if(value.equals(""))
		{
			if()
		}*/
		return null;
	}
	@SuppressWarnings("unchecked")
	@Override
	public PageBean<?> setTopageBean(Integer PageCode, Integer size, String hql,List<?> list) {
		// TODO Auto-generated method stub
		Integer count = MD.getTotalFOrder( hql);
		pb.setBeanList(list);
		pb.setTotalCount(new Long(count));
		pb.setPageCode(PageCode);
		pb.setPageSize(size);
		return pb;
	}
	@Override
	public int sendProduct(String orderid) {
		// TODO Auto-generated method stub
		FOrder fOrder = (FOrder) MD.getObject(FOrder.class, orderid);
		fOrder.setState(1);
		return MD.update(fOrder);
	}
	@Override
	public int HandleForderCancel(String orderid) {
		// TODO Auto-generated method stub
		FOrder fOrder = (FOrder) MD.getObject(FOrder.class, orderid);
		fOrder.setValidity(1);
		return MD.update(fOrder);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<FOrder> searchOrders(String key, String value) {
		// TODO Auto-generated method stub
		List<FOrder> list;
		value="%"+value+"%";
		if(value.equals("")||key.equals(""))
		{
			list = (List<FOrder>) MD.getList(FOrder.class);
		}
		list = MD.searchOrders(key, value);
		return list;
	}
	@Override
	public List<FOrder> getOrders() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<FOrder> searchOrders(String key, String value, Integer state) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<FOrder> getOrdersByPage(int index) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
