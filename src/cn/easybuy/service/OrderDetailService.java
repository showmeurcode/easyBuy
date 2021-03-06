package cn.easybuy.service;

import java.sql.SQLException;

import java.util.List;

import cn.easybuy.entity.OrderDetail;

public interface OrderDetailService {
	// 获取所有订单
	public List<OrderDetail> findAllOrderDetail() throws SQLException;

	// 根据ID删除订单
	public int deleteById(int id) throws Exception;

	// 查询订单信息
	public OrderDetail getOrderDetailById(Integer id) throws Exception;

	// 添加订单详情列表
	public int addOrderDetail(OrderDetail detail) throws Exception;

	// 修改订单详情
	public int updateOrderDetail(OrderDetail detail) throws Exception;

	// 获得订单详情总数
	public int getTotalCount() throws SQLException;
	 //根据订单编号获取订单详情
	List<OrderDetail> getOrderDetailByOrderId(int orderId) throws SQLException;

}
