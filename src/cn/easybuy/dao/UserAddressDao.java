package cn.easybuy.dao;

import java.sql.SQLException;
import java.util.List;

import cn.easybuy.entity.UserAddress;

/**
* 
* @author 李高珊
* 用户地址类工具接口
*/
public interface UserAddressDao {
	/**
	 * 添加地址
	 * @param userAddress 添加的地址对象
	 * @return 返回影响行数
	 * @throws SQLException 
	 */
	int addAddress(UserAddress userAddress) throws SQLException;
	/**
	 * 删除地址
	 * @param id 地址的id
	 * @return 返回影响行数
	 * @throws SQLException 
	 */
	int delAddress(int id) throws SQLException;
	/**
	 * 更新地址信息，默认地址，备注等
	 * @param userAddress 要修改的地址对象
	 * @return 返回影响行数
	 * @throws SQLException 
	 */
	int updateAddress(UserAddress userAddress) throws SQLException;
	/**
	 * 通过用户ID查找该用户的所有地址信息
	 * @param userid 用户ID
	 * @return 返回查找地址集合
	 * @throws SQLException 
	 */
	List<UserAddress> findAddressByUserId(int userid) throws SQLException;
	
	
	void releaseDefault()throws SQLException ;
	
}
