package com.sm.demo.mapper;



import java.util.List;

import com.sm.demo.model.UserInfo;


/**
 * 存接口的方式来开发持久层
 * 写接口，写接口对应的映射文件   持久层就一斤开发完毕了
 * 注意事项
 * 1.要求接口和映射文件的位置保持一至
 * 2.映射文件的命名空间指向接口的全路径
 * 3.接口里面的方法名和 映射文件中的sql的id保持一至
 * @author Administrator
 *
 */
public interface UserInfoMapper {
	public List<UserInfo> queryUserList(UserInfo ui) throws Exception;

	public void addUser(UserInfo ui) throws Exception;

	public void updUser(UserInfo ui) throws Exception;

	public void delUser(UserInfo ui) throws Exception;
}
