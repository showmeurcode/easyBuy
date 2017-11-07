package cn.easybuy.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import cn.easybuy.util.DatabaseUtil;

/**
 * 
 * @author  yinxiaochen
 * 数据库增删改查 基类
 */
public class BaseDao {
	
	  private Connection conn;
	    
	    public BaseDao(Connection conn) {
	        this.conn = conn;
	    }
	    
//    增删改的方法
	    protected int executeUpdate(String sql, Object... params) throws SQLException {
	        int result = 0;
	        PreparedStatement pstmt = null;
	        try {
	            pstmt = conn.prepareStatement(sql);
	            for (int i = 0; i < params.length; i++) {
	                pstmt.setObject(i + 1, params[i]);
	            }
	            result = pstmt.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	            throw e;
	        } finally {
	            DatabaseUtil.closeAll(null, pstmt, null);
	        }
	        return result;
	    }
//查询的方法  
	    protected ResultSet executeQuery(String sql, Object... params) throws SQLException {
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        try {
	            pstmt = conn.prepareStatement(sql);
	            for (int i = 0; i < params.length; i++) {
	                pstmt.setObject(i + 1, params[i]);
	            }
	            rs = pstmt.executeQuery();
	        } catch (SQLException e) {
	            e.printStackTrace();
	            throw e;
	        }
	        return rs;
	    }
}
