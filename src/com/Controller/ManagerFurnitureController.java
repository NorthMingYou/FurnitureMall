package com.Controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.Utils.PageBean;
import com.entity.Furniture;
import com.entity.Furniture_count;
import com.service.FurnitureService;

@Controller
public class ManagerFurnitureController {
	
	@Autowired
	private FurnitureService furnitureService;
	
	
	
	
//	@RequestMapping("/furniture/getAll")
//	public String getFurnitures(Map<String,Object> map) {
//		
//		List<Furniture> fList=furnitureService.getAllFurniture();
//		map.put("flist", fList.get(0));
//		System.out.println(fList.get(0).getFname());
//		return "admin/product_list";
//		
//	}
	/**
	 * 添加新商品
	 * @param furniture
	 * @param fcount
	 * @param request
	 * @param response
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping(value="/furniture/add", method=RequestMethod.POST)  
	private String addAFurniture(@ModelAttribute Furniture furniture, 
			String fcount,MultipartHttpServletRequest request,
			HttpServletResponse response)throws IllegalStateException, IOException {
		
		System.out.println(furniture.getFname()+furniture.getFstyle());
		
		/**
		 * 上传文件绝对路径
		 */
		String pic_path = request.getServletContext().getRealPath("GPages/furniture_images");
		//String pic_path = request.getContextPath()+"/GPages/furniture_images";
		//String th = request.getServletContext().getRealPath("/");
		
		//request 就是MultipartHttpServletRequest的实例，fileName 就是jsp页面中的name
		List<MultipartFile> fileList = request.getFiles("fpic");
		Iterator<MultipartFile> iter=fileList.iterator();
		int i=1;
		while(iter.hasNext()){  
			
            //记录上传过程起始时的时间，用来计算上传时间  
            //int pre = (int) System.currentTimeMillis();  
            //取得上传文件  
			Date date=new Date();
			long d=date.getTime();
			//System.out.println("d="+d);
            MultipartFile file = iter.next();  
            if(file != null){  
                //取得当前上传文件的文件名称  
                String myFileName = file.getOriginalFilename();  
                //如果名称不为“”,说明该文件存在，否则说明该文件不存在  
                if(myFileName.trim() !=""){  
                    //System.out.println(myFileName);  
                    //重命名上传后的文件名  
                	int pointIndex =  myFileName.indexOf("."); //点号的位置       
                    String fileSuffix = myFileName.substring(pointIndex); 
                    String fileName = d +fileSuffix; 
                    if(i==1) {
                    	furniture.setFpic1(fileName);
                    }else if(i==2) {
                    	furniture.setFpic2(fileName);
                    }else if(i==3) {
                    	furniture.setFpic3(fileName);
                    }
                    
                    //String fileName = d +"_"+ file.getOriginalFilename(); 
                    //定义上传路径  
                    String path = pic_path +"/"+ fileName;
                    //System.out.println(path);
                    File localFile = new File(path);  
                    file.transferTo(localFile);  
                }  
            }  
            i++;
            //记录上传该文件后的时间  
            //int finaltime = (int) System.currentTimeMillis();  
            //System.out.println(finaltime - pre);  
        }  
		
		Date date=new Date();
//    	DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		
    	DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	String time=format.format(date);
		furnitureService.addFurniture(furniture);//先要保存家具这个类，才能获取他的id，才能保存家具数量
		Furniture_count fc=new Furniture_count(furniture.getFid(),0,time);
		furnitureService.addFurniture_count(fc);
		
