package cn.easybuy.dao;

import java.sql.SQLException;

import java.util.List;

import cn.easybuy.entity.OrderDetail;
/**
 * 
 * @author 孔祥忠
 * 订单详情
 */
public interface OrderDetailDao {
		// 获取所有新闻
	    public List<OrderDetail> getAllOrderDetail() throws SQLException;
		//根据ID删除订单
		public int deleteById(int id) throws Exception;
		//查询订单信息
		public OrderDetail getOrderDetailById(Integer id)throws Exception; 
		//添加订单详情列表
		public int addOrderDetail(OrderDetail detail)throws Exception;
		//修改订单详情
		public int updateOrderDetail(OrderDetail detail)throws Exception;
		// 获得订单详情总数
	    public int getTotalCount() throws SQLException;
	    //根据订单编号获取订单详情
	    List<OrderDetail> getOrderDetailByOrderId(int orderId) throws SQLException;
}
