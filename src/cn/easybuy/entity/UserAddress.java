package cn.easybuy.entity;

import java.io.Serializable;

/**
 * 
 * @author 李高珊
 * 用户地址表实体类
 */

public class UserAddress implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//主键
	private int 	id;
	//地址
	private String 	address;
	//创建时间
	private String 	createTime;
	//用户主键
	private int 	userId;
	//是否是默认地址：1为是，0为否
	private int 	isDefault;
	//备注
	private String 	remark;
	
	/**
	 * 获取主键id属性
	 * @return id 主键
	 */
	public int getId() {
		return id;
	}
	/**
	 * 设置主键id属性
	 * @param id 主键
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * 获取地址address属性
	 * @return address 地址
	 */
	public String getAddress() {
		return address;
	}
	/**
	 * 设置地址address属性
	 * @param address 地址
	 */
	public void setAddress(String address) {
		this.address = address;
	}
	/**
	 * 获取创建时间createTime属性
	 * @return createTime 创建时间
	 */
	public String getCreateTime() {
		return createTime;
	}
	/**
	 * 设置创建时间createTime属性
	 * @param createTime 创建时间
	 */
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	/**
	 * 获取用户主键userId属性
	 * @return userId 用户主键
	 */
	public int getUserId() {
		return userId;
	}
	/**
	 * 设置用户主键userId属性
	 * @param userId 用户主键
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}
	/**
	 * 获取是否是默认地址isDefault属性：1为是，0为否
	 * @return isDefault 是否是默认地址：1为是，0为否
	 */
	public int getIsDefault() {
		return isDefault;
	}
	/**
	 * 设置是否是默认地址isDefault属性：1为是，0为否
	 * @param isDefault 是否是默认地址：1为是，0为否
	 */
	public void setIsDefault(int isDefault) {
		this.isDefault = isDefault;
	}
	/**
	 * 获取备注remark属性
	 * @return remark 备注
	 */
	public String getRemark() {
		return remark;
	}
	/**
	 * 设置备注remark属性
	 * @param remark 备注
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
