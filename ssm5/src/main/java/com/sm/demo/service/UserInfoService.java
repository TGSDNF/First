package com.sm.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sm.demo.mapper.UserInfoMapper;
import com.sm.demo.model.UserInfo;

@Service
public class UserInfoService {
	@Autowired
	private UserInfoMapper um ;
	
	public List<UserInfo> queryList(UserInfo ui) throws Exception{
		return um.queryUserList(ui);
	}
	
	public void addUser(UserInfo ui)  throws Exception{
		 um.addUser(ui);
	}
	
	public void updUser(UserInfo ui)  throws Exception{
		 um.updUser(ui);
	}

	public void delUser(UserInfo ui)  throws Exception{
		 um.delUser(ui);
	}
	
}
