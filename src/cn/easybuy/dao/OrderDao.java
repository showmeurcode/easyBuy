package cn.easybuy.dao;

import java.sql.SQLException;
import java.util.List;

import cn.easybuy.entity.Order;
/**
 * 
 * @author zwy
 * 订单表工具接口
 *
 */
public interface OrderDao {
	/**
	 * 根据编号查看订单信息
	 * @param 
	 * @return 返回影响行数
	 */
	public Order findOrder(int id) throws SQLException;

	/**
	 * 根据订单编号查看订单信息
	 * @param 
	 * @return 返回影响行数
	 */
	public Order findOrderByserialNumber(String  serialNumber) throws SQLException;
	/**
	 * 根据用户ID查看订单信息
	 * @param 
	 * @return 返回影响行数
	 */
	public List<Order> findOrderUserId(int userId) throws SQLException;
	
	/**
	 * 添加新订单
	 * @param 
	 * @return 返回影响行数
	 */
	int addOrder(Order order) throws SQLException;
	
	/**
	 * 根据订单id删除订单
	 * @param 
	 * @return 返回影响行数
	 */
	int delOrder(int id) throws SQLException;
	
	/**
	 * 更改订单信息
	 * @param 
	 * @return 返回影响行数
	 */
	int updateOrder(Order order) throws SQLException;
}
