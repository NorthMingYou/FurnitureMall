package com.DaoImpl;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.Dao.Manager_OrdersDao;
import com.entity.FOrder;
import com.entity.OrderDetail;
@Repository
public class Manager_OrdersDaoImpl extends BaseDaoImpl implements Manager_OrdersDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<FOrder> searchOrders(String key, String value, Integer start, Integer size) {
		// TODO Auto-generated method stub
		//hibernateTemplate 的 execute 方法，通过回调获得session
		return (List<FOrder>) hibernateTemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session)throws HibernateException {
				String hql = "from FOrder where ? like ?";  
                Query query = session.createQuery(hql);  
                query.setParameter(0, key);
                query.setParameter(1, value);
                query.setFirstResult(start);
                query.setMaxResults(size);
                return query.list();
			}
		});
	}
	@Override
	public List<OrderDetail> searchOrderdetails(String orderId) {
		// TODO Auto-generated method stub
		String hql = "from bean.orderDetails where orderid = ?";
		@SuppressWarnings("unchecked")
		List<OrderDetail> list = (List<OrderDetail>) hibernateTemplate.find(hql, orderId);
		return list ;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public Integer getTotalFOrder(String hql) {
		
		// TODO Auto-generated method stub
		return  (Integer) hibernateTemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session)throws HibernateException {
                Query query = session.createQuery(hql);  
                Integer count = (Integer) query.uniqueResult();
                return count; 	
			}
		});
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<FOrder> searchOrders(Integer state) {
		// TODO Auto-generated method stub
		String hql = "from FOrder where state = ?";
		return (List<FOrder>) hibernateTemplate.find(hql, state);
	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<FOrder> searchOrders(Integer state, Integer start, Integer size) {
		// TODO Auto-generated method stub
		return (List<FOrder>) hibernateTemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session)throws HibernateException {
				String hql = "from FOrder where state = ?";  
                Query query = session.createQuery(hql);  
                query.setParameter(0, state);
                query.setFirstResult(start);
                query.setMaxResults(size);
                return query.list(); 	
			}
		});
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<FOrder> searchOrders(String key, String value, Integer state, Integer start, Integer size) {
		// TODO Auto-generated method stub
		return (List<FOrder>) hibernateTemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session)throws HibernateException {
				String hql = "from FOrder where ? like ? and state = ?";  
                Query query = session.createQuery(hql);
                query.setParameter(0, key);
                query.setParameter(1, value);
                query.setParameter(2, state);
                query.setFirstResult(start);
                query.setMaxResults(size);
                return query.list(); 	
			}
		});
	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<FOrder> getOrders(Integer start, Integer size) {
		// TODO Auto-generated method stub
		return (List<FOrder>) hibernateTemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session)throws HibernateException {
				String hql = "from FOrder";  
                Query query = session.createQuery(hql);
                query.setFirstResult(start);
                query.setMaxResults(size);
                return query.list(); 	
			}
		});
	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<FOrder> searchOrders(String key, String value) {
		// TODO Auto-generated method stub
		return (List<FOrder>) hibernateTemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session)throws HibernateException {
				String hql = "from FOrder where ? like ?";  
                Query query = session.createQuery(hql);  
                query.setParameter(0, key);
                query.setParameter(1, value);
                return query.list();
			}
		});
	}
}
