package cn.easybuy.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.easybuy.dao.BaseDao;
import cn.easybuy.dao.BuycarDao;
import cn.easybuy.entity.Buycar;

import cn.easybuy.util.DatabaseUtil;

public class BuycarDaoImpl extends  BaseDao implements BuycarDao  {

	public BuycarDaoImpl(Connection conn) {
		super(conn);
		// TODO Auto-generated constructor stub
	}

	@Override
	// 获取某用户购物车所有商品信息
	public List<Buycar> getBuycarsByUserId(int userId) throws SQLException {
		List<Buycar> list = new ArrayList<Buycar>();
		ResultSet rs = null;
		String sql = "SELECT `id`, `productId`,  `userId`,"
				+ " `quantity` FROM `buycar` where userid=?";
		try {
			rs = this.executeQuery(sql,userId);
			Buycar buycar = null;
			while (rs.next()) {
				buycar = new Buycar();
				buycar.setId(rs.getInt("id"));
				buycar.setProductId(rs.getInt("productId"));
				buycar.setUserId(rs.getInt("userId"));
				buycar.setQuantity(rs.getInt("quantity"));
				list.add(buycar);
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
	//查询某条商品信息
	public Buycar getBuycarById(Integer id) throws Exception {
		ResultSet rs = null;
		String sql = "SELECT * FROM `buycar` WHERE `id` = ?";
		Buycar buycar = null;
		try {
			rs = this.executeQuery(sql, id);
			if (rs.next()) {
				buycar = new Buycar();
				buycar.setId(rs.getInt("id"));
				buycar.setProductId(rs.getInt("productId"));
				buycar.setUserId(rs.getInt("userId"));
				buycar.setQuantity(rs.getInt("quantity"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DatabaseUtil.closeAll(null, null, rs);
		}
		return buycar;
	}

	@Override
	//根据ID删除购物车商品信息
	public int deleteById(int id) throws Exception {
		String sql = "DELETE FROM `buycar` WHERE `id` = ?";
		int result = -1;
		try {
			result = executeUpdate(sql, id);
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return result;
	}

	@Override
	//添加购物车商品信息
	public int addBuycar(Buycar buycar) throws Exception {
		String sql = "INSERT INTO `buycar`(`productId`, `userId`, `quantity`) VALUES( ?,?,?)";

		int result = -1;
		try {
			result = executeUpdate(sql, buycar.getProductId(),buycar.getUserId(),buycar.getQuantity());
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return result;
	}

	@Override
	// 通过用户ID和商品ID找到Buycar对象
	public Buycar getBuycarByuidAndpid(int userId, int productId)throws Exception {
		ResultSet rs = null;
		String sql = "SELECT * FROM `buycar` WHERE `userId` = ? and `productId`=?";
		Buycar buycar = null;
		try {
			rs = this.executeQuery(sql, userId,productId);
			if (rs.next()) {
				buycar = new Buycar();
				buycar.setId(rs.getInt("id"));
				buycar.setProductId(rs.getInt("productId"));
				buycar.setUserId(rs.getInt("userId"));
				buycar.setQuantity(rs.getInt("quantity"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DatabaseUtil.closeAll(null, null, rs);
		}
		return buycar;
	}

	@Override
	//更新某购物车信息
	public int updateBuycar(Buycar buycar) throws Exception {
		String sql = "UPDATE `buycar` SET  `userid`= ?, " +
				" `productid`= ? ,`quantity`= ?  WHERE `id`= ?";
		
		int result = -1;
		try {
			result = executeUpdate(sql,buycar.getUserId(), buycar.getProductId(),buycar.getQuantity(),buycar.getId());
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return result;
	}

}
