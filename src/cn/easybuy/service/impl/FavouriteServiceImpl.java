package cn.easybuy.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import cn.easybuy.dao.impl.FavouriteDaoImpl;
import cn.easybuy.entity.Favourite;
import cn.easybuy.service.FavouriteService;
import cn.easybuy.util.DatabaseUtil;

/**
 * 
 * @author zwy
 *
 */
public class FavouriteServiceImpl implements FavouriteService{

	@Override
	public List<Favourite> findFavouriteByUserId(int userId)
			throws SQLException {
		Connection conn = null;
		try {
			conn = DatabaseUtil.getConnection();

			return new FavouriteDaoImpl(conn).findFavouriteByUserId(userId);
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DatabaseUtil.closeAll(conn, null, null);
		}
	}

	@Override
	public Favourite findFavouriteById(int id) throws SQLException {
		Connection conn = null;
		try {
			conn = DatabaseUtil.getConnection();

			return new FavouriteDaoImpl(conn).findFavouriteById(id);
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DatabaseUtil.closeAll(conn, null, null);
		}
	}
	
	@Override
	public int delFavouriteById(int id) throws SQLException {
		Connection conn = null;
		int result;
		try {
			conn = DatabaseUtil.getConnection();
			conn.setAutoCommit(false);
			result = new FavouriteDaoImpl(conn).delFavouriteById(id);
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
	public int addFavourite(Favourite favourite) throws SQLException {
		Connection conn = null;
		int result=-1;
		Favourite existfavourite=null;
		try {
			conn = DatabaseUtil.getConnection();
			conn.setAutoCommit(false);
			existfavourite=new  FavouriteDaoImpl(conn).findFavouriteByAllID(favourite.getUserId(), favourite.getProductId());
			if(existfavourite==null){
				result = new FavouriteDaoImpl(conn).addFavourite(favourite);
			}else{
				result=0;
				
			}
			
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
	public Favourite findFavouriteByAllID(int userId, int productId)
			throws Exception {
		Connection conn = null;
		try {
			conn = DatabaseUtil.getConnection();

			return new FavouriteDaoImpl(conn).findFavouriteByAllID(userId, productId);
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DatabaseUtil.closeAll(conn, null, null);
		}
	}
	
}
