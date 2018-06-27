package coinweb.vo;

public class RankingVO {
	int  id,profit, rno;
	String name,money;
	
	
	
	public int getProfit() {
		return profit;
	}
	public void setProfit(int profit) {
		this.profit = (int) ((profit/30000000.0)*100-100);
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

}
