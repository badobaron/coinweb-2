package coinweb.dao;

import java.util.ArrayList;

import coinweb.vo.OrderVO;
import coinweb.vo.WalletVO;

public interface WalletDAO {
		public int getInsertResult(int id);		
		public WalletVO getWalletResult(int id, String coin_name);		
		public ArrayList<WalletVO> getWalletListResult(int id);
		public int getWalletUpdate(int id, String coin, int price, float amount, String type);
		public int getWalletCancel(OrderVO vo);
		public int getOrderingUpdate(String id, String coin, String price, String amount, String type);
		public int getOrderingUpdate2(String id, String coin, String price, String amount, String type);
}
