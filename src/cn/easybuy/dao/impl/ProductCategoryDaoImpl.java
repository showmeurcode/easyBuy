package cn.easybuy.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.easybuy.dao.BaseDao;
import cn.easybuy.dao.ProductCategoryDao;
import cn.easybuy.entity.ProductCategory;
import cn.easybuy.util.DatabaseUtil;

/**
 * 
 * @author zwy
 * 商品分类表工具接口实现类
 */
public class ProductCategoryDaoImpl  extends BaseDao implements ProductCategoryDao {

	public ProductCategoryDaoImpl(Connection conn) {
		super(conn);
	}

	@Override
	public ProductCategory findProductCategory(int id) throws SQLException {
		ResultSet rs = null;
		ProductCategory productcategory = null;
        // 根据用户名密码查找匹配的用户
        String sql = "select * from product_category where id=?";
		try {
			rs=this.executeQuery(sql,id);
			while(rs.next()){
				productcategory=new ProductCategory();
				productcategory.setId(id);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		}finally{
			DatabaseUtil.closeAll(null, null, rs);
		}
        return productcategory;
	}

	@Override
	public int addProductCategory(ProductCategory productcategory)
			throws SQLException {
		int result=0;
		String sql="insert into `product_category` " +
				"(`name`,`parentId`,`type`)" +
				" values (?,?,?)";
		Object[] params=new Object[] {productcategory.getName(),productcategory.getParentId(),
				productcategory.getType()};
		try {
			result=this.executeUpdate(sql, params);
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} 
		return result;
	}

	@Override
	public int delProductCategory(int id) throws SQLException {
		int result=0;
		String sql="delete from `product_category` where `id` = ?";
		try {
			result=this.executeUpdate(sql, id);
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return result;
	}

	@Override
	public int updateProductCategory(ProductCategory productcategory)
			throws SQLException {
		String sql = "UPDATE `product_category` SET `name`= ?,`parentId`=?,`type`=? WHERE `id` = ?";
		// System.out.println(productcategory.getName() + ":id"+productcategory.getId());
       Object[] params = new Object[] { productcategory.getName(),productcategory.getParentId(),
    		   productcategory.getType(),productcategory.getId() };
       int result = 0;
       try {
           result = executeUpdate(sql, params);
       } catch (SQLException e) {
           e.printStackTrace();
           throw e;
       }
       return result;
	}

	@Override
	public List<ProductCategory> getAllProductCategory(int parentId)
			throws SQLException {
		List<ProductCategory> list = new ArrayList<ProductCategory>();
        ResultSet rs = null;
        // 获取所有分类
        String sql = "select * from product_category where parentId=?";
        try {
            rs = executeQuery(sql,parentId);
            ProductCategory productcategory = null;
            while (rs.next()) {
            	productcategory = new ProductCategory();
            	productcategory.setId(rs.getInt("id"));
            	productcategory.setName(rs.getString("name"));
            	productcategory.setParentId(rs.getInt("parentId"));
            	productcategory.setType(rs.getInt("type"));
                list.add(productcategory);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            DatabaseUtil.closeAll(null, null, rs);
        }
        return list;
	}

	@Override
	public List<ProductCategory> getProductCategoryBytype(int type)
			throws SQLException {
		List<ProductCategory> list = new ArrayList<ProductCategory>();
        ResultSet rs = null;
        // 获取所有分类
        String sql = "select * from product_category where type=?";
        try {
            rs = executeQuery(sql,type);
            ProductCategory productcategory = null;
            while (rs.next()) {
            	productcategory = new ProductCategory();
            	productcategory.setId(rs.getInt("id"));
            	productcategory.setName(rs.getString("name"));
            	productcategory.setParentId(rs.getInt("parentId"));
            	productcategory.setType(rs.getInt("type"));
                list.add(productcategory);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            DatabaseUtil.closeAll(null, null, rs);
        }
        return list;
	}

	@Override
	public List<ProductCategory> getProductCategory() throws SQLException {
		List<ProductCategory> list = new ArrayList<ProductCategory>();
        ResultSet rs = null;
        // 获取所有分类
        String sql = "select * from product_category";
        try {
            rs = executeQuery(sql);
            ProductCategory productcategory = null;
            while (rs.next()) {
            	productcategory = new ProductCategory();
            	productcategory.setId(rs.getInt("id"));
            	productcategory.setName(rs.getString("name"));
            	productcategory.setParentId(rs.getInt("parentId"));
            	productcategory.setType(rs.getInt("type"));
                list.add(productcategory);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            DatabaseUtil.closeAll(null, null, rs);
        }
        return list;
	}


}
