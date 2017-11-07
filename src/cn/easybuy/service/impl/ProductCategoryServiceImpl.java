package cn.easybuy.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import cn.easybuy.dao.impl.ProductCategoryDaoImpl;
import cn.easybuy.entity.ProductCategory;
import cn.easybuy.service.ProductCategoryService;
import cn.easybuy.util.DatabaseUtil;
/**
 * 
 * @author zwy
 * 商品分类表服务接口实现类
 *
 */
public class ProductCategoryServiceImpl implements ProductCategoryService{

	@Override
	public ProductCategory findProductCategory(int id) throws SQLException {
		Connection conn=null;
		ProductCategory result;
		try {
			conn=DatabaseUtil.getConnection();
			conn.setAutoCommit(false);
			result=new ProductCategoryDaoImpl(conn).findProductCategory(id);
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			if (conn != null)
				 conn.rollback();
			throw e;
		} finally {
			DatabaseUtil.closeAll(conn, null, null);
		}
		return result;
	}

	@Override
	public int addProductCategory(ProductCategory productcategory)
			throws SQLException {
		Connection conn = null;
		int result;
		try {
			conn=DatabaseUtil.getConnection();
			conn.setAutoCommit(false);
			result =new ProductCategoryDaoImpl(conn).addProductCategory(productcategory);
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			if(conn != null)
				conn.rollback();
			
			throw e;
		} finally {
			DatabaseUtil.closeAll(conn, null, null);
		}
		
		return result;
	}

	@Override
	public int delProductCategory(int id) throws SQLException {
		Connection conn=null;
		int result;
		try {
			conn=DatabaseUtil.getConnection();
			conn.setAutoCommit(false);
			result=new ProductCategoryDaoImpl(conn).delProductCategory(id);
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			if (conn != null)
				 conn.rollback();
			throw e;
		} finally {
			DatabaseUtil.closeAll(conn, null, null);
		}
		return result;
	}

	@Override
	public int updateProductCategory(ProductCategory productcategory)
			throws SQLException {
		Connection conn = null;
        int result;
        try {
            conn = DatabaseUtil.getConnection();
            conn.setAutoCommit(false);
            result = new ProductCategoryDaoImpl(conn).updateProductCategory(productcategory);
            conn.commit();
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			if (conn != null)
				 conn.rollback();
			throw e;
		} finally {
			DatabaseUtil.closeAll(conn, null, null);
		}
		return result;
	}

	@Override
	public List<ProductCategory> getAllProductCategory(int parentId)
			throws SQLException {
		Connection conn = null;
		List<ProductCategory> result;
        try {
        	conn = DatabaseUtil.getConnection();
            conn.setAutoCommit(false);
            result = new ProductCategoryDaoImpl(conn).getAllProductCategory(parentId);
            conn.commit();
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			if (conn != null)
				 conn.rollback();
			throw e;
		} finally {
			DatabaseUtil.closeAll(conn, null, null);
		}
		return result;
	}

	@Override
	public List<ProductCategory> getProductCategoryBytype(int type)
			throws SQLException {
		Connection conn = null;
		List<ProductCategory> result;
        try {
        	conn = DatabaseUtil.getConnection();
            conn.setAutoCommit(false);
            result = new ProductCategoryDaoImpl(conn).getProductCategoryBytype(type);
            conn.commit();
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			if (conn != null)
				 conn.rollback();
			throw e;
		} finally {
			DatabaseUtil.closeAll(conn, null, null);
		}
		return result;
	}

	@Override
	public List<ProductCategory> getProductCategory() throws SQLException {
		Connection conn = null;
		List<ProductCategory> result;
        try {
        	conn = DatabaseUtil.getConnection();
            conn.setAutoCommit(false);
            result = new ProductCategoryDaoImpl(conn).getProductCategory();
            conn.commit();
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			if (conn != null)
				 conn.rollback();
			throw e;
		} finally {
			DatabaseUtil.closeAll(conn, null, null);
		}
		return result;
	}
}