		//添加商品成功之后转发到获取商品列表请求处理
		return "forward:/productList";
	}
	
	
	/**
	 * 添加新商品
	 * @param furniture
	 * @param fcount
	 * @param request
	 * @param response
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping(value="/furniture/edit", method=RequestMethod.POST)  
	private String editAFurniture(@ModelAttribute Furniture furniture, 
			String fcount,MultipartHttpServletRequest request,
			HttpServletResponse response)throws IllegalStateException, IOException {
		
		//先获取到要修改的商品
		String id = request.getParameter("fid");
		Furniture temp = furnitureService.get(id);
		
		System.out.println(furniture.getFname()+furniture.getFstyle());
		
		/**
		 * 上传文件绝对路径
		 */
		String pic_path = request.getServletContext().getRealPath("GPages/furniture_images");
		//String pic_path = request.getContextPath()+"/GPages/furniture_images";
		//System.out.println("====上传路径："+contextPath+"/GPages/furniture_images");
		System.out.println(pic_path);
		
		//request 就是MultipartHttpServletRequest的实例，fileName 就是jsp页面中的name
		List<MultipartFile> fileList = request.getFiles("fpic");
		Iterator<MultipartFile> iter=fileList.iterator();
		int i=1;
		while(iter.hasNext()){  
			
            //记录上传过程起始时的时间，用来计算上传时间  
            //int pre = (int) System.currentTimeMillis();  
            //取得上传文件  
			Date date=new Date();
			long d=date.getTime();
			//System.out.println("d="+d);
            MultipartFile file = iter.next();  
            if(file != null){  
                //取得当前上传文件的文件名称  
                String myFileName = file.getOriginalFilename();  
                //如果名称不为“”,说明该文件存在，否则说明该文件不存在  
                if(myFileName.trim() !=""){  
                    //System.out.println(myFileName);  
                    //重命名上传后的文件名  
                	int pointIndex =  myFileName.indexOf("."); //点号的位置       
                    String fileSuffix = myFileName.substring(pointIndex); 
                    String fileName = d +fileSuffix; 
                    if(i==1) {
                    	furniture.setFpic1(fileName);
                    }else if(i==2) {
                    	furniture.setFpic2(fileName);
                    }else if(i==3) {
                    	furniture.setFpic3(fileName);
                    }
                    
                    //String fileName = d +"_"+ file.getOriginalFilename(); 
                    //定义上传路径  
                    String path = pic_path +"/"+ fileName;
                    //System.out.println(path);
                    File localFile = new File(path);  
                    file.transferTo(localFile);  
                    
                }else {
                	if(i==1) {
                    	furniture.setFpic1(temp.getFpic1());
                    }else if(i==2) {
                    	furniture.setFpic2(temp.getFpic2());
                    }else if(i==3) {
                    	furniture.setFpic3(temp.getFpic3());
                    }
                }
            }  
            i++;
            //记录上传该文件后的时间  
            //int finaltime = (int) System.currentTimeMillis();  
            //System.out.println(finaltime - pre);  
        }  
		
		Date date=new Date();
    	DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	String time=format.format(date);
    	furniture.setDate(time);
    	
    	System.out.println("xiugai----"+furniture);
    	
    	furnitureService.update(furniture);
    	
		/*furnitureService.addFurniture(furniture);//先要保存家具这个类，才能获取他的id，才能保存家具数量
		Furniture_count fc=new Furniture_count(furniture.getFid(),0,time);
		furnitureService.addFurniture_count(fc);
		*/
		//添加商品成功之后转发到获取商品列表请求处理
		return "forward:/productList";
	}
	
	/**
	 * 商品列表
	 * 
	 * @return
	 */
	@RequestMapping("/productList")
	public String productList() {
		return "admin/product_list";
	}
	/**
	 * 全部商品
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/getProductListByPage")
	@ResponseBody
	public Object getProductListByPage(HttpServletRequest request) {
		//获取到要分页的数据下标
		int index = Integer.parseInt(request.getParameter("index"));
		
		System.out.println("接收到商品列表分页的请求。。。。"+index);
		
		PageBean<Furniture>  page = furnitureService.getProductListByPage(index);
		
		return page;
	}
	
	/**
	 * 模糊查询
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/searchProductByLike")
	@ResponseBody
	public Object searchProductByLike(HttpServletRequest request) {
		
		//获取模糊查询的字符串
		String name = request.getParameter("name");
		int index = Integer.parseInt(request.getParameter("index"));
		System.out.println("接收到商品列表搜索的请求。。。。"+index+";"+name);
		PageBean<Furniture>  page = furnitureService.getProductListByPageForLike(index,name);
		return page;	
	}
	/**
	 * 商品详情页
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/showProduct")
	public String showProduct(HttpServletRequest request, Map<String,Object> furnitureMap) {
		
		String productId = request.getParameter("productId");
		Furniture furniture = furnitureService.get(productId);
		
		furnitureMap.put("furniture", furniture);
		
		return "admin/productDetail";
	}
	
	/**
	 * 修改商品页面
	 * @param request
	 * @param furnitureMap
	 * @return
	 */
	@RequestMapping(value="/editProduct")
	public String editProduct(HttpServletRequest request, Map<String,Object> furnitureMap){
		
		String productId = request.getParameter("productId");
		Furniture furniture = furnitureService.get(productId);
		
		furnitureMap.put("furniture", furniture);
		
		return "admin/editProduct";
	}
	/**
	 * 商品下架
	 * @return
	 */
	@RequestMapping(value="/productDrop")
	public String productDrop() {
		return "admin/productDrop";
	}
	
	/**
	 * 商品下架
	 * @return
	 */
	@RequestMapping(value="/productUp")
	public String productUp() {
		return "admin/productUp";
	}
	
	@RequestMapping(value="/getProductListByState")
	@ResponseBody
	public Object getProductListByState(HttpServletRequest request) {
		//获取到要分页的数据下标
		int index = Integer.parseInt(request.getParameter("index"));
		int state = Integer.parseInt(request.getParameter("state"));
		
		System.out.println("接收到商品下架页面的请求。。。。"+index);
		
		PageBean<Furniture>  page = furnitureService.getProductListByState(index,state);
		
		return page;
	}
	/**
	 * 商品下架
	 * @return
	 */
	@RequestMapping(value="/dropProduct")
	public String dropProduct(HttpServletRequest request) {
		//先获取到要修改的商品
		String id = request.getParameter("productId");
		Furniture temp = furnitureService.get(id);
		Date date=new Date();
    	DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	String time=format.format(date);
    	temp.setDate(time);
		
		temp.setIsdropoff("0");
		
		furnitureService.update(temp);
		
		return "admin/productDrop";
	}
	/**
	 * 商品下架
	 * @return
	 */
	@RequestMapping(value="/upProduct")
	public String upProduct(HttpServletRequest request) {
		//先获取到要修改的商品
		String id = request.getParameter("productId");
		Furniture temp = furnitureService.get(id);
		
		Date date=new Date();
    	DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	String time=format.format(date);
    	temp.setDate(time);
		temp.setIsdropoff("1");
		
		furnitureService.update(temp);
		
		return "admin/productUp";
	}
}
