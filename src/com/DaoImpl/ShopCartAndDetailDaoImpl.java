package com.DaoImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.Dao.ShopCartAndDetailDao;
import com.entity.FOrder;
import com.entity.Furniture_count;
import com.entity.OrderDetail;
import com.entity.Shopcart;
import com.entity.User;

@Component
public class ShopCartAndDetailDaoImpl extends BaseDaoImpl implements ShopCartAndDetailDao{

	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Shopcart> getShopcart(String userid) {
		// TODO Auto-generated method stub
		String hql = "from Shopcart where userid=?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter(0, userid);
		@SuppressWarnings("unchecked")
		List<Shopcart> shopcart=(List<Shopcart>) query.list();
		return shopcart;
	}

	@Override
	public int delShopCartByscid(String scid) {
		// TODO Auto-generated method stub
		String hql_1="delete from Shopcart where scid =?";
		int a=hibernateTemplate.bulkUpdate(hql_1, new Object[]{ scid});
		if(a>0)
			return 1;
		else 
			return 0;
	}


	@Override
	public Shopcart getCartById(String scid) {
		// TODO Auto-generated method stub
		String hql="from Shopcart where scid=?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter(0, scid);
		Shopcart shopcart=(Shopcart) query.uniqueResult();
		return shopcart;
	}

	@Override
	public int delShopcartByUser(User user) {
		// TODO Auto-generated method stub
		String hql_1="delete from Shopcart where userid =?";
		int a=hibernateTemplate.bulkUpdate(hql_1, new Object[]{ user.getUserid()});
		if(a>0)
			return 1;
		else 
			return 0;
	}

	@Override
	public List<FOrder> getFOrderByUserid(String userid) {
		// TODO Auto-generated method stub
		String hql = "from FOrder where userid=? order by buydate desc";
		
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter(0, userid);
		
		@SuppressWarnings("unchecked")
		List<FOrder> list =query.list();
		
		return list;
	}

	@Override
	public List<OrderDetail> getDetailByDid(String orderid) {
		// TODO Auto-generated method stub
		String hql = "from OrderDetail where orderid=?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter(0, orderid);
		
		@SuppressWarnings("unchecked")
		List<OrderDetail> list =query.list();
		
		return list;
	}

	@Override
	public FOrder getOrderByOrderid(String orderid) {
		// TODO Auto-generated method stub
		String hql="from FOrder where orderid=?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter(0, orderid);
		FOrder order=(FOrder) query.uniqueResult();
		return order;
	}

	@Override
	public Furniture_count getFCByFidAndDate(String fid, String date) {
		// TODO Auto-generated method stub
		String hql="from Furniture_count where fid=? and date=?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter(0, fid);
		query.setParameter(1, date);
		Furniture_count furniture_count=(Furniture_count) query.uniqueResult();
		return furniture_count;
	}

}
