package cn.easybuy.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import cn.easybuy.dao.impl.UserAddressDaoImpl;
import cn.easybuy.entity.UserAddress;
import cn.easybuy.service.UserAddressService;
import cn.easybuy.util.DatabaseUtil;
/**
 * 
 * @author 李高珊
 * 用户地址类服务接口实现类
 */
public class UserAddressServiceImpl implements UserAddressService {

	@Override
	public int addAddress(UserAddress userAddress) throws SQLException {
		Connection conn = null;
		int result;
		try {
			conn = DatabaseUtil.getConnection();
			conn.setAutoCommit(false);
			
			if(userAddress.getIsDefault()==1){
				new UserAddressDaoImpl(conn).releaseDefault();
				
			}
			
			result = new UserAddressDaoImpl(conn).addAddress(userAddress);
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
	public int delAddress(int id) throws SQLException {
		Connection conn = null;
		int result;
		try {
			conn = DatabaseUtil.getConnection();
			conn.setAutoCommit(false);
			result = new UserAddressDaoImpl(conn).delAddress(id);
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
	public int updateAddress(UserAddress userAddress) throws SQLException {
		Connection conn = null;
		int result;
		try {
			conn = DatabaseUtil.getConnection();
			conn.setAutoCommit(false);
			result = new UserAddressDaoImpl(conn).updateAddress(userAddress);
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
	public List<UserAddress> findAddressByUserId(int userid)
			throws SQLException {
		Connection conn = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			
			return new UserAddressDaoImpl(conn).findAddressByUserId(userid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		} finally {
			DatabaseUtil.closeAll(conn, null, null);
		}
	}

}
