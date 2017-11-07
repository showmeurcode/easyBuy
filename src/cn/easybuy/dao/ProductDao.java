/**
 * 
 */
package cn.easybuy.dao;

import java.sql.SQLException;
import java.util.List;

import cn.easybuy.entity.Product;

/**
 * @author x
 *  商品  dao层接口
 */
public interface ProductDao {

	
	int addProduct (Product product);//增加某商品
	int delProductById(int id);//根据商品id删除某商品
	int updateProduct(Product product);//更新某商品
	List<Product> getProductsByCid(Integer categoryLevel ,Integer cid);//获取（某分类id下的）所有商品
	List<Product> getProductList(Integer categoryLevel,Integer cid,int pageNo, int pageSize) throws SQLException;//(根据所属分类) 分页获得商品
	public Product findProductByid(int id)  throws SQLException;
}
