package cn.easybuy.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.easybuy.dao.BaseDao;
import cn.easybuy.dao.FavouriteDao;
import cn.easybuy.entity.Favourite;
import cn.easybuy.util.DatabaseUtil;

/**
 * 
 * @author zwy
 *
 */
public class FavouriteDaoImpl extends  BaseDao implements FavouriteDao{

	public FavouriteDaoImpl(Connection conn) {
		super(conn);
	}

	@Override
	public List<Favourite> findFavouriteByUserId(int userId)
			throws SQLException {
		List<Favourite> list = new ArrayList<Favourite>();
		ResultSet rs = null;
		String sql = "SELECT `id`, `productId`,  `userId` FROM `favourite` where userId=?";
		try {
			rs = this.executeQuery(sql, userId);
			Favourite favourite = null;
			while (rs.next()) {
				favourite = new Favourite();
				favourite.setId(rs.getInt("id"));
				favourite.setProductId(rs.getInt("productId"));
				favourite.setUserId(rs.getInt("userId"));
				list.add(favourite);
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
	public Favourite findFavouriteById(int id) throws SQLException {
		ResultSet rs = null;
		String sql = "SELECT * FROM `favourite` WHERE `id` = ?";
		Favourite favourite = null;
		try {
			rs = this.executeQuery(sql, id);
			if (rs.next()) {
				favourite = new Favourite();
				favourite.setId(rs.getInt("id"));
				favourite.setProductId(rs.getInt("productId"));
				favourite.setUserId(rs.getInt("userId"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DatabaseUtil.closeAll(null, null, rs);
		}
		return favourite;
	}

	@Override
	public int delFavouriteById(int id) throws SQLException {
		String sql = "DELETE FROM `favourite` WHERE `id` = ?";
		int result = 0;
		try {
			result = executeUpdate(sql, id);
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return result;
	}

	@Override
	//添加收藏
	public int addFavourite(Favourite favourite) throws SQLException {
		String sql = "INSERT INTO `favourite`( `productId`, `userId`) VALUES(?,?)";
		
		int result = 0;
		try {
			result = executeUpdate(sql, favourite.getProductId(),favourite.getUserId());
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return result;
	}

	@Override
	public Favourite findFavouriteByAllID(int userId, int productId)
			throws SQLException {
		ResultSet rs = null;
		String sql = "SELECT * FROM `favourite` WHERE `userId` = ? and `productId`=?";
		Favourite favourite = null;
		try {
			rs = this.executeQuery(sql, userId,productId);
			if (rs.next()) {
				favourite = new Favourite();
				favourite.setId(rs.getInt("id"));
				favourite.setProductId(rs.getInt("productId"));
				favourite.setUserId(rs.getInt("userId"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DatabaseUtil.closeAll(null, null, rs);
		}
		return favourite;
	}
	
}
