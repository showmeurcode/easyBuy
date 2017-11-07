package cn.easybuy.dao;

import java.sql.SQLException;
import java.util.List;


import cn.easybuy.entity.User;

/**
 * 
 * @author 李高珊
 * 用户类工具接口
 */
public interface UserDao {
	/**
	 * 添加新用户
	 * @param user 存储用户信息的用户对象
	 * @return 返回影响行数
	 */
	int addUser(User user) throws SQLException;
	/**
	 * 根据用户id删除用户、账户注销
	 * @param id 要注销用户的用户id
	 * @return 返回影响行数
	 */
	int delUser(int id) throws SQLException;
	/**
	 * 更改用户信息
	 * @param user 要更改的用户对象
	 * @return 返回影响行数
	 */
//	int updateUser(User user);
	/**
	 * 根据用户昵称和密码确认登录
	 * @param name 用户昵称
	 * @param password 用户密码
	 * @return 返回查找的用户对象
	 */
	User userLogin(String name,String password) throws SQLException;
	/**
	 * 根据用户昵称查找是否已存在
	 * @param name 用户昵称
	 * @return
	 * @throws SQLException 
	 */
	User findUserByname(String name) throws SQLException;
	/**
	 * 根据用户类型查找用户集合
	 * @param type
	 * @return
	 * @throws SQLException
	 */
	List<User> findUserByType(int type) throws SQLException;
}
