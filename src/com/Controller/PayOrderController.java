package com.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.FOrder;
import com.entity.Furniture;
import com.entity.OrderDetail;
import com.entity.User;
import com.service.FurnitureService;
import com.service.ShoppingService;

@Controller
public class PayOrderController {

	
	@Autowired
	private ShoppingService shoppingservice;
	
	@Autowired
	private FurnitureService furnitureservice;
	
	/**
	 * 从购物车中结算,就是不加入购物车直接买
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/checkoutWithShopcart")
	public  String checkoutWithShopcart(HttpServletRequest request) throws IOException  {
		User user=(User) request.getSession().getAttribute("user");//查看用户是否登录
		if(user==null) {//如果没有登录，就跳到登录 页面
			return "redirect:/GPages/mall/userLogin.jsp";
		}
		
		//首先从数据库中读出该用户的购物车，因为每个用户只有一个购物车，而且只能全部结算
		//接着生成订单详情表
		List<OrderDetail> orderdetailslist=shoppingservice.getUserOrderDetail(user);
		
		Double ordermoney =shoppingservice.getOrderTotalPrice(orderdetailslist);
		
		request.getSession().setAttribute("buylist", orderdetailslist);
		request.getSession().setAttribute("ordermoney", ordermoney);
		
		return "mall/checkout";
	}
	
	/***
	 * 单个商品直接结算
	 * @param fid
	 * @param count
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/checkoutByFid")
	@ResponseBody
	public  String checkoutByFid(String fid,Integer count,HttpServletRequest request) throws IOException {
		User user=(User) request.getSession().getAttribute("user");//查看用户是否登录
		if(user==null) {//如果没有登录，就跳到登录页面
			return "login";
		}
		
		Furniture f=furnitureservice.get(fid);
		OrderDetail orderDetail=new OrderDetail();
		orderDetail.setFurniture(f);
		orderDetail.setQuantity(count);
		orderDetail.setAllmoney(f.getFprice()*count);
		
		List<OrderDetail> orderdetailslist=new ArrayList<OrderDetail>();
		orderdetailslist.add(orderDetail);
		Double ordermoney =shoppingservice.getOrderTotalPrice(orderdetailslist);
		request.getSession().setAttribute("buylist", orderdetailslist);
		request.getSession().setAttribute("ordermoney", ordermoney);
		return "OK";
	}
	
	/***
	 * 确认下单了
	 * @param order
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/confirmOrder",produces = "text/html;charset=UTF-8")
	public  String confirmOrder(FOrder order,HttpServletRequest request) throws IOException{
		
		//先接受订单信息，新建一个订单，然后从session中读取buylist,将其赋值
		request.setCharacterEncoding("UTF-8");//这里出现乱码问题，我在service里强制转换了
		
		@SuppressWarnings("unchecked")
		List<OrderDetail> orderdetailslist=(List<OrderDetail>) request.getSession().getAttribute("buylist");
		Double ordermoney=(Double) request.getSession().getAttribute("ordermoney");
		User user=(User) request.getSession().getAttribute("user");
		
		order.setUser(user);
		order.setTotalprice(ordermoney);
		
		shoppingservice.addFOrder(order);//先保存到数据库，获取id
		
		shoppingservice.addOrderDetail(orderdetailslist,order);
		
		
		shoppingservice.deleteUserShopcart(user);//订单下完后，记得删除购物车！
		//下单完成后，还要在家具表中将数量减去，同时增加销售记录
		shoppingservice.changeFCountAndSaleRecord(orderdetailslist);
		request.getSession().removeAttribute("shoppinglist");
		request.getSession().removeAttribute("shopCount");
		request.getSession().setAttribute("userOrder", order);
		
		
		
		return "mall/enterPayPassword";
	}
	
	/***
	 * 检查支付密码
	 * @param password
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/checkPayPassword")
	@ResponseBody
	public int confirmPayPassword(String password,HttpServletRequest request) throws IOException {
		
		User user=(User) request.getSession().getAttribute("user");
		if(user.getPassword().equals(password)) {
			return 1;
		}
		return 0;
	}
	
	/**
	 * 密码正确，下单成功
	 * @param password
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/payOrder")
	@ResponseBody
	public int userPayOrder(String password,HttpServletRequest request) throws IOException {
		
		FOrder order=(FOrder) request.getSession().getAttribute("userOrder");
		order.setState(1);
		shoppingservice.updataFOrder(order);
		return 1;
	}
	
	@RequestMapping("/getMyOrder")
	@ResponseBody
	public List<FOrder> getUserOrder(HttpServletRequest request) throws IOException {
		User user=(User) request.getSession().getAttribute("user");
		
		List<FOrder> userOrder=shoppingservice.getUserOrder(user);
		
		if(userOrder==null||userOrder.isEmpty()) {
			return null;
		}
		request.getSession().setAttribute("AllOrder",userOrder);
		
		return userOrder;
	}
	
	@RequestMapping("/getAOrderDetail")
	public String getAOrderDetail(String orderid,HttpServletRequest request) throws IOException {
		
		List<OrderDetail> oDetails=shoppingservice.getOrderDetailByOrderid(orderid);
		request.getSession().setAttribute("AOrderDetail",oDetails);
		Double money=shoppingservice.getOrderTotalPrice(oDetails);
		request.getSession().setAttribute("AOrderMoney",money);
		return "mall/orderDetail";
	}
	
	@RequestMapping("/toPayOrder")
	public String toPayOrder(String orderid,HttpServletRequest request) throws IOException{
		
		FOrder order=shoppingservice.getAOrderByorderid(orderid);
		request.getSession().setAttribute("userOrder", order);
		return "mall/enterPayPassword";
	}
	
	@RequestMapping("/confirmReceipt")
	@ResponseBody
	public List<FOrder> confirmReceipt(String orderid,HttpServletRequest request) throws IOException {
		
		FOrder order=shoppingservice.getAOrderByorderid(orderid);
		order.setState(3);
		shoppingservice.updataFOrder(order);
		
		User user=(User) request.getSession().getAttribute("user");
		
		List<FOrder> userOrder=shoppingservice.getUserOrder(user);
		
		if(userOrder==null||userOrder.isEmpty()) {
			return null;
		}
		request.getSession().setAttribute("AllOrder",userOrder);
		
		return userOrder;
	}
	
	@RequestMapping("/cancelOrder")
	@ResponseBody
	public int cancelOrder(String orderid) {
		FOrder order=shoppingservice.getAOrderByorderid(orderid);
		order.setCancel("1");
		shoppingservice.updataFOrder(order);
		
		return 1;
	}
	
}
