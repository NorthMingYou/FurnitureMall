package com.Controller;

import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Utils.PageBean;
import com.entity.FOrder;
import com.entity.Furniture;
import com.entity.Furniture_count;
import com.entity.OrderDetail;
import com.service.FOrderService;
import com.service.FurnitureService;
import com.service.Furniture_countService;
import com.service.OrderDetailService;

@Controller
public class OrderController {
	
	@Autowired
	private FOrderService fOrderService;
	
	@Autowired
	private OrderDetailService orderDetailService;
	
	@Autowired
	private FurnitureService furnitureService;
	
	@Autowired
	private Furniture_countService furniture_countService;
	
	@RequestMapping("/orderList")
	public String orderList() {
		
		return "admin/order_list";
	}
//	noPayList
//	isSendLis
//	waitRecList
//	isRecList
	@RequestMapping("/newOrderList")
	public String newOrderList() {
		
		return "admin/newOrderList";
	}
	@RequestMapping("/noPayList")
	public String noPayList() {
		
		return "admin/noPayList";
	}
	@RequestMapping("/isSendList")
	public String isSendLis() {
		
		return "admin/isSendLis";
	}
	@RequestMapping("/waitRecList")
	public String waitRecList() {
		
		return "admin/waitRecList";
	}
	@RequestMapping("/isRecList")
	public String isRecList() {
		
		return "admin/isRecList";
	}
	/**
	 * 按状态获取订单
	 * @param request
	 * @return
	 */
	@RequestMapping("/orderState")
	@ResponseBody
	public Object orderState(HttpServletRequest request) {
		
		int index = Integer.parseInt(request.getParameter("index"));
		int state = Integer.parseInt(request.getParameter("state"));
		//获取最新订单
		if(state == 100) {
			
			//获取所以订单之后转发到订单列表界面
			PageBean<FOrder> list = fOrderService.getFOrderListByToday(index);
			
			return list;
		}else {
			PageBean<FOrder> list = fOrderService.getFOrderListByState(index,state);
			return list;
		}
	}
	/**
	 * 获取订单列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/getOrderList")
	@ResponseBody
	public Object getOrderList(HttpServletRequest request) {
		
		int index = Integer.parseInt(request.getParameter("index"));
		if(index != 99) {
			
			//获取所以订单之后转发到订单列表界面
			PageBean<FOrder> list = fOrderService.getFOrderListByPage(index);
			
			return list;
		}else {
			List<FOrder> fOrders = fOrderService.getOrderIsCancel();
			return fOrders;
		}
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/orderDetail")
	public String orderDetail(HttpServletRequest request, Map<String,Object> map) {
		String orderId = request.getParameter("orderId");
		FOrder fOrder = fOrderService.getOrder(orderId);
		
		List<OrderDetail> list = orderDetailService.get(orderId);
		
		fOrder.setOrderDetails(new HashSet(list));
		
		map.put("details", fOrder);
		
		
		return "admin/orderDetail";
	}
	@RequestMapping("/sendGood")
	public String sendGood(HttpServletRequest request,Map<String,Object> map) {
		String orderId = request.getParameter("orderId");
		FOrder fOrder = fOrderService.getOrder(orderId);
		fOrder.setState(2);
		
		fOrderService.update(fOrder);
		
		return "forward:orderList"; 
	}
	@RequestMapping("/quitGoods")
	public String quitGoods(Map<String,List<FOrder>> map) {
		
		return "admin/quitGoods";
	}
//	/**
//	 * 获取订单列表
//	 * @param request
//	 * @return
//	 */
	@RequestMapping("/getQuitOrderList")
	@ResponseBody
	public Object getQuitOrderList() {
		List<FOrder> fOrders = fOrderService.getOrderIsCancel();
		System.out.println(fOrders);
		return fOrders;
		
	}
	@RequestMapping("/toDoQuitGood")
	public String toDoQuitGood(HttpServletRequest request) {
		String orderId = request.getParameter("orderId");
		FOrder fOrder = fOrderService.getOrder(orderId);
		request.getSession().setAttribute("forder", fOrder);
		System.out.println(fOrder);
		
		return "admin/doQuitGoods";
	}
	/**
	 * 退单步骤
	 * 	1、先让order失效
	 *  2、
	 * @param request
	 * @return
	 */
	@RequestMapping("/doQuitGood")
	public String doQuitGood(HttpServletRequest request) {
//		String orderId = request.getParameter("orderId");
//		FOrder fOrder = fOrderService.getOrder(orderId);
		
		FOrder fOrder = (FOrder) request.getSession().getAttribute("forder");
		System.out.println(fOrder);
		//让该订单失效
		fOrder.setValidity(0);
		
		fOrderService.update(fOrder);
		
		//更新商品的数量
		List<OrderDetail> list = orderDetailService.get(fOrder.getOrderid());
		for (OrderDetail orderDetail : list) {
			Furniture furniture = orderDetail.getFurniture();
			//获取交易的数量
			Integer quantity = orderDetail.getQuantity();
			//库存+1
			furniture.setFnum(furniture.getFnum()+quantity);
			furnitureService.update(orderDetail.getFurniture());
			System.out.println("时间+"+fOrder.getBuydate().substring(0, 10));
			//销量-1
			Furniture_count furniture_count = furniture_countService.get(furniture.getFid(),fOrder.getBuydate().substring(0, 10));
			furniture_count.setSales(furniture_count.getSales()-quantity);
			furniture_countService.update(furniture_count);
		}
		
		return "forward:quitGoods";
	}

}
