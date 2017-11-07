package cn.easybuy.dao;

import java.sql.SQLException;
import java.util.List;

import cn.easybuy.entity.Buycar;

public interface BuycarDao {
	// 获取购物车所有商品信息
	public List<Buycar> getBuycarsByUserId(int userId) throws SQLException;

	// 查询某条商品信息
	public Buycar getBuycarById(Integer id) throws Exception;

	// 根据ID删除购物车商品信息
	public int deleteById(int id) throws Exception;

	// 添加购物车商品信息
	public int addBuycar(Buycar buycar) throws Exception;
	
	// 通过用户ID和商品ID找到Buycar对象
	Buycar getBuycarByuidAndpid(int userId,int productId)throws Exception;
	
	//更新某购物车信息
	int updateBuycar(Buycar buycar)throws Exception;

}
