package cn.easybuy.service;

import java.sql.SQLException;
import java.util.List;

import cn.easybuy.entity.Favourite;

/**
 * 
 * @author zwy
 *
 */
public interface FavouriteService {
		// 获取收藏所有商品信息
		public List<Favourite>findFavouriteByUserId(int userId) throws SQLException;
		// 通过id查找收藏商品
		public Favourite findFavouriteById(int id) throws SQLException;
		// 通过id删除收藏信息
		int delFavouriteById(int id) throws SQLException;
		// 添加收藏信息
		int addFavourite(Favourite favourite) throws SQLException;
		// 通过用户ID和商品ID找到信息
		public Favourite findFavouriteByAllID(int userId,int productId)throws Exception;
}
