package com.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.StaticService;

@Controller
public class StaticController {
	
	@Autowired
	private StaticService staticService;
	
	/**
	 * 处理ajax请求：
	 * 		一、添加jar包：
	 * 		二、添加 ResponseBody注解
	 * 		三、如果出现乱码,则RequestMapping中添加produces="text/html;charset=utf-8"参数
	 * 
	 * SELECT * FROM furniture f, furniture_count fc WHERE f.fid = fc.fid AND f.fstyle="复古" AND fc.date LIKE "2018-%6-%"; 
	 * 
SELECT fprice*sales, fprice, sales,ftype FROM furniture f, furniture_count fc WHERE f.fid = fc.fid AND f.fstyle="复古" AND fc.date LIKE "2018-%6-%";
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/saleStatic")
	@ResponseBody
	public Object staticSale(HttpServletRequest request) {
		
		System.out.println("shshhshsh");
		
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String style = request.getParameter("style");
		
		
		//获取到数据
		@SuppressWarnings("rawtypes")
		List res = staticService.getSale(year, month, style);
		
		System.out.println(res);
		
		return res;
		
	}
	@RequestMapping(value="/incomeStatic")
	@ResponseBody
	public Object staticIncome(HttpServletRequest request) {
		
		System.out.println("shshhshsh");
		
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		
		//获取到数据
		@SuppressWarnings("rawtypes")
		List res = staticService.getIncome(year, month);
		
		System.out.println(res);
		
		return res;
		
	}
}
