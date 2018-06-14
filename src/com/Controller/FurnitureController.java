package com.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Utils.PageBean;
import com.entity.Furniture;
import com.service.FurnitureService;

@Controller
public class FurnitureController {

	@Autowired
	private FurnitureService furnitureService;
	
	/**
	 * 首页推荐商品
	 * @param ftype
	 * @return
	 */
	@RequestMapping(value="/product", method=RequestMethod.POST)
	@ResponseBody
	public Object getFurnitureByFtype( HttpServletRequest request )
	{
		
		String ftype = request.getParameter("ftype"); 
		List<Furniture> list = furnitureService.getFurniturebyftype(ftype);	
		request.getSession().setAttribute("list",list);
		request.getSession().setAttribute("ftype", ftype);
		
		return list;
	}
	
	@RequestMapping(value="/pageproduct", method=RequestMethod.POST)
	@ResponseBody
	public Object getFurnitureByPageFtype( HttpServletRequest request )
	{
		
		String ftype = request.getParameter("ftype");
		int index = Integer.parseInt(request.getParameter("index"));
		PageBean<Furniture>  page = furnitureService.getFurnitureByPageFtype(index,ftype);
		request.getSession().setAttribute("ftype", ftype);
		return page;
	}
	
	@RequestMapping(value="/pagesearch", method=RequestMethod.POST)
	@ResponseBody
	public Object getFurnitureByPageSearch( HttpServletRequest request )
	{
		
		String fname = request.getParameter("fname");
		int index = Integer.parseInt(request.getParameter("index"));
		PageBean<Furniture>  page = furnitureService.getFurnitureByPageSearch(index,fname);
		return page;
	}
	
	@RequestMapping(value="/bypagetands", method=RequestMethod.POST)
	@ResponseBody
	public Object getFurnitureByPageTandS( HttpServletRequest request )
	{
		
		String ftype = request.getParameter("ftype");
		String fstyle = request.getParameter("fstyle");
		int index = Integer.parseInt(request.getParameter("index"));
		PageBean<Furniture>  page = furnitureService.getFurnitureByPageTandS(index,ftype,fstyle);
		return page;
	}
	
	@RequestMapping(value="/bystyle", method=RequestMethod.POST)
	@ResponseBody
	public Object getFurnitureByFstyle( HttpServletRequest request )
	{
		
		String fstyle = request.getParameter("fstyle");
		List<Furniture> list = furnitureService.getFurniturebyfstyle(fstyle);
		request.getSession().setAttribute("list",list);
		request.getSession().setAttribute("fstyle", fstyle);
		return list;
	}
	
	@RequestMapping(value="/furnituredetail", method=RequestMethod.POST)
	@ResponseBody
	public Object getFurnitureByFid( HttpServletRequest request )
	{	
		String fid = request.getParameter("fid");
		Furniture f = furnitureService.get(fid);
		request.getSession().setAttribute("f",f);
		return f;
	}
	
	@RequestMapping(value="/bytands", method=RequestMethod.POST)
	@ResponseBody
	public Object getFurnitureByTandS( HttpServletRequest request )
	{
		String ftype = request.getParameter("ftype");
		String fstyle = request.getParameter("fstyle");
		List<Furniture> list = furnitureService.getFurniturebytands(ftype,fstyle);	
		return list;
	}
	
	@RequestMapping("/toShop")
	public String toShop(HttpServletRequest request,@RequestParam(value="ftype")String ftype) 
	{
		request.getSession().setAttribute("ftype", ftype);
		return "mall/shop";
	}
	
	
	@RequestMapping("/pagetoShop")
	public String Pagetoshop(HttpServletRequest request,@RequestParam(value="ftype")String ftype) {
		
		request.getSession().setAttribute("ftype", ftype);
		
		return "mall/shop";
	}
	
	@RequestMapping("/toDetails")
	public String toDetails(HttpServletRequest request) {
		
		String fid = request.getParameter("fid");
		request.getSession().setAttribute("fid", fid);
		
		return "mall/product";
	}
	
	@RequestMapping("/tosearch")
	public String thesearch( Furniture f,HttpServletRequest request,@RequestParam(value="fname")String fname) 
	{
		//System.err.println("----"+f.getFname());
		request.getSession().setAttribute("fname", fname);
		return "mall/searchresult";
	}
}
