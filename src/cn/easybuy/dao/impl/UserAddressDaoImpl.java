package cn.easybuy.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.easybuy.dao.BaseDao;
import cn.easybuy.dao.UserAddressDao;
import cn.easybuy.entity.UserAddress;
import cn.easybuy.util.DatabaseUtil;
/**
 * 
 * @author 李高珊
 * 用户地址类工具接口实现类
 */
public class UserAddressDaoImpl extends BaseDao implements UserAddressDao {

	public UserAddressDaoImpl(Connection conn) {
		super(conn);
	}
	
	@Override
	public int addAddress(UserAddress userAddress) throws SQLException {
		int result = 0;
		String sql = "insert into `user_address` ( `address`, `createTime`," +
        		"`userId`,`isDefault`,`remark`) VALUES( ?, ?, ?, ?,?)";
		Object[] params = new Object[]{userAddress.getAddress(),
				userAddress.getCreateTime(),userAddress.getUserId(),
				userAddress.getIsDefault(),userAddress.getRemark()};
		try {
			result = this.executeUpdate(sql, params);
		} catch (SQLException e) {
			e.printStackTrace();
			throw  e;
		}
		return result;
	}

	@Override
	public int delAddress(int id) throws SQLException {
		int result = 0;
		String sql = "delete from `user_address` WHERE `id` = ?";
		try {
			result = this.executeUpdate(sql, id);
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return result;
	}

	@Override
	public int updateAddress(UserAddress userAddress) throws SQLException {
		int result = 0;
		
		String sql = "update `user_address` set  `address`= ?, `createTime`= ?," +
        		"`userId`= ?, `isDefault`=?, `remark`=? where `id` = ?";
		Object[] params = new Object[]{userAddress.getAddress(),
				userAddress.getCreateTime(),userAddress.getUserId(),
				userAddress.getIsDefault(),userAddress.getRemark(),userAddress.getId()};
		try {
			result = this.executeUpdate(sql, params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		}
		return result;
	}

	@Override
	public List<UserAddress> findAddressByUserId(int userid) throws SQLException {
		List<UserAddress> list = new ArrayList<UserAddress>();;
		ResultSet rs = null;
		String sql = "select * from `user_address` where `userId`=?";
		try {
			rs = this.executeQuery(sql, userid);
			UserAddress userAdd = null;
			while(rs.next()){
				
				userAdd = new UserAddress();
				userAdd.setId(rs.getInt("id"));
				userAdd.setAddress(rs.getString("address"));
				userAdd.setCreateTime(rs.getString("createTime"));
				userAdd.setUserId(rs.getInt("userId"));
				userAdd.setIsDefault(rs.getInt("isDefault"));
				userAdd.setRemark(rs.getString("remark"));
				list.add(userAdd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DatabaseUtil.closeAll(null, null, rs);
		}
		return list;
	}

	/* (non-Javadoc)
	 * @see cn.easybuy.dao.UserAddressDao#releaseDefault()
	 */
	@Override
	public void releaseDefault()throws SQLException  {//设置所有条目为非默认

		
		String sql = "update `user_address` set  `isDefault`= 0";
		
		try {
			this.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		}
	
	}



}
