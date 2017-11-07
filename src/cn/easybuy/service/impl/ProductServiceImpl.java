/**
 * 
 */
package cn.easybuy.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.easybuy.dao.ProductDao;
import cn.easybuy.dao.impl.ProductDaoImpl;
import cn.easybuy.entity.Product;
import cn.easybuy.service.ProductService;
import cn.easybuy.util.DatabaseUtil;
import cn.easybuy.util.Page;

/**
 * @author x
 *
 */
public class ProductServiceImpl implements ProductService {

	@Override
	public int updateProduct(Product product) throws Exception {
		Connection conn = null;
		int result=-1;
		try {
			conn = DatabaseUtil.getConnection();
			conn.setAutoCommit(false);

			result = new ProductDaoImpl(conn).updateProduct(product);

			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			if (conn != null)
				try {
					conn.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			throw e;
		} finally {
			DatabaseUtil.closeAll(conn, null, null);
		}
		return result;
	}

	@Override
	public List<Product> getAllPrductsByCid(Integer categoryLevel, Integer cid) throws SQLException{
		Connection conn = null;
		try {
			conn = DatabaseUtil.getConnection();

			return new ProductDaoImpl(conn).getProductsByCid(categoryLevel, cid);
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DatabaseUtil.closeAll(conn, null, null);
		}
	}

	@Override
	public int addProduct(Product product) throws SQLException {
		Connection conn = null;
		int result=-1;
		try {
			conn = DatabaseUtil.getConnection();
			conn.setAutoCommit(false);

			result = new ProductDaoImpl(conn).addProduct(product);

			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			if (conn != null)
				try {
					conn.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			throw e;
		} finally {
			DatabaseUtil.closeAll(conn, null, null);
		}
		return result;
	}

	@Override
	public int delProductById(int id) throws SQLException {
		Connection conn = null;
		int result=-1;
		try {
			conn = DatabaseUtil.getConnection();
			conn.setAutoCommit(false);

			result = new ProductDaoImpl(conn).delProductById(id);

			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			if (conn != null)
				try {
					conn.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			throw e;
		} finally {
			DatabaseUtil.closeAll(conn, null, null);
		}
		return result;
	}

	@Override
	public void findPageObj(Integer categoryLevel, Integer cid, Page pageObj)
			throws SQLException {
		Connection conn = null;
		try {
			conn = DatabaseUtil.getConnection();

			ProductDao productDao = new ProductDaoImpl(conn);
			int totalCount = productDao.getProductsByCid(categoryLevel, cid).size();

			pageObj.setTotalCount(totalCount); // 设置总数量并计算总页数
			if (totalCount > 0) {
				if (pageObj.getCurrPageNo() > pageObj.getTotalPageCount())
					pageObj.setCurrPageNo(pageObj.getTotalPageCount());
				List<Product> productList = productDao.getProductList(categoryLevel, cid,pageObj.getCurrPageNo(), pageObj.getPageSize());
				pageObj.setProductList(productList);
			} else {
				pageObj.setCurrPageNo(0);
				pageObj.setProductList(new ArrayList<Product>());
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DatabaseUtil.closeAll(conn, null, null);
		}

	}

	@Override
	public Product findProductByid(int id) throws Exception {
		Connection conn=null;
		Product result;
		try {
			conn=DatabaseUtil.getConnection();
			conn.setAutoCommit(false);
			result=new ProductDaoImpl(conn).findProductByid(id);
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
