package cn.easybuy.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.easybuy.dao.BaseDao;
import cn.easybuy.dao.OrderDao;
import cn.easybuy.entity.Order;
import cn.easybuy.util.DatabaseUtil;

/**
 * 
 * @author zwy
 * 订单表工具接口实现类
 *
 */
public class OrderDaoImpl extends BaseDao implements OrderDao {

	public OrderDaoImpl(Connection conn) {
		super(conn);
	}

	@Override
	public Order findOrder(int id) throws SQLException {
		ResultSet rs = null;
		Order order = null;
        String sql = "select * from order where id=?";
		try {
			rs=this.executeQuery(sql,id);
			while(rs.next()){
				order=new Order();
				order.setId(rs.getInt("id"));
				order.setUserId(rs.getString("userId"));
				order.setLoginName(rs.getString("loginName"));
				order.setUserAddress(rs.getString("userAddress"));
				order.setCreateTime(rs.getString("createTime"));
				order.setCost(rs.getFloat("cost"));
				order.setStatus(rs.getInt("status"));
				order.setType(rs.getInt("type"));
				order.setSerialNumber(rs.getString("serialNumber"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		}finally{
			DatabaseUtil.closeAll(null, null, rs);
		}
        return order;
	}
	@Override//根据订单编号查看订单信息
	public Order findOrderByserialNumber(String serialNumber) throws SQLException {
		ResultSet rs = null;
		Order order = null;
        String sql = "select * from`order` where serialNumber=?";
		try {
			rs=this.executeQuery(sql,serialNumber);
			while(rs.next()){
				order=new Order();
				order.setId(rs.getInt("id"));
				order.setUserId(rs.getString("userId"));
				order.setLoginName(rs.getString("loginName"));
				order.setUserAddress(rs.getString("userAddress"));
				order.setCreateTime(rs.getString("createTime"));
				order.setCost(rs.getFloat("cost"));
				order.setStatus(rs.getInt("status"));
				order.setType(rs.getInt("type"));
				order.setSerialNumber(rs.getString("serialNumber"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		}finally{
			DatabaseUtil.closeAll(null, null, rs);
		}
        return order;
	}
	@Override
	public List<Order> findOrderUserId(int userId) throws SQLException {
		ResultSet rs = null;
		Order order = null;
		List<Order> list = new ArrayList<Order>();
        String sql = "select * from `order` where `userId`=?";
		try {
			rs=this.executeQuery(sql,userId);
			while(rs.next()){
				order=new Order();
				order.setId(rs.getInt("id"));
				order.setUserId(rs.getString("userId"));
				order.setLoginName(rs.getString("loginName"));
				order.setUserAddress(rs.getString("userAddress"));
				order.setCreateTime(rs.getString("createTime"));
				order.setCost(rs.getFloat("cost"));
				order.setStatus(rs.getInt("status"));
				order.setType(rs.getInt("type"));
				order.setSerialNumber(rs.getString("serialNumber"));
				list.add(order);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		}finally{
			DatabaseUtil.closeAll(null, null, rs);
		}
        return list;
	}
	
	@Override
	public int addOrder(Order order) throws SQLException {
		int result=0;
		String sql="INSERT INTO `order` (`userId`,`loginName`,`userAddress`,`createTime`,`cost`,`status`,`type`,`serialNumber`)VALUES (?,?,?,?,?,?,?,?)";
		Object[] params=new Object[] {order.getUserId(),order.getLoginName(),
				order.getUserAddress(),order.getCreateTime(),order.getCost(),
				order.getStatus(),order.getType(),order.getSerialNumber()};
		try {
			result=this.executeUpdate(sql, params);
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} 
		return result;
	}

	@Override
	public int delOrder(int id) throws SQLException {
		int result=0;
		String sql="delete from `order` where `id` = ?";
		try {
			result=this.executeUpdate(sql, id);
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return result;
	}

	@Override
	public int updateOrder(Order order) throws SQLException {
		String sql = "UPDATE `order` SET `userId`= ?,`loginName`=?,`userAddress`=?,`createTime`=?,`cost`=?,`status`=?,`type`=?,`serialNumber`=? WHERE `id` = ?";
		Object[] params = new Object[] { order.getUserId(),order.getLoginName(),order.getUserAddress(),
				order.getCreateTime(),order.getCost(),order.getStatus(),order.getType(),
				order.getSerialNumber(),order.getId()};
		int result = 0;
		try {
			result = executeUpdate(sql, params);
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
     	  return result;
	}



	

}
