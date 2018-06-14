package com.DaoImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.Dao.Manager_FurnitureDao;
import com.entity.Furniture;

@Repository
public class Manager_FurntureDaoImpl extends BaseDaoImpl implements Manager_FurnitureDao {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Override
	public int deleteFurniture(String fid) {
		// TODO Auto-generated method stub
		String hql_2="delete from Furniture_count where fid =?";
		String hql_1="delete from Furniture where fid = ?";
		int a=hibernateTemplate.bulkUpdate(hql_1, new Object[]{ fid});
		int b=hibernateTemplate.bulkUpdate(hql_2, new Object[]{ fid});
		//hibernateTemplate.delete(sql);
		if(a+b == 2)
			return 1;
		return 0;
	}

	@Override
	public Furniture findFurnitureById(String fid) {
		// TODO Auto-generated method stub
		return (Furniture)hibernateTemplate.load(Furniture.class, fid);
	}

	@Override
	public List<Furniture> findFurnitureByName(String fname) {
		// TODO Auto-generated method stub
		String hql = "from Furniture where fname like = '%?%'";
		@SuppressWarnings("unchecked")
		List<Furniture> list = (List<Furniture>) hibernateTemplate.find(hql, fname);
		return list;
	}

	@Override
	public List<Furniture> findFurnitureByType(String ftype) {
		// TODO Auto-generated method stub
		String hql = "from Furniture where ftype = ?";
		@SuppressWarnings("unchecked")
		List<Furniture> list = (List<Furniture>) hibernateTemplate.find(hql, ftype);
		return list;
	}

	@Override
	public List<Furniture> findFurnitureByStyle(String fstyle) {
		// TODO Auto-generated method stub
		String hql = "from Furniture where fstyle = ?";
		@SuppressWarnings("unchecked")
		List<Furniture> list = (List<Furniture>) hibernateTemplate.find(hql, fstyle);
		return list;
	}
	
	/**
	 * 修改啊
	 */
	@Override
	public int updateFurniture(Furniture f) {
		// TODO Auto-generated method stub
		return 0;
	}

}
