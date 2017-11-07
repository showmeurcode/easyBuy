package cn.easybuy.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @author zwy
 * 订单表实体类
 */
public class Order implements Serializable {
	
	/**
	 * 集成序列化接口
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;//编号
	private String userId;//用户ID
	private String loginName;//登录用户名
	private String userAddress;//用户地址
	private String createTime;//创建时间
	private double cost;//金额
	private int status;//状态：1 为待审核，2 为审核通过，3 为配货，4 为卖家已发货，5 为已收货
	private int type;//类型
	private String serialNumber;//订单号
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public double getCost() {
		return cost;
	}
	public void setCost(double cost) {
		this.cost = cost;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getSerialNumber() {
		return serialNumber;
	}
	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}
	
}
