package com.sm.demo.model;

/**
 * int  Integer 
 * int ��һ�������������� �� 
 * int Ĭ��ֵ��  0 
 * �Զ�װ��   �Զ�����  
 * @author Administrator
 * 
 */
public class UserInfo {
	private Integer id ; 
	private String name  ;
	private Integer age ; 
	private String address ;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public UserInfo(Integer id, String name, Integer age, String address) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.address = address;
	}
	public UserInfo() {
		super();
	}
	@Override
	public String toString() {
		return "UserInfo [id=" + id + ", name=" + name + ", age=" + age + ", address=" + address + "]";
	}
	
}
