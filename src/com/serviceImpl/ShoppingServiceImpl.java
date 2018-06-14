package com.serviceImpl;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.Dao.ShopCartAndDetailDao;
import com.entity.FOrder;
import com.entity.Furniture;
import com.entity.Furniture_count;
import com.entity.OrderDetail;
import com.entity.Shopcart;
import com.entity.User;
import com.service.ShoppingService;

@Transactional
@Service
public class ShoppingServiceImpl implements ShoppingService{

	@Autowired
	private ShopCartAndDetailDao scad;
	
	@Override
	public int addUserShopCart(Shopcart shopcart) {
		// TODO Auto-generated method stub
		
		/*Date date=new Date();
    	DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	String time=format.format(date);
    	shopCartDetail.setAdddate(time);//设置时间
*/    	
		return scad.save(shopcart);
	}
	
	/**
	 * 通过userID返回一个购物车
	 */
	@Override
	public List<Shopcart> getUserShopcart(String userid) {
		// TODO Auto-generated method stub
		return scad.getShopcart(userid);
	}


	@Override
	public int deleteShopcartByscid(String scid) {
		// TODO Auto-generated method stub
		return scad.delShopCartByscid(scid);
	}

	@Override
	public int updataShopCart(Shopcart shopCart) {
		// TODO Auto-generated method stub
		return scad.update(shopCart);
	}

	@Override
	public Shopcart getShopcartByScid(String scid) {
		// TODO Auto-generated method stub
		return scad.getCartById(scid);
	}

	@Override
	public Double getAllMoney(List<Shopcart> shopcartlist) {
		// TODO Auto-generated method stub
		Double tem=0.0;
		for(Shopcart shopcart:shopcartlist) {
			tem=tem+shopcart.getTotalprice();
		}
		return tem;
	}

	@Override
	public Double getTotalPrice(Shopcart shopcart) {
		// TODO Auto-generated method stub
		return shopcart.getFurniture().getFprice()*shopcart.getQuantity();
	}

	@Override
	public List<OrderDetail> getUserOrderDetail(User user) {
		// TODO Auto-generated method stub
		List<Shopcart> shopcarts=scad.getShopcart(user.getUserid());
		
		List<OrderDetail> orderdetailsList=new ArrayList<OrderDetail>();
		
		for(Shopcart shopcart:shopcarts) {
			OrderDetail oDetail=new OrderDetail();
			oDetail.setFurniture(shopcart.getFurniture());
			oDetail.setQuantity(shopcart.getQuantity());
			oDetail.setAllmoney(shopcart.getTotalprice());
			orderdetailsList.add(oDetail);
		}
		return orderdetailsList;
	}

	@Override
	public Double getOrderTotalPrice(List<OrderDetail> list) {
		// TODO Auto-generated method stub
		Double tem=0.0;
		for(OrderDetail orderDetail:list) {
			tem=tem+orderDetail.getAllmoney();
		}
		return tem;
	}

	@Override
	public int addFOrder(FOrder forder) {
		// TODO Auto-generated method stub
		Date date=new Date();
    	DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	String time=format.format(date);
		forder.setBuydate(time);
		
		forder.setCancel("0");
		forder.setState(0);
		forder.setValidity(1);
		
		
		String remark=forder.getRemark();
		String receiptPeople=forder.getReceiptPeople();
		String receiptaddress=forder.getReceiptaddress();
		String receiptTel=forder.getReceiptTel();
		try {
			remark=new String(remark.getBytes("ISO-8859-1"), "UTF-8");
			receiptPeople=new String(receiptPeople.getBytes("ISO-8859-1"), "UTF-8");
			receiptaddress=new String(receiptaddress.getBytes("ISO-8859-1"), "UTF-8");
			receiptTel=new String(receiptTel.getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		forder.setRemark(remark);
		forder.setReceiptaddress(receiptaddress);
		forder.setReceiptPeople(receiptPeople);
		forder.setReceiptTel(receiptTel);
		
		return scad.save(forder);
	}

	@Override
	public int addAOrderDetail(OrderDetail orderDetail) {
		// TODO Auto-generated method stub
		return scad.save(orderDetail);
	}

	@Override
	public int updataFOrder(FOrder forder) {
		// TODO Auto-generated method stub
		return scad.update(forder);
	}

	@Override
	public int updataOrderDetail(OrderDetail orderDetail) {
		// TODO Auto-generated method stub
		return scad.update(orderDetail);
	}

	@Override
	public int addOrderDetail(List<OrderDetail> orderDetaillist,FOrder fOrder) {
		// TODO Auto-generated method stub
		for(OrderDetail orderDetail:orderDetaillist) {
			orderDetail.setfOrder(fOrder);
			scad.save(orderDetail);
		}
		return 1;
	}

	@Override
	public int deleteUserShopcart(User user) {
		// TODO Auto-generated method stub
		return scad.delShopcartByUser(user);
	}

	@Override
	public List<FOrder> getUserOrder(User user) {
		// TODO Auto-generated method stub
		
		return scad.getFOrderByUserid(user.getUserid());
	}

	@Override
	public List<OrderDetail> getOrderDetailByOrderid(String id) {
		// TODO Auto-generated method stub
		return scad.getDetailByDid(id);
	}

	@Override
	public FOrder getAOrderByorderid(String orderid) {
		// TODO Auto-generated method stub
		return scad.getOrderByOrderid(orderid);
	}

	@Override
	public int changeFCountAndSaleRecord(List<OrderDetail> orderDetaillist) {
		// TODO Auto-generated method stub
		for (OrderDetail orderDetail : orderDetaillist) {
			Furniture furniture=orderDetail.getFurniture();
			System.out.println(furniture.getFid());
			//家具本来的数量减去卖出的数量
			furniture.setFnum(furniture.getFnum()-orderDetail.getQuantity());
			scad.update(furniture);
			Date date=new Date();
			//DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    	DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
	    	String time=format.format(date);
			Furniture_count furniture_count=scad.getFCByFidAndDate(furniture.getFid(), time);
			if(furniture_count==null) {
				Furniture_count fc=new Furniture_count();
				fc.setFid(furniture.getFid());
				fc.setDate(time);
				fc.setSales(orderDetail.getQuantity());
				scad.save(fc);
			}else {
				furniture_count.setSales(furniture_count.getSales()+orderDetail.getQuantity());
				scad.update(furniture_count);
			}
		}
		return 1;
	}


}
