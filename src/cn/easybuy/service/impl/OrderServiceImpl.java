package cn.easybuy.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import cn.easybuy.dao.impl.OrderDaoImpl;
import cn.easybuy.entity.Order;
import cn.easybuy.service.OrderService;
import cn.easybuy.util.DatabaseUtil;

/**
 * 
 * @author zwy
 * 订单表服务接口实现类
 *
 */
public class OrderServiceImpl implements OrderService{

	@Override
	public Order findOrder(int id) throws SQLException {
		Connection conn=null;
		Order order=null;
		try {
			conn=DatabaseUtil.getConnection();
			conn.setAutoCommit(false);
			order=new OrderDaoImpl(conn).findOrder(id);
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
		return order;
	}
	
	
	@Override
	public Order findOrderByserialNumber(String serialNumber) throws SQLException {
		Connection conn=null;
		Order order=null;
		try {
			conn=DatabaseUtil.getConnection();
			conn.setAutoCommit(false);
			order=new OrderDaoImpl(conn).findOrderByserialNumber(serialNumber);
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
		return order;
	}
	@Override
	public List<Order> findOrderUserId(int userId) throws SQLException {
		Connection conn=null;
		List<Order> list = null;
		try {
			conn=DatabaseUtil.getConnection();
			conn.setAutoCommit(false);
			list=new OrderDaoImpl(conn).findOrderUserId(userId);
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
		return list;
	}

	@Override
	public int addOrder(Order order) throws SQLException {
		Connection conn = null;
		int result;
		try {
			conn=DatabaseUtil.getConnection();
			conn.setAutoCommit(false);
			result =new OrderDaoImpl(conn).addOrder(order);
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
	public int delOrder(int id) throws SQLException {
		Connection conn=null;
		int result;
		try {
			conn=DatabaseUtil.getConnection();
			conn.setAutoCommit(false);
			result=new OrderDaoImpl(conn).delOrder(id);
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
	public int updateOrder(Order order) throws SQLException {
		Connection conn = null;
        int result;
        try {
            conn = DatabaseUtil.getConnection();
            conn.setAutoCommit(false);
            result = new OrderDaoImpl(conn).updateOrder(order);
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
