/**
 * 
 */
package cn.easybuy.service;

import java.sql.SQLException;
import java.util.List;

import cn.easybuy.entity.News;

/**
 * @author yinxiaochen
 *
 */
public interface NewsService {
	// 获取所有新闻
		public List<cn.easybuy.entity.News> getAllnews() throws SQLException;
		// 添加新闻
		public int addNews(News news) throws SQLException;
		// 更新新闻
		public int updateNews(News news) throws SQLException;
		// 通过id删除新闻
		public int deleteNews(int id) throws SQLException;
		//获取某条新闻
		public News getNewsByID(int id) throws SQLException;
		// 获得新闻总数
		public int getTotalCount() throws SQLException;

}
