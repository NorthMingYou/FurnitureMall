package com.serviceImpl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.Dao.FurnitureDao;
import com.Dao.Manager_FurnitureDao;
import com.Utils.PageBean;
import com.entity.Furniture;
import com.entity.Furniture_count;
import com.service.FurnitureService;

@Service
@Transactional
public class FurnitureServiceImpl implements FurnitureService {

	@Autowired
	private Manager_FurnitureDao manager_furnitureDao;
	
	@Autowired
	private FurnitureDao furnitureDao;
	
	@Override
	public void addFurniture(Furniture f) {
		//获取当前服务器的时间
		Date date=new Date();
    	DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	//DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	String time=format.format(date);
    	f.setDate(time);
    	
		manager_furnitureDao.save(f);
	}

	@Override
	public Furniture get(String fid) {
		// TODO Auto-generated method stub

		Furniture f = (Furniture) furnitureDao.getFurnitureById(fid);
		return f;

	}

	@Override
	public void addFurniture_count(Furniture_count fc) {
		// TODO Auto-generated method stub
		manager_furnitureDao.save(fc);
	}

	@Override
	public List<Furniture> getAllFurniture() {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		List<Furniture> list=(List<Furniture>)manager_furnitureDao.getList(Furniture.class);
		
		return list;
	}

	@Override
	public List<Furniture> getAPageFurniture(int page) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<Furniture> getFurniturebyftype(String ftype){
		
		List<Furniture> list=(List<Furniture>)furnitureDao.getFurnitureByType(ftype);
		
		return list;
	}
	@Override
	public List<Furniture> getFurniturebyfstyle(String fstyle){
		List<Furniture> list=(List<Furniture>)furnitureDao.getFurnitureByStyle(fstyle);
		return list;
	}
	
	@Override
	public List<Furniture> getFurniturebytands(String ftype,String fstyle){
		List<Furniture> list=(List<Furniture>)furnitureDao.getFurnitureByTandS(ftype,fstyle);
		return list;
	}
	
	@Override
	public PageBean<Furniture> getFurnitureByPageFtype(int index,String ftype){
		return furnitureDao.getFurnitureBypageftype(index,ftype);
	}
	
	@Override
	public PageBean<Furniture> getFurnitureByPageTandS(int index,String ftype,String fstyle){
		return furnitureDao.getFurnitureBypagetands(index,ftype,fstyle);
	}
	
	@Override
	public PageBean<Furniture>getFurnitureByPageSearch(int index,String fname){
		return furnitureDao.getFurnitureBypagesearch(index,fname);
	}
	
	@Override
	public PageBean<Furniture> getProductListByPage(int index) {
		// TODO Auto-generated method stub
		return furnitureDao.getProductListByPage(index);
	}

	@Override
	public PageBean<Furniture> getProductListByPageForLike(int index, String name) {
		// TODO Auto-generated method stub
		return furnitureDao.getProductListByPageForLike(index,name);
	}

	@Override
	public void update(Furniture furniture) {
		// TODO Auto-generated method stub
		furnitureDao.update(furniture);
	}

	@Override
	public PageBean<Furniture> getProductListByState(int index, int state) {
		// TODO Auto-generated method stub
		return furnitureDao.getProductListByState(index,state);
	}

}
