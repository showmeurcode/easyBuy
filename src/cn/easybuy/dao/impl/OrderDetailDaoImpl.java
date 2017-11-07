package cn.easybuy.dao.impl;

import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

import cn.easybuy.dao.BaseDao;
import cn.easybuy.dao.OrderDetailDao;
import cn.easybuy.entity.Order;
import cn.easybuy.entity.OrderDetail;
import cn.easybuy.util.DatabaseUtil;

public class OrderDetailDaoImpl extends BaseDao implements OrderDetailDao {

	public OrderDetailDaoImpl(Connection conn) {
		super(conn);
		// TODO Auto-generated constructor stub
	}

	@Override
	//获取所有订单详情
	public List<OrderDetail> getAllOrderDetail() throws SQLException {

		List<OrderDetail> list = new ArrayList<OrderDetail>();
		ResultSet rs = null;
		String sql = "SELECT `id`, `orderId`, `productId`, `quantity`,"
				+ " `cost`, `order`.`loginName` FROM `order_detail`, `order`"
				+ " WHERE `order_detail`.`orderId` = `order`.`id`"
				+ " ORDER BY `id` DESC";
		try {
			rs = this.executeQuery(sql);
			OrderDetail detail = null;
			Order  order= null;
			while (rs.next()) {
				detail = new OrderDetail();
				order = new Order();
				detail.setId(rs.getInt("id"));
				detail.setOrderId(rs.getInt("orderId"));
				detail.setProductId(rs.getInt("productId"));
				detail.setQuantity(rs.getInt("quantity"));
				detail.setCost(rs.getFloat("cost"));
				order.setLoginName(rs.getString("loginName"));
				list.add(detail);
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
	// 删除订单
	public int deleteById(int id) throws Exception {
		int result = 0;
		String sql = "DELTE FROM `order_detail` where `id` = ?";
		try {
			result = this.executeUpdate(sql, id);
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return result;

	}

	@Override
	// 根据ID查询订单
	public OrderDetail getOrderDetailById(Integer id) throws Exception {
		ResultSet rs = null;
		String sql = "SELECT * FROM `order_detail` WHERE `id` = ?";
		OrderDetail detail = null;
		try {
			rs = this.executeQuery(sql, id);
			if (rs.next()) {
				detail = new OrderDetail();
				detail.setId(rs.getInt("id"));
				detail.setOrderId(rs.getInt("orderId"));
				detail.setProductId(rs.getInt("productId"));
				detail.setQuantity(rs.getInt("quantity"));
				detail.setCost(rs.getFloat("cost"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DatabaseUtil.closeAll(null, null, rs);
		}
		return detail;
	}

	@Override
	// 添加订单
	public int addOrderDetail(OrderDetail detail) throws Exception {
		String sql = "INSERT INTO `order_detail`(`orderId`, `productId`,"
				+ "`quantity`,`cost`) VALUES(?, ?, ?, ?)";
		
		Object[] params = new Object[] {  detail.getOrderId(),
				detail.getProductId(), detail.getQuantity(), detail.getCost() };
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
	// 更新订单
	public int updateOrderDetail(OrderDetail detail) throws Exception {
		String sql = "UPDATE `order_detail` SET `orderId`=? ,`productId`=? ,`quantity`=? ,`cost`= ? ";
		System.out.println(detail.getOrderId() + ":" + detail.getProductId()
				+ ":" + detail.getQuantity() + ":" + detail.getCost() + ":"
				+ ":id" + detail.getId());
		Object[] params = new Object[] { detail.getOrderId(),
				detail.getProductId(), detail.getQuantity(), detail.getCost(),
				detail.getId() };
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
	// 获得订单数量
	public int getTotalCount() throws SQLException {
		ResultSet rs = null;
		// List<Object> params = new ArrayList<Object>();
		String sql = "SELECT COUNT(`id`) FROM `order_detail`";

		int count = -1;
		try {
			rs = this.executeQuery(sql);
			rs.next();
			count = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DatabaseUtil.closeAll(null, null, rs);
		}
		return count;
	}

	@Override
	public List<OrderDetail> getOrderDetailByOrderId(int orderId) throws SQLException {
		List<OrderDetail> list = new ArrayList<OrderDetail>();
		OrderDetail orderDetail = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM `order_detail` WHERE `orderId` = ?";
		try {
			rs = this.executeQuery(sql, orderId);
			while (rs.next()) {
				orderDetail = new OrderDetail();
				orderDetail.setId(rs.getInt("id"));
				orderDetail.setOrderId(rs.getInt("orderId"));
				orderDetail.setProductId(rs.getInt("productId"));
				orderDetail.setQuantity(rs.getInt("quantity"));
				orderDetail.setCost(rs.getFloat("cost"));
				list.add(orderDetail);
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
