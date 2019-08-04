package com.sm.demo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
//sss
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sm.demo.model.UserInfo;
import com.sm.demo.service.UserInfoService;

@Controller
public class UserController {
	@Autowired
	@Qualifier("userInfoService") 
	private UserInfoService  userInfoService;
	
	@RequestMapping("query")
	   
	public String query(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model,UserInfo ui) throws Exception{
		 PageHelper.startPage(pn, 5);
	        List<UserInfo> uis = userInfoService.queryList(ui);
	       
	        //将用户信息放入PageInfo对象里
	        PageInfo<UserInfo> page = new PageInfo<UserInfo>(uis);
	        model.addAttribute("pageInfo", page);
	        return "show";
	}
		
	/**
	 * 如果需要把对象转换成 json格式的字符串，那么首先需要的是
	 * jackson   jar包 
	 * jackson-core   
	 * jackson-databind 
	 * jackson-annotations
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("del")
	@ResponseBody//当作json格式的字符串返回去     {属性名 : 属性值,属性名 : 属性值}
	public Map<String , Object> delete(UserInfo ui) throws Exception{
	    userInfoService.delUser(ui);	
		Map<String, Object> map = new HashMap<>() ;
		map.put("msg", "ok");
		map.put("code", "100");
		return map ; 
	}
	
	@RequestMapping("upd")
	@ResponseBody
	public Map<String , Object> update(UserInfo ui) throws Exception{
		userInfoService.updUser(ui);	
		Map<String, Object> map = new HashMap<>() ;
		map.put("msg", "ok");
		map.put("code", "100");
		return map ; 
	}
	
	
	
	@ResponseBody
	@RequestMapping("add")
	public Map<String , Object> add(UserInfo ui) throws Exception{
		//System.out.println(ui);
		userInfoService.addUser(ui);
		Map<String, Object> map = new HashMap<>() ;
		map.put("msg", "ok");
		map.put("code", "100");
		return map ; 
	}
}

