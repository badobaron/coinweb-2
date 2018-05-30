package coinweb.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class HistoryDAO {
	//Field
	PreparedStatement pstmt;
	ResultSet rs;
	
	//Method
	public void getPreparedStatement(String sql){
		try{
			pstmt = DBConn.getConnection().prepareStatement(sql);
		}catch(Exception e){ e.printStackTrace(); }
	}
	
	
	
	/* close */
	public void close(){
		try{
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(DBConn.conn != null) DBConn.conn.close();
		}catch(Exception e){ e.printStackTrace();}
	}
}
