package cn.easybuy.util;

import java.sql.*;

import javax.naming.*;
import javax.sql.*;
/**
 * 
 * @author 李高珊
 * 数据库连接关闭资源类
 * @author 
 */
public class DatabaseUtil {
	
	/**
	 *
	 *获取连接
	 */
	public static Connection getConnection() throws SQLException{
		Connection conn = null;
		Context ctx;
		// 获取连接并捕获异常
		try {
			ctx=new InitialContext();
			DataSource ds=(DataSource)ctx.lookup("java:comp/env/jdbc/easybuy");
			conn=ds.getConnection();		
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
			 throw e;
		}  
		return conn;// 返回连接对象
	}
	
	/**
	 * @param conn 	Connection对象
	 * @param stmt Statement对象
	 * @param rs    	结果集
	 * 关闭连接
	 */
	public static void closeAll(Connection conn, Statement stmt, ResultSet rs){

        try {
            if (rs != null && !rs.isClosed())
                rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            if (stmt != null && !stmt.isClosed())
                stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            if (conn != null && !conn.isClosed())
                conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
}
