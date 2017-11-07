package cn.easybuy.entity;
/**
 * @author 孔祥忠
 * 商品类实体类2017.9.24
 *
 */
import java.io.Serializable;

public class OrderDetail implements Serializable {

	private static final long serialVersionUID = 8456547789761324251L;
	private int id; // 编号
	private int orderId; // 订单ID
	private int productId; // 商品ID
	private int quantity; // 数量
	private float cost; // 金额

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
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

	public float getCost() {
		return cost;
	}

	public void setCost(float cost) {
		this.cost = cost;
	}

}
