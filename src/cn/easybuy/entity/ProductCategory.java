package cn.easybuy.entity;

import java.io.Serializable;

/**
 * 
 * @author zwy
 * 商品分类表实体类
 *
 */
public class ProductCategory implements Serializable {
	/**
	 * 集成序列化接口
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;//编号
	private String name;//名字
	private int parentId;//父分类
	private int type;//类型
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
}
