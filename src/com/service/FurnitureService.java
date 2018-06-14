package com.service;

import java.util.List;

import com.Utils.PageBean;
import com.entity.Furniture;
import com.entity.Furniture_count;

public interface FurnitureService {
	
	/**
	 * 添加商品
	 * @param f
	 * @param fc
	 */
	public void addFurniture(Furniture f);
	
	/**先添加商品
	 * 在添加数量
	 * 
	 */
	public void addFurniture_count(Furniture_count fc);
	

	/**
	 * 根据商品id获取商品具体信息
	 * @param fid 
	 * @return
	 */
	public Furniture get(String fid);
	
	/**
	 * 获取所有家具
	 * @return
	 */
	public List<Furniture> getAllFurniture();
	
	
	/**
	 * 获取一页的家具
	 * @param page
	 * @return
	 */
	public List<Furniture> getAPageFurniture(int page);
	
	/**
	 * 获取家具通过家具类型
	 * @param ftype
	 * @return
	 */
	public List<Furniture> getFurniturebyftype(String ftype);
	
	public List<Furniture> getFurniturebyfstyle(String fstyle);
	
	public List<Furniture> getFurniturebytands(String ftype,String fstyle);
	
	/**
	 * 分页查询商品列表
	 * 
	 * @param index
	 * @return
	 */
	public PageBean<Furniture> getFurnitureByPageFtype(int index,String ftype);
	
	public PageBean<Furniture> getFurnitureByPageTandS(int index,String ftype,String fstyle);
	
	public PageBean<Furniture> getProductListByPage(int index);

	public PageBean<Furniture> getProductListByPageForLike(int index, String name);

	public PageBean<Furniture> getFurnitureByPageSearch(int index,String fname);
	
	public void update(Furniture furniture);
	
	/**
	 * 
	 * @param index
	 * @param state 商品上下架状态  1上架 0下架
	 * @return
	 */
	public PageBean<Furniture> getProductListByState(int index, int state);
}
