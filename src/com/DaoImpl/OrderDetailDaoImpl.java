package com.DaoImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Dao.OrderDetailDao;
import com.entity.OrderDetail;

@Repository
public class OrderDetailDaoImpl implements OrderDetailDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<OrderDetail> get(String orderId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("From OrderDetail where fOrder=?");
		query.setString(0, orderId);
		
		return query.list();
	}

}
