package com.DaoImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.Dao.StaticDao;

@Repository
public class StaticDaoImpl implements StaticDao {
	
	@Autowired
	private SessionFactory sessionFactory; 
	/**
	 * 
	SELECT fprice*sales, fprice, sales,ftype
	 				FROM furniture f, furniture_count fc 
					WHERE f.fid = fc.fid AND f.fstyle="复古" AND fc.date LIKE "2018-%6-%";
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	@Transactional(readOnly = true)
	public List getSaleByDateAndType(String year, String month, String style) {
		
		List list = new ArrayList();
		Session session = sessionFactory.getCurrentSession();
		
		String[] ftyle = {"床","沙发","椅子","桌子"};
		
		//模糊字符2018-%6-%
		String yearAndMonth = year+"-"+"%"+month+"-%";
//		SELECT SUM(fc.sales * f.fprice)
		
		for (String string : ftyle) {
			String sql = "SELECT SUM(fc.sales) "
					+ "FROM furniture f, furniture_count fc "
					+ "WHERE f.fid = fc.fid AND f.fstyle= '"+style+"' "
							+ "AND fc.date LIKE '"+yearAndMonth+"' AND fc.sales>0 AND f.ftype='"+string+"'";
			System.out.println(sql);
			SQLQuery sqlQuery = session.createSQLQuery(sql);

			Object res = sqlQuery.uniqueResult();
			
			
			System.out.println("Dao---"+res);
			
			//如果返回值为空的话则表明为零
			if(res == null) {
				list.add(0);
			}
			else{
				list.add(res);
			}
		}
		
		return list;
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	@Transactional(readOnly = true)
	public List getIncomeByDate(String year, String month) {
		List list = new ArrayList();
		Session session = sessionFactory.getCurrentSession();
		
		String[] ftyle = {"床","沙发","椅子","桌子"};
		
		//模糊字符2018-%6-%
		String yearAndMonth = year+"-"+"%"+month+"-%";
//		SELECT SUM(fc.sales * f.fprice)
		
		for (String string : ftyle) {
			String sql = "SELECT SUM(fc.sales * f.fprice) "
					+ "FROM furniture f, furniture_count fc "
					+ "WHERE f.fid = fc.fid "
							+ "AND fc.date LIKE '"+yearAndMonth+"' AND fc.sales>0 AND f.ftype='"+string+"'";
			System.out.println(sql);
			SQLQuery sqlQuery = session.createSQLQuery(sql);

			
			Object res = sqlQuery.uniqueResult();
			
			System.out.println("Dao hhhh---"+res);
			
			//如果返回值为空的话则表明为零
			if(res == null) {
				list.add(0);
			}
			else{
				list.add(res);
			}
		}
		
		return list;
	}
}
