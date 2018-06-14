package com.Controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entity.Admin;
import com.entity.Furniture;
import com.entity.Furniture_count;
import com.service.AdminService;
import com.service.FurnitureService;
import com.service.Furniture_countService;
import com.vo.Record;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private Furniture_countService furniture_countService;
	
	@Autowired
	private FurnitureService furnitureService; 
	
	
	
	
	/**
	 * 管理员进入后台控制
	 */
	@RequestMapping("/g-main")
	public String loadMain(HttpServletRequest request) {
		
		//獲取top10
		List<Furniture_count> list = furniture_countService.getTop10();
		
		//获取list中的商品的具体详情
		List<Record> records = new ArrayList<Record>();
		
		for (Furniture_count furniture_count : list) {
			
			Furniture furniture = furnitureService.get(furniture_count.getFid());
			
			Record record = new Record();
			record.setName(furniture.getFname());
			record.setCount(furniture_count.getSales());
			record.setAmount(furniture.getFprice()*record.getCount());
			
			records.add(record);
			
		}
		
		//將數據放入session
		request.getSession().setAttribute("records", records);
		
		return "admin/main";	
	}
	
	/**
	 * 最新订单
	 */
	@RequestMapping("/newOrder")
	public String newOrder() {
		
		return "admin/newOrder";	
	}
	/**
	 * 管理员进入后台控制
	 */
	@RequestMapping("/g-menu")
	public String loadMenu() {
		
		return "admin/menu";	
	}
	/**
	 * 管理员进入后台控制
	 */
	@RequestMapping("/admin")
	public String toAdminLogin() {
		
		return "admin/login";	
	}
	
	/**
	 * 登录
	 */
	@RequestMapping("/login")
	public String checkAdminName(HttpServletRequest request,HttpServletResponse response) {
		String adminname = request.getParameter("adminname");
		String password = request.getParameter("password");
		Admin admin = adminService.login(adminname, password);
		
		HttpSession session = request.getSession();
		//登录失败
		if(admin == null) {
			request.setAttribute("msg", "账号或者密码输入错误！");
			return "admin/login";
		}
			
		session.setAttribute("admin", admin);		
		
		return "admin/index";
	}
	
	/**
	 * 退出，重定向到登录界面
	 */
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		
		return "redirect:/GPages/admin/login.jsp";
	}
}
