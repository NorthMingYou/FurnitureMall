package com.Controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.Furniture;
import com.entity.Shopcart;
import com.entity.User;
import com.service.FurnitureService;
import com.service.ShoppingService;

@Controller
public class ShoppingController {
	
	
	@Autowired
	private ShoppingService shoppingservice;
	
	@Autowired
	private FurnitureService furnitureservice;
	
	
	
	public static String getUUID(){
        UUID uuid=UUID.randomUUID();
        String str = uuid.toString(); 
        String uuidStr=str.replace("-", "");
        return uuidStr;
	}
	
	
	@RequestMapping("/loadShopCart")
	@ResponseBody
	public List<Shopcart> loadShopCart(HttpServletRequest request){
		
		@SuppressWarnings("unchecked")
		List<Shopcart> shoppinglist=(List<Shopcart>) request.getSession().getAttribute("shoppinglist");
		
		if(shoppinglist==null||shoppinglist.isEmpty()||shoppinglist.size()==0) {
			request.getSession().removeAttribute("shoppinglist");
			request.getSession().removeAttribute("shopCount");
			return null;
		}
		else {
			request.getSession().setAttribute("shoppinglist", shoppinglist);
			request.getSession().setAttribute("shopCount", shoppinglist.size());
			return shoppinglist;
		}
	}
	
	
	/**
	 * 添加到购物车
	 * @param f
	 * @param count
	 * @return
	 */
	@RequestMapping("/addToShopCart")
	@ResponseBody
	public List<Shopcart> addTocart(String fid,Integer count,HttpServletRequest request) throws IOException {
		
		Furniture f=furnitureservice.get(fid);
		Shopcart shopcart=new Shopcart();
		shopcart.setFurniture(f);//设置家具
		shopcart.setQuantity(count);//设置数量
		
		/*Double totalprice=f.getFprice()*count;//计算总价*/
		shopcart.setTotalprice(shoppingservice.getTotalPrice(shopcart));
		Date date=new Date();
    	DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	String time=format.format(date);
    	shopcart.setAdddate(time);
		
		User user=(User) request.getSession().getAttribute("user");//查看用户是否登录
		if(user!=null) {//加入用户已经登录了，则，
			shopcart.setUser(user);
			shoppingservice.addUserShopCart(shopcart);//最后保存到数据库
		}
		else {
			String uuid=getUUID();
			shopcart.setScid(uuid);
		}
		//没登录就不必要存到数据库了
		//接下来把购物车保存到session中
		@SuppressWarnings("unchecked")
		List<Shopcart> shoppinglist=(List<Shopcart>) request.getSession().getAttribute("shoppinglist");
		
		if(shoppinglist==null||shoppinglist.isEmpty()||shoppinglist.equals(null)) {
			List<Shopcart> sclist= new ArrayList<Shopcart>();
			sclist.add(shopcart);
			Double allmonry=shoppingservice.getAllMoney(sclist);
			request.getSession().setAttribute("allmonry", allmonry);
			request.getSession().setAttribute("shoppinglist", sclist);
			request.getSession().setAttribute("shopCount", sclist.size());
			return sclist;
		}
		else {
			shoppinglist.add(shopcart);
			Double allmonry=shoppingservice.getAllMoney(shoppinglist);
			request.getSession().setAttribute("allmonry", allmonry);
			request.getSession().setAttribute("shoppinglist", shoppinglist);
			request.getSession().setAttribute("shopCount", shoppinglist.size());
			return shoppinglist;
		}
		
	}
	
	

	@RequestMapping("/removeFormShopcart")
	@ResponseBody
	public List<Shopcart>  deleteFormCart(String scid,HttpServletRequest request) throws IOException{
		
		User user=(User) request.getSession().getAttribute("user");//查看用户是否登录
		if(user!=null) {
			shoppingservice.deleteShopcartByscid(scid);//直接根据id删除
			List<Shopcart> ushopcart=shoppingservice.getUserShopcart(user.getUserid());
			
			if(ushopcart!=null) {
				Double allmonry=shoppingservice.getAllMoney(ushopcart);
				request.getSession().setAttribute("allmonry", allmonry);
				request.getSession().setAttribute("shoppinglist", ushopcart);
				request.getSession().setAttribute("shopCount", ushopcart.size());
				return ushopcart;
			}else {
				
				request.getSession().setAttribute("allmonry", 0);
				request.getSession().removeAttribute("shoppinglist");
				request.getSession().removeAttribute("shopCount");
				return null;
			}
			
			
			
			
		}
		else {
			@SuppressWarnings("unchecked")
			List<Shopcart> shoppinglist=(List<Shopcart>) request.getSession().getAttribute("shoppinglist");
			
			Iterator<Shopcart> it = shoppinglist.iterator();
			while(it.hasNext()){
				Shopcart x = it.next();
			    if(x.getScid().equals(scid)){
			        it.remove();
			    }
			}
			
			
			if(shoppinglist.isEmpty()||shoppinglist.size()==0) {
				request.getSession().setAttribute("allmonry", 0);
				request.getSession().removeAttribute("shoppinglist");
				request.getSession().removeAttribute("shopCount");
				return null;
			}
			else {
				Double allmonry=shoppingservice.getAllMoney(shoppinglist);
				request.getSession().setAttribute("allmonry", allmonry);
				request.getSession().setAttribute("shoppinglist", shoppinglist);
				request.getSession().setAttribute("shopCount", shoppinglist.size());
				return shoppinglist;
			}
			
		}
		
	}
	
	
	@RequestMapping("/updataShopcartNum")
	@ResponseBody
	public List<Shopcart> changeNum(Integer num,String scid,HttpServletRequest request) throws IOException {
		User user=(User) request.getSession().getAttribute("user");//查看用户是否登录
		if(user!=null) {
			Shopcart shopcart=shoppingservice.getShopcartByScid(scid);//
			shopcart.setQuantity(num);
			shopcart.setTotalprice(shoppingservice.getTotalPrice(shopcart));
			shoppingservice.updataShopCart(shopcart);
			List<Shopcart> ushopcart=shoppingservice.getUserShopcart(user.getUserid());
			request.getSession().setAttribute("shoppinglist", ushopcart);
			Double allmonry=shoppingservice.getAllMoney(ushopcart);
			request.getSession().setAttribute("allmonry", allmonry);
			return ushopcart;
		}
		@SuppressWarnings("unchecked")
		List<Shopcart> shoppinglist=(List<Shopcart>) request.getSession().getAttribute("shoppinglist");
		for(Shopcart shopcart:shoppinglist) {
			if(shopcart.getScid().equals(scid)) {
				shopcart.setQuantity(num);
				shopcart.setTotalprice(shoppingservice.getTotalPrice(shopcart));
			}
		}
		Double allmonry=shoppingservice.getAllMoney(shoppinglist);
		request.getSession().setAttribute("allmonry", allmonry);
		request.getSession().setAttribute("shoppinglist", shoppinglist);
		request.getSession().setAttribute("shopCount", shoppinglist.size());
		return shoppinglist;
	}
	
	
}
