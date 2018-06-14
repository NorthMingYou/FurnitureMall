package com.Dao;

import java.util.List;

import com.Dao.BaseDao;
import com.entity.Furniture;
import com.Utils.PageBean;

public interface FurnitureDao extends BaseDao{

	PageBean<Furniture> getProductListByPage(int index);

	PageBean<Furniture> getProductListByPageForLike(int index,String name);

	PageBean<Furniture> getProductListByState(int index, int state);
	
	public List<Furniture> getFurnitureByType(String ftype);//通过类型查找商品
	
	public List<Furniture> getFurnitureByStyle(String fstyle);
	
	public List<Furniture> getFurnitureByTandS(String ftype,String fstyle);
	
	public Furniture getFurnitureById(String fid);
	
	PageBean<Furniture> getFurnitureBypageftype(int index,String ftype);
	
	PageBean<Furniture> getFurnitureBypagetands(int index,String ftype,String fstyle);
	
	PageBean<Furniture> getFurnitureBypagesearch(int index,String fname);
}
