package cn.easybuy.entity;

import java.io.Serializable;

/**
 * 
 * @author 李高珊
 * 用户表实体类
 */

public class User implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//用户名
	private int 	id;
	//用户真实姓名
	private String 	userName;
	//用户登录用户名
	private String 	loginName;
	//密码
	private String 	password;
	//性别：1为男，0为女
	private int 	sex;
	//身份证号
	private String 	identityCode;
	//电子邮箱
	private String 	email;
	//手机
	private String 	mobile;
	//用户类型：1为后台，0为前台
	private int 	type;
	
	/**
	 * 获取用户名id属性
	 * @return 用户名
	 */
	public int getId() {
		return id;
	}
	/**
	 * 设置用户名id属性
	 * @param id 用户名
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * 获取用户真实姓名userName属性
	 * @return userName 用户真实姓名
	 */
	public String getUserName() {
		return userName;
	}
	/**
	 * 设置用户真实姓名userName属性
	 * @param userName 用户真实姓名
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	/**
	 * 获取用户登录用户名loginName属性
	 * @return loginName 用户登录用户名
	 */
	public String getLoginName() {
		return loginName;
	}
	/**
	 * 设置用户登录用户名loginName属性
	 * @param loginName 用户登录用户名
	 */
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	/**
	 * 获取密码password属性
	 * @return password 密码
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * 设置密码password属性
	 * @param password 密码
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * 获取性别sex属性：1为男，0为女
	 * @return sex 性别：1为男，0为女
	 */
	public int getSex() {
		return sex;
	}
	/**
	 * 设置性别sex属性：1为男，0为女
	 * @param sex 性别：1为男，0为女
	 */
	public void setSex(int sex) {
		this.sex = sex;
	}
	/**
	 * 获取身份证号identityCode属性
	 * @return identityCode 身份证号
	 */
	public String getIdentityCode() {
		return identityCode;
	}
	/**
	 * 设置身份证号identityCode属性
	 * @param identityCode 身份证号
	 */
	public void setIdentityCode(String identityCode) {
		this.identityCode = identityCode;
	}
	/**
	 * 获取电子邮箱email属性
	 * @return email 电子邮箱
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * 设置电子邮箱email属性
	 * @param email 电子邮箱
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * 获取手机mobile属性
	 * @return mobile 手机
	 */
	public String getMobile() {
		return mobile;
	}
	/**
	 * 设置手机mobile属性
	 * @param mobile 手机
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	/**
	 * 获取用户类型type属性：1为后台，0为前台
	 * @return type 用户类型：1为后台，0为前台
	 */
	public int getType() {
		return type;
	}
	/**
	 * 设置用户类型type属性：1为后台，0为前台
	 * @param type 用户类型：1为后台，0为前台
	 */
	public void setType(int type) {
		this.type = type;
	}
	
}
