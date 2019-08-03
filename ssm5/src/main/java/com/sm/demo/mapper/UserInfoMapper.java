package com.sm.demo.mapper;



import java.util.List;

import com.sm.demo.model.UserInfo;


/**
 * ��ӿڵķ�ʽ�������־ò�
 * д�ӿڣ�д�ӿڶ�Ӧ��ӳ���ļ�   �־ò��һ�￪�������
 * ע������
 * 1.Ҫ��ӿں�ӳ���ļ���λ�ñ���һ��
 * 2.ӳ���ļ��������ռ�ָ��ӿڵ�ȫ·��
 * 3.�ӿ�����ķ������� ӳ���ļ��е�sql��id����һ��
 * @author Administrator
 *
 */
public interface UserInfoMapper {
	public List<UserInfo> queryUserList(UserInfo ui) throws Exception;

	public void addUser(UserInfo ui) throws Exception;

	public void updUser(UserInfo ui) throws Exception;

	public void delUser(UserInfo ui) throws Exception;
}
