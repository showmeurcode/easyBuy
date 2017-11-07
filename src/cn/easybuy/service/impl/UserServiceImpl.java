package cn.easybuy.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import cn.easybuy.dao.impl.UserDaoImpl;
import cn.easybuy.entity.User;
import cn.easybuy.service.UserService;
import cn.easybuy.util.DatabaseUtil;
/**
 * 
 * @author 李高珊
 * 用户类服务接口实现类
 */
public class UserServiceImpl implements UserService {

	@Override
	public int addUser(User user) throws SQLException {
		
		Connection conn = null;
		int result;
		try {
			conn=DatabaseUtil.getConnection();
			conn.setAutoCommit(false);
			
			result =new UserDaoImpl(conn).addUser(user);

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
	public int delUser(int id) throws SQLException {
		Connection conn=null;
		int result;
		try {
			conn=DatabaseUtil.getConnection();
			conn.setAutoCommit(false);
			result=new UserDaoImpl(conn).delUser(id);
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
	public User userLogin(String name, String password) throws SQLException {
		 Connection conn = null;
		 try {
			conn = DatabaseUtil.getConnection();
			 
			return new UserDaoImpl(conn).userLogin(name, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		} finally {
			DatabaseUtil.closeAll(conn, null, null);
		}
		
	}

	@Override
	public User findUserByname(String name) throws SQLException {
		 Connection conn = null;
		 try {
			conn = DatabaseUtil.getConnection();
			 
			return new UserDaoImpl(conn).findUserByname(name);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		} finally {
			DatabaseUtil.closeAll(conn, null, null);
		}
	}

	@Override
	public List<User> findUserByType(int type) throws SQLException {
		 Connection conn = null;
		 try {
			conn = DatabaseUtil.getConnection();
			 
			return new UserDaoImpl(conn).findUserByType(type);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		} finally {
			DatabaseUtil.closeAll(conn, null, null);
		}
	}

}
