package coinweb.dao;

import coinweb.vo.OrderVO;
import coinweb.vo.WalletVO;

public interface WalletDAO {
		public int getInsertResult(int id);		
		public WalletVO getWalletResult(int id, String coin_name);		
		public int getWalletUpdate(int id, String coin, int price, float amount, String type);
		public int getWalletCancel(OrderVO vo);
		public int getOrderingUpdate(String price, String amount, String type);
}
