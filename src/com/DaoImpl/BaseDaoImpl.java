package com.DaoImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.Dao.BaseDao;
@Repository
public class BaseDaoImpl implements BaseDao {
	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Override
	public int save(Object object) {
		// TODO Auto-generated method stub
		try {
			hibernateTemplate.save(object);
			return 1;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public int delete(Object object) {
		// TODO Auto-generated method stub
		try {
			hibernateTemplate.delete(object);
			return 1;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public List<?> getList(Class<?> clas) {
		// TODO Auto-generated method stub
		List<?> list = hibernateTemplate.loadAll(clas);
		return list;
	}

	@Override
	public int update(Object object) {
		// TODO Auto-generated method stub
		try {
			hibernateTemplate.update(object);
			return 1;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
			
		}
	}

	@Override
	public Object getObject(Class<?> clas,String mainKey) {
		// TODO Auto-generated method stub
		try {
			return hibernateTemplate.get(clas,mainKey);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
}
