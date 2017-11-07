package cn.easybuy.entity;

import java.io.Serializable;
/*
 * 购物车实体类
 * 孔
 */

public class Buycar implements Serializable{
	
	private static final long serialVersionUID = 8456547789761324251L;
	private int id; // 编号
	private int userId; //用户ID
	private int productId; // 商品ID
	private int quantity; // 数量
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	

}
