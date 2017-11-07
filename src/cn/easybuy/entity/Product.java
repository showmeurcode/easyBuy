/**
 * 
 */
package cn.easybuy.entity;

import java.io.Serializable;

/**
 * @author yinxiaochen
 * 商品类实体类2017.9.23
 *
 */
public class Product implements Serializable {/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int id;//商品编号
	private String name ;//商品名称
	
	private String description ;//商品描述
	private float  price;//价格
	private int stock;//库存
	private int categoryLevel1;//一级目录id
	private int categoryLevel2;//二级目录id
	private int categoryLevel3;//三级目录id
	private String  fileName;//文件名
	private int isDelete;//是否删除（默认为0代表未删除）
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getCategoryLevel1() {
		return categoryLevel1;
	}
	public void setCategoryLevel1(int categoryLevel1) {
		this.categoryLevel1 = categoryLevel1;
	}
	public int getCategoryLevel2() {
		return categoryLevel2;
	}
	public void setCategoryLevel2(int categoryLevel2) {
		this.categoryLevel2 = categoryLevel2;
	}
	public int getCategoryLevel3() {
		return categoryLevel3;
	}
	public void setCategoryLevel3(int categoryLevel3) {
		this.categoryLevel3 = categoryLevel3;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}
	

}
