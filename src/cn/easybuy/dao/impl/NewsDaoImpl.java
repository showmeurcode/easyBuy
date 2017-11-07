/**
 * 
 */
package cn.easybuy.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



import cn.easybuy.dao.BaseDao;
import cn.easybuy.dao.NewsDao;
import cn.easybuy.entity.News;
import cn.easybuy.util.DatabaseUtil;

/**
 * @author x
 *新闻资讯  dao层实现类
 */
public class NewsDaoImpl  extends BaseDao implements NewsDao{

	public NewsDaoImpl(Connection conn) {
		super(conn);
		// TODO Auto-generated constructor stub
	}

	public List<News> getAllnews() throws SQLException {
		List<News> list = new ArrayList<News>();
		ResultSet rs = null;
		String sql = "SELECT `id`, `title`,  `content`,"
				+ " `createtime` FROM `news`;";
		try {
			rs = this.executeQuery(sql);
			News news = null;
			while (rs.next()) {
				news = new News();
				news.setId(rs.getInt("id"));
				
				news.setTitle(rs.getString("title"));
				news.setCreateTime(rs.getString("createtime").substring(0, 19));
				
				list.add(news);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DatabaseUtil.closeAll(null, null, rs);
		}
		return list;
	}

	// 添加新闻
	public int addNews(News news) throws SQLException {

		String sql = "INSERT INTO `news`( `title`, `content`) VALUES( ?, ?)";

		int result = 0;
		try {
			result = executeUpdate(sql, news.getTitle(),news.getContent());
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return result;
	}

	public int deleteNews(int id) throws SQLException {
		String sql = "DELETE FROM `news` WHERE `id` = ?";
		int result = 0;
		try {
			result = executeUpdate(sql, id);
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return result;
	}

	// 获取某条新闻
	public News getNewsByID(int id) throws SQLException {
		ResultSet rs = null;
		String sql = "SELECT * FROM `news` WHERE `id` = ?";
		News news = null;
		try {
			rs = this.executeQuery(sql, id);
			if (rs.next()) {
				news = new News();
				news.setId(rs.getInt("id"));
			
				news.setTitle(rs.getString("title"));
				
				news.setCreateTime(rs.getString("createtime").substring(0, 19));
				news.setContent(rs.getString("content"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DatabaseUtil.closeAll(null, null, rs);
		}
		return news;
	}
	// 更新新闻update
	public int updateNews(News news) throws SQLException {
		String sql = "UPDATE `news` SET  `title`= ?, " +
				"`content`= ? WHERE `id` = ?";
		
		int result = 0;
		try {
			result = executeUpdate(sql, news.getTitle(),news.getContent(),news.getId());
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return result;
	}

	// 获得所有新闻的数量
	public int getTotalCount() throws SQLException {
		ResultSet rs = null;
		String sql = "SELECT COUNT(`id`) FROM `news`";
		int count = -1;
		try {
			rs = this.executeQuery(sql);
			rs.next();
			count = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DatabaseUtil.closeAll(null, null, rs);
		}
		return count;
	}




}
