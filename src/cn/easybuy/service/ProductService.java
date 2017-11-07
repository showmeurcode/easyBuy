/**
 * 
 */
package cn.easybuy.service;

import java.sql.SQLException;
import java.util.List;


import cn.easybuy.entity.Product;
import cn.easybuy.util.Page;

/**
 * @author x
 *
 */
public interface ProductService {


	
	public int updateProduct(Product product) throws Exception;// 修改订单详情
	List<Product>  getAllPrductsByCid(Integer categoryLevel,Integer cid)throws SQLException;//获取某分类下的所有的商品
	int addProduct (Product product)throws SQLException;//增加某商品
	int delProductById(int id)throws SQLException;//根据商品id删除某商品
	void findPageObj(Integer categoryLevel ,Integer cid ,Page pageObj)throws SQLException; //赋予page对象属性
	public Product findProductByid(int id) throws Exception;
	
}
