package com.DaoImpl;

import java.util.Calendar;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.Dao.Furniture_countDao;
import com.entity.Furniture_count;

@SuppressWarnings("deprecation")
@Repository
public class Furniture_countDaoImpl extends BaseDaoImpl implements Furniture_countDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Transactional(readOnly = true)
	public List<Furniture_count> getTop10() {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Furniture_count.class);
		
		criteria.addOrder(Order.desc("sales"));//按銷量獲取前十
		
		//获取当前年月分
		Calendar c = Calendar.getInstance();//可以对每个时间域单独修改   
		int year = c.get(Calendar.YEAR);  
		int month = c.get(Calendar.MONTH)+1;
		System.out.println("年月："+year+month);
		String time = year+"-"+"%"+month+"-%";
 
        criteria.add(Expression.or(Expression.like("date",time)));

    
		criteria.setMaxResults(10);//設置查詢10條記錄
		
		@SuppressWarnings("unchecked")
		List<Furniture_count> list = criteria.list();
		
		return list;
	}

	@Override
	public Furniture_count get(String id,String date) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("From Furniture_count where fid=? and date like ?");
		query.setString(0, id);
		query.setString(1, date+"%");
		
		Furniture_count fc = (Furniture_count) query.uniqueResult();
		
		return fc;
	}

}
