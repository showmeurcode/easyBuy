package cn.easybuy.entity;

import java.io.Serializable;

/**
 * 
 * @author zwy
 *	收藏表实体类
 */
public class Favourite implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;//编号
	private int productId;//商品ID
	private int userId;//用户ID
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
}
