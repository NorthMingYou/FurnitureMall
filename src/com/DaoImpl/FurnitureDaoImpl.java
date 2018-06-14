package com.DaoImpl;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.hibernate.Session;
import org.springframework.stereotype.Component;

import com.Dao.FurnitureDao;
import com.entity.Furniture;
import com.Utils.Constant;
import com.Utils.PageBean;

@Component
public class FurnitureDaoImpl extends BaseDaoImpl implements FurnitureDao{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public PageBean<Furniture> getProductListByPage(int index) {
		PageBean<Furniture> page = new PageBean<Furniture>();
		page.setPageCode(index);
		page.setPageSize(Constant.ONE_PAGE_NUM);
		Session session = sessionFactory.getCurrentSession();
		
		//查询总记录数
		Long count = (Long) session.createQuery("select count(f) from Furniture f ").uniqueResult();
		page.setTotalCount(count);
		
		//按时间降序、分页查询
		Query query = session.createQuery("From Furniture order by date desc");
		query.setFirstResult((index-1)*page.getPageSize());//从第几条数据开始查询
		
        query.setMaxResults(page.getPageSize());//每页显示多少条数据
        
        @SuppressWarnings("unchecked")
		List<Furniture> list = query.list();
        
        for (Furniture furniture : list) {
			System.out.println(furniture);
		}
		
		page.setBeanList(list);
		
		return page;
	}
	
	@Override
	public PageBean<Furniture> getProductListByPageForLike(int index, String name) {
		PageBean<Furniture> page = new PageBean<Furniture>();
		page.setPageCode(index);
		
		page.setPageSize(Constant.ONE_PAGE_NUM);
		Session session = sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("select count(*) from Furniture where fname like ? ");
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
		List<Furniture> list = query.list();
        
        for (Furniture furniture : list) {
			System.out.println(furniture);
		}
		
		page.setBeanList(list);
		
		return page;
	}
	@Override
	public PageBean<Furniture> getProductListByState(int index, int state) {
		
		PageBean<Furniture> page = new PageBean<Furniture>();
		page.setPageCode(index);
		page.setPageSize(Constant.ONE_PAGE_NUM);
		Session session = sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("select count(*) from Furniture where isdropoff=? ");
		query.setInteger(0, state);
		//查询总记录数
		Long count = (Long)query.uniqueResult();
		page.setTotalCount(count);
		
		//按时间降序、分页查询
		query = session.createQuery("From Furniture where isdropoff=? order by date desc");
		
		query.setInteger(0, state);
		
		query.setFirstResult((index-1)*page.getPageSize());//从第几条数据开始查询
		
        query.setMaxResults(page.getPageSize());//每页显示多少条数据
        
        @SuppressWarnings("unchecked")
		List<Furniture> list = query.list();
        
//        for (Furniture furniture : list) {
//			System.out.println(furniture);
//		}
		
		page.setBeanList(list);
		
		return page;
	}
	
	@Override
	public PageBean<Furniture> getFurnitureBypagesearch(int index,String fname){
		PageBean<Furniture> page = new PageBean<Furniture>();
		page.setPageCode(index);
		page.setPageSize(Constant.ONE_PAGE_NUM);
		Session session = sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("select count(*) from Furniture where fname like ? and isdropoff=1");
		query.setString(0, "%"+fname+"%");
		//查询总记录数
		Long count = (Long)query.uniqueResult();
		page.setTotalCount(count);
		
		//分页模糊查询
		query = session.createQuery("from Furniture where fname like ? and isdropoff='1'");
		
		query.setString(0, "%"+fname+"%");
		
		query.setFirstResult((index-1)*page.getPageSize());//从第几条数据开始查询
		
        query.setMaxResults(page.getPageSize());//每页显示多少条数据
        
        @SuppressWarnings("unchecked")
		List<Furniture> list = query.list();
        
		page.setBeanList(list);
		
		return page;
	}
		
	@Override
	public List<Furniture> getFurnitureByType(String ftype){
		
		String hql = "from Furniture where ftype=? and isdropoff='1'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter(0, ftype);
		
		//query.uniqueResult()只能返回一条数据
		@SuppressWarnings("unchecked")
		List<Furniture> list =query.list();
		return list;
	}
	
	@Override
	public PageBean<Furniture> getFurnitureBypageftype(int index,String ftype){
		
		PageBean<Furniture> page = new PageBean<Furniture>();
		page.setPageCode(index);
		page.setPageSize(Constant.ONE_PAGE_NUM);
		Session session = sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("select count(*) from Furniture where ftype=? and isdropoff='1'");
		query.setParameter(0, ftype);
		Long count = (Long)query.uniqueResult();
		page.setTotalCount(count);
		
		query = session.createQuery("From Furniture where ftype=? and isdropoff='1'");
		
		query.setParameter(0, ftype);
		
		query.setFirstResult((index-1)*page.getPageSize());//从第几条数据开始查询
		
        query.setMaxResults(page.getPageSize());//每页显示多少条数据
        
        @SuppressWarnings("unchecked")
		List<Furniture> list = query.list();
		page.setBeanList(list);
		
		return page;
	}
	
	@Override
	public PageBean<Furniture> getFurnitureBypagetands(int index,String ftype,String fstyle ){
		PageBean<Furniture> page = new PageBean<Furniture>();
		page.setPageCode(index);
		page.setPageSize(Constant.ONE_PAGE_NUM);
		Session session = sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("select count(*) from Furniture where ftype=? and fstyle=? and isdropoff='1'");
		query.setParameter(0, ftype);
		query.setParameter(1, fstyle);
		Long count = (Long)query.uniqueResult();
		page.setTotalCount(count);
		
		query = session.createQuery("From Furniture where ftype=? and fstyle=? and isdropoff='1'");
		
		query.setParameter(0, ftype);
		query.setParameter(1, fstyle);
		
		query.setFirstResult((index-1)*page.getPageSize());//从第几条数据开始查询
		
        query.setMaxResults(page.getPageSize());//每页显示多少条数据
        
        @SuppressWarnings("unchecked")
		List<Furniture> list = query.list();
		page.setBeanList(list);
		
		return page;
	}
	
	@Override
	public List<Furniture> getFurnitureByStyle(String fstyle){
		
		String hql = "from Furniture where fstyle=? and isdropoff='1'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter(0, fstyle);
		@SuppressWarnings("unchecked")
		List<Furniture> list =query.list();
		return list;
	}
	
	public Furniture getFurnitureById(String fid) {
		String hql = "from Furniture where fid=?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter(0, fid);
		Furniture f = (Furniture) query.uniqueResult();
		return f;
	}
	
	public List<Furniture> getFurnitureByTandS(String ftype,String fstyle){
		String hql = "from Furniture where ftype=? and fstyle=? and isdropoff='1'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter(0, ftype);
		query.setParameter(1, fstyle);
		@SuppressWarnings("unchecked")
		List<Furniture> list =query.list();  
		return list;
	}
		
}
