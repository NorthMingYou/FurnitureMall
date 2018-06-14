package com.DaoImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.Dao.UserDao;
import com.entity.User;

@Repository
public class UserDaoImpl extends BaseDaoImpl implements UserDao{

	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public int checkPhoneExist(String phone) {
		// TODO Auto-generated method stub
		
		@SuppressWarnings("unchecked")
		List<User> uu=(List<User>) hibernateTemplate.find("from User where phone = ?", phone); 
		
		if(uu.isEmpty())
			return 0;
		
		return 1;
	}

	@Override
	public User getAUserByPhone(String phone) {
		// TODO Auto-generated method stub
		String hql = "from User where phone=?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		
		query.setParameter(0, phone);
		User user=(User) query.uniqueResult();
		
		return user;
	}

	@Override
	public User getAUserById(String userid) {
		@SuppressWarnings("unchecked")
		List<User> uu=(List<User>) hibernateTemplate.find("from User where userid = ?", userid); 
		return uu.get(0);
	}

	@Override
	public User getAUserByPhoneAndPassword(String phone, String password) {
		// TODO Auto-generated method stub
		String hql = "from User where phone=? and password=?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		
		query.setParameter(0, phone);
		query.setParameter(1, password);
		User user=(User) query.uniqueResult();
		/*String hql1= "from User where phone=? and password=?";                 
		List<User> uu=(List<User>) hibernateTemplate.find(hql, new String[]{phone, password}); */
		return user;
	}

	

}
