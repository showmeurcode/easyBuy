package cn.easybuy.service.impl;

import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import cn.easybuy.dao.impl.BuycarDaoImpl;
import cn.easybuy.dao.impl.NewsDaoImpl;
import cn.easybuy.entity.Buycar;
import cn.easybuy.service.BuycarService;
import cn.easybuy.util.DatabaseUtil;

public class BuycarServiceImpl implements BuycarService  {

	@Override
	// 获取购物车所有商品信息
	public List<Buycar> getBuycarsByUserId(int userId) throws SQLException {
		Connection conn = null;
		try {
			conn = DatabaseUtil.getConnection();

			return new BuycarDaoImpl(conn).getBuycarsByUserId(userId);
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DatabaseUtil.closeAll(conn, null, null);
		}
	}

	@Override
	// 查询某条商品信息
	public Buycar getBuycarById(Integer id) throws Exception {
		Connection conn = null;
		try {
			conn = DatabaseUtil.getConnection();

			return new BuycarDaoImpl(conn).getBuycarById(id);
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DatabaseUtil.closeAll(conn, null, null);
		}
	}

	@Override
	// 根据ID删除购物车商品信息
	public int deleteById(int id) throws Exception {
		Connection conn = null;
		int result;
		try {
			conn = DatabaseUtil.getConnection();
			conn.setAutoCommit(false);
			result = new BuycarDaoImpl(conn).deleteById(id);
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
	// 添加购物车商品信息
	public int addBuycar(Buycar buycar) throws Exception {
		Connection conn = null;
		int result=-1;
		try {
			conn = DatabaseUtil.getConnection();
			conn.setAutoCommit(false);
			 Buycar oldbuycar= new BuycarDaoImpl(conn).getBuycarByuidAndpid(buycar.getUserId(),buycar.getProductId());
			if(oldbuycar!=null){
				oldbuycar.setQuantity(oldbuycar.getQuantity()+buycar.getQuantity());//数量相加
				result= new BuycarDaoImpl(conn).updateBuycar(oldbuycar);
				
			}else{

			result = new BuycarDaoImpl(conn).addBuycar(buycar);
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
	// 通过用户ID和商品ID找到Buycar对象
	public Buycar getBuycarByuidAndpid(int userId, int productId)
			throws Exception {
		Connection conn = null;
		try {
			conn = DatabaseUtil.getConnection();

			return new BuycarDaoImpl(conn).getBuycarByuidAndpid(userId, productId);
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DatabaseUtil.closeAll(conn, null, null);
		}
		
	}

	@Override
	//更新某购物车信息
	public int updateBuycar(Buycar buycar) throws Exception {
		Connection conn = null;
		int result;
		try {
			conn = DatabaseUtil.getConnection();
			conn.setAutoCommit(false);

			result = new BuycarDaoImpl(conn).updateBuycar(buycar);

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

}
