package cn.easybuy.service;

import java.sql.SQLException;
import java.util.List;

import cn.easybuy.entity.ProductCategory;

/**
 * 
 * @author zwy
 * 商品分类表服务接口
 */
public interface ProductCategoryService {
	/**
	 * 查看分类信息
	 * @param 
	 * @return 返回影响行数
	 */
	public ProductCategory findProductCategory(int id) throws SQLException;
	
	/**
	 * 添加新分类
	 * @param 
	 * @return 返回影响行数
	 */
	int addProductCategory(ProductCategory productcategory) throws SQLException;
	
	/**
	 * 根据分类id删除分类
	 * @param 
	 * @return 返回影响行数
	 */
	int delProductCategory(int id) throws SQLException;
	
	/**
	 * 更改分类信息
	 * @param 
	 * @return 返回影响行数
	 */
	int updateProductCategory(ProductCategory productcategory) throws SQLException;
	
	/**
	 * 根据父分类来查找产品分类
	 */
	public List<ProductCategory> getAllProductCategory(int parentId) throws SQLException;
	
	/**
	 * 根据type来查找产品分类
	 */
	public List<ProductCategory> getProductCategoryBytype(int type) throws SQLException;
	
	/**
	 * 获取所有分类的方法
	 */
	public List<ProductCategory> getProductCategory() throws SQLException;
}
