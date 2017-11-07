package cn.easybuy.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.easybuy.dao.BaseDao;
import cn.easybuy.dao.UserDao;
import cn.easybuy.entity.User;
import cn.easybuy.util.DatabaseUtil;
/**
 * 
 * @author 李高珊
 * 用户类工具接口实现类
 */
public class UserDaoImpl extends BaseDao implements UserDao {

	public UserDaoImpl(Connection conn) {
		super(conn);
	}

	@Override
	public int addUser(User user) throws SQLException {
		int result=0;
		String sql="insert into `user` " +
				"(`userName`,`loginName`,`password`,`sex`,`identityCode`,`email`,`mobile`,`type`)" +
				" values (?,?,?,?,?,?,?,?)";
		Object[] params=new Object[] {user.getUserName(),user.getLoginName(),
				user.getPassword(),user.getSex(),user.getIdentityCode(),
				user.getEmail(),user.getMobile(),user.getType()};
		try {
			result=this.executeUpdate(sql, params);
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} 
		return result;
	}

	@Override
	public int delUser(int id) throws SQLException {
		int result=0;
		String sql="delete from `user` where `id` = ?";
		try {
			result=this.executeUpdate(sql, id);
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return result;
	}

	@Override
	public User userLogin(String name, String password) throws SQLException {
		User user=null;
		ResultSet rs=null;
		String sql = "SELECT `id`,`userName`,`loginName`,`password`,`sex`,`identityCode`,`email`,`mobile`,`type` FROM USER WHERE `loginName`=? AND `password`=?";
		try {
			rs=this.executeQuery(sql, name,password);
			
			while (rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setUserName(rs.getString("userName"));
				user.setLoginName(rs.getString("loginName"));
				user.setPassword(rs.getString("password"));
				user.setSex(rs.getInt("sex"));
				user.setIdentityCode(rs.getString("identityCode"));
				user.setEmail(rs.getString("email"));
				user.setMobile(rs.getString("mobile"));
				user.setType(rs.getInt("type"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DatabaseUtil.closeAll(null, null, rs);
		}
		return user;
	}

	@Override
	public User findUserByname(String name) throws SQLException {
		User user=null;
		ResultSet rs=null;
		String sql = "select `id`,`userName`,`loginName`,`password`," +
				"`sex`,`identityCode`,`email`,`mobile`,`type` " +
				"from user "+
				"where `loginName`=?";
		try {
			rs=this.executeQuery(sql, name);
			
			while (rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setUserName(rs.getString("userName"));
				user.setLoginName(rs.getString("loginName"));
				user.setPassword(rs.getString("password"));
				user.setSex(rs.getInt("sex"));
				user.setIdentityCode(rs.getString("identityCode"));
				user.setEmail(rs.getString("email"));
				user.setMobile(rs.getString("mobile"));
				user.setType(rs.getInt("type"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DatabaseUtil.closeAll(null, null, rs);
		}
		return user;
	}

	@Override
	public List<User> findUserByType(int type) throws SQLException {
		List<User> list = new ArrayList<User>();
		User user=null;
		ResultSet rs=null;
		String sql = "select `id`,`userName`,`loginName`,`password`," +
				"`sex`,`identityCode`,`email`,`mobile`,`type` " +
				"from user "+
				"where `type`=?";
		try {
			rs=this.executeQuery(sql, type);
			
			while (rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setUserName(rs.getString("userName"));
				user.setLoginName(rs.getString("loginName"));
				user.setPassword(rs.getString("password"));
				user.setSex(rs.getInt("sex"));
				user.setIdentityCode(rs.getString("identityCode"));
				user.setEmail(rs.getString("email"));
				user.setMobile(rs.getString("mobile"));
				user.setType(rs.getInt("type"));
				list.add(user);
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
