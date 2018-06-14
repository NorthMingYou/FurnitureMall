package com.DaoImpl;
import java.util.Calendar;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.hibernate.Session;
import org.springframework.stereotype.Component;

import com.Dao.OrderDao;
import com.Utils.Constant;
import com.Utils.PageBean;
import com.entity.FOrder;

@Component
public class OrderDaoImpl extends BaseDaoImpl implements OrderDao{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public PageBean<FOrder> getOrderListByPage(int index) {
		PageBean<FOrder> page = new PageBean<FOrder>();
		page.setPageCode(index);
		page.setPageSize(Constant.ONE_PAGE_NUM);
		Session session = sessionFactory.getCurrentSession();
		
		//查询总记录数
		Long count = (Long) session.createQuery("select count(f) from FOrder f where f.validity=1").uniqueResult();
		page.setTotalCount(count);
		
		//按时间降序、分页查询
		Query query = session.createQuery("From FOrder where validity=1 order by buydate desc");
		query.setFirstResult((index-1)*page.getPageSize());//从第几条数据开始查询
		
        query.setMaxResults(page.getPageSize());//每页显示多少条数据
        
        @SuppressWarnings("unchecked")
		List<FOrder> list = query.list();
        
        for (FOrder furniture : list) {
			System.out.println(furniture);
		}
		
		page.setBeanList(list);
		
		return page;
	}

	/**
	 * 查看某个用户的订单
	 */

	@Override
	public PageBean<FOrder> getOrderListByPageForUser(int index, String name) {
		PageBean<FOrder> page = new PageBean<FOrder>();
		page.setPageCode(index);
		page.setPageSize(Constant.ONE_PAGE_NUM);
		Session session = sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("select count(*) from FOrder where fname like ? ");
		query.setString(0, "%"+name+"%");
		//查询总记录数
		Long count = (Long)query.uniqueResult();
	
		page.setTotalCount(count);
		
		//按时间降序、分页查询
		query = session.createQuery("From Furniture where fname like ? order by date desc");
		
		query.setString(0, "%"+name+"%");
		
		query.setFirstResult((index-1)*page.getPageSize());//从第几条数据开始查询
		
        query.setMaxResults(page.getPageSize());//每页显示多少条数据
        
        @SuppressWarnings("unchecked")
		List<FOrder> list = query.list();
        
		
		page.setBeanList(list);
		
		return page;
	}

	
	/**
	 * 查看某个状态下的订单
	 */

	@Override
	public PageBean<FOrder> getOrderListByState(int index, int state) {
		
		PageBean<FOrder> page = new PageBean<FOrder>();
		page.setPageCode(index);
		page.setPageSize(Constant.ONE_PAGE_NUM);
		Session session = sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("select count(*) from FOrder where validity=1 and state=? ");
		query.setInteger(0, state);
		//查询总记录数
		Long count = (Long)query.uniqueResult();
		page.setTotalCount(count);
		
		//按时间降序、分页查询
		query = session.createQuery("From FOrder where validity=1 and state=? order by buydate desc");
		
		query.setInteger(0, state);
		
		query.setFirstResult((index-1)*page.getPageSize());//从第几条数据开始查询
		
        query.setMaxResults(page.getPageSize());//每页显示多少条数据
        
        @SuppressWarnings("unchecked")
		List<FOrder> list = query.list();
        
//        for (Furniture furniture : list) {
//			System.out.println(furniture);
//		}
		
		page.setBeanList(list);
		
		return page;
	}

	@Override
	public FOrder getOrder(String orderId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("From FOrder where orderid=?");
		query.setString(0, orderId);
		FOrder fOrder = (FOrder) query.uniqueResult();
		
		Hibernate.initialize(fOrder.getOrderDetails());
		
		return fOrder;
	}

	@Override
	public List<FOrder> getOrderIsCancel() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("From FOrder f where f.cancel=1 and f.validity=1");
		
		@SuppressWarnings("unchecked")
		List<FOrder> forderList = query.list();
		for (FOrder fOrder : forderList) {
			
			//为了处理懒加载异常，初始化集合属性
			Hibernate.initialize(fOrder.getOrderDetails());
		}
		
		return forderList;
	}

	@Override
	public PageBean<FOrder> getFOrderListByToday(int index) {
		PageBean<FOrder> page = new PageBean<FOrder>();
		page.setPageCode(index);
		page.setPageSize(Constant.ONE_PAGE_NUM);
		Session session = sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("select count(*) from FOrder where validity=1 and buydate like ? ");
		
		//获取当前年月分
		Calendar c = Calendar.getInstance();//可以对每个时间域单独修改   
		int year = c.get(Calendar.YEAR);  
		int month = c.get(Calendar.MONTH)+1;
		String newmoth = month+"";
		if(month <10) {
			newmoth = "0"+newmoth;
		}
//		int date = c.get(Calendar.DATE)-1;
		int date = c.get(Calendar.DATE);
		String newd = date+"";
		if(date <10) {
			newd = "0"+newd;
		}
		System.out.println("年月："+year+month);
		String time = year+"-"+newmoth+"-"+newd+"%";
		System.out.println("时间==="+time);
		query.setString(0, time);
		
		//查询总记录数
		Long count = (Long)query.uniqueResult();
		page.setTotalCount(count);
		
		//按时间降序、分页查询
		query = session.createQuery("From FOrder where validity=1 and buydate like ? order by buydate desc");
		query.setString(0, time);
		
		query.setFirstResult((index-1)*page.getPageSize());//从第几条数据开始查询
		
        query.setMaxResults(page.getPageSize());//每页显示多少条数据
        
        @SuppressWarnings("unchecked")
		List<FOrder> list = query.list();
        
//        for (Furniture furniture : list) {
//			System.out.println(furniture);
//		}
		
		page.setBeanList(list);
		
		return page;
	}
		
}
