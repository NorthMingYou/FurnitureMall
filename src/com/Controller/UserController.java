package com.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.Shopcart;
import com.entity.User;
import com.service.ShoppingService;
import com.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userservice;
	
	@Autowired
	private ShoppingService shoppingservice;
	
	/**
	 * 检查手机号
	 * @param phone
	 * @return
	 */
	@RequestMapping("/user/checkPhone")
	@ResponseBody
	public int isThePhoneExit(String phone) {
		
		System.out.println(phone);
		//userservice.checkPhone(phone);
		
		return userservice.checkPhone(phone);
	}
	
	/**
	 * 用户注册
	 * @param user
	 * @return
	 */
	@RequestMapping("/user/register")
	public String addUser(User user) {
		System.out.println(user.getPhone());
		
		userservice.addUser(user);
		
		return "mall/userLogin";
	}
	
	
	/**s
	 * 用户登录
	 * @param u
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/user/login")
	public String userLogin(User u,HttpServletRequest request) throws IOException {
		
		HttpSession httpSession = request.getSession();
		User user=userservice.getAUserByPhoneAndPwd(u.getPhone(), u.getPassword());
		
		if(user==null) {//登录失败
			System.out.println("用户名或密码错误！");
			request.setAttribute("loginTips", "用户名或密码错误！");
			return "mall/userLogin";
		}
		else {//登录成功
			httpSession.setAttribute("user", user);
			request.removeAttribute("loginTips");
			
			//读取session中的购物车内容
			@SuppressWarnings("unchecked")
			List<Shopcart> shoppinglist=(List<Shopcart>) httpSession.getAttribute("shoppinglist");
			
			//得到用户的购物车
			//Shopcart usershopcart= shoppingservice.getUserShopcart(user.getUserid());
			
			if(shoppinglist!=null && !shoppinglist.isEmpty()) {//假如已有东西加入购物车了
				//其实这里是跟用户绑定在一起，就如有用户未登录时就把商品加入购物车，那么登录后，就要把购物车内容跟用户绑定在一起
				for (Shopcart shopcart : shoppinglist) {
					shopcart.setUser(user);
					shoppingservice.addUserShopCart(shopcart);//保存到数据库
				}
			}
			
			//重新读取用户的购物车，把用户以前添加的进购物车的东西都拿出来
			List<Shopcart> afterUpdatalist=shoppingservice.getUserShopcart(user.getUserid());
			httpSession.setAttribute("shoppinglist", afterUpdatalist);
			httpSession.setAttribute("shopCount", afterUpdatalist.size());
			
			return "redirect:/GPages/mall/index.jsp";
		}
		
	}
	
	

	@RequestMapping("/user/updataInfo")
	@ResponseBody
	public String updataUser(User new_user,HttpServletRequest request) throws IOException {
	
		System.out.println(new_user.getGender());
		User old_user=(User) request.getSession().getAttribute("user");
		
		new_user.setUserid(old_user.getUserid());
		new_user.setPhone(old_user.getPhone());
		new_user.setPassword(old_user.getPassword());
		
		int a=userservice.updataUser(new_user);
		request.getSession().setAttribute("user", new_user);
		if(a==0) {
			return "error";
		}
		return "ok";
	}
	
	@RequestMapping("/user/checkPwd")
	@ResponseBody
	public String checkUserPwd(String oldpassword,HttpServletRequest request) throws IOException {
		
		User user=(User) request.getSession().getAttribute("user");
		System.out.println(oldpassword);
		if(user.getPassword().equals(oldpassword))
			return "ojbk";
		return "error";
	}
	
	@RequestMapping("/user/updataPwd")
	@ResponseBody
	public String updataUserPwd(String newpassword,HttpServletRequest request) throws IOException {
		
		User user=(User) request.getSession().getAttribute("user");
		user.setPassword(newpassword);
			
		int a=userservice.updataUser(user);
		request.getSession().setAttribute("user", user);
		if(a==0) {
			return "error";
		}
		return "ok";
			
		
	}
	

	@RequestMapping(value="/user/logout")
	public String loadIndex(HttpServletRequest request) {
		
		request.getSession().removeAttribute("user");
		request.getSession().removeAttribute("shoppinglist");
		request.getSession().removeAttribute("shopCount");
		request.getSession().removeAttribute("buylist");
		request.getSession().removeAttribute("ordermoney");
		request.getSession().removeAttribute("userOrder");
		request.getSession().removeAttribute("AllOrder");
		
		return "redirect:/GPages/mall/index.jsp";
	}
	
}
