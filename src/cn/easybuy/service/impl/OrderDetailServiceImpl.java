package  cn.easybuy.service.impl;

import java.sql.Connection;

import java.sql.SQLException;
import java.util.List;

import cn.easybuy.entity.OrderDetail;
import cn.easybuy.dao.impl.OrderDetailDaoImpl;
import cn.easybuy.service.OrderDetailService;
import cn.easybuy.util.DatabaseUtil;

public class OrderDetailServiceImpl implements OrderDetailService {
	
	@Override
	//获取所有订单详情信息
	public List<OrderDetail> findAllOrderDetail() throws SQLException {
		Connection conn = null;
		try {
			conn = DatabaseUtil.getConnection();

			return new OrderDetailDaoImpl(conn).getAllOrderDetail();
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DatabaseUtil.closeAll(conn, null, null);
		}
	}

	@Override
	//删除订单详情
	public int deleteById(int id) throws Exception {
		Connection conn = null;
        int result;
        try {
            conn = DatabaseUtil.getConnection();
            conn.setAutoCommit(false);
            result = new OrderDetailDaoImpl(conn).deleteById(id);
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
	//查询订单详情
	public OrderDetail getOrderDetailById(Integer id) throws Exception {
		Connection conn = null;
        try {
            conn = DatabaseUtil.getConnection();

            return new OrderDetailDaoImpl(conn).getOrderDetailById(id);
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            DatabaseUtil.closeAll(conn, null, null);
        }
	}

	
	//添加订单详情
	public int addOrderDetail(OrderDetail detail) throws Exception {
		Connection conn = null;
        int result;
        try {
            conn = DatabaseUtil.getConnection();
            conn.setAutoCommit(false);

            result = new OrderDetailDaoImpl(conn).addOrderDetail(detail);

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
	//修改订单详情
	public int updateOrderDetail(OrderDetail detail) throws Exception {
		Connection conn = null;
        int result;
        try {
            conn = DatabaseUtil.getConnection();
            conn.setAutoCommit(false);

            result = new OrderDetailDaoImpl(conn).updateOrderDetail(detail);

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
	//获取订单详情总数
	public int getTotalCount() throws SQLException {
		Connection conn = null;
		 int result = 0;
	        try {
	            conn = DatabaseUtil.getConnection();
	            result = new OrderDetailDaoImpl(conn).getTotalCount();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            DatabaseUtil.closeAll(conn, null, null);
	        }
		return result;
	}

	@Override
	public List<OrderDetail> getOrderDetailByOrderId(int orderId) throws SQLException {
		Connection conn = null;
        try {
            conn = DatabaseUtil.getConnection();

            return new OrderDetailDaoImpl(conn).getOrderDetailByOrderId(orderId);
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            DatabaseUtil.closeAll(conn, null, null);
        }
	}

	

	
}
