package coinweb.dao;

import java.util.ArrayList;

import coinweb.vo.MemberVO;
import coinweb.vo.RankingVO;

public interface MemberDAO {	
	
	public int getInsertResult(MemberVO vo); 
	public int getLoginResult(MemberVO vo);	
	public ArrayList<MemberVO> getResultList();
	public MemberVO getResultVO(String eamil);
	public int getIdCheckResult(String email);
	public MemberVO getJoinIdResult(MemberVO vo);
	public int getNameCheckResult(String name);
	public int getLoginCheckResult(String email,String pass,int id);
	public int getPassWordChangeResult(MemberVO vo);
	public ArrayList<RankingVO> getRankingList();
}

 

