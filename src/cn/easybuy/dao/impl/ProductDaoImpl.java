/**
 * 
 */
package cn.easybuy.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.easybuy.dao.BaseDao;
import cn.easybuy.dao.ProductDao;
import cn.easybuy.entity.Product;
import cn.easybuy.util.DatabaseUtil;

/**
 * @author x
 *商品  dao层实现类
 */
public class ProductDaoImpl extends BaseDao implements ProductDao {

	public ProductDaoImpl(Connection conn) {
		super(conn);
		// TODO Auto-generated constructor stub
	}




	@Override
	public int addProduct(Product product) {
		int result=0;
		String sql="insert into `product` " +
				"(`name`,`description`,`price`,`stock`,`categorylevel1`,`categorylevel2`,`categorylevel3`,`fileName`,`isDelete`)" +
				" values (?,?,?,?,?,?,?,?,?)";
		Object[] params=new Object[] {product.getName(),product.getDescription(),
				product.getPrice(),product.getStock(),product.getCategoryLevel1(),product.getCategoryLevel2(),
				product.getCategoryLevel3(),product.getFileName(),product.getIsDelete()};
		try {
			result=this.executeUpdate(sql, params);
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return result;
	}

	@Override
	public int delProductById(int id) {
		int result=0;
		String sql="delete from `product` where `id` = ?";
		try {
			result=this.executeUpdate(sql, id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int updateProduct(Product product) {
		String sql = "UPDATE `product` SET `name`= ?, `description`=? ,`price`=? ,`stock`=?, `categorylevel1`=?, `categorylevel2`=?, `categorylevel3`=? ,`fileName`=?, `isDelete`=? WHERE `id` = ?";
		Object[] params = new Object[] { product.getName(),product.getDescription(),product.getPrice(),
				product.getStock(),product.getCategoryLevel1(),product.getCategoryLevel2(),
				product.getCategoryLevel3(),product.getFileName(),product.getIsDelete(),product.getId()};
		int result = 0;
		try {
			result = executeUpdate(sql, params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Product> getProductsByCid(Integer categoryLevel, Integer cid) {
		List<Product> list = new ArrayList<Product>();
		ResultSet rs = null;
		String sql = "select * from `product`";
		try {
			if(categoryLevel == null || cid == null){
				rs = this.executeQuery(sql);
			}else{
				switch(categoryLevel){

				case 1:
					sql += "where `categorylevel1`=?";
					break;
				case 2:
					sql += "where `categorylevel2`=?";;
					break;
				case 3:
					sql += "where `categorylevel3`=?";;
					break;
				default:

					break;
				}
				rs = this.executeQuery(sql,cid);
			}
			Product product = null;
			while(rs.next()){
				product = new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setDescription(rs.getString("description"));
				product.setPrice(rs.getFloat("price"));
				product.setStock(rs.getInt("stock"));
				product.setCategoryLevel1(rs.getInt("categorylevel1"));
				product.setCategoryLevel2(rs.getInt("categorylevel2"));
				product.setCategoryLevel3(rs.getInt("categorylevel3"));
				product.setFileName(rs.getString("fileName"));
				product.setIsDelete(rs.getInt("isDelete"));
				list.add(product);
			}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		return list;
	}

	@Override
	public List<Product> getProductList(Integer categoryLevel, Integer cid,
			int pageNo, int pageSize) throws SQLException {
		List<Product> list = new ArrayList<Product>();
		ResultSet rs = null;

		String sql = "select * from `product` ";
		try {
			if(categoryLevel == null || cid == null){
				sql = sql + " order by `id` desc limit ?, ?";
				rs = this.executeQuery(sql, (pageNo-1)*pageSize, pageSize);
			}else{
				switch(categoryLevel){

				case 1:
					sql += "where `categorylevel1`=?";
					break;
				case 2:
					sql += "where `categorylevel2`=?";
					break;
				case 3:
					sql += "where `categorylevel3`=?";
					break;
				default:
					break;
				}
				sql = sql + " order by `id` desc limit ?, ?";
				rs = this.executeQuery(sql, cid,(pageNo-1)*pageSize, pageSize);

			}



			Product product = null;
			while(rs.next()){
				product = new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setDescription(rs.getString("description"));
				product.setPrice(rs.getFloat("price"));
				product.setStock(rs.getInt("stock"));
				product.setCategoryLevel1(rs.getInt("categorylevel1"));
				product.setCategoryLevel2(rs.getInt("categorylevel2"));
				product.setCategoryLevel3(rs.getInt("categorylevel3"));
				product.setFileName(rs.getString("fileName"));
				product.setIsDelete(rs.getInt("isDelete"));
				list.add(product);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DatabaseUtil.closeAll(null, null, rs);
		}
		return list;
	}




	@Override
	public Product findProductByid(int id) throws SQLException{
		ResultSet rs = null;
		Product product = null;
        String sql = "select * from product where id=?";
		try {
			rs=this.executeQuery(sql,id);
			while(rs.next()){
				product=new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setDescription(rs.getString("description"));
				product.setPrice(rs.getFloat("price"));
				product.setStock(rs.getInt("stock"));
				product.setCategoryLevel1(rs.getInt("categorylevel1"));
				product.setCategoryLevel2(rs.getInt("categorylevel2"));
				product.setCategoryLevel3(rs.getInt("categorylevel3"));
				product.setFileName(rs.getString("fileName"));
				product.setIsDelete(rs.getInt("isDelete"));
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		}finally{
			DatabaseUtil.closeAll(null, null, rs);
		}
        return product;
	}



	


}
