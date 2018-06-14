package com.Dao;

import java.util.List;

import com.entity.FOrder;
import com.entity.Furniture_count;
import com.entity.OrderDetail;
import com.entity.Shopcart;
import com.entity.User;

public interface ShopCartAndDetailDao extends BaseDao{

	
	//int addShopCartDetail(ShopCartDetail shopCartDetail);
	
	List<Shopcart> getShopcart(String userid);
	
	int delShopCartByscid(String scid);
	
	
	Shopcart getCartById(String scid);
	
	int delShopcartByUser(User user);
	
	
	List<FOrder> getFOrderByUserid(String id);
	
	List<OrderDetail> getDetailByDid(String id);
	
	FOrder getOrderByOrderid(String orderid);
	
	
	Furniture_count getFCByFidAndDate(String fid,String date);
}
