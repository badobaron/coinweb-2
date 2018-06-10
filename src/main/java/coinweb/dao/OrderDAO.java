package coinweb.dao;

import java.util.ArrayList;

import coinweb.vo.HistoryVO;
import coinweb.vo.OrderVO;

public interface OrderDAO {
	
	public int getOrderResult(String id, String coin, String price, String amount, String type);
	public OrderVO getOrderCancelResult(String id, String coin, String idx);
	public int getOrderCancel(String idx);
	public ArrayList<OrderVO> getOrderListResult(String id, String coin);
	public ArrayList<OrderVO> getOrderAllListResult(String coin);
	public int getOrdering(String idx, String price, String amount);
	public int getHistoryInsert(String id, String coin,String type, String price, String amount);
	public ArrayList<HistoryVO> getHistoryListResult(String id, String coin);
}
