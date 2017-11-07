package cn.easybuy.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;




import cn.easybuy.dao.impl.NewsDaoImpl;
import cn.easybuy.entity.News;
import cn.easybuy.service.NewsService;
import cn.easybuy.util.DatabaseUtil;

/**
 * 
 * @author yinxiaochen
 *
 */
public  class  NewsServiceImpl implements NewsService {

	@Override  //获取所有新闻
	public List<News> getAllnews() throws SQLException {
		Connection conn = null;
		try {
			conn = DatabaseUtil.getConnection();

			return new NewsDaoImpl(conn).getAllnews();
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DatabaseUtil.closeAll(conn, null, null);
		}
	}

	@Override  //添加新闻
	public int addNews(News news) throws SQLException {
		Connection conn = null;
		int result;
		try {
			conn = DatabaseUtil.getConnection();
			conn.setAutoCommit(false);

			result = new NewsDaoImpl(conn).addNews(news);

			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			if (conn != null)
				try {
					conn.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			throw e;
		} finally {
			DatabaseUtil.closeAll(conn, null, null);
		}
		return result;
	}

	@Override   //更新新闻
	public int updateNews(News news) throws SQLException {
		Connection conn = null;
		int result;
		try {
			conn = DatabaseUtil.getConnection();
			conn.setAutoCommit(false);

			result = new NewsDaoImpl(conn).updateNews(news);

			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			if (conn != null)
				try {
					conn.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			throw e;
		} finally {
			DatabaseUtil.closeAll(conn, null, null);
		}
		return result;
	}

	@Override
	public int deleteNews(int id) throws SQLException {
		Connection conn = null;
		int result;
		try {
			conn = DatabaseUtil.getConnection();
			conn.setAutoCommit(false);
			result = new NewsDaoImpl(conn).deleteNews(id);
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			if (conn != null)
				try {
					conn.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			throw e;
		} finally {
			DatabaseUtil.closeAll(conn, null, null);
		}
		return result;
	}

	@Override
	public News getNewsByID(int id) throws SQLException {
		Connection conn = null;
		try {
			conn = DatabaseUtil.getConnection();

			return new NewsDaoImpl(conn).getNewsByID(id);
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DatabaseUtil.closeAll(conn, null, null);
		}
	}

	@Override
	public int getTotalCount() throws SQLException {
		Connection conn = null;
		int result = 0;
		try {
			conn = DatabaseUtil.getConnection();
			result = new NewsDaoImpl(conn).getTotalCount();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DatabaseUtil.closeAll(conn, null, null);
		}
		return result;
	}

}
