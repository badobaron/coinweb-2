package coinweb.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import coinweb.dao.DBConn;
import coinweb.vo.bbsVO;

public class bbsDAO {
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;

	static String url = "jdbc:oracle:thin:@localhost:1521:xe";
	static String user = "scott";
	static String pass = "tiger";
	static Connection conn;

	// Constructor
	public bbsDAO() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// Method
	static public Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
		/* 전체 카운트 가져오기*/
		public int execTotalCount(){
			int result =0;
			try{
				String sql = "select count(*) from bbs";
				getPreparedStatement(sql);
				
				rs = pstmt.executeQuery();
				if(rs.next()){
					result = rs.getInt(1);
				}
			}catch(Exception e){e.printStackTrace();}
			
			return result;

	}

	public String getDate() {
		String sql = "SELECT sysDate()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		return "";
	}

	public int getNext() {
		String sql = "SELECT bbsID FROM BBS ORDER BY bbsID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) ;
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();

		}
		return -1;
	}

	public int write(bbsVO vo) {

		try {
			String sql = "INSERT INTO BBS VALUES(sequ_bbs.nextval,?,?,?,sysdate)";

			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, vo.getBbsTitle());
			pstmt.setString(2, vo.getUserID());
			pstmt.setString(3, vo.getBbsContent());

			int result = pstmt.executeUpdate();

			return result;

		} catch (Exception e) {
			e.printStackTrace();

		}
		return -1;
	}


	 
	public ArrayList<bbsVO> getResultList(int startCount, int endCount){

		ArrayList<bbsVO>  list = new ArrayList<bbsVO>();

		try {
			String sql = //"select rownum as rno,bbsid,bbstitle,userid,bbscontent,bbsdate from"
					/*+*/ //"(select rownum,bbsid,bbstitle,userid,bbscontent,bbsdate FROM BBS order by bbsid desc)";
					 "select * from (select rownum as rno,bbsid, bbstitle,userid,bbscontent,to_char(bbsdate,'yyyy-mm-dd')" 
							+"from (select * from bbs order by bbsdate desc)) where rno between ? and?";
			
			getPreparedStatement(sql);
			
			pstmt.setInt(1, startCount);
			pstmt.setInt(2, endCount);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				bbsVO vo = new bbsVO();
				vo.setRno(rs.getInt(1));
				vo.setBbsID(rs.getInt(2));
				vo.setBbsTitle(rs.getString(3));
				vo.setUserID(rs.getString(4));
				vo.setBbsContent(rs.getString(5));
				vo.setBbsdate(rs.getString(6));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	private void getPreparedStatement(String sql) {

		try {
			pstmt = conn.prepareStatement(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}


	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (DBConn.conn != null)
				DBConn.conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public bbsVO getResultVO(String BbsID) {
		String sql = "select bbsid,bbstitle,userid,bbscontent,bbsdate FROM BBS WHERE bbsID =? ";

		try {
			// System.out.println(BbsID);
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, BbsID);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				bbsVO vo = new bbsVO();
				// System.out.println(rs.getInt(1));
				// System.out.println(rs.getString(2));
				vo.setBbsID(rs.getInt(1));
				vo.setBbsTitle(rs.getString(2));
				vo.setUserID(rs.getString(3));
				vo.setBbsContent(rs.getString(4));
				vo.setBbsdate(rs.getString(5));
				return vo;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

	public int getUpdateResult(bbsVO vo,String BbsID) {
		int result = 0;

		try {
			String sql = "update bbs set bbstitle=?,userid=?, bbscontent=? where bbsid=? ";

			getPreparedStatement(sql);
		
			pstmt.setString(1, vo.getBbsTitle());
			pstmt.setString(2, vo.getUserID());
			pstmt.setString(3, vo.getBbsContent());
			pstmt.setString(4, BbsID); 
				
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	/*게시판글삭제*/
	public int getDeleteResult(String BbsID){
		int result = 0;
		try{ 
			String sql = "delete from bbs where bbsid=?";
			getPreparedStatement(sql);
			pstmt.setString(1, BbsID);
			result = pstmt.executeUpdate();
			
		}catch(Exception e){e.printStackTrace();}
		return result;
		
		
		}
	}
	
	
	

