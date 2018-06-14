package com.DaoImpl;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Dao.AdminDao;
import com.entity.Admin;

@Repository
public class Furniture_countImpl implements AdminDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public Admin get(String adminname, String password) {
		String hql = "from Admin where adminname = ? and password =?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		
		query.setParameter(0, adminname);
		query.setParameter(1, password);
		
		Admin admin = (Admin) query.uniqueResult();
		
		return admin;
	}

}
